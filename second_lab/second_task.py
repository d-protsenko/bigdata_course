import os
import pandas as pd
import numpy as np


def main():
    df = pd.read_csv('./weather.csv', ',')
    df['Date'] = df['Day']
    df['Day'] = df['Date'].map(lambda x: int(x[8:10]))
    df['Year'] = df['Date'].map(lambda x: int(x[0:4]))
    df['Month'] = df['Date'].map(lambda x: int(x[5:7]))
    task_a(df)
    task_b(df)
    task_c(df)
    task_d(df)


def task_a(df):
    tmean_years = df.groupby(['Year'], as_index=False).agg(t=('t', 'mean'))
    y_1y1 = tmean_years[(tmean_years['t'] == tmean_years['t'].min())]['Year'].max()
    print(f'y_1y1: {y_1y1}')
    y_2y2 = tmean_years[(tmean_years['t'] == tmean_years['t'].max())]['Year'].max()
    print(f'y_2y2: {y_2y2}')
    print(f'y_1y1 + y_2y2: {y_1y1 + y_2y2}')


def task_b(df):
    aggregated = df[(df['Month'] == 1) & (df['t'] > 0)] \
        .groupby(['Year'], as_index=False).agg(avg_day=('Day', 'count'))
    year_with_max_days = aggregated[(aggregated['avg_day'] == aggregated['avg_day'].max())].min()['Year'].max()
    print(f'year_with_max_days: {year_with_max_days}')


def task_c(df):
    summer = df[(5 < df['Month']) & (df['Month'] < 9)]
    mean_by_t = summer.groupby(['Year'], as_index=False).agg(mean_t=('t', 'mean'))
    hottest_summer_year = mean_by_t[(mean_by_t['mean_t'] == mean_by_t['mean_t'].max())]['Year'].min()
    print(f'hottest_summer_year: {hottest_summer_year}')


def task_d(df):
    compared = df
    compared['t_diff'] = compared['t'].shift(-1)
    compared['t_diff'][len(compared['t_diff']) - 1] = 0
    compared['t_diff'] = compared['t_diff'].map(lambda x: abs(int(x)))
    max_diff_date = compared[(compared['t_diff'] == compared['t_diff'].max())]['Date'].max()
    print(f'max_diff_date: {max_diff_date}')


if __name__ == '__main__':
    main()
