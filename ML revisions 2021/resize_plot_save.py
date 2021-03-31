import numpy as np
from matplotlib import pyplot as plt
from skimage.transform import resize

resize_factor=0.02

def main():
    raw_csv_data = np.genfromtxt('Raw_Clips/A_10mm_Fl_1.csv', delimiter=',')
    # resize image
    resized_dimensions = [int(x*resize_factor) for x in raw_csv_data.shape]
    resized_csv_data = resize(raw_csv_data, resized_dimensions)

    name = f'A_10mm_Fl_1 raw data with resize factor {resize_factor}'
    plt.imshow(resized_csv_data)
    plt.title(name)
    plt.colorbar()
    #plt.show()
    plt.savefig(name + '.png')
    print(resized_csv_data)

if __name__ == '__main__':
    main()