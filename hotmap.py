
# coding: utf-8

# In[30]:


import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
from scipy.misc.pilutil import imread
import matplotlib.cm as cm
import imageio as im


# In[3]:


era_landing = pd.read_csv("D:\Rdir\linear_ylm\era_landing.csv")
mir_landing = pd.read_csv("D:\Rdir\linear_ylm\mir_landing.csv")


# In[29]:


position_data = ["killer_position_x","killer_position_y","victim_position_x","victim_position_y"]
for position in position_data:
    mir_landing[position] = mir_landing[position].apply(lambda x: x*1000/800000)
    mir_landing = mir_landing[mir_landing[position] != 0]

    era_landing[position] = era_landing[position].apply(lambda x: x*4096/800000)
    era_landing = era_landing[era_landing[position] != 0]


# In[45]:


mir_bg = imread("E:\DS\pubg\miramar.jpg")
fig, ax = plt.subplots(1,1,figsize=(15,15))
ax.imshow(mir_bg)
sns.kdeplot(mir_landing["victim_position_x"], mir_landing["victim_position_y"], n_levels=300,cmap=cm.Oranges, alpha=0.9)


# In[39]:


era_bg = imread("E:\DS\pubg\erangel.jpg")
fig, ax = plt.subplots(1,1,figsize=(15,15))
ax.imshow(era_bg)
sns.kdeplot(era_landing["victim_position_x"], era_landing["victim_position_y"], n_levels=300,cmap=cm.Oranges, alpha=0.9)


# In[41]:


era = pd.read_csv("D:\Rdir\linear_ylm\era.csv")
mir = pd.read_csv("D:\Rdir\linear_ylm\mir.csv")


# In[42]:


era_final = era
mir_final = mir


# In[43]:


len(mir_final)


# In[44]:


len(era_final)


# In[45]:


position_data = ["killer_position_x","killer_position_y","victim_position_x","victim_position_y"]
for position in position_data:
    mir_final[position] = mir_final[position].apply(lambda x: x*1000/800000)
    mir_final = mir_final[mir_final[position] != 0]

    era_final[position] = era_final[position].apply(lambda x: x*4096/800000)
    era_final = era_final[era_final[position] != 0]


# In[54]:


mir_bg = imread("E:\DS\pubg\miramar.jpg")
fig, ax = plt.subplots(1,1,figsize=(15,15))
ax.imshow(mir_bg)
sns.kdeplot(mir_final["victim_position_x"], mir_final["victim_position_y"], n_levels=100,cmap=cm.Blues, alpha=0.5,shade=False)


# In[55]:



era_bg = imread("E:\DS\pubg\erangel.jpg")
fig, ax = plt.subplots(1,1,figsize=(15,15))
ax.imshow(era_bg)
sns.kdeplot(era_final["victim_position_x"], era_final["victim_position_y"], n_levels=100,cmap=cm.Blues, alpha=0.5, shade=False)


# In[9]:


bygun = pd.read_csv("D:\Rdir\linear_ylm\guntype.csv",encoding='gb18030')


# In[10]:


bygun


# In[15]:


era = bygun[bygun['map']=='ERANGEL']
mir = bygun[bygun['map']=='MIRAMAR']


# In[35]:


era_bq = era[era['guntype']=='步枪']
era_cf = era[era['guntype']=='冲锋枪']
era_sj = era[era['guntype']=='栓狙']
era_lj = era[era['guntype']=='连狙']
era_xd = era[era['guntype']=='霰弹枪']


# In[24]:


era_xd


# In[36]:


position_data = ["killer_position_x","killer_position_y","victim_position_x","victim_position_y"]
for position in position_data:
    era_bq[position] = era_bq[position].apply(lambda x: x*4096/800000)
    era_bq = era_bq[era_bq[position] != 0]
    
    era_cf[position] = era_cf[position].apply(lambda x: x*4096/800000)
    era_cf = era_cf[era_cf[position] != 0]
    
    era_sj[position] = era_sj[position].apply(lambda x: x*4096/800000)
    era_sj = era_sj[era_sj[position] != 0]
    
    era_lj[position] = era_lj[position].apply(lambda x: x*4096/800000)
    era_lj = era_lj[era_lj[position] != 0]
    
    era_xd[position] = era_xd[position].apply(lambda x: x*4096/800000)
    era_xd = era_xd[era_xd[position] != 0]


# In[45]:


fig, ax = plt.subplots(1,1,figsize=(15,15))
ax.imshow(era_bg)
sns.kdeplot(era_bq["killer_position_x"], era_bq["killer_position_y"], n_levels=100,cmap=cm.Reds, alpha=0.7, shade=False)


# In[46]:


fig, ax = plt.subplots(1,1,figsize=(15,15))
ax.imshow(era_bg)
sns.kdeplot(era_cf["killer_position_x"], era_cf["killer_position_y"], n_levels=100,cmap=cm.Reds, alpha=0.7, shade=False)


# In[47]:


fig, ax = plt.subplots(1,1,figsize=(15,15))
ax.imshow(era_bg)
sns.kdeplot(era_sj["killer_position_x"], era_sj["killer_position_y"], n_levels=100,cmap=cm.Reds, alpha=0.7, shade=False)


# In[48]:


fig, ax = plt.subplots(1,1,figsize=(15,15))
ax.imshow(era_bg)
sns.kdeplot(era_lj["killer_position_x"], era_lj["killer_position_y"], n_levels=100,cmap=cm.Reds, alpha=0.7, shade=False)


# In[49]:


fig, ax = plt.subplots(1,1,figsize=(15,15))
ax.imshow(era_bg)
sns.kdeplot(era_xd["killer_position_x"], era_xd["killer_position_y"], n_levels=100,cmap=cm.Reds, alpha=0.7, shade=False)

