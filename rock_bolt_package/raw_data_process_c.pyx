import numpy as np

def process(x, n=3):
    cdef int i
    cdef int j
    for j in range(0, x.shape[0]):
        for i in range(1, int(len(x)/n)):
            x.loc[j][i] = np.average(x.loc[j][i*n:i*n+n])

        for i in range(1, int(len(x)/n)):
            if (x.loc[j][i] > x.loc[j][i-1]) & (x.loc[j][i] > x.loc[j][i+1]) & (x.loc[j][i+1] <x.loc[j][i+2]):
                x.loc[j][i] = (x.loc[j][i-1] + x.loc[j][i+1])/2
            if (x.loc[j][i] < x.loc[j][i-1]) & (x.loc[j][i] < x.loc[j][i+1]) & (x.loc[j][i+1] >x.loc[j][i+2]):
                x.loc[j][i] = (x.loc[j][i-1] + x.loc[j][i+1])/2
        for i in range(1, int(len(x)/n)):
            if (x.loc[j][i] > x.loc[j][i-1]) & (x.loc[j][i] > x.loc[j][i+1]) & (x.loc[j][i+1] <x.loc[j][i+2]):
                x.loc[j][i] = (x.loc[j][i-1] + x.loc[j][i+1])/2
            if (x.loc[j][i] < x.loc[j][i-1]) & (x.loc[j][i] < x.loc[j][i+1]) & (x.loc[j][i+1] >x.loc[j][i+2]):
                x.loc[j][i] = (x.loc[j][i-1] + x.loc[j][i+1])/2
    x.to_csv('D:\\01.working\\02.research projects\\01.rock bolt\data\\raw data\\xxx.csv', header=None, index=None)
    return x
