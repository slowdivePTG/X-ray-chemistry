#This is used for calculating the X-rays ionization rates of HI and HeII

#from cal_cross import atom
from commons import *
from cal_cross import atom

def F_E(E): #E in eV, F_E in s^-1cm^-2
    return(4*np.pi/h*1e-21*np.power(E/1000.0,-1.5)*J21)

def Tau(E, H, He):
    rou_H, rou_He = nH*mH, nHe*mHe
    rou = rou_H + rou_He
    lambda_j = np.sqrt(np.pi*k*T/G/rou/mH*(nH+nHe)/(4.0026022*nHe+1.00794*nH))
    NH, NHe = nH*lambda_j, nHe*lambda_j
    tau = H.cross(E)*NH + He.cross(E)*NHe
    #print(NH)
    return(tau/2.0)

def Ion_p(H, He, A):
    val1, err1 = quad(lambda epsilon:F_E(epsilon)/epsilon*np.exp(-Tau(epsilon, H, He))*A.cross(epsilon), 2000, 10000)
    return(val1)


def phi(E, A):
    aa, bb, cc = A.getabc()
    ph = (E/A.min()-1)*aa*np.power(1-np.power(xe, bb), cc)
    return ph

def phi_bar(A):
    J_Phi, err1 = quad(lambda epsilon:J21*1e-21*np.power(epsilon/1000.0,-1.5)*phi(epsilon, A), 2000, 10000)
    J, err2 = quad(lambda epsilon:J21*1e-21*np.power(epsilon/1000.0,-1.5), 2000, 10000)
    return(J_Phi/J)

def phi_b(A):
    aa, bb, cc = A.getabc()
    if A.name == 'H':
        return 327.832286034056e0*aa*np.power(1-np.power(xe, bb), cc)
    elif A.name == 'He':
        return 180.793458763612e0*aa*np.power(1-np.power(xe, bb), cc)
    else:
        return 0

def Ion_x(n1, n2, H, He, A, B): #the method offered in Latif 2015
    Ip = Ion_p(H, He, A)
    zeta_2 = (Ip + n2/n1*Ion_p(H, He, B))*phi_bar(A)
    return(Ip + zeta_2)

def Ion_xx(n1, n2, H, He, A, B): #what krome is actually using(simplified phi_b)
    Ip = Ion_p(H, He, A)
    zeta_2 = (Ip + n2/n1*Ion_p(H, He, B))*phi_b(A)
    return(Ip + zeta_2)

def Ion_xxx(n1, n2, H, He, A, B):
    Ip = Ion_p(H, He, A)
    I21,err1 = quad(lambda epsilon:F_E(epsilon)*np.exp(-Tau(epsilon, H, He))/epsilon*B.cross(epsilon)*phi(epsilon,A), 2000, 10000)
    I22,err2 = quad(lambda epsilon:F_E(epsilon)*np.exp(-Tau(epsilon, H, He))/epsilon*A.cross(epsilon)*phi(epsilon,A), 2000, 10000)
    print(I22/Ion_p(H, He, A)/phi_bar(A))
    print(I21/Ion_p(H, He, B)/phi_bar(A))
    print()
    return(Ip+n2/n1*I21+I22)


def test(H, He):
    print(H.name, np.log10(Ion_p(H, He, H)))
    print(He.name, np.log10(Ion_p(H, He, He)))
    print()
    print(Ion_x(nH, nHe, H, He, H, He)/Ion_p(H, He, H), np.log10(Ion_x(nH, nHe, H, He, H, He)))
    print(Ion_x(nHe, nH, H, He, He, H)/Ion_p(H, He, H), np.log10(Ion_x(nHe, nH, H, He, He, H)))
    print()
    #print(Ion_xx(nH, nHe, H, He, H, He), np.log10(Ion_xx(nH, nHe, H, He, H, He)))
    #print(Ion_xx(nHe, nH, H, He, He, H), np.log10(Ion_xx(nHe, nH, H, He, He, H)))
    #print()
    #print(Ion_xxx(nH, nHe, H, He, H, He), np.log10(Ion_xxx(nH, nHe, H, He, H, He)))
    #print(Ion_xxx(nHe, nH, H, He, He, H), np.log10(Ion_xxx(nHe, nH, H, He, He, H)))

def main():
    H = atom('H', 1.360E+01, 5.000E+04, 4.298E-01, 5.475E+04, 3.288E+01, 2.963E+00, 0.000E+00, 0.000E+00, 0.000E+00)
    He = atom('He', 2.459E+01, 5.000E+04, 1.361E+01, 9.492E+02, 1.469E+00, 3.188E+00, 2.039E+00, 4.434E-01, 2.136E+00)
    test(H, He)
    #E=np.linspace(2000,10000,1000)
    #plt.xscale('log')
    #plt.yscale('log')
    #plt.plot(E,Tau(E,H,He))

    #draw_flux(H, He)
    #plt.show()

def draw_flux(H, He):
    E = np.linspace(100, 5.000E+04, 100000)
    T = np.exp(-Tau(E, H, He))
    J0 = J21*1e-21*np.power(E/1000.0,-1.5)
    Jx = J0*T

    plt.xscale('log')
    plt.yscale('log')
    plt.plot(E, J0, label='$J_0$')
    plt.plot(E, Jx, label='$J_H$')
    plt.xlabel("E(eV)",fontsize=13)
    plt.ylabel("$J$(erg/cm2/s/Hz)",fontsize=13)
    plt.legend()
    plt.show()
    J1 = J0*T*H.cross(E)
    J2 = J0*T*He.cross(E)
    plt.xscale('log')
    plt.yscale('log')
    plt.ylim([5e-6,1e-3])
    #plt.plot(E, J1, label='$J_H$')
    #plt.plot(E, J2, label='$J_{He}$')
    plt.plot(E, Jx*4*np.pi*E/(4.135667662e-15), label=r'$\nu F_{\nu}$')
    plt.xlabel("E(eV)",fontsize=13)
    plt.ylabel(r"$\nu F_{\nu}$(erg cm$^{-2}$ s$^{-1}$)",fontsize=13)
    plt.legend()
    fx = quad(lambda epsilon:J21*1e-21*np.power(epsilon/1000.0,-1.5)*np.exp(-Tau(epsilon, H, He))*4*np.pi/((h_eV)), 2000, 100000)
    print(fx)
main()

###################################################################################################################################
