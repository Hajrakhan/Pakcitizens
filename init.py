#!/usr/bin/env python
# coding: utf-8

# In[2]:


import numpy as np
import scipy
import pandas as pd
import math
import random
import sklearn
# from nltk.corpus import stopwords
from sklearn.model_selection import train_test_split
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity
from scipy.sparse.linalg import svds
# import matplotlib.pyplot as plt

articles_df = pd.read_csv('shared_articles.csv')
articles_df = articles_df[articles_df['eventType'] == 'CONTENT SHARED']

pd.options.display.max_colwidth = 10000
# In[3]:


#read interactions.csv file
interactions_df = pd.read_csv('users_interactions.csv')
#interactions_df = pd.read_csv(interactions_file)

#data munging(define event type strength)
event_type_strength = {
   'VIEW': 1.0,
   'LIKE': 2.0,
   'BOOKMARK': 2.5,
   'FOLLOW': 3.0,
   'COMMENT CREATED': 4.0,
}

interactions_df['eventStrength'] = interactions_df['eventType'].apply(lambda x: event_type_strength[x])


# In[4]:


#removed less interaction users from the dataset
#getting count of no of users
users_interactions_count_df = interactions_df.groupby(['personId', 'contentId']).size().groupby('personId').size()
users_with_enough_interactions_df = users_interactions_count_df[users_interactions_count_df >= 5].reset_index()[['personId']]


# In[12]:


interactions_from_selected_users_df = interactions_df.merge(users_with_enough_interactions_df, 
               how = 'right',
               left_on = 'personId',
               right_on = 'personId')


# In[15]:


#calculated weighted sum of the interaction for each news article for each user
def smooth_user_preference(x):
    return math.log(1+x, 2)

interactions_full_df = interactions_from_selected_users_df                     .groupby(['personId', 'contentId'])['eventStrength'].sum()                     .apply(smooth_user_preference).reset_index()
interactions_full_df.head(10)


# In[17]:


#split train and test dataset by a reference date
#train dataset > before that date
#test dataset > after that date
interactions_train_df, interactions_test_df = train_test_split(interactions_full_df,
                                   stratify=interactions_full_df['personId'],
                                   test_size=0.20,
                                   random_state=42)


#Indexing by personId to speed up the searches during evaluation
interactions_full_indexed_df = interactions_full_df.set_index('personId')
interactions_train_indexed_df = interactions_train_df.set_index('personId')
interactions_test_indexed_df = interactions_test_df.set_index('personId')


# In[18]:


def get_items_interacted(person_id, interactions_df):
    # Get the user's data and merge in the news information.
    interacted_items = interactions_df.loc[person_id]['contentId']
    return set(interacted_items if type(interacted_items) == pd.Series else [interacted_items])
