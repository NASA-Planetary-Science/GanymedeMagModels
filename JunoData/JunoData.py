import spiceypy as sp
import numpy as np

#rplanet = 2631.2

# Turn the Juno Ganymede flyby data from Jupiter coordinates into
# Ganymede coordinates

# Maybe sp.pxform can help? It may just transform the position
# coordinates, but not the vector field coordinates

sp.furnsh("./meta.txt")

# Step 1: Load data
data = np.loadtxt('MagData/fgm_jno_l3_2021158pc_r1s_v01_nohdr.txt')

npos = data.shape[0]
#npos = 10

utctime = ['x']*npos

dat = data[0:npos,[11,12,13,7,8,9]] 

for i in range(0,npos):
    utctime[i] = '%d-%d// %d:%d:%g' %(data[i,0], data[i,1], data[i,2], data[i,3],   data[i,4] +data[i,5]/1000)
    # // or :: indicate day of year

# Get ephemeral time from data
et = sp.str2et(utctime)

# Get coordinates and field
# data 8th, 9th, 10th column are mag field in nT
# data 12th, 13th, 14th column are X,Y,Z coordinates
# trafo matrices from sxform are:
# X, Y, Z, BX, BY, BZ


trafo = sp.sxform('IAU_JUPITER','IAU_GANYMEDE',et)
#trafo = sp.sxform('IAU_JUPITER','GPHIO',et) # GPHIO doesn't exist


#print( np.matmul( [[1,2],[3,4]], [[2],[3]] ) ) ### To check if matmul is the right thing

newdat = np.zeros(dat.shape)

for i in range(0,npos):
    newdat[i,0:3] = np.matmul(trafo[i,0:3,0:3], dat[i,0:3])
    newdat[i,3:6] = np.matmul(trafo[i,3:6,3:6], dat[i,3:6]) 


#### I have been having problems with the locations. Get locations directly from spice
positions, lightTimes = sp.spkpos('Juno', et, 'IAU_GANYMEDE', 'NONE', 'GANYMEDE')
    

### Save style 1
#newdata =np.append(  np.append(data[0:npos,0:7], newdat[:,[3,4,5]], axis=1),  np.append(data[0:npos,[10]], newdat[:,[0,1,2]],axis=1),  axis=1) 
#np.savetxt('MagData/Juno_Ganymede_2021158pc_r1s_v01_nohdr.txt',newdata,delimiter='\t',fmt='%4.12g') #,fmt='%g'    
 


### Save style 2
import datetime as dt

#outfile = 'ORB101_GAN_GPHIO.TAB'
outfile = 'ORB101_GAN_IAU_fullDay.TAB'

with open(outfile, 'w') as f:
    for i in range(0,npos):
        t = dt.datetime(int(data[i,0]),1,1) + dt.timedelta(data[i,1] -1)

        ### I never managed to get the locations correct from the transformation.
        ### Possibly the issue could be that I would need to normalize by the planet's radius,
        ### Something like input/Jupiter radius, then transformation, then output*Ganymede radius
        #loctr = sp.pxform('IAU_JUPITER','IAU_GANYMEDE',et[i])
        #newpos = np.matmul(dat[i,0:3],loctr)

        #### Old: Pauper transformation to GPHIO, which is incorrect
        # X = -positions[i,1]
        # Y = positions[i,0]
        # Z = positions[i,2] 
        # # Transform IAU to GPHIO
        # BX = -newdat[i,4]
        # BY = newdat[i,3]
        # BZ = newdat[i,5]  

        #### New: We just keep it in IAU
        X = positions[i,0]
        Y = positions[i,1]
        Z = positions[i,2] 
        # Transform IAU to GPHIO
        BX = newdat[i,3]
        BY = newdat[i,4]
        BZ = newdat[i,5]  

        

        Babs = np.sqrt(np.power(BX,2.)+np.power(BY,2.)+np.power(BZ,2.))

        secs = data[i,4]+data[i,5]/1000.
    
        f.write('%4d-%02d-%02dT%02d:%02d:%05g\t%4g\t%4g\t%4g\t%5g\t%6g\t%6g\t%6g\n' %(t.year,t.month,t.day,data[i,2],data[i,3],secs,BX,BY,BZ,Babs,X,Y,Z))



##### Plotting
# import matplotlib.pyplot as plt
# distance = np.sqrt( np.power(newdat[:,0],2.) + np.power(newdat[:,1],2.) + np.power(newdat[:,2],2.) )
# plt.plot(distance)
# plt.savefig('fig.pdf')
