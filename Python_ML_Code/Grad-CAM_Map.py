import matplotlib.pyplot as plt
import matplotlib.cm as cm
import numpy as np
from vis.visualization import visualize_cam, overlay
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
indices_to_visualize = [0,1,2,3,4,5]


# Visualize
for index_to_visualize in indices_to_visualize:
    # Get input
    input_image = X_test[index_to_visualize]
    input_class = np.argmax(y_test[index_to_visualize])
    # Matplotlib preparations
    fig, axes = plt.subplots(1, 3)
    # Generate visualization
    visualization = visualize_cam(model, layer_index, filter_indices=input_class, seed_input=input_image)
    axes[0].imshow(input_image[..., 0], cmap='viridis') 
    axes[0].set_title('Input')
    axes[1].imshow(visualization)
    axes[1].set_title('Grad-CAM')
    heatmap = np.uint8(cm.jet(visualization)[..., :3] * 255)
    original = np.uint8(cm.gray(input_image[..., 0])[..., :3] * 255)
    axes[2].imshow(overlay(heatmap, original))
    axes[2].set_title('Overlay')
    if input_class == 1 :
        fig.suptitle('Close Nodule')
    else:
        fig.suptitle('Far Nodule')    
    plt.show()