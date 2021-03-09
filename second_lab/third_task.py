import os
import pandas as pd
import numpy as np


def main():
    first_series = pd.Series([428, 300, 250, 578, 492, 204, 245, 420, 760, 363, 600, 483, 711, 265,
                              572, 350, 652, 460, 340, 670, 565, 750, 452])
    task_a(first_series)
    task_b(first_series)
    task_c(first_series)
    series_x = pd.Series([428, 300, 250, 578, 492, 204, 245, 420, 760, 363, 600, 483, 711, 265, 572,
                          350, 652, 460, 340, 670, 565, 750, 452])
    series_y = pd.Series([21, 33, 43, 71, 85, 17, 38, 43, 53, 76, 33, 16, 24, 59, 65, 73, 45, 63, 53, 43,
                          58, 28, 37])
    task_d(series_x, series_y)
    task_e(series_x, series_y)


def task_a(df):
    print('Mean: {0:.{1}f}'.format(df.mean(), 2))


def task_b(df):
    print(f'Median: {df.median()}')


def task_c(df):
    print('Std: {0:.{1}f}'.format(df.std(), 2))


def task_d(x, y):
    print('Cov: {0:.{1}f}'.format(x.cov(y), 4))


def task_e(x, y):
    print('Corr: {0:.{1}f}'.format(x.corr(y),4))


if __name__ == '__main__':
    main()
