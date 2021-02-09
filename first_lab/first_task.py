import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

data = np.ones(2)
data[0] = 0


def save_vector():
    plt.plot(data)
    plot, ax = plt.subplots()
    ax.plot(data)
    plot.savefig('./vector.jpg')


def save_hist():
    n_bins = len(data)
    fig, axs = plt.subplots()
    axs.hist(data, bins=n_bins)
    axs.set_title('histogram')
    plt.show()
    fig.savefig('./myhist.jpg')


def structures():
    listStructure = [0, 1, 2]
    print(f'list:\n{listStructure}')
    matrix = np.arange(12).reshape(3, 4)
    print(f'matrix:\n{matrix}')
    data = {'color': ['blue', 'green', 'yellow', 'red', 'white'],
            'object': ['ball', 'pen', 'pencil', 'paper', 'mug'],
            'price': [1.2, 1.0, 0.6, 0.9, 1.7]}
    frame = pd.DataFrame(data)
    print(f'DataFrame:\n{frame}')

def main():
    save_vector()
    save_hist()
    structures()


if __name__ == '__main__':
    main()
