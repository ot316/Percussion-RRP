import numpy as np
from matplotlib import pyplot as plt
from skimage.transform import resize
from mpl_toolkits.mplot3d import Axes3D
from sklearn.mixture import GaussianMixture

resize_factor=0.05
num_components = 5

def main():
    raw_csv_data = np.genfromtxt('../Raw_Clips/A_10mm_Fl_1.csv', delimiter=',')
    # resize image
    resized_dimensions = [int(x*resize_factor) for x in raw_csv_data.shape]
    resized_csv_data = resize(raw_csv_data, resized_dimensions)

    xs, ys, zs, data = [], [], [], []

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
    z_means = means[:,2]

    name = f'A_10mm_Fl_1 raw data 3D plot with resize factor {resize_factor}'

    fig = plt.figure()
    ax = Axes3D(fig)
    sc = ax.scatter(xs, ys, zs, c=zs, s=200, cmap='viridis')
    ax.scatter(x_means, y_means, z_means, s=10000, marker='o', c='red')
    plt.title(name)
    plt.colorbar(sc)
    plt.show()
    #plt.savefig('../' + name + '.png')
    # print(resized_csv_data.shape)
    # print(column_data)

if __name__ == '__main__':
    main()