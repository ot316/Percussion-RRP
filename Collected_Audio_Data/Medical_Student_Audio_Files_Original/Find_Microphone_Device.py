// Author: Oli Thompson
// This code prints the name of connected audio devices

import pyaudio
p = pyaudio.PyAudio()
for ii in range(p.get_device_count()):
    print(p.get_device_info_by_index(ii).get('name'))
