import numpy as np
import matplotlib.pyplot as plt
from species import *

# Get names of the species
with open('species') as data:
    line = data.readline()
    name = line.split(' ')

# Get names of the reactions
with open('../reactions_verbatim.dat') as data:
    reactions = data.readlines()

class Trace():
    def __init__(self, file):
        with open(file) as f:
            lines = f.readlines()

        self.t = np.array([])
        self.species = np.array([])

        react = {}
        pro = 0
        for line in lines:
            try:
                t = float(line)
                self.t = np.append(self.t, t)
                self.species = np.append(self.species, {})
                product = 0

            except:
                l = line.replace('   ', ' ')
                l = l.replace('  ', ' ')
                l = l.strip(' ')
                dat = l.split(' ')

                if product != int(dat[0]):
                    for na in react.keys():
                        S = dict(
                            sorted(react.items(), key=lambda item: item[1]))
                        form = {
                            key: value
                            for key, value in S.items() if float(value) > 0
                        }
                        destruct = {
                            key: value
                            for key, value in S.items() if float(value) < 0
                        }
                        self.species[-1][name[product - 1]] = {}
                        self.species[-1][name[product - 1]]['form'] = form
                        self.species[-1][name[product -
                                              1]]['destruct'] = destruct
                    react = {}

                product = int(dat[0])
                react[reactions[int(dat[1]) - 1]] = float(dat[2])

    def spe_list(self, sp):
        for item, i in enumerate(self.species):
            print(self.t[item])
            print('Formation')
            li = list(i[sp]['form'].keys())
            li.reverse()
            for num, j in enumerate(li[:min(5, len(li))], 1):
                print(j, i[sp]['form'][j])
            print('Destruction')
            li = list(i[sp]['destruct'].keys())
            for num, j in enumerate(li[:min(5, len(li))], 1):
                print(j, i[sp]['destruct'][j])

    def plot(self, sp, num=5):
        f, ax = plt.subplots(1, 2, figsize=(24, 8))
        ax[0].set_title('Formation', fontsize=25)
        ax[0].set_xlabel(r'$t-10^6$ (yr)', fontsize=25)
        ax[0].set_ylabel(r'd$n$/d$t$ (s$^{-1}$)', fontsize=25)
        ax[0].tick_params(labelsize=25)
        ax[1].set_title('Destruction', fontsize=25)
        ax[1].set_xlabel(r'$t-10^6$ (yr)', fontsize=25)
        ax[1].tick_params(labelsize=25)
        setf, setd = set(), set()
        for i in self.species:
            lf = list(i[sp]['form'].keys())
            lf.reverse()
            setf = setf | set(lf[:min(num, len(lf))])
            ld = list(i[sp]['destruct'].keys())
            setd = setd | set(ld[:min(num, len(ld))])
        for f in setf:
            ax[0].loglog(self.t - 1e6,
                         [i[sp]['form'][f] for i in self.species],
                         label=f)
        for d in setd:
            ax[1].loglog(self.t - 1e6,
                         [-i[sp]['destruct'][d] for i in self.species],
                         label=d)
        ax[0].legend(prop={'size': 10})
        ax[0].set_xlim([1e2, 1e8])
        ax[1].legend(prop={'size': 10})
        ax[1].set_xlim([1e2, 1e8])
