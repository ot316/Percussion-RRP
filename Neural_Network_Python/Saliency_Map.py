# Author: Oli Thompson
# load the model and plot the Saliency map for an array of data points.

import matplotlib.pyplot as plt
import numpy as np
import cv2
from vis.visualization import visualize_saliency
from vis.utils import utils
from keras.models import model_from_json
from keras import activations

#load the test samples from previous code
X_test = np.load('X_test.npy')
y_test = np.load('y_test.npy')

#load saved model
json_file = open('model.json', 'r')
loaded_model_json = json_file.read()
json_file.close()
model = model_from_json(loaded_model_json)

# load weights into new model
model.load_weights("model_weights.h5")
print("Loaded model and weights")

# Find the index of the to be visualized layer above
layer_index = utils.find_layer_idx(model, 'visualized_layer_4')

# Swap softmax with linear
model.layers[layer_index].activation = activations.linear
model = utils.apply_modifications(model)

# Numbers to visualize
indices_to_visualize = [0,100,16,133,44]

# Visualize
for index_to_visualize in indices_to_visualize:
    # Get input
    input_image = X_test[index_to_visualize]
    input_class = np.argmax(y_test[index_to_visualize])
    # Matplotlib preparations
    fig, axes = plt.subplots(1, 2)
    # Generate visualization
    visualization = visualize_saliency(model, layer_index, filter_indices=input_class, seed_input=input_image)
    plt.set_cmap('gray')
    axes[0].imshow(input_image[..., 0])
    axes[0].set_title('Original image')
    plt.set_cmap('seismic')
    axes[1].imshow(visualization)
    axes[1].set_title('Saliency map')
    if input_class == 1 :
        fig.suptitle('Close Nodule')
    else:
        fig.suptitle('Far Nodule')
    plt.show()