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