import numpy as np
import matplotlib as mpl
from matplotlib import pyplot as plt
from skimage.transform import resize
from sklearn.mixture import GaussianMixture
from mpl_toolkits.mplot3d import Axes3D

filename = 'A_10mm_Fl_25.csv'
resize_factor=0.1
num_components=5


def main():
    data = []
    raw_csv_data = np.genfromtxt(f'../Raw_Clips/{filename}', delimiter=',')
    # resize image
    resized_dimensions = [int(x*resize_factor) for x in raw_csv_data.shape]
    resized_csv_data = resize(raw_csv_data, resized_dimensions)

    for ix, iy in np.ndindex(resized_csv_data.shape):
        c_value = resized_csv_data[ix,iy]
        data.append((ix, iy, c_value))

    gmm = GaussianMixture(n_components=num_components, random_state=42).fit(data)
    means = gmm.means_
    covar = gmm.covariances_
    print(list(zip(means, covar))[0])


if __name__ == '__main__':
    main()

