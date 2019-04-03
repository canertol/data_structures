import csv
from sklearn import preprocessing
from sklearn.neural_network import MLPClassifier
from keras.utils.np_utils import to_categorical
import numpy as np
from sklearn.model_selection import train_test_split


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

clf = MLPClassifier(hidden_layer_sizes=(128), activation='relu', batch_size=500, solver='sgd', max_iter=600,
                    learning_rate='constant',learning_rate_init=0.01, momentum=0, alpha=0)
classes = [0,1,2,3,4]
loss = []
loss_grad = []
weights = np.array([])
temp = np.array([])

for i in range(100):
    for j in range(6):
        if i != 0 or j != 0:
            temp = weights*1
        for k in range(10):

            clf.partial_fit(train_images, train_labels, classes)
            weights = clf.coefs_[1]
            if i == 0 and j == 0 and k == 0:
                temp = weights*1
        loss.append(clf.loss_)
        loss_ = (100*temp-100*weights)
        loss_grad.append(np.sqrt(np.mean(loss_**2)))

    # shuffle the training set after each epoch
    idx = np.random.permutation(len(train_labels))
    train_images, train_labels = train_images[idx], train_labels[idx]
    print(i * 60 + 6 * 10 + 1, 'th iteration relu')
# save the experiment results


with open('3relu_loss1.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(loss)
csvFile.close()

with open('3relu_loss_grad1.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(loss_grad)
csvFile.close()


loss = []
loss_grad = []
weights = np.array([])
temp = np.array([])

clf2 = MLPClassifier(hidden_layer_sizes=(128), activation='logistic', batch_size=500, solver='sgd', max_iter=600,
                    learning_rate='constant',learning_rate_init=0.01, momentum=0, alpha=0)
classes = [0,1,2,3,4]

for i in range(100):
    for j in range(6):
        if i != 0 or j != 0:
            temp = weights*1
        for k in range(10):

            clf2.partial_fit(train_images, train_labels, classes)
            weights = clf2.coefs_[1]
            if i == 0 and j == 0 and k == 0:
                temp = weights*1
        loss.append(clf2.loss_)
        loss_ = (100*temp-100*weights)
        loss_grad.append(np.sqrt(np.mean(loss_**2)))

    # shuffle the training set after each epoch
    idx = np.random.permutation(len(train_labels))
    train_images, train_labels = train_images[idx], train_labels[idx]
    print(i * 60 + 6 * 10 + 1, 'th iteration logistic')


# save the experiment results


with open('3logistic_loss1.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(loss)
csvFile.close()

with open('3logistic_loss_grad1.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(loss_grad)
csvFile.close()

clf3 = MLPClassifier(hidden_layer_sizes=(16,128), activation='relu', batch_size=500, solver='sgd', max_iter=600,
                    learning_rate='constant',learning_rate_init=0.01, momentum=0, alpha=0)
classes = [0,1,2,3,4]
loss = []
loss_grad = []
weights = np.array([])
temp = np.array([])

for i in range(100):
    for j in range(6):
        if i != 0 or j != 0:
            temp = weights*1
        for k in range(10):

            clf3.partial_fit(train_images, train_labels, classes)
            weights = clf3.coefs_[1]
            if i == 0 and j == 0 and k == 0:
                temp = weights*1
        loss.append(clf3.loss_)
        loss_ = (100*temp-100*weights)
        loss_grad.append(np.sqrt(np.mean(loss_**2)))

    # shuffle the training set after each epoch
    idx = np.random.permutation(len(train_labels))
    train_images, train_labels = train_images[idx], train_labels[idx]
    print(i * 60 + 6 * 10 + 1, 'th iteration relu')
# save the experiment results


with open('3relu_loss2.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(loss)
csvFile.close()

with open('3relu_loss_grad2.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(loss_grad)
csvFile.close()


loss = []
loss_grad = []
weights = np.array([])
temp = np.array([])

clf4 = MLPClassifier(hidden_layer_sizes=(16,128), activation='logistic', batch_size=500, solver='sgd', max_iter=600,
                    learning_rate='constant',learning_rate_init=0.01, momentum=0, alpha=0)
classes = [0,1,2,3,4]

for i in range(100):
    for j in range(6):
        if i != 0 or j != 0:
            temp = weights*1
        for k in range(10):

            clf4.partial_fit(train_images, train_labels, classes)
            weights = clf4.coefs_[1]
            if i == 0 and j == 0 and k == 0:
                temp = weights*1
        loss.append(clf4.loss_)
        loss_ = (100*temp-100*weights)
        loss_grad.append(np.sqrt(np.mean(loss_**2)))

    # shuffle the training set after each epoch
    idx = np.random.permutation(len(train_labels))
    train_images, train_labels = train_images[idx], train_labels[idx]
    print(i * 60 + 6 * 10 + 1, 'th iteration logistic')


# save the experiment results


with open('3logistic_loss2.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(loss)
csvFile.close()

with open('3logistic_loss_grad2.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(loss_grad)
csvFile.close()
clf5 = MLPClassifier(hidden_layer_sizes=(16,128,16), activation='relu', batch_size=500, solver='sgd', max_iter=600,
                    learning_rate='constant',learning_rate_init=0.01, momentum=0, alpha=0)
classes = [0,1,2,3,4]
loss = []
loss_grad = []
weights = np.array([])
temp = np.array([])

for i in range(100):
    for j in range(6):
        if i != 0 or j != 0:
            temp = weights*1
        for k in range(10):

            clf5.partial_fit(train_images, train_labels, classes)
            weights = clf5.coefs_[1]
            if i == 0 and j == 0 and k == 0:
                temp = weights*1
        loss.append(clf5.loss_)
        loss_ = (100*temp-100*weights)
        loss_grad.append(np.sqrt(np.mean(loss_**2)))

    # shuffle the training set after each epoch
    idx = np.random.permutation(len(train_labels))
    train_images, train_labels = train_images[idx], train_labels[idx]
    print(i * 60 + 6 * 10 + 1, 'th iteration relu')
# save the experiment results


with open('3relu_loss3.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(loss)
csvFile.close()

with open('3relu_loss_grad3.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(loss_grad)
csvFile.close()


loss = []
loss_grad = []
weights = np.array([])
temp = np.array([])

clf6 = MLPClassifier(hidden_layer_sizes=(16,128,16), activation='logistic', batch_size=500, solver='sgd', max_iter=600,
                    learning_rate='constant',learning_rate_init=0.01, momentum=0, alpha=0)
classes = [0,1,2,3,4]

for i in range(100):
    for j in range(6):
        if i != 0 or j != 0:
            temp = weights*1
        for k in range(10):

            clf6.partial_fit(train_images, train_labels, classes)
            weights = clf6.coefs_[1]
            if i == 0 and j == 0 and k == 0:
                temp = weights*1
        loss.append(clf6.loss_)
        loss_ = (100*temp-100*weights)
        loss_grad.append(np.sqrt(np.mean(loss_**2)))

    # shuffle the training set after each epoch
    idx = np.random.permutation(len(train_labels))
    train_images, train_labels = train_images[idx], train_labels[idx]
    print(i * 60 + 6 * 10 + 1, 'th iteration logistic')


# save the experiment results


with open('3logistic_loss3.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(loss)
csvFile.close()

with open('3logistic_loss_grad3.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(loss_grad)
csvFile.close()

clf7 = MLPClassifier(hidden_layer_sizes=(16,128,64,32,16), activation='relu', batch_size=500, solver='sgd', max_iter=600,
                    learning_rate='constant',learning_rate_init=0.01, momentum=0, alpha=0)
classes = [0,1,2,3,4]
loss = []
loss_grad = []
weights = np.array([])
temp = np.array([])

for i in range(100):
    for j in range(6):
        if i != 0 or j != 0:
            temp = weights*1
        for k in range(10):

            clf7.partial_fit(train_images, train_labels, classes)
            weights = clf7.coefs_[1]
            if i == 0 and j == 0 and k == 0:
                temp = weights*1
        loss.append(clf7.loss_)
        loss_ = (100*temp-100*weights)
        loss_grad.append(np.sqrt(np.mean(loss_**2)))

    # shuffle the training set after each epoch
    idx = np.random.permutation(len(train_labels))
    train_images, train_labels = train_images[idx], train_labels[idx]
    print(i * 60 + 6 * 10 + 1, 'th iteration relu')
# save the experiment results


with open('3relu_loss5.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(loss)
csvFile.close()

with open('3relu_loss_grad5.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(loss_grad)
csvFile.close()


loss = []
loss_grad = []
weights = np.array([])
temp = np.array([])

clf8 = MLPClassifier(hidden_layer_sizes=(16,128,64,32,16), activation='logistic', batch_size=500, solver='sgd', max_iter=600,
                    learning_rate='constant',learning_rate_init=0.01, momentum=0, alpha=0)
classes = [0,1,2,3,4]

for i in range(100):
    for j in range(6):
        if i != 0 or j != 0:
            temp = weights*1
        for k in range(10):

            clf8.partial_fit(train_images, train_labels, classes)
            weights = clf8.coefs_[1]
            if i == 0 and j == 0 and k == 0:
                temp = weights*1
        loss.append(clf8.loss_)
        loss_ = (100*temp-100*weights)
        loss_grad.append(np.sqrt(np.mean(loss_**2)))

    # shuffle the training set after each epoch
    idx = np.random.permutation(len(train_labels))
    train_images, train_labels = train_images[idx], train_labels[idx]
    print(i * 60 + 6 * 10 + 1, 'th iteration logistic')


# save the experiment results


with open('3logistic_loss5.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(loss)
csvFile.close()

with open('3logistic_loss_grad5.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(loss_grad)
csvFile.close()

clf9 = MLPClassifier(hidden_layer_sizes=(16,32,64,128,64,32,16), activation='relu', batch_size=500, solver='sgd', max_iter=600,
                    learning_rate='constant',learning_rate_init=0.01, momentum=0, alpha=0)
classes = [0,1,2,3,4]
loss = []
loss_grad = []
weights = np.array([])
temp = np.array([])

for i in range(100):
    for j in range(6):
        if i != 0 or j != 0:
            temp = weights*1
        for k in range(10):

            clf9.partial_fit(train_images, train_labels, classes)
            weights = clf9.coefs_[1]
            if i == 0 and j == 0 and k == 0:
                temp = weights*1
        loss.append(clf9.loss_)
        loss_ = (100*temp-100*weights)
        loss_grad.append(np.sqrt(np.mean(loss_**2)))

    # shuffle the training set after each epoch
    idx = np.random.permutation(len(train_labels))
    train_images, train_labels = train_images[idx], train_labels[idx]
    print(i * 60 + 6 * 10 + 1, 'th iteration relu')
# save the experiment results


with open('3relu_loss7.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(loss)
csvFile.close()

with open('3relu_loss_grad7.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(loss_grad)
csvFile.close()


loss = []
loss_grad = []
weights = np.array([])
temp = np.array([])

clf10 = MLPClassifier(hidden_layer_sizes=(16,32,64,128,64,32,16), activation='logistic', batch_size=500, solver='sgd', max_iter=600,
                    learning_rate='constant',learning_rate_init=0.01, momentum=0, alpha=0)
classes = [0,1,2,3,4]

for i in range(100):
    for j in range(6):
        if i != 0 or j != 0:
            temp = weights*1
        for k in range(10):

            clf10.partial_fit(train_images, train_labels, classes)
            weights = clf10.coefs_[1]
            if i == 0 and j == 0 and k == 0:
                temp = weights*1
        loss.append(clf10.loss_)
        loss_ = (100*temp-100*weights)
        loss_grad.append(np.sqrt(np.mean(loss_**2)))

    # shuffle the training set after each epoch
    idx = np.random.permutation(len(train_labels))
    train_images, train_labels = train_images[idx], train_labels[idx]
    print(i * 60 + 6 * 10 + 1, 'th iteration logistic')


# save the experiment results


with open('3logistic_loss7.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(loss)
csvFile.close()

with open('3logistic_loss_grad7.csv','w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(loss_grad)
csvFile.close()


import csv
import pickle
import numpy as np
import utils

p3_arch_1_logistic_loss = list(csv.reader(open('3logistic_loss1.csv'), quoting=csv.QUOTE_NONNUMERIC))
p3_arch_1_logistic_loss = p3_arch_1_logistic_loss.pop(0)
p3_arch_1_relu_loss = list(csv.reader(open('3relu_loss1.csv'), quoting=csv.QUOTE_NONNUMERIC))
p3_arch_1_relu_loss = p3_arch_1_relu_loss.pop(0)
p3_arch_1_logistic_grad = list(csv.reader(open('3logistic_loss_grad1.csv'), quoting=csv.QUOTE_NONNUMERIC))
p3_arch_1_logistic_grad = p3_arch_1_logistic_grad.pop(0)
p3_arch_1_relu_grad = list(csv.reader(open('3relu_loss_grad1.csv'), quoting=csv.QUOTE_NONNUMERIC))
p3_arch_1_relu_grad = p3_arch_1_relu_grad.pop(0)


p3_arch_2_logistic_loss = list(csv.reader(open('3logistic_loss2.csv'), quoting=csv.QUOTE_NONNUMERIC))
p3_arch_2_logistic_loss = p3_arch_2_logistic_loss.pop(0)
p3_arch_2_relu_loss = list(csv.reader(open('3relu_loss2.csv'), quoting=csv.QUOTE_NONNUMERIC))
p3_arch_2_relu_loss = p3_arch_2_relu_loss.pop(0)
p3_arch_2_logistic_grad = list(csv.reader(open('3logistic_loss_grad2.csv'), quoting=csv.QUOTE_NONNUMERIC))
p3_arch_2_logistic_grad = p3_arch_2_logistic_grad.pop(0)
p3_arch_2_relu_grad = list(csv.reader(open('3relu_loss_grad2.csv'), quoting=csv.QUOTE_NONNUMERIC))
p3_arch_2_relu_grad = p3_arch_2_relu_grad.pop(0)

p3_arch_3_logistic_loss = list(csv.reader(open('3logistic_loss3.csv'), quoting=csv.QUOTE_NONNUMERIC))
p3_arch_3_logistic_loss = p3_arch_3_logistic_loss.pop(0)
p3_arch_3_relu_loss = list(csv.reader(open('3relu_loss3.csv'), quoting=csv.QUOTE_NONNUMERIC))
p3_arch_3_relu_loss = p3_arch_3_relu_loss.pop(0)
p3_arch_3_logistic_grad = list(csv.reader(open('3logistic_loss_grad3.csv'), quoting=csv.QUOTE_NONNUMERIC))
p3_arch_3_logistic_grad = p3_arch_3_logistic_grad.pop(0)
p3_arch_3_relu_grad = list(csv.reader(open('3relu_loss_grad3.csv'), quoting=csv.QUOTE_NONNUMERIC))
p3_arch_3_relu_grad = p3_arch_3_relu_grad.pop(0)

p3_arch_5_logistic_loss = list(csv.reader(open('3logistic_loss5.csv'), quoting=csv.QUOTE_NONNUMERIC))
p3_arch_5_logistic_loss = p3_arch_5_logistic_loss.pop(0)
p3_arch_5_relu_loss = list(csv.reader(open('3relu_loss5.csv'), quoting=csv.QUOTE_NONNUMERIC))
p3_arch_5_relu_loss = p3_arch_5_relu_loss.pop(0)
p3_arch_5_logistic_grad = list(csv.reader(open('3logistic_loss_grad5.csv'), quoting=csv.QUOTE_NONNUMERIC))
p3_arch_5_logistic_grad = p3_arch_5_logistic_grad.pop(0)
p3_arch_5_relu_grad = list(csv.reader(open('3relu_loss_grad5.csv'), quoting=csv.QUOTE_NONNUMERIC))
p3_arch_5_relu_grad = p3_arch_5_relu_grad.pop(0)

p3_arch_7_logistic_loss = list(csv.reader(open('3logistic_loss7.csv'), quoting=csv.QUOTE_NONNUMERIC))
p3_arch_7_logistic_loss = p3_arch_7_logistic_loss.pop(0)
p3_arch_7_relu_loss = list(csv.reader(open('3relu_loss7.csv'), quoting=csv.QUOTE_NONNUMERIC))
p3_arch_7_relu_loss = p3_arch_7_relu_loss.pop(0)
p3_arch_7_logistic_grad = list(csv.reader(open('3logistic_loss_grad7.csv'), quoting=csv.QUOTE_NONNUMERIC))
p3_arch_7_logistic_grad = p3_arch_7_logistic_grad.pop(0)
p3_arch_7_relu_grad = list(csv.reader(open('3relu_loss_grad7.csv'), quoting=csv.QUOTE_NONNUMERIC))
p3_arch_7_relu_grad = p3_arch_7_relu_grad.pop(0)

part3_arch_1 = {"name": 'arch_1',
                "relu_loss_curve": p3_arch_1_relu_loss,
                "sigmoid_loss_curve": p3_arch_1_logistic_loss,
                "relu_grad_curve": p3_arch_1_relu_grad,
                "sigmoid_grad_curve": p3_arch_1_logistic_grad,
               }

part3_arch_2 = {"name": 'arch_2',
                "relu_loss_curve": p3_arch_2_relu_loss,
                "sigmoid_loss_curve": p3_arch_2_logistic_loss,
                "relu_grad_curve": p3_arch_2_relu_grad,
                "sigmoid_grad_curve": p3_arch_2_logistic_grad,
               }

part3_arch_3 = {"name": 'arch_3',
                "relu_loss_curve": p3_arch_3_relu_loss,
                "sigmoid_loss_curve": p3_arch_3_logistic_loss,
                "relu_grad_curve": p3_arch_3_relu_grad,
                "sigmoid_grad_curve": p3_arch_3_logistic_grad,
               }

part3_arch_5 = {"name": 'arch_5',
                "relu_loss_curve": p3_arch_5_relu_loss,
                "sigmoid_loss_curve": p3_arch_5_logistic_loss,
                "relu_grad_curve": p3_arch_5_relu_grad,
                "sigmoid_grad_curve": p3_arch_5_logistic_grad,
               }

part3_arch_7 = {"name": 'arch_7',
                "relu_loss_curve": p3_arch_7_relu_loss,
                "sigmoid_loss_curve": p3_arch_7_logistic_loss,
                "relu_grad_curve": p3_arch_7_relu_grad,
                "sigmoid_grad_curve": p3_arch_7_logistic_grad,
               }

pickle_out = open("part3_arch_1.pickle", "wb")
pickle.dump(part3_arch_1, pickle_out)
pickle_out.close()

pickle_out = open("part3_arch_2.pickle", "wb")
pickle.dump(part3_arch_2, pickle_out)
pickle_out.close()

pickle_out = open("part3_arch_3.pickle", "wb")
pickle.dump(part3_arch_3, pickle_out)
pickle_out.close()

pickle_out = open("part3_arch_5.pickle", "wb")
pickle.dump(part3_arch_5, pickle_out)
pickle_out.close()

pickle_out = open("part3_arch_7.pickle", "wb")
pickle.dump(part3_arch_7, pickle_out)
pickle_out.close()

results = [part3_arch_1, part3_arch_2, part3_arch_3, part3_arch_5, part3_arch_7]

utils.part3Plots(results, save_dir='C:/Users/Caner/Documents/GitHub/Course-Projects/EE496/Homework1', filename='image2', show_plot=True)