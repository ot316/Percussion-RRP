import numpy as np
import math
import matplotlib as mpl
from matplotlib import pyplot as plt
from skimage.transform import resize
from sklearn.mixture import GaussianMixture
from matplotlib.patches import Ellipse

filename = 'A_10mm_Li_25.csv'
resize_factor=0.1
num_components=5


def main():
    data = []
    raw_csv_data = np.genfromtxt(f'../Raw_Clips/{filename}', delimiter=',')
    # resize image
    resized_dimensions = [int(x*resize_factor) for x in raw_csv_data.shape]
    resized_csv_data = resize(raw_csv_data, resized_dimensions)

    xs, ys, zs = [], [], []

    for ix, iy in np.ndindex(resized_csv_data.shape):
        c_value = resized_csv_data[ix,iy]
        xs.append(ix)
        ys.append(iy)
        zs.append(c_value)
        data.append((ix, iy, c_value))

    gmm = GaussianMixture(n_components=num_components, random_state=42).fit(data)
    means = gmm.means_
    x_means = means[:,0]
    y_means = means[:,1]

    name = f'{filename} raw data resize factor {resize_factor} and {num_components} guassian distributions.'
    
    ax = plt.gca()
    ax.imshow(resized_csv_data)
    ax.scatter(y_means, x_means, s=300, c='red')
    plt.title(name)

    # plot 2D elipses
    for i, (pos, covar) in enumerate(zip(means[:,0:2], gmm.covariances_[:,0:2,0:2])):
        pos = (pos[1], pos[0]) # reverse x and y
        U, s, _ = np.linalg.svd(covar)
        angle = np.degrees(np.arctan2(U[1, 0], U[0, 0]))
        x, y = 2 * np.sqrt(s)
        ax.text(pos[0], pos[1], i, fontsize='x-large')
        for nsig in range(0, 5):   
            ax.add_patch(Ellipse(pos, nsig/4 * y, nsig/4 * x, math.pi-angle, alpha=0.3, color='red'))

    plt.show()
    #plt.savefig('../' + name + '.png')
    # print(resized_csv_data.shape)
    # print(column_data)

if __name__ == '__main__':
    main()

