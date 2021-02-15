import os
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import time

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


if __name__ == '__main__':
    big_df = pd.DataFrame({
        'Test': np.ones(1000000)
    })
    split_and_save_big_df(big_df)
    dir_path = './target'
    read = read_splitted_by_dir(dir_path)
    print(read)
