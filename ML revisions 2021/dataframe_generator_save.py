import numpy as np
import os
from matplotlib import pyplot as plt
from skimage.transform import resize
from sklearn.mixture import GaussianMixture
import pandas as pd

resize_factor=0.05
num_components=5

def main():
    df = pd.DataFrame(columns= ["mu1x", "mu1y", "mu1z", "var1x", "var1y", "var1z", \
                                "mu2x", "mu2y", "mu2z", "var2x", "var2y", "var2z", \
                                "mu3x", "mu3y", "mu3z", "var3x", "var3y", "var3z", \
                                "mu4x", "mu4y", "mu4z", "var4x", "var4y", "var4z", \
                                "mu5x", "mu5y", "mu5z", "var5x", "var5y", "var5z", \
                                "Sample Letter", "Sample Depth", "Sample Type"])
    i = 0  
    files = os.listdir('Raw_Clips')
    for filename in files:
        if filename.endswith('.csv'): # only read 10%
            i+=1
            # resize image
            raw_csv_data = np.genfromtxt('Raw_Clips/' + filename, delimiter=',')
            resized_dimensions = [int(x*resize_factor) for x in raw_csv_data.shape]
            resized_csv_data = resize(raw_csv_data, resized_dimensions)

            # find attributes
            sample_letter = filename[0]
            sample_depth = int(filename[2:4])
            sample_type = filename[7]

            # read all c values
            c_val_data = []
            for ix, iy in np.ndindex(resized_csv_data.shape):
                c_value = resized_csv_data[ix,iy]
                c_val_data.append([ix, iy, c_value])

            # compute 5 guassian distributions that fit the data
            gmm = GaussianMixture(n_components=num_components, random_state=42).fit(c_val_data)
            variances = np.array([np.diagonal(gmm.covariances_[i]) for i in range(len(gmm.covariances_))]) # decompose covariance matrix into variances
            data = np.concatenate((gmm.means_, variances), axis=1).flatten()
            attribute_data = list(data) + [sample_letter, sample_depth, sample_type] # add attributes
            df.loc[len(df.index)] = attribute_data

            # progress terminal output
            percentage_complete = i / (len(files)) * 100
            print("{:.2f}% complete.".format(percentage_complete))
            df.to_csv("5-GMM-Dataset-0.05-scaled-full-random-state.csv")



if __name__ == '__main__':
    main()