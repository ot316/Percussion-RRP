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


if __name__ == "__main__":
    source_dir = "."
    input_files = [f for f in os.listdir(source_dir) if os.path.isfile(os.path.join(source_dir, f)) and f[-4:] == ".wav"]

    for f in input_files:

        # Create destination folders
        if not os.path.exists(f[:-4]):
            os.makedirs(f[:-4])
            print("Created folder " + f[:-4])

        # Load long audio taps.
        filepath = (f[:-4])
        filename = (f)
        song = AudioSegment.from_wav(filename)
        print("Loaded audio ", f)

        # Split track where the silence is 200ms or more and get taps using 
        taps = split_on_silence (
            # Use the loaded audio.
            song, 
            # Specify silent period
            min_silence_len = 200,
            # Consider a period silent if it's quieter than -30 dBFS.
            silence_thresh = -35,
            keep_silence = 100
        )
            
        # Process each tap with  parameters
        for i, tap in enumerate(taps):
            # Create a silence chunk for padding.
            silence_tap = AudioSegment.silent(duration=0)

            # Normalize the entire tap.
            # normalized_tap = match_target_amplitude(tap, -20.0)

            # Export the audio tap with new bitrate.
            export = ".//{path}/{filename}_tap_{index}.wav".format(path = filepath, filename = filepath, index = i)
            #print("Exporting" +  export)    
            tap.export(export,      
                bitrate = "192k",
                format = "wav"
            )
        print(i, " taps exported.")
