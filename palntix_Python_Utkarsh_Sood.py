#!/usr/bin/env python
# coding: utf-8

# In[3]:


#Importing important libraries
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
get_ipython().run_line_magic('matplotlib', 'inline')
import seaborn as sns


# #This is extracted from data using SQL 
# ##
# Total users in July 2021(Monthly active users) = 10867
# Total users in July 2022(Monthly active users) = 13022
# 19.83 % increase in Users
# ##
# Total retained users (users who were in July 2021 and July 2022) = 3607
# Retention rate = (3607/10867) * 100 = 33.192 %
# New users in July 2022 = 9415
# Users in July 2021 who are not in July 2022 = 7260
# ##
# Churn rate = 66.808 %
# ##
# Daily active users(avg daily active users in July 2021) = 1515
# Daily active users(avg daily active users in July 2022) = 2234
# Daily active users % increase = 47.46 %
# ##
# Average Revenue per user (July 2021) = 24598.68
# Average Revenue per user (July 2022) = 39214.15
# % increase = 59.42%
# ##
# Total Sessions per User
# July, 2021 = 24      
# July, 2022 = 30
# 25% increase in Total Sessions 
# 
# 

# In[45]:


# This is extracted from data using SQL
# App users
users_year_wise = {
    'July 2021' : 10867,
    'July 2022' : 13022
}
xdata = users_year_wise.keys()
ydata = users_year_wise.values()
plt.bar(xdata,ydata,width = 0.5,color = ['green','red'])
plt.show()
    


# # This is extracted from data using SQL # Orders
# Orders in July,2021 = 6216
# Orders in July,2022 = 7414
# 19.27 % increase in orders 
# Orders shipped in July,2021 = 2434
# Orders Rejected in July,2021 = 3764
# Orders shipped in July,2021 = 3489
# Orders Rejected in July,2021 = 3899

# In[127]:


orders_year_wise = {
    'July 2021' : 6216,
    'July 2022' : 7414
    }
xdata = orders_year_wise.keys()
ydata = orders_year_wise.values()
plt.bar(xdata,ydata,width = 0.5,color = ['yellow','Blue'])
plt.xlabel('Year')
plt.ylabel('Orders')
plt.show()
    


# # This is extracted from data using SQL # Buyers
# Buyers in July 2021 = 2452 
# Buyers in July 2022 = 2980
# 21.533 % increase in Buyers
# Buyers in July 2021 as well as in July 2022 = 600
# Buyers in July 2022 who were not in July 2021 = 2380

# In[130]:


# This is extracted from data using SQL
# customers
Buyers_year_wise = {
    'July 2021' : 2452,
    'July 2022' : 2980
    }
xdata = Buyers_year_wise.keys()
ydata = Buyers_year_wise.values()
plt.bar(xdata,ydata,width = 0.5,color = ['green','red'])
plt.xlabel('Year')
plt.ylabel('Buyers')
plt.show()


# #
# Total Depots in July,2021 = 8
# Total Depots in July,2022 = 11
# New Depots = 3
# #
# 
# 
# 

# Number of different products sold in 2021 = 554
# Number of different products sold in 2022 = 483

# Revenue in July,2021 = 60315970.91
# Revenue in July,2022 = 116858178.44
# Percentage increase in revenue = 93.74

# In[126]:


Revenue_year_wise = {
    'July 2021' : 6.03,
    'July 2022' : 11.68
    }
xdata = Revenue_year_wise.keys()
ydata = Revenue_year_wise.values()
plt.bar(xdata,ydata,width = 0.5,color = ['RED','Yellow'])
plt.xlabel('Year')
plt.ylabel('Revenue')

plt.show()


# 554 different products were sold in july 2021
# 483 different products were sold in july 2022
# 304 different products sold in july 2021 were not sold in july 2022
# 233 different products sold in july 2022 were not sold in july 2021

# In[133]:


#This CSV FILE IS EXTRACTED FROM DATA USING SQL
df_plantix_products_no_of_orders = pd.read_csv(r"C:\Users\x\Downloads\plantix_products_no_of_orders.csv", names = ['fk_product_id','no_of_orders'])
df_plantix_products_no_of_orders = df_plantix_products_no_of_orders.iloc[0:10,:]
df_plantix_products_no_of_orders 


# In[134]:


xdata = df_plantix_products_no_of_orders ['fk_product_id'].to_list()
xdata = [str(item) for item in xdata ]
ydata = df_plantix_products_no_of_orders ['no_of_orders'].to_list()
plt.xlabel('Product id')
plt.ylabel('No of orders')
plt.title('Top 10 selling Products')
plt.xticks(rotation = 'vertical')
plt.bar(xdata,ydata,width = 0.5,color = 'green')

plt.show()


# In[102]:


#This CSV FILE IS EXTRACTED FROM DATA USING SQL
df_plantix_products_no_of_orders2021 = pd.read_csv(r"C:\Users\x\Downloads\plantix_top_selling_products_2021.csv", names = ['fk_product_id','no_of_orders'])
df_plantix_products_no_of_orders2021 = df_plantix_products_no_of_orders2021.iloc[0:10,:]
df_plantix_products_no_of_orders2021['Revenue'] = [2238276.45,8370628.4,2563695.52,1822052.09,1794376.67,2590386.5,5591222.3,20501461.3,8645730.5,301922]
df_plantix_products_no_of_orders2021


# Revenue from Top 10 selling Products = 54419751.73
# It is 90.22% of Total Revenue of July, 2021

# In[131]:


xdata = df_plantix_products_no_of_orders2021 ['fk_product_id'].to_list()
xdata = [str(item) for item in xdata ]
ydata = df_plantix_products_no_of_orders2021 ['no_of_orders'].to_list()
plt.xlabel('Product id')
plt.ylabel('No of orders')
plt.title('Top 10 selling Products 2021')
plt.xticks(rotation = 'vertical')
plt.bar(xdata,ydata,width = 0.5,color = 'red')

plt.show()


# In[132]:


#This CSV FILE IS EXTRACTED FROM DATA USING SQL
df_plantix_products_no_of_orders2022 = pd.read_csv(r"C:\Users\x\Downloads\plantix_top_selling_products_2022.csv", names = ['fk_product_id','no_of_orders'])
df_plantix_products_no_of_orders2022 = df_plantix_products_no_of_orders2022.iloc[0:10,:]
df_plantix_products_no_of_orders2022['Revenue'] = [8370628.4,2238276.45,1822052.09,2590386.5,11240647,5591222.3,895768.49,3566049.12,2062316.5,2846476]
df_plantix_products_no_of_orders2022


# Revenue from Top 10 selling Products = 41223822.85
# It is  of Total Revenue of July, 2022
# 

# In[96]:


xdata = df_plantix_products_no_of_orders2022 ['fk_product_id'].to_list()
xdata = [str(item) for item in xdata ]
ydata = df_plantix_products_no_of_orders2022 ['no_of_orders'].to_list()
plt.xlabel('Product id')
plt.ylabel('No of orders')
plt.title('Top 10 selling Products 2022')
plt.xticks(rotation = 'vertical')
plt.bar(xdata,ydata,width = 0.5,color = 'yellow')

plt.show()


# In[7]:


#This CSV FILE IS EXTRACTED FROM DATA USING SQL

df_logins_orders = pd.read_csv(r"C:\Users\x\Downloads\Plantix_logins_orders.csv", names = ['fk_buyer_id','Total_orders','user_id','no_of_logins'])
df_logins_orders


# In[11]:


# fk_buyer_id is same as user_id
df_logins_orders = df_logins_orders[['user_id','Total_orders','no_of_logins']].sort_values('Total_orders', ascending = False)
df_logins_orders


# In[15]:


sns.lineplot('no_of_logins','Total_orders',data = df_logins_orders)

