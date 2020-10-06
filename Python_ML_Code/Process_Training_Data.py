# Process the spectrogram images into labelled training and testing data and save the arrays.

import numpy as np
import os
import cv2
from sklearn.model_selection import train_test_split
from keras.utils import np_utils

fars = ("../Audio_Files_10.03.20_Experiment_Scalograms/No_Nodule_taps/Trimmed_Scalograms")
closes = ("../Audio_Files_10.03.20_Experiment_Scalograms/Nodule_taps/Trimmed_Scalograms")

X = []
y = []
num_labels = 2

#iterate through files in folder for far
farcount = 0
for root, dirs, files in os.walk(fars):
    for file in files:
        if file.endswith(".png"):
            X.append(cv2.imread(fars + '/' + file)/255) #add images to t
            farcount +=1                
[y.append(0) for i in range(farcount)]


#iterate through files in folder for far
closecount = 0
for root, dirs, files in os.walk(closes):
    for file in files:
        if file.endswith(".png"):
            X.append(cv2.imread(closes + '/' + file)/255) #add images to t
            closecount +=1
                
[y.append(1) for i in range(closecount)]


#splitting into training, validation and testing data
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.1, random_state=42)
X_train, X_valid, y_train, y_valid = train_test_split(X_train, y_train, test_size=0.1, random_state=41)

#categorise data
y_train=np_utils.to_categorical(y_train, num_classes=num_labels)
y_test=np_utils.to_categorical(y_test, num_classes=num_labels)

np.save('X_train', X_train)
np.save('X_test', X_test)
np.save('y_train', y_train)
np.save('y_test', y_test)

