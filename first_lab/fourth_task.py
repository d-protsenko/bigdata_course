import os
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import time
from nycflights13 import flights


def split_and_save_big_df(big_df):
    splitted = np.array_split(big_df, 4)
    if not os.path.exists("./target"):
        os.mkdir('./target')
    for i in range(0, len(splitted)):
        splitted[i].to_csv(f'./target/file{i}.csv')


def read_splitted_by_dir(dir_path):
    filelist = os.listdir(dir_path)
    df_list = [pd.read_table(f'{dir_path}/' + file) for file in filelist]
    df = pd.concat(df_list)
    return df


def first_task():
    big_df = pd.DataFrame({
        'Test': np.ones(1000000)
    })
    split_and_save_big_df(big_df)
    dir_path = './target'
    read = read_splitted_by_dir(dir_path)
    print(read)


def count_by_carrier():
    counted = flights.groupby(['carrier'], as_index=False).agg(count=('flight', 'count'))
    print(counted)


def first_and_last_five():
    df = flights[['dep_time', 'dep_delay', 'arr_time', 'carrier', 'tailnum']]
    print(df.head(5).append(df.tail(5)))


def means_by_carrier():
    aggregated = flights.groupby(['carrier'], as_index=False) \
        .agg(mean_arr_delay=('arr_delay', 'mean'),
             mean_dep_delay=('dep_delay', 'mean'))
    print(aggregated)


def transpose():
    df = np.ones((3, 100), int)
    print(df)
    df_transposed = df.transpose()
    print(df_transposed)


if __name__ == '__main__':
    first_task()
    count_by_carrier()
    first_and_last_five()
    means_by_carrier()
    transpose()
