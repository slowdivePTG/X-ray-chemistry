#!/usr/bin/env python
# coding: utf-8

# # Flux with and without absorption
# - As a test, we first check the meaning of each data files (orz)

# In[1]:


import numpy as np
import os
import string as s
import matplotlib.pyplot as plt

def get_filename(path,filetype):
    Name =[]
    Final_Name = []
    for root,dirs,files in os.walk(path):
    #os.walk()
    #generate the file names in a directory tree by walking the tree either top-down or bottom-up.
    #For each directory in the tree rooted at directory top (including top itself),
    #it yields a 3-tuple (dirpath, dirnames, filenames).
        for i in files:
            if filetype in i:
                i = '/'.join((root,i))
                Name.append(i.replace(filetype,'')) #list of file names without '.dat'
    Final_Name = [item + filetype for item in Name] #list of the complete names
    return(Final_Name)

class spec:
    def __init__(self, filename):
        # alpha, beta, mdot
        place_alpha = filename.find('alpha')
        place_beta = filename.find('-beta')
        place_mdot = filename.find('/data-spect-mdot')
        place_end = filename.find('-alpha')
        self.name = filename[place_mdot:filename.find('.txt')]
        self.alpha = float(filename[place_alpha+len('alpha'):place_beta])
        self.beta = int(filename[place_beta+len('-beta'):place_mdot])
        self.mdot = float(filename[place_mdot+len('/data-spect-mdot'):place_end])

        # spectrum
        raw_data = np.loadtxt(filename)
        self.log_nu = raw_data[:,0]
        self.log_keV = self.log_nu+np.log10(4.13566553853599E-15)-3 #Hertz to keV
        self.log_Lnu = raw_data[:,1]
        self.log_Lnus = raw_data[:,2]
        self.log_nuL = raw_data[:,3]
        self.log_nuLs = raw_data[:,4]

    def info(self):
        print('************************')
        print('alpha = ', self.alpha)
        print('beta = ', self.beta)
        print('mdot = ', self.mdot)
        print('************************')

    def draw(self):
        plt.title(r'$\alpha=$'+str(self.alpha)+r', $\beta=$'+str(self.beta))
        plt.loglog(10**self.log_eV, 10**self.log_nuF, label = r'$\dot{m} = $' + str(self.mdot), lw = 0.5)
        plt.loglog(10**self.log_eV, 10**self.log_nuF-10**self.log_nuFs, '--',  label = r'$\dot{m} = $' + str(self.mdot) + ' ,extinction', lw = 0.5)
        plt.xlabel(r'$E$(keV)')
        plt.ylabel(r'$\nu F($erg s$^{-1}$ cm $^{-2}$)')
        plt.ylim([1e39,1e44])
        plt.xlim([1e-3,1e4])
        plt.legend(bbox_to_anchor=(1.5,1))

    def flux(self,distance):
        #distance in kpc
        self.distance_kpc = distance
        self.distance_cm = 3.0856776e+21*distance #kpc to cm
        self.Fnu = 10**self.log_Lnu/4/np.pi/self.distance_cm**2 #No absorption
        return(self.Fnu)


def readfile(path, filetype):
    name_list = get_filename(path, filetype)
    data_list = []

    for name in name_list:
        dat = spec(name)
        data_list.append(dat)

    data_list = np.array(data_list)
    return(data_list)

def ok():
    import subprocess as sub
    sub.Popen("cowsay -f www I feel OK", shell = True)
