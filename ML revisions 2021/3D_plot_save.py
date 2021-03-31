import numpy as np
from matplotlib import pyplot as plt
from skimage.transform import resize
from mpl_toolkits.mplot3d import Axes3D

resize_factor=0.1

def main():
    raw_csv_data = np.genfromtxt('../Raw_Clips/A_10mm_Fl_1.csv', delimiter=',')
    # resize image
    resized_dimensions = [int(x*resize_factor) for x in raw_csv_data.shape]
    resized_csv_data = resize(raw_csv_data, resized_dimensions)

    xs, ys, zs = [], [], []

    for ix, iy in np.ndindex(resized_csv_data.shape):
        xs.append(ix)
        ys.append(iy)
        zs.append(resized_csv_data[ix,iy])

    name = f'A_10mm_Fl_1 raw data 3D plot with resize factor {resize_factor}'

    fig = plt.figure()
    ax = Axes3D(fig)
    sc = ax.scatter(xs, ys, zs, c=zs, s=200, cmap='viridis')
    plt.title(name)
    plt.colorbar(sc)
    plt.show()
    #plt.savefig('../' + name + '.png')
    # print(resized_csv_data.shape)
    # print(column_data)

if __name__ == '__main__':
    main()