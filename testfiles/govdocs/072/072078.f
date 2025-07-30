c
cC     USGS Vegetation Types Used in 20km RUC
C        as of 2 September 2003 -  
C                                                 
C    1:   Urban and Built-Up Land                  
C    2:   Dryland Cropland and Pasture              
C    3:   Irrigated Cropland and Pasture             
C    4:   Mixed Dryland/Irrigated Cropland and Pasture
C    5:   Cropland/Grassland Mosaic
C    6:   Cropland/Woodland Mosaic
C    7:   Grassland              
C    8:   Shrubland               
C    9:   Mixed Shrubland/Grassland
C   10:   Savanna                  
C   11:   Deciduous Broadleaf Forest
C   12:   Deciduous Needleleaf Forest
C   13:   Evergreen Broadleaf Forest
C   14:   Evergreen Needleleaf Fores
C   15:   Mixed Forest            
C   16:   Water Bodies             
C   17:   Herbaceous Wetland        
C   18:   Wooded Wetland             
C   19:   Barren or Sparsely Vegetated
C   20:   Herbaceous Tundra
C   21:   Wooded Tundra   
C   22:   Mixed Tundra     
C   23:   Bare Ground Tundra
C   24:   Snow or Ice 

C----  Below are the arrays for the vegetation parameters
         REAL LALB(nvegclas),LMOI(nvegclas),LEMI(nvegclas),
     1        LROU(nvegclas),LTHI(nvegclas),LSIG(nvegclas),
     1        LPC(nvegclas), NROTBL(nvegclas)

C************************************************************************
C----     vegetation parameters
c
c-- USGS model
c
c--- summer
c
C  Albedo
        DATA  LALB/.18,.17,.18,.18,.18,.16,.19,.22,.2,.2,.16,.14,
     1             .12,.12,.13,.08,.14,.14,.25,.15,.15,.15,.25,.55/
C  Emissivity
        DATA LEMI/.88,4*.92,.93,.92,.88,.9,.92,.93,.94,
     1           .95,.95,.94,.98,.95,.95,.85,.92,.93,.92,.85,.95/
C  Roughness length
        DATA LROU/.5,.06,.075,.065,.05,.2,.075,.1,.11,.15,.8,.85,
     2            2.0,1.0,.563,.0001,.2,.4,.05,.1,.15,.1,.065,.05/

C***************************************************************************
