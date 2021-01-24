#split a given audio file into individual taps using the silence between them

import os
import matplotlib.pyplot as plt
from pydub import AudioSegment
from pydub.silence import split_on_silence


# Define a function to normalize a tap to a target amplitude.
def match_target_amplitude(atap, target_dBFS):
    ''' Normalize given audio tap '''
    change_in_dBFS = target_dBFS - atap.dBFS
    return atap.apply_gain(change_in_dBFS)

# Load long audio taps.
filepath = ("AudioFiles 10.03.20/")
filename = ("No_Nodule_taps.wav")
song = AudioSegment.from_wav(filepath + filename)
print("loaded audio")

# Split track where the silence is 200ms or more and get taps using 
taps = split_on_silence (
    # Use the loaded audio.
    song, 
    # Specify silent tap
    min_silence_len = 200,
    # Consider a tap silent if it's quieter than -60 dBFS.
    silence_thresh = -30
)


# create export file path
dir = os.path.join(filepath + "/" + filename[0:len(filename)-4])
if not os.path.exists(dir):
    os.mkdir(dir)
    
# Process each tap with  parameters
for i, tap in enumerate(taps):
    # Create a silence chunk for padding.
    silence_tap = AudioSegment.silent(duration=0)

    # Add the padding tap to beginning and end of the entire tap.
    audio_tap = silence_tap + tap + silence_tap

    # Normalize the entire tap.
    normalized_tap = match_target_amplitude(audio_tap, -20.0)

    # Export the audio tap with new bitrate.
    export = ".//{path}/{filename}tap{index}.wav".format(path = filepath + filename[0:len(filename)-4], filename = filename[0:len(filename)-4], index = i)
    print("Exporting" +  export)    
    normalized_tap.export(export,      
        bitrate = "192k",
        format = "wav"
    )

