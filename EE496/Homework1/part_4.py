import csv
from sklearn import preprocessing
from sklearn.neural_network import MLPClassifier
from keras.utils.np_utils import to_categorical
import numpy as np
from sklearn.model_selection import train_test_split

train_score = []
val_score = []
loss = []
train_score1 = []
val_score1 = []
loss1 = []
test_score1 = []
weights1 = []

# load images and labels
test_images = np.load('test_images.npy')
test_labels = np.load('test_labels.npy')
train_images = np.load('train_images.npy')
train_labels = np.load('train_labels.npy')
test_labels = np.reshape(test_labels, (5000,1))
test_labels = to_categorical(test_labels, num_classes=5)
train_labels = np.reshape(train_labels, (30000,1))
train_labels = to_categorical(train_labels, num_classes=5)

# normalize pixel values between -1 and 1
test_images = preprocessing.normalize(test_images)
train_images = preprocessing.normalize(train_images)
test_images = 2 * test_images - 1
train_images = 2 * train_images - 1
# split the train_images into 10% validation and 90% train data.
train_images, validation_images, train_labels, validation_labels =\
    train_test_split(train_images, train_labels, test_size=0.1, random_state=1)

clf = MLPClassifier(hidden_layer_sizes=(16,128,16), activation='relu', batch_size=500, solver='sgd', max_iter=600,
                    learning_rate='constant',learning_rate_init=0.04, momentum=0, alpha=0)
classes = [0,1,2,3,4]


for i in range(100):
    for j in range(6):
        for k in range(10):
            clf.partial_fit(train_images, train_labels, classes)
        # calculate  validation score and train loss after 10 iterations
        val_score.append(clf.score(validation_images, validation_labels, sample_weight=None))
        loss.append(clf.loss_)
    # shuffle the training set after each epoch
    idx = np.random.permutation(len(train_labels))
    train_images, train_labels = train_images[idx], train_labels[idx]
    print(i * 60 + 6 * 10 + 1, 'th iteration')

#test_score = []
#test_score.append(clf.score(test_images, test_labels, sample_weight=None))
#weights = clf.coefs_[1]
# save the experiment results


with open('4val_score1.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(val_score)
csvFile.close()

with open('4loss1.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(loss)
csvFile.close()

train_score = []
val_score = []
loss = []
train_score1 = []
val_score1 = []
loss1 = []
test_score1 = []
weights1 = []
clf2 = MLPClassifier(hidden_layer_sizes=(16,128,16), activation='relu', batch_size=500, solver='sgd', max_iter=600,
                    learning_rate='constant',learning_rate_init=0.01, momentum=0, alpha=0)
classes = [0,1,2,3,4]

for i in range(100):
    for j in range(6):
        for k in range(10):
            clf2.partial_fit(train_images, train_labels, classes)
        # calculate  validation score and train loss after 10 iterations
        val_score.append(clf2.score(validation_images, validation_labels, sample_weight=None))
        loss.append(clf2.loss_)
    # shuffle the training set after each epoch
    idx = np.random.permutation(len(train_labels))
    train_images, train_labels = train_images[idx], train_labels[idx]
    print(i * 60 + 6 * 10 + 1, 'th iteration')
#test_score = []
#test_score.append(clf.score(test_images, test_labels, sample_weight=None))
#weights = clf.coefs_[1]
# save the experiment results


with open('4val_score01.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(val_score)
csvFile.close()

with open('4loss01.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(loss)
csvFile.close()

train_score = []
val_score = []
loss = []
train_score1 = []
val_score1 = []
loss1 = []
test_score1 = []
weights1 = []
clf3 = MLPClassifier(hidden_layer_sizes=(16,128,16), activation='relu', batch_size=500, solver='sgd', max_iter=600,
                    learning_rate='constant',learning_rate_init=0.001, momentum=0, alpha=0)
classes = [0,1,2,3,4]

for i in range(100):
    for j in range(6):
        for k in range(10):
            clf3.partial_fit(train_images, train_labels, classes)
        # calculate  validation score and train loss after 10 iterations
        val_score.append(clf3.score(validation_images, validation_labels, sample_weight=None))
        loss.append(clf3.loss_)
    # shuffle the training set after each epoch
    idx = np.random.permutation(len(train_labels))
    train_images, train_labels = train_images[idx], train_labels[idx]
    print(i * 60 + 6 * 10 + 1, 'th iteration')
#test_score = []
#test_score.append(clf.score(test_images, test_labels, sample_weight=None))
#weights = clf.coefs_[1]
# save the experiment results


with open('4val_score001.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(val_score)
csvFile.close()

with open('4loss001.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(loss)
csvFile.close()
