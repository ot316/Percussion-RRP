import numpy as np
from keras.models import Sequential
from keras.layers import Dense
from keras.models import model_from_json

#load saved model
json_file = open('model.json', 'r')
loaded_model_json = json_file.read()
json_file.close()
CNN = model_from_json(loaded_model_json)

# load weights into new model
CNN.load_weights("model_weights.h5")
print("Loaded model and weights")

y_true=[]
y_pred=[]

X = np.load('X_test.npy')
y = np.load('y_test.npy')

pred = CNN.predict(X).tolist()
true = y.tolist()
count = 0

for i in range(len(y)):
    yy = max(pred[i])
    yyt = max(true[i])
    y_pred.append(pred[i].index(yy))
    y_true.append(true[i].index(yyt))
    if(pred[i].index(yy) == true[i].index(yyt)):
        count+=1
        
acc = (count/len(y))*100
print("Accuracy on test set: "+str(acc)+"%")