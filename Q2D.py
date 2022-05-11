import numpy as np

# Earth
# From PlanetMagField
#D = np.array([-31543, -2298, 5922])
#Q = np.array([-677, 2905, -1061, 924, 1121])

# From CHAOS 7
D = np.array([-2.949546321987000e+04, -1.586477336990000e+03, 4.944287270050000e+03])
Q = np.array([-2.395820710240000e+03, 3.026371025180000e+03, -2.708434289540000e+03, 1.668186548530000e+03, -5.756620780900000e+02])

q2dsurf = ( (2+1)*np.sum(np.power(Q,2.)) ) / ( (1+1)*np.sum(np.power(D,2.)) )
print("Earth surface: %g" %(q2dsurf))

q2dcmb = q2dsurf * np.power(6371/3480, 2.)
print("Earth CMB: %g" %(q2dcmb))


# Ganymede Kiv wrong
D = np.array([-711, 46.8, 22.3])
Q = np.array([0.9, 27, 1.8, -0.4, -11])

q2dsurf = ( (2+1)*np.sum(np.power(Q,2.)) ) / ( (1+1)*np.sum(np.power(D,2.)) )
print("Kiv wrong, G surface: %g" %(q2dsurf))

#rCMB = np.round(2631*0.25)
rCMB = 900
#print("rCMB used by Christensen et al 2015a: %g km" %(rCMB))
print("rCMB used: %g km" %(rCMB))


#q2dcmb = q2dsurf * np.power(2631.2/900, 2.)
q2dcmb = q2dsurf * np.power(2631.2/rCMB, 2.)
print("Kiv wrong, G CMB: %g" %(q2dcmb))


#R1 = (1+1) * ( 711**2 + 46.8**2 + 22.3**2)
#R2 = (2+1) * (0.9**2 + 27**2 + 1.8**2 + 0.4**2 + 11**2) 



# Ganymede Kiv
D = np.array([-694.8, 45.7, 21.8])
Q = np.array([1.1, 34.1, 2.3, -0.5, -13.9])

q2dsurf = ( (2+1)*np.sum(np.power(Q,2.)) ) / ( (1+1)*np.sum(np.power(D,2.)) )
print("Kiv, G surface: %g" %(q2dsurf))

q2dcmb = q2dsurf * np.power(2631.2/900, 2.)
print("Kiv, G CMB: %g" %(q2dcmb))

R1 = (1+1) * ( 694.8**2 + 45.7**2 + 21.8**2)
R2 = (2+1) * (1.1**2 + 34.1**2 + 2.3**2 + 0.5**2 + 13.9**2) 




# Ganymede Model L=2 all tracks
D = np.array([-745.3, 42.8, 20.8])
Q = np.array([13.5, 26.8, -7.4, 3.7, -7.8])

q2dsurf = ( (2+1)*np.sum(np.power(Q,2.)) ) / ( (1+1)*np.sum(np.power(D,2.)) )
print("L=2, G surface: %g" %(q2dsurf))

q2dcmb = q2dsurf * np.power(2631.2/rCMB, 2.)
print("L=2, G CMB: %g" %(q2dcmb))



# Ganymede Model L=3 all tracks
D = np.array([-773.1, 39.7, 34.5])
Q = np.array([51.8, 46.6, -13.6, 7.7, -7.8])

q2dsurf = ( (2+1)*np.sum(np.power(Q,2.)) ) / ( (1+1)*np.sum(np.power(D,2.)) )
print("L=3, G surface: %g" %(q2dsurf))

q2dcmb = q2dsurf * np.power(2631.2/rCMB, 2.)
print("L=3, G CMB: %g" %(q2dcmb))




# Ganymede Model L=3 g10 = -900
D = np.array([-900, 47.9, -30])
Q = np.array([244.3, 33.2, 9.8, -27.7, -17.5])

q2dsurf = ( (2+1)*np.sum(np.power(Q,2.)) ) / ( (1+1)*np.sum(np.power(D,2.)) )
print("L=3 g10=-900, G surface: %g" %(q2dsurf))

q2dcmb = q2dsurf * np.power(2631.2/rCMB, 2.)
print("L=3 g10=-900, G CMB: %g" %(q2dcmb))
