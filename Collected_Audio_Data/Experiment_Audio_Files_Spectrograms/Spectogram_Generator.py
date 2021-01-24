# Author: Oli Thompson
#Take a folder and save a spectogram for each wav file in the folder

import matplotlib.pyplot as plt
import os
from scipy import signal
from scipy.io import wavfile
from time import *
import numpy as np

#define folder path

filepath = (".//AudioFiles 10.03.20/No_Nodule_Taps")

start = strptime(asctime())

#iterate through files in folder
for root, dirs, files in os.walk(filepath):
    for file in files:
        if file.endswith(".wav"):
            sample_rate, samples = wavfile.read(filepath + "/" + file)
            frequencies, times, spectrogram = signal.spectrogram(samples,sample_rate,nfft=1024,noverlap=900, nperseg=1024)
            plt.axis('off')
            plt.pcolormesh(times, frequencies, 10*np.log10(spectrogram))
            #plt.show()
            plt.savefig(filepath + "/" + '{0}.png'.format(file[0:len(file)-4]), bbox_inches='tight', pad_inches=0)
            print("{0}.png spectrogram saved".format(file[0:len(file)-4]))
            
end = strptime(asctime())
print('%i minutes' % (end[4] - start[4]))