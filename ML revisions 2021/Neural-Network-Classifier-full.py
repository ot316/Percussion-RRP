from keras.models import Sequential
from keras.layers import Dense, Dropout
from keras.utils import np_utils
from keras.optimizers import Adam
from keras.metrics import CategoricalAccuracy
from keras.callbacks import EarlyStopping
from sklearn.metrics import confusion_matrix
import tensorflow as tf
import numpy as np
import seaborn as sn
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder, MinMaxScaler
import pandas as pd
import matplotlib.pyplot as plt

def basicArchitecture():
    model = Sequential()
    model.add(Dense(64, input_dim=30, activation='relu'))
    model.add(Dense(128, activation='relu'))
    model.add(Dense(128, activation='relu'))
    model.add(Dense(64, activation='relu'))
    return model

def plotHistory(history):
    for metric in history.history.keys():
        if metric[0:3] != 'val':
            plt.plot(history.history[metric])
            plt.plot(history.history['val_' + metric])
            plt.title('model ' + metric)
            plt.ylabel(metric)
            plt.xlabel('epoch')
            plt.legend(['train', 'test'], loc='upper left')
            plt.show()

def plotConfusionMatrix(Y_test, predictions, labels):
    cm = confusion_matrix(Y_test.argmax(axis=1), predictions.argmax(axis=1))
    df_cm = pd.DataFrame(cm, labels, labels)
    plt.figure(figsize=(20,14))
    sn.heatmap(df_cm, annot=True)
    plt.show()

def main():
    # read data from csv
    df = pd.read_csv("5-GMM-Dataset-0.05-scaled-full.csv", index_col=0)
    df = df.sample(frac=1).reset_index(drop=True) # shuffle dataset

    for index, feature in enumerate(range(0,30,6)):
        dataset = df.values
        X = dataset[:,feature:feature + 6].astype(float) # using all features
        
        # add zeros to make number of features 30
        if X.shape[1] < 30:
            filler = np.zeros((X.shape[0], (30 - X.shape[1])), dtype='float')
            X = np.concatenate((X, filler), axis=1)

        y = dataset[:,-3:] # last 3 columns used as labesl
        collapsed_y = np.array([y[i][0] + str(y[i][1]) + y[i][2] for i in range(y.shape[0])]) # collapse 3 label attributes into single composite label

        # Encode labels
        encoder = LabelEncoder()
        encoder.fit(collapsed_y)
        encoded_Y = encoder.transform(collapsed_y)
        # convert integers to dummy variables (i.e. one hot encoded)
        categorical_y = np_utils.to_categorical(encoded_Y)
        
        # scale X values
        min_max_scaler = MinMaxScaler()
        X_scaled = min_max_scaler.fit_transform(X)

        # Train test split
        X_train, X_test, Y_train, Y_test = train_test_split(X_scaled, categorical_y, test_size=0.3)

        # create model
        model = basicArchitecture()
        model.add(Dense(30, activation='softmax'))

        model.compile(optimizer='adam',
                    loss='categorical_crossentropy',
                    metrics=['categorical_accuracy'])

        # early stopping criteria
        es = EarlyStopping(monitor='val_categorical_accuracy', 
                        mode='max',
                        verbose=1, 
                        patience=4)

        # fit model
        history = model.fit(X_train,
                            Y_train, 
                            epochs=20,
                            batch_size=25, 
                            verbose=0, 
                            validation_data=(X_test, Y_test),
                            callbacks=[es])

        # evaluate model
        test_pred = model.predict(X_test)
        loss, categorical_accuracy = model.evaluate(X_test, Y_test)
        print("Guassian Distribution", index)
        print("Loss =", loss)
        print("Categorical Accuracy =", categorical_accuracy)

        # plotHistory(history)
        # plotConfusionMatrix(Y_test, test_pred, np.unique(collapsed_y))

if __name__ == '__main__':
    main()