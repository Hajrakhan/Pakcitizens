#!/usr/bin/env python
# coding: utf-8

# In[24]:


from init import interactions_full_df,articles_df

print("********Popularity-Based Filtering Model********")
#Computes the most popular items
item_popularity_df = interactions_full_df.groupby('contentId')['eventStrength'].sum().sort_values(ascending=False).reset_index()
item_popularity_df.head(10)


# In[ ]:




