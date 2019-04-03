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

clf = MLPClassifier(hidden_layer_sizes=(128), activation='relu', batch_size=500, solver='adam', max_iter=600, momentum=0, alpha=0)
classes = [0,1,2,3,4]

for i in range(100):
    for j in range(6):
        for k in range(10):
            clf.partial_fit(train_images, train_labels, classes)
        # calculate train_score, validation score and train loss after 10 iterations
        train_score.append(clf.score(train_images, train_labels, sample_weight=None))
        val_score.append(clf.score(validation_images, validation_labels, sample_weight=None))
        loss.append(clf.loss_)
    # shuffle the training set after each epoch
    idx = np.random.permutation(len(train_labels))
    train_images, train_labels = train_images[idx], train_labels[idx]
    print(i * 60 + 6 * 10 + 1, 'th iteration')
test_score = []
test_score.append(clf.score(test_images, test_labels, sample_weight=None))
weights = clf.coefs_[1]
# save the experiment results

with open('2train_score1.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(train_score)
csvFile.close()

with open('2val_score1.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(val_score)
csvFile.close()

with open('2loss1.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(loss)
csvFile.close()


with open('2test_score1.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(test_score)
csvFile.close()

with open('2weights1.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(weights)
csvFile.close()

train_score = []
val_score = []
loss = []
train_score1 = []
val_score1 = []
loss1 = []
test_score1 = []
weights1 = []

clf2 = MLPClassifier(hidden_layer_sizes=(16,128), activation='relu', batch_size=500, solver='adam', max_iter=600, momentum=0, alpha=0)
classes = [0,1,2,3,4]

for i in range(100):
    for j in range(6):
        for k in range(10):
            clf2.partial_fit(train_images, train_labels, classes)
        # calculate train_score, validation score and train loss after 10 iterations
        train_score.append(clf2.score(train_images, train_labels, sample_weight=None))
        val_score.append(clf2.score(validation_images, validation_labels, sample_weight=None))
        loss.append(clf2.loss_)
    # shuffle the training set after each epoch
    idx = np.random.permutation(len(train_labels))
    train_images, train_labels = train_images[idx], train_labels[idx]
    print(i * 60 + 6 * 10 + 1, 'th iteration')
test_score = []
test_score.append(clf2.score(test_images, test_labels, sample_weight=None))
weights = clf2.coefs_[1]
# save the experiment results

with open('2train_score2.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(train_score)
csvFile.close()

with open('2val_score2.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(val_score)
csvFile.close()

with open('2loss2.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(loss)
csvFile.close()


with open('2test_score2.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(test_score)
csvFile.close()

with open('2weights2.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(weights)
csvFile.close()

train_score = []
val_score = []
loss = []
train_score1 = []
val_score1 = []
loss1 = []
test_score1 = []
weights1 = []
clf3 = MLPClassifier(hidden_layer_sizes=(16,128,16), activation='relu', batch_size=500, solver='adam', max_iter=600, momentum=0, alpha=0)
classes = [0,1,2,3,4]

for i in range(100):
    for j in range(6):
        for k in range(10):
            clf3.partial_fit(train_images, train_labels, classes)
        # calculate train_score, validation score and train loss after 10 iterations
        train_score.append(clf3.score(train_images, train_labels, sample_weight=None))
        val_score.append(clf3.score(validation_images, validation_labels, sample_weight=None))
        loss.append(clf3.loss_)
    # shuffle the training set after each epoch
    idx = np.random.permutation(len(train_labels))
    train_images, train_labels = train_images[idx], train_labels[idx]
    print(i * 60 + 6 * 10 + 1, 'th iteration')
test_score = []
test_score.append(clf3.score(test_images, test_labels, sample_weight=None))
weights = clf3.coefs_[1]
# save the experiment results

with open('2train_score3.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(train_score)
csvFile.close()

with open('2val_score3.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(val_score)
csvFile.close()

with open('2loss3.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(loss)
csvFile.close()


with open('2test_score3.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(test_score)
csvFile.close()

with open('2weights3.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(weights)
csvFile.close()

train_score = []
val_score = []
loss = []
train_score1 = []
val_score1 = []
loss1 = []
test_score1 = []
weights1 = []
clf5 = MLPClassifier(hidden_layer_sizes=(16,128,64,32,16), activation='relu', batch_size=500, solver='adam', max_iter=600, momentum=0, alpha=0)
classes = [0,1,2,3,4]

for i in range(100):
    for j in range(6):
        for k in range(10):
            clf5.partial_fit(train_images, train_labels, classes)
        # calculate train_score, validation score and train loss after 10 iterations
        train_score.append(clf5.score(train_images, train_labels, sample_weight=None))
        val_score.append(clf5.score(validation_images, validation_labels, sample_weight=None))
        loss.append(clf5.loss_)
    # shuffle the training set after each epoch
    idx = np.random.permutation(len(train_labels))
    train_images, train_labels = train_images[idx], train_labels[idx]
    print(i * 60 + 6 * 10 + 1, 'th iteration')
test_score = []
test_score.append(clf5.score(test_images, test_labels, sample_weight=None))
weights = clf5.coefs_[1]
# save the experiment results

with open('2train_score5.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(train_score)
csvFile.close()

with open('2val_score5.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(val_score)
csvFile.close()

with open('2loss5.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(loss)
csvFile.close()


with open('2test_score5.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(test_score)
csvFile.close()

with open('2weights5.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(weights)
csvFile.close()

train_score = []
val_score = []
loss = []
train_score1 = []
val_score1 = []
loss1 = []
test_score1 = []
weights1 = []
clf7 = MLPClassifier(hidden_layer_sizes=(16,32,64,128,64,32,16), activation='relu', batch_size=500, solver='adam', max_iter=600, momentum=0, alpha=0)
classes = [0,1,2,3,4]

for i in range(100):
    for j in range(6):
        for k in range(10):
            clf7.partial_fit(train_images, train_labels, classes)
        # calculate train_score, validation score and train loss after 10 iterations
        train_score.append(clf7.score(train_images, train_labels, sample_weight=None))
        val_score.append(clf7.score(validation_images, validation_labels, sample_weight=None))
        loss.append(clf7.loss_)
    # shuffle the training set after each epoch
    idx = np.random.permutation(len(train_labels))
    train_images, train_labels = train_images[idx], train_labels[idx]
    print(i * 60 + 6 * 10 + 1, 'th iteration')
test_score = []
test_score.append(clf7.score(test_images, test_labels, sample_weight=None))
weights = clf7.coefs_[1]
# save the experiment results

with open('2train_score7.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(train_score)
csvFile.close()

with open('2val_score7.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(val_score)
csvFile.close()

with open('2loss7.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(loss)
csvFile.close()


with open('2test_score7.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(test_score)
csvFile.close()

with open('2weights7.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(weights)
csvFile.close()


import csv
import pickle
import numpy as np
import utils

p2_arch_1_loss = list(csv.reader(open('2loss1.csv'), quoting=csv.QUOTE_NONNUMERIC))
p2_arch_1_loss = p2_arch_1_loss.pop(0)
p2_arch_1_test = list(csv.reader(open('2test_score1.csv'), quoting=csv.QUOTE_NONNUMERIC))
p2_arch_1_test = p2_arch_1_test.pop(0)
p2_arch_1_train = list(csv.reader(open('2train_score1.csv'), quoting=csv.QUOTE_NONNUMERIC))
p2_arch_1_train = p2_arch_1_train.pop(0)
p2_arch_1_val = list(csv.reader(open('2val_score1.csv'), quoting=csv.QUOTE_NONNUMERIC))
p2_arch_1_val = p2_arch_1_val.pop(0)
p2_arch_1_weights = list(csv.reader(open('2weights1.csv')))

p2_arch_2_loss = list(csv.reader(open('2loss2.csv'), quoting=csv.QUOTE_NONNUMERIC))
p2_arch_2_loss = p2_arch_2_loss.pop(0)
p2_arch_2_test = list(csv.reader(open('2test_score2.csv'), quoting=csv.QUOTE_NONNUMERIC))
p2_arch_2_test = p2_arch_2_test.pop(0)
p2_arch_2_train = list(csv.reader(open('2train_score2.csv'), quoting=csv.QUOTE_NONNUMERIC))
p2_arch_2_train = p2_arch_2_train.pop(0)
p2_arch_2_val = list(csv.reader(open('2val_score2.csv'), quoting=csv.QUOTE_NONNUMERIC))
p2_arch_2_val = p2_arch_2_val.pop(0)
p2_arch_2_weights = list(csv.reader(open('2weights2.csv')))

p2_arch_3_loss = list(csv.reader(open('2loss3.csv'), quoting=csv.QUOTE_NONNUMERIC))
p2_arch_3_loss = p2_arch_3_loss.pop(0)
p2_arch_3_test = list(csv.reader(open('2test_score3.csv'), quoting=csv.QUOTE_NONNUMERIC))
p2_arch_3_test = p2_arch_3_test.pop(0)
p2_arch_3_train = list(csv.reader(open('2train_score3.csv'), quoting=csv.QUOTE_NONNUMERIC))
p2_arch_3_train = p2_arch_3_train.pop(0)
p2_arch_3_val = list(csv.reader(open('2val_score3.csv'), quoting=csv.QUOTE_NONNUMERIC))
p2_arch_3_val = p2_arch_3_val.pop(0)
p2_arch_3_weights = list(csv.reader(open('2weights3.csv')))

p2_arch_5_loss = list(csv.reader(open('2loss5.csv'), quoting=csv.QUOTE_NONNUMERIC))
p2_arch_5_loss = p2_arch_5_loss.pop(0)
p2_arch_5_test = list(csv.reader(open('2test_score5.csv'), quoting=csv.QUOTE_NONNUMERIC))
p2_arch_5_test = p2_arch_5_test.pop(0)
p2_arch_5_train = list(csv.reader(open('2train_score5.csv'), quoting=csv.QUOTE_NONNUMERIC))
p2_arch_5_train = p2_arch_5_train.pop(0)
p2_arch_5_val = list(csv.reader(open('2val_score5.csv'), quoting=csv.QUOTE_NONNUMERIC))
p2_arch_5_val = p2_arch_5_val.pop(0)
p2_arch_5_weights = list(csv.reader(open('2weights5.csv')))

p2_arch_7_loss = list(csv.reader(open('2loss7.csv'), quoting=csv.QUOTE_NONNUMERIC))
p2_arch_7_loss = p2_arch_7_loss.pop(0)
p2_arch_7_test = list(csv.reader(open('2test_score7.csv'), quoting=csv.QUOTE_NONNUMERIC))
p2_arch_7_test = p2_arch_7_test.pop(0)
p2_arch_7_train = list(csv.reader(open('2train_score7.csv'), quoting=csv.QUOTE_NONNUMERIC))
p2_arch_7_train = p2_arch_7_train.pop(0)
p2_arch_7_val = list(csv.reader(open('2val_score7.csv'), quoting=csv.QUOTE_NONNUMERIC))
p2_arch_7_val = p2_arch_7_val.pop(0)
p2_arch_7_weights = list(csv.reader(open('2weights7.csv')))

part2_arch_1 = {"name": 'arch_1',
                "loss_curve": p2_arch_1_loss,
                "train_acc_curve": p2_arch_1_train,
                "val_acc_curve": p2_arch_1_val,
                "test_acc": p2_arch_1_test,
                "weights": p2_arch_1_weights}

part2_arch_2 = {"name": 'arch_2',
                "loss_curve": p2_arch_2_loss,
                "train_acc_curve": p2_arch_2_train,
                "val_acc_curve": p2_arch_2_val,
                "test_acc": p2_arch_2_test,
                "weights": p2_arch_2_weights}

part2_arch_3 = {"name": 'arch_3',
                "loss_curve": p2_arch_3_loss,
                "train_acc_curve": p2_arch_3_train,
                "val_acc_curve": p2_arch_3_val,
                "test_acc": p2_arch_3_test,
                "weights": p2_arch_3_weights}

part2_arch_5 = {"name": 'arch_5',
                "loss_curve": p2_arch_5_loss,
                "train_acc_curve": p2_arch_5_train,
                "val_acc_curve": p2_arch_5_val,
                "test_acc": p2_arch_5_test,
                "weights": p2_arch_5_weights}

part2_arch_7 = {"name": 'arch_7',
                "loss_curve": p2_arch_7_loss,
                "train_acc_curve": p2_arch_7_train,
                "val_acc_curve": p2_arch_7_val,
                "test_acc": p2_arch_7_test,
                "weights": p2_arch_7_weights}

pickle_out = open("part2_arch_1.pickle", "wb")
pickle.dump(part2_arch_1, pickle_out)
pickle_out.close()

pickle_out = open("part2_arch_2.pickle", "wb")
pickle.dump(part2_arch_2, pickle_out)
pickle_out.close()

pickle_out = open("part2_arch_3.pickle", "wb")
pickle.dump(part2_arch_3, pickle_out)
pickle_out.close()

pickle_out = open("part2_arch_5.pickle", "wb")
pickle.dump(part2_arch_5, pickle_out)
pickle_out.close()

pickle_out = open("part2_arch_7.pickle", "wb")
pickle.dump(part2_arch_7, pickle_out)
pickle_out.close()

results = [part2_arch_1, part2_arch_2, part2_arch_3, part2_arch_5, part2_arch_7]

utils.part2Plots(results, save_dir='C:/Users/Caner/Documents/GitHub/Course-Projects/EE496/Homework1', filename='image', show_plot=True)

