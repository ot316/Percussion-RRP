# Author: Oli Thompson
# This code loads the model and plots the activation maximisation for the final layer

import matplotlib.pyplot as plt
import numpy as np
from vis.visualization import visualize_activation
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
layer_index = utils.find_layer_idx(model, 'visualized_layer')

# Swap softmax with linear
model.layers[layer_index].activation = activations.linear
model = utils.apply_modifications(model)

# Visualize close and far nodule
fig, axes = plt.subplots(1, 2)
visualizationfar = visualize_activation(model, layer_index, filter_indices=0, input_range=(0., 1.))
visualizationclose = visualize_activation(model, layer_index, filter_indices=1, input_range=(0., 1.))
fig.suptitle('Comparison of Acivation Maximisation Spectrograms for Far and Close Nodules')
axes[0].imshow(visualizationfar[..., 0])
axes[0].set_title('Far Nodule')
axes[1].imshow(visualizationclose[..., 0])
axes[1].set_title('Close Nodule')
plt.show()
