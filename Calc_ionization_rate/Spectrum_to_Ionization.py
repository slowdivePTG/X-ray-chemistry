#!/usr/bin/env python
# coding: utf-8

# # Flux with and without absorption

# In[1]:

import numpy as np
import os
import string as s
import matplotlib.pyplot as plt

# ## Raw Spectrum

# In[2]:


def get_filename(path, filetype, noname=False):
    Name = []
    Final_Name = []
    for root, dirs, files in os.walk(path):
        #os.walk()
        #generate the file names in a directory tree by walking the tree either top-down or bottom-up.
        #For each directory in the tree rooted at directory top (including top itself),
        #it yields a 3-tuple (dirpath, dirnames, filenames).
        for i in files:
            if filetype in i:
                i = '/'.join((root, i))
                Name.append(i.replace(filetype,
                                      ''))  #list of file names without '.dat'
    if not noname:
        Final_Name = [item + filetype
                      for item in Name]  #list of the complete names
    else:
        Final_Name = Name
    return (Final_Name)


# In[3]:


class Spec:
    def __init__(self, filename):
        # alpha, beta, mdot
        place_alpha = filename.find('alpha')
        place_beta = filename.find('-beta')
        place_mdot = filename.find('/data-spect-mdot')
        place_end = filename.find('-alpha')
        self.name = filename[place_mdot:filename.find('.txt')]
        self.alpha = float(filename[place_alpha + len('alpha'):place_beta])
        self.beta = int(filename[place_beta + len('-beta'):place_mdot])
        self.mdot = float(filename[place_mdot +
                                   len('/data-spect-mdot'):place_end])

        # spectrum
        raw_data = np.loadtxt(filename)
        self.nu = 10**raw_data[:, 0]
        self.E_eV = self.nu * (4.13566553853599E-15)  #Hertz to eV
        self.E_keV = self.E_eV / 1000
        self.Lnu = 10**raw_data[:, 1]# * 4 #Jieying Liu's suggestion
        self.Lnus = 10**raw_data[:, 2]# * 4 #Jieying Liu's suggestion
        self.nuL = 10**raw_data[:, 3]# * 4 #Jieying Liu's suggestion
        self.nuLs = 10**raw_data[:, 4]# * 4 #Jieying Liu's suggestion

    def intro(self):
        print('************************')
        print('alpha = ', self.alpha)
        print('beta = ', self.beta)
        print('mdot = ', self.mdot)
        print('************************')

    def draw(self, absorb=False):
        plt.loglog(self.E_eV, self.Fnu, label=self.title(),
                   lw=0.25)  #, color = '#C1693C')
        plt.xlabel(r'$E$(eV)')
        plt.ylabel(r'$F($erg s$^{-1}$ cm $^{-2}$ Hz $^{-1}$)')
        #plt.ylim([1e-9,1e-1])
        plt.xlim([1e-1, 1e6])
        if absorb:
            plt.loglog(self.E_eV,
                       self.Fnu_abs,
                       '--',
                       label=self.title() + ' (absorption)',
                       lw=0.5)  #, color = '#F7C242')

    def flux(self, distance):
        self.distance_kpc = distance
        self.distance_cm = 3.0856776e+21 * distance  #kpc to cm
        self.Fnu = self.Lnu / 4 / np.pi / self.distance_cm**2  #No absorption
        return (self.Fnu)

    def absorb(self, Abs):
        self.flux(Abs.distance)
        self.Fnu_abs = self.Fnu.copy()
        Abs_UV_raw = np.loadtxt('./Galactic_absorption_UV/dist_1.0kpc')
        Abs_UV_E = Abs_UV_raw[:, 0]
        Abs_UV = Abs_UV_raw[:, 2]
        for j in range(len(self.E_eV)):
            for i in range(len(Abs_UV_E)):
                if self.E_keV[j] < Abs_UV_E[i]:
                    break
            if i == 0:
                slope = (Abs_UV[1] - Abs_UV[0]) / (Abs_UV_E[1] - Abs_UV_E[0])
                self.Fnu_abs[j] = self.Fnu[j] * (Abs_UV[0] + slope *
                                                 (self.E_keV[j] - Abs_UV_E[0]))
            elif i == len(Abs.E):
                pass
            else:
                slope = (Abs_UV[i - 1] - Abs_UV[i]) / (Abs_UV_E[i - 1] -
                                                       Abs_UV_E[i])
                self.Fnu_abs[j] = self.Fnu[j] * (Abs_UV[i] + slope *
                                                 (self.E_keV[j] - Abs_UV_E[i]))
        for j in range(len(self.E_eV)):
            for i in range(len(Abs.E)):
                if self.E_keV[j] < Abs.E[i]:
                    break
            if i == 0:
                slope = (Abs.absorb[1] - Abs.absorb[0]) / (Abs.E[1] - Abs.E[0])
                self.Fnu_abs[j] = self.Fnu_abs[j] * (
                    Abs.absorb[0] + slope * (self.E_keV[j] - Abs.E[0]))
            elif i == len(Abs.E):
                pass
            else:
                slope = (Abs.absorb[i - 1] - Abs.absorb[i]) / (Abs.E[i - 1] -
                                                               Abs.E[i])
                self.Fnu_abs[j] = self.Fnu_abs[j] * (
                    Abs.absorb[i] + slope * (self.E_keV[j] - Abs.E[i]))

    def info(self, alpha=True, beta=True, mdot=True):
        temp = {}
        if alpha:
            temp['alpha'] = self.alpha
        if beta:
            temp['beta'] = self.beta
        if mdot:
            temp['mdot'] = self.mdot
        return (temp)

    def title(self, alpha=False, beta=False, mdot=False, distance=True):
        temp = ''
        if alpha:
            temp = temp + r'$\alpha=$' + str(self.alpha) + ', '
        if beta:
            temp = temp + r'$\beta=$' + str(self.beta) + ', '
        if mdot:
            temp = temp + r'$\dot m=$' + str(self.mdot) + ', '
        if distance:
            temp = temp + r'$distance=$' + str(self.distance_kpc) + ' kpc'
        return (temp)


# In[4]:


def readfile(path, filetype, distance, ab, ab_UV):
    name_list = get_filename(path, filetype)
    data_list = np.array([])

    for name in name_list:
        dat = Spec(name)
        data_list = np.append(data_list, dat)

    temp = 0
    ss = np.array([])
    from copy import deepcopy
    t = deepcopy(data_list)
    for dis in distance:
        t = deepcopy(t)
        temp += 1
        for dat in range(len(t)):
            t[dat].flux(dis)
            if dis >= 1:
                t[dat].absorb(ab[int(dis) - 1])
            else:
                t[dat].absorb(ab_UV[int(dis * 10) - 1])
        ss = np.append(ss, t)
    return (ss)


# In[5]:


def ok():
    import subprocess as sub
    sub.Popen("cowsay -f www I feel OK", shell=True)


# ## Absorption

# In[6]:


class Abs:
    def __init__(self, filename, UV=False):
        self_UV = UV
        if UV:  #UV absorption
            begin_UV = filename.find('dist_') + len('dist_')
            end_UV = filename.find('kpc')
            self.distance = float(filename[begin_UV:end_UV])
        else:
            begin = filename.find('nh_')
            dis = filename[begin + len('nh_'):-1] + filename[-1]
            self.distance = float(dis)
        data_raw = np.loadtxt(filename)
        self.E = data_raw[:, 0]
        self.absorb = data_raw[:, 2]


# In[7]:


def read_abs():
    name_abs = get_filename('./Galactic_absorption', '.txt', noname=True)
    name_abs_UV = get_filename('./Galactic_absorption_UV', '.txt', noname=True)
    abs_list, abs_UV_list = [], []
    for i in name_abs:
        temp = Abs(i)
        if temp.distance <= 25:
            abs_list.append(temp)
    for i in name_abs_UV:
        temp = Abs(i, UV=True)
        abs_UV_list.append(temp)
    ab = sorted(abs_list, key=lambda i: i.distance)
    ab_UV = sorted(abs_UV_list, key=lambda i: i.distance)
    return (ab, ab_UV)


# In[8]:


def draw_abs(ab, ab_UV):
    for i in ab:
        plt.loglog(i.E,
                   i.absorb,
                   lw=0.5,
                   label='distance = ' + str(i.distance) + ' kpc')
    plt.xlim([1e-1, 1e1])
    plt.ylim([1e-40, 1])
    plt.xlabel(r'$E$(eV)')
    plt.ylabel(r'$\alpha$')
    #plt.legend(bbox_to_anchor=(1.5,0.95))
    plt.show()
    for i in ab_UV:
        plt.loglog(i.E,
                   i.absorb,
                   lw=0.5,
                   label='distance = ' + str(i.distance) + ' kpc')
    plt.xlim([1e-2, 1])
    plt.ylim([1e-40, 1])
    plt.xlabel(r'$E$(eV)')
    plt.ylabel(r'$\alpha$')
    #plt.legend(bbox_to_anchor=(1.5,0.95))
    plt.show()


# In[18]:


def test(ab):
    data_list = readfile('./spectrum data/spectrum/', '.txt')
    data = data_list[17]
    data.intro()
    data.absorb(ab[7])
    data.draw(absorb=True)
    plt.show()
    ok()


ok()