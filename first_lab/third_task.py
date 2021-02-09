import pandas as pd
import time

file_name = './ss06pid.csv'


def main():
    data = pd.read_csv(file_name, ',')
    nanos = time.time_ns()
    df = data[['SEX', 'pwgtp15']]
    first_mean = df[(df['SEX'] == 1)]['pwgtp15'].mean()
    second_mean = df[(df['SEX'] == 2)]['pwgtp15'].mean()
    print(f'1 sex pwgtp15 mean: {first_mean}')
    print(f'2 sex pwgtp15 mean: {second_mean}')
    print(f'time elapsed: {(time.time_ns() - nanos) / (10 ** 9)}s')


if __name__ == '__main__':
    main()
