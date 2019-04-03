from sklearn import preprocessing
from sklearn.neural_network import MLPClassifier
from keras.utils.np_utils import to_categorical
from sklearn.metrics import accuracy_score
import numpy as np
from sklearn.model_selection import train_test_split

x= ([1, 2, 2, 1, 0, 2, 1, 0, 0, 1, 2, 0, 1, 2, 2, 2, 0, 0, 1, 0, 0, 2,
0, 2, 0, 0, 0, 2, 2, 0, 2, 2, 0, 0, 1, 1, 2, 0, 0, 1, 1, 0, 2, 2,
2, 2, 2, 1, 0, 0, 2, 0, 0, 1, 1, 1, 1, 2, 1, 2, 0, 2, 1, 0, 0, 2,
1, 2, 2, 0, 1, 1, 2, 0, 2])


y= ([1, 1, 0, 2, 2, 0, 0, 1, 1, 2, 0, 0, 1, 0, 1, 2, 0, 2, 0, 0, 1, 0,
0, 1, 2, 1, 1, 1, 0, 0, 1, 2, 0, 0, 1, 1, 1, 2, 1, 1, 1, 2, 0, 0,
1, 2, 2, 2, 2, 0, 1, 0, 1, 1, 0, 1, 2, 1, 2, 2, 0, 1, 0, 2, 2, 1,
1, 2, 2, 1, 0, 1, 1, 2, 2])

train_images, validation_images, train_labels, validation_labels =\
    train_test_split(x, y, test_size=0.5, random_state=1)