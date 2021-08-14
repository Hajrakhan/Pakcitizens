import numpy as np
from init import interactions_full_df,articles_df


def popularity():
    #Computes the most popular items
    item_popularity_df = interactions_full_df.groupby('contentId')['eventStrength'].sum().sort_values(ascending=False).reset_index()
    ids=item_popularity_df[0:11]['contentId']
    a=0
    ar=[]
    for i in ids:
        a=a+1
        ar.append(articles_df[articles_df['contentId']==i])
        if a==10:
            break
    return(ar)
    
popularity()