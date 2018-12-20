#This is used for calculating the cross sections of HI and HeI
from commons import *

class atom:
    def __init__(self, name, Eth, Emax, E0, sigma0, ya, P, yw, y0, y1):
        self.name = name
        self.Eth, self.Emax, self.E0 = Eth, Emax, E0
        self.sigma0, self.P = sigma0, P
        self.ya, self.yw, self.y0, self.y1 = ya, yw, y0, y1
        if (name == 'H'):
            self.aa, self.bb, self.cc = 0.3908, 0.4092, 1.7592
        elif (name == 'He'):
            self.aa, self.bb, self.cc = 0.0554, 0.4614, 1.666
        else:
            self.aa, self.bb, self.cc = 0, 0, 0

    def cross(self, E):
        x = E/self.E0-self.y0
        y = np.sqrt(x**2+self.y1**2)
        D = (x-1)**2+self.yw**2
        B = np.power(y, 0.5*self.P-5.5)
        C = np.power(1+np.sqrt(y/self.ya),-self.P)
        return(D*B*C*self.sigma0*1e-18)

    def draw(self):
        E = np.linspace(self.Eth, self.Emax, 10000)
        sigma = self.cross(E)
        plt.xscale('log')
        plt.yscale('log')
        plt.plot(E, sigma, label=self.name)
        plt.xlabel("E(eV)",fontsize=13)
        plt.ylabel("$\sigma$(cm$^2$)",fontsize=13)
        plt.legend()

    def min(self):
        return self.Eth

    def max(self):
        return self.Emax

    def getabc(self):
        return self.aa, self.bb, self.cc

def main():
    H = atom('H', 1.360E+1, 5.000E+04, 4.298E-01, 5.475E+04, 3.288E+01, 2.963E+00, 0.000E+00, 0.000E+00, 0.000E+00)
    He = atom('He', 2.459E+1, 5.000E+04, 1.361E+01, 9.492E+02, 1.469E+00, 3.188E+00, 2.039E+00, 4.434E-01, 2.136E+00)
    C = atom('C',1.126E+01, 2.910E+02, 2.144E+00, 5.027E+02, 6.216E+01, 5.101E+00, 9.157E-02, 1.133E+00, 1.607E+00)
    O = atom('O',1.362E+01, 5.380E+02, 1.240E+00, 1.745E+03, 3.784E+00, 1.764E+01, 7.589E-02, 8.698E+00, 1.271E-01)
    N = atom('N',1.453E+01, 4.048E+02, 4.034E+00, 8.235E+02, 8.033E+01, 3.928E+00, 9.097E-02, 8.598E-01, 2.325E+00)
    Mg = atom('Mg',7.646E+00, 5.490E+01, 1.197E+01, 1.372E+08, 2.228E-01, 1.574E+01, 2.805E-01, 0.000E+00, 0.000E+00)
    #H.draw()
    #He.draw()
    #C.draw()
    #O.draw()
    #plt.show()
    print(O.cross(500)/H.cross(500))
    print(C.cross(500)/H.cross(500))
    print(O.cross(1000)/H.cross(1000))
    print(C.cross(1000)/H.cross(1000))
    print(N.cross(1000)/H.cross(1000))
    print(Mg.cross(1000)/H.cross(1000))


main()
