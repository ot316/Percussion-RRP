import matplotlib.pyplot as plt
import sys
from scipy.fftpack import fft
from scipy.io import wavfile # get the api
try:
    fs, data = wavfile.read(str(sys.argv[1])) # load the data
except: 
    print("specify filename as argument")
a = data.T[0] # this is a two channel soundtrack, I get the first track
b=[(ele/2**8.)*2-1 for ele in a] # this is 8-bit track, b is now normalized on [-1,1)
c = fft(b) # calculate fourier transform (complex numbers list)
d = len(c)/2  # you only need half of the fft list (real signal symmetry)
plt.plot(abs(c[:(d-1)]),'r') 
plt.savefig(str(sys.argv[1])+' fft.png')