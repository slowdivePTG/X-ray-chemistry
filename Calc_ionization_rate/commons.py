from scipy.integrate import quad
import numpy as np
import matplotlib as mpl
import matplotlib.pyplot as plt

#Useful commons
#Planck Constant(ergs)
h = 6.62606957e-27
#Planck Constant(#!/usr/bin/env pythons)
h_eV = 4.135667662e-15
#Boltzmann Constant(erg/K)
k = 1.3806485279e-16
#frequence_0
mu0 = 1e0/h
#Gravitional constant(cm^3/g/s)
G = 6.67408e-8
#Mass of a Hydrogen atom(g)
mH = 1.67357e-24
#Mass of a Helium atom(g)
mHe = 1.67357e-24*4.0026022/1.00794

nH = 1e5
nHe = 1e4

xe = 0


#Initial conditions
T = 2.5e1 #K
J21 = 0.1
