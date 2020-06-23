import numpy as np
import matplotlib.pyplot as plt
from species import *

def plot_fig(txt, spe, div = None):
    raw = np.loadtxt(txt)
    t = raw[:,0]
    d = 'xH'
    abu = raw[:,eval('krome_idx_' + spe)]
    if div != None:
        abu /= raw[:,eval('krome_idx_' + div)]
        d = 'n' + div
    plt.loglog(t, abu, label = txt[-4:-1])
    plt.xlabel(r'$t$ (yr)')
    plt.ylabel(r'$n$'+spe.replace('j','+').replace('k','-')+'/'+d)
    plt.legend()

species_list = ['C','Cj']
j = 1
for i in species_list:
    plt.subplot(1,2,j)
    j += 1
    plot_fig('/Users/chang/KROME/build/data/EA1', i)
    plot_fig('/Users/chang/KROME/build/data/EA2', i)
    plot_fig('/Users/chang/KROME/build/data/EA3', i)
plt.show()

species_list = ['H3j','HCOj','H3Oj','OH','H2O','O2']
j = 1
for i in species_list:
    plt.subplot(2,3,j)
    j += 1
    plot_fig('/Users/chang/KROME/build/data/EA1', i)
    plot_fig('/Users/chang/KROME/build/data/EA2', i)
    plot_fig('/Users/chang/KROME/build/data/EA3', i)
plt.show()
