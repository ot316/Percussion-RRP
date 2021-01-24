# Author: Oli Thompson
# Process the scalogram images into labelled training and testing data and save the arrays.

import numpy as np
import os
import cv2
from sklearn.model_selection import train_test_split
from keras.utils import np_utils


X = []
y = []
num_classes = 2
classification =    [0, 1110, 1115, 1120, 1125, 1130, 
                    1210, 1215, 1220, 1225, 1230, 
                    2110, 2115, 2120, 2125, 2130,
                    2210, 2215, 2220, 2225, 2230,
                    3110, 3115, 3120, 3125, 3130,
                    3210, 3215, 3220, 3225, 3230]

#iterate through files in folder for far

foldercount = 0
path = os.walk("../Collected_Audio_Data/Experiment_02_Audio_Files_Original")
for root, directories, files in path:
    for directory in directories:
        filecount = 0
        foldercount +=1  
        for filename in os.listdir(directory):
            if filename.endswith(".png"):
                output = os.path.join(directory, filename)
                X.append(cv2.imread(output)/255) #normalise and add images
                filecount +=1                
        [y.append(classification[foldercount]) for i in range(filecount)]

#splitting into training, validation and testing data
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.1, random_state=42)
X_train, X_valid, y_train, y_valid = train_test_split(X_train, y_train, test_size=0.1, random_state=41)

#categorise data
y_train=np_utils.to_categorical(y_train, num_classes=num_classes)
y_test=np_utils.to_categorical(y_test, num_classes=num_classes)

np.save('X_train', X_train)
np.save('X_test', X_test)
np.save('y_train', y_train)
np.save('y_test', y_test)
