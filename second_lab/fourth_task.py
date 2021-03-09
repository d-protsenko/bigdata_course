import os
import pandas as pd
import numpy as np
import scipy.stats as stats
import seaborn as sns
import matplotlib.pyplot as plt
import random
import sys
import warnings

if not sys.warnoptions:
    warnings.simplefilter("ignore")


def main():
    task_1()
    task_3()
    task_5()


def task_1():
    df = pd.DataFrame({'A': list(range(100)), 'B': list(range(100)), 'C': list(range(100))})
    # before adding nan
    print(df.head(10))

    nan_percent = {'A': 0.10, 'B': 0.15, 'C': 0.08}

    for col in df:
        for i, row_value in df[col].iteritems():
            if random.random() <= nan_percent[col]:
                df[col][i] = np.nan
    # after adding nan
    print(df.head(10))
    # with dropped nan rows
    print(df.dropna(how='any').head(10))


def task_3():
    data = pd.DataFrame({
        'A': generate(),
        'B': generate(),
        'C': generate()
    })
    # find absolute value of z-score for each observation
    z = np.abs(stats.zscore(data))

    # only keep rows in dataframe with all z-scores less than absolute value of 3
    data_clean = data[(z < 3).all(axis=1)]
    print(data.shape)
    # shape of data was changed
    print(data_clean.shape)
    sns.boxplot(data['A'])
    plt.show()
#     https://www.statology.org/remove-outliers-python/


def task_5():
    df = pd.DataFrame({
        'brand': ['Yum Yum', 'Yum Yum', 'Indomie', 'Indomie', 'Indomie'],
        'style': ['cup', 'cup', 'cup', 'pack', 'pack'],
        'rating': [4, 4, 3.5, 15, 5]
    })
    print(df)
    print(df.drop_duplicates())
    print(df.drop_duplicates(subset=['brand']))


def generate(median=630, err=12, outlier_err=100, size=80, outlier_size=10):
    errs = err * np.random.rand(size) * np.random.choice((-1, 1), size)
    data = median + errs

    lower_errs = outlier_err * np.random.rand(outlier_size)
    lower_outliers = median - err - lower_errs

    upper_errs = outlier_err * np.random.rand(outlier_size)
    upper_outliers = median + err + upper_errs

    data = np.concatenate((data, lower_outliers, upper_outliers))
    np.random.shuffle(data)

    return data


if __name__ == '__main__':
    main()
