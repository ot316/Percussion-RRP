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
from Neural_Network_Classifier_full import basicArchitecture, plotHistory
import random_seed_initialiser

num_data_points = 750

def main():
    # read data from csv
    df = pd.read_csv("../5-GMM-Dataset-0.05-scaled-full-random-state.csv", index_col=0)
    df = df.sample(frac=1).reset_index(drop=True) # shuffle dataset

    df_res = pd.DataFrame(columns= ["Guassian Distribution", "Loss", "Mean Squared Error"]) # empty df for results

    for index, feature in enumerate(range(0,30,6)):

        dataset = df.values
        X = dataset[:num_data_points,:30].astype(float) # using all features

        y = dataset[:num_data_points,-2].astype(float) # sample depth used as labels

        # scale X values
        min_max_scaler = MinMaxScaler()
        X_scaled = min_max_scaler.fit_transform(X)

        # Train test split
        X_train, X_test, Y_train, Y_test = train_test_split(X_scaled, y, test_size=0.3)

        # create model
        model = basicArchitecture()
        model.add(Dense(1, activation='linear'))

        model.compile(optimizer='adam',
                    loss='mean_squared_error',
                    metrics=['mean_squared_error'])

        # early stopping criteria
        es = EarlyStopping(monitor='val_mean_squared_error', 
                        mode='min',
                        verbose=0, 
                        patience=50)

        # fit model
        history = model.fit(X_train,
                            Y_train, 
                            epochs=50,
                            batch_size=25, 
                            verbose=0, 
                            validation_data=(X_test, Y_test),
                            callbacks=[es])

        # evaluate model
        test_pred = model.predict(X_test)
        loss, mse = model.evaluate(X_test, Y_test)
        print(model.metrics_names)

        print("Loss =", loss)
        print("Mean Squared Error =", mse)

        # plotHistory(history)

        df_res.loc[index] = [index, loss, mse]

    plt.bar(df_res["Guassian Distribution"], df_res["Mean Squared Error"], label="Data 1")
    plt.title("Sample Depth Classification Mean Squared Error")
    plt.xlabel("Guassian Distributions")
    plt.ylabel("Model Mean Squared Error")
    plt.show()

    plt.bar(df_res["Guassian Distribution"], df_res["Loss"], label="Data 1")
    plt.title("Sample Depth Classification Loss")
    plt.xlabel("Guassian Distributions")
    plt.ylabel("Model Loss")
    plt.show()

if __name__ == '__main__':
    main()