import os
from os import sys
sys.path.append('./data')
import numpy as np
import matplotlib.pyplot as plt
from species import *

Col = [
    '#b2182b', '#d6604d', '#f4a582', '#fddbc7', '#d1e5f0', '#92c5de',
    '#4393c3', '#2166ac'
]


def latex_name(S):
    if 'DUST' in S:
        S = S.replace('_DUST', '')
    Name = {}
    for i in ['H', 'N', 'O', 'C', 'S', 'F', 'M', 'P', 'F']:
        Name[i] = r'\mathrm{' + i + '}'
    for i in ['E', 'I', 'L', 'A', 'G']:
        Name[i] = r'\mathrm{' + i.lower() + '}'
    for i in '0123456789':
        Name[i] = '_{}'.format(i)
    Name['j'] = '^+'
    Name['k'] = '^-'
    S_n = ''
    for i in S:
        S_n += Name[i]
    return '{}'.format(S_n)


class Abu:
    def __init__(self, i):
        txt = './data/2dis' + i
        raw = np.loadtxt(txt)
        self.t = raw[:, 0]
        self.dt = self.t - 1e6
        self.abu = raw
        self.name_div = r'$n_{\mathrm{H}}$'
        try:
            txt_l = './data/1dis' + i  #lower limit of extinction
            raw_l = np.loadtxt(txt_l)
            txt_u = './data/3dis' + i  #upper limit of extinction
            raw_u = np.loadtxt(txt_u)
            self.abu_l = raw_l
            self.abu_u = raw_u
        except:
            pass

    def Div(self, div):
        self.abu /= raw[:, eval('krome_idx_' + div)]
        self.abu_l /= raw_l[:, eval('krome_idx_' + div)]
        self.abu_u /= raw_u[:, eval('krome_idx_' + div)]
        self.name_div = r'$n{}$'.format(latex_name(div))

    def print(self, spe='H'):
        for i in range(len(self.t)):
            print(self.t[i], 'yr', self.abu[i, eval('krome_idx_' + spe)])

    def plot(self,
             ax,
             spe='H',
             label=None,
             color=None,
             linestyle='-',
             Dt=True,
             linewidth=1):
        if Dt:
            t = self.dt
        else:
            t = self.t
        arg = np.where(t > 0)
        x = t[arg]
        y = self.abu[:, eval('krome_idx_' + spe)][arg]
        ax.loglog(x,
                  y,
                  label=label,
                  color=color,
                  linestyle=linestyle,
                  linewidth=linewidth)

    def plot_u(self,
               ax,
               spe='H',
               color=None,
               Dt=True,
               Nolabel=True,
               NoX=False,
               linewidth=1):
        linewidth = 3
        if Dt:
            t = self.dt
        else:
            t = self.t
        if Nolabel:
            label = None
        else:
            label = r'$N_{\mathrm{H}}=10^{23}$ cm$^{-2}$'
        if NoX:
            label = 'No X-ray, ' + label
        arg = np.where(t > 0)
        x = t[arg]
        y = self.abu_u[:, eval('krome_idx_' + spe)][arg]
        ax.loglog(x,
                  y,
                  color=color,
                  linestyle='-.',
                  label=label,
                  linewidth=linewidth)

    def plot_l(self,
               ax,
               spe='H',
               color=None,
               Dt=True,
               Nolabel=True,
               NoX=False,
               linewidth=1):
        linewidth = 3
        if Dt:
            t = self.dt
        else:
            t = self.t
        arg = np.where(t > 0)
        if Nolabel:
            label = None
        else:
            label = r'$N_{\mathrm{H}}=10^{22}$ cm$^{-2}$'
        if NoX:
            label = 'No X-ray, ' + label
        arg = np.where(t > 0)
        x = t[arg]
        y = self.abu_l[:, eval('krome_idx_' + spe)][arg]
        ax.loglog(x,
                  y,
                  color=color,
                  linestyle=':',
                  label=label,
                  linewidth=linewidth)
