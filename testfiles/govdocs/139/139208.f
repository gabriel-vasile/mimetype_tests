      program const
!     ******************************************************************
!     *                                                                *
!     *  calculates constants needed for model                         *
!     *                                                                *
!     ******************************************************************
!-----------------------------------------------------------------------
      include "/emcsrc/wx20hc/intrst_mpi_hybrid/model.inc"
!-----------------------------------------------------------------------
      common /pteta/                       
     & sigma,pdtop
     &,deta(lm),aeta(lm),eta(lm+1),dfl(lm+1)
     &,deta1(lm),aeta1(lm),eta1(lm+1)
     &,deta2(lm),aeta2(lm),eta2(lm+1)
     &,res(im,jm),fis(im,jm),wet(im,jm),sno(im,jm)              
     &,sst(im,jm),si(im,jm),albedo(im,jm)
     &,cmc(im,jm),stc(im,jm,nsoil),smc(im,jm,nsoil)
!-----------------------------------------------------------------------
      common /masks/                        
     & hbm2(im,jm),vbm2(im,jm),vbm3(im,jm)
     &,sm(im,jm),sice(im,jm)  
     &,htm(im,jm,lm),vtm(im,jm,lm)
!-----------------------------------------------------------------------
      dimension
     & idat(3)
     &,pd(im,jm)
     &,u(im,jm,lm),v(im,jm,lm),t(im,jm,lm),q(im,jm,lm)
!-----------------------------------------------------------------------
      equivalence
     & (t(1,1,1),u(1,1,1))
     &,(q(1,1,1),v(1,1,1))
!-----------------------------------------------------------------------
      logical run,sigma
!-----------------------------------------------------------------------
      print*,'const'
      open(unit=1,file='/ptmp/wx20hc/intrst22to22hyb/nfcst0'
     &    ,status='unknown',form='unformatted')
!
      read(1) sigma
     &       ,fis,sm,res
     &   ,pdtop,eta,deta,aeta,eta1,deta1,aeta1,eta2,deta2,aeta2,dfl
!-------------converting date from dd/mm/year to mm/dd/year------------
      idath=idat(1)
      idat(1)=idat(2)
      idat(2)=idath
!----------------------------------------------------------------------
c      open(unit=3
c     &    ,file='/ptmp/wx20hc/intrst22to22hyb/soiltm.bilin'
c     &    ,status='unknown',form='unformatted')
!
c      read(3) stc,smc
c      close(3)
!-----------------------------------------------------------------------
      call cnsts                                  
!-----------------------------------------------------------------------
c              do j=1,jm
c          do i=1,im
c      res(i,j)=1./res(i,j)
c      cmc(i,j)=0.
c          enddo
c              enddo
!-----------------------------------------------------------------------
c      ntsd=0
c      open(unit=2,file='/nfsuser/g01/wx20zj/meso300/iofiles/nfcst'
c     &    ,status='unknown',form='unformatted')
!
c      write(2) run,idat,ihrst,ntsd
c      write(2) pd
c      write(2) ((res(i,j),i=1,im),j=1,jm)
c      write(2) fis
!-----------------------------------------------------------------------
c      read(1) u,v
!-----------------------------------------------------------------------
c          do l=1,lm
c      write(2) ((u(i,j,l),i=1,im),j=1,jm)
c          enddo
c          do l=1,lm
c      write(2) ((v(i,j,l),i=1,im),j=1,jm)
c          enddo
!-----------------------------------------------------------------------
c      read(1) t,q
c      close(1)
!-----------------------------------------------------------------------
c          do l=1,lm
c      write(2) ((t(i,j,l),i=1,im),j=1,jm)
c          enddo
c          do l=1,lm
c      write(2) ((q(i,j,l),i=1,im),j=1,jm)
c          enddo
!-------------ice temperature-------------------------------------------
c              do j=1,jm
c          do i=1,im
c          if(sice(i,j).gt.0.) then
c      tice=(t(i,j,lm)+ti0)*0.5
c          do n=1,nsoil
c      stc(i,j,n)=tice
c          enddo
c          endif
c          enddo
c              enddo
!-----------------------------------------------------------------------
c      write(2) wet
c      write(2) sno
c      write(2) smc
c      write(2) cmc
c      write(2) stc
c      close(2)
!-----------------------------------------------------------------------
      stop                                       
      end                                        
!+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
      subroutine cnsts                           
!     ******************************************************************
!     *                                                                *
!     *  routine for initialization of constants and variables         *
!     *                                                                *
!     ******************************************************************
!-----------------------------------------------------------------------
!      include "../include/deco.inc"
!-----------------------------------------------------------------------
      include "/emcsrc/wx20hc/intrst_mpi_hybrid/model.inc"
!-----------------------------------------------------------------------
      parameter
     &(itbq=152,jtbq=440,itb=076,jtb=134
     &,jam=6+2*(jm-10),list=3,nfcst=16,nbc=18)
!-----------------------------------------------------------------------
      common /pteta/
     & sigma,pdtop
     &,deta(lm),aeta(lm),eta(lm+1),dfl(lm+1)
     &,deta1(lm),aeta1(lm),eta1(lm+1)
     &,deta2(lm),aeta2(lm),eta2(lm+1)
     &,res(im,jm),fis(im,jm),wet(im,jm),sno(im,jm)
     &,sst(im,jm),si(im,jm),albedo(im,jm)
     &,stc(im,jm,nsoil),smc(im,jm,nsoil)
!-----------------------------------------------------------------------
      common /masks/
     & hbm2(im,jm),vbm2(im,jm),vbm3(im,jm)
     &,sm(im,jm),sice(im,jm)
     &,htm(im,jm,lm),vtm(im,jm,lm)
!-----------------------------------------------------------------------
      dimension                          
     & ihw(jm),ihe(jm),ivw(jm),ive(jm)
!
     &,dxj(jm),wpdarj(jm),cpgfuj(jm),curvj (jm),fcpj(jm)      
     &,fdivj(jm),emj(jm),emtj(jm),fadj(jm)                  
     &,ddmpuj(jm),ddmpvj(jm),hdacj(jm)                              
!-----------------------------------------------------------------------
      dimension
     & khla(jam),khha(jam),kvla(jam),kvha(jam),jra(jam)
     &,lmh(im,jm),lmv(im,jm)                                        
!-----------------------------------------------------------------------
      dimension                          
     & rdeta(lm),f4q2(lm)                                            
     &,em(jam),emt(jam)
!
     &,dx(im,jm),wpdar(im,jm),cpgfu(im,jm),curv(im,jm),fcp(im,jm) 
     &,fdiv(im,jm),fad(im,jm),f(im,jm),ddmpu(im,jm),ddmpv(im,jm) 
     &,glat(im,jm),glon(im,jm)
!-----------------------------------------------------------------------
      dimension                          
     & detam1(lm),aetam1(lm),etam1(lm+1)
     &,detam11(lm),aetam11(lm),etam11(lm+1)
     &,detam12(lm),aetam12(lm),etam12(lm+1)
     &,detap2(lm),aetap2(lm),etap2(lm+1)
     &,detap21(lm),aetap21(lm),etap21(lm+1)
     &,detap22(lm),aetap22(lm),etap22(lm+1)
     &,dfrlg(lm+1)
     &,sldpth(nsoil),rtdpth(nsoil)
     &,qs0(jtb),sqs(jtb),the0(itb),sthe(itb)
!                                                                       
     &,epsr(im,jm),gffc(im,jm),tg(im,jm),wfk(im,jm)             
     &,hdac(im,jm),hdacv(im,jm)
!
     &,ptbl(itb,jtb),ttbl(jtb,itb)                                  
cds new convection
     &,ttblq(jtbq,itbq),the0q(itbq),stheq(itbq)
!-----------------------------------------------------------------------
      dimension                          
     & islope(im,jm),ivgtyp(im,jm),isltyp(im,jm),vegfrc(im,jm)
!-----------------------------------------------------------------------
      logical sigma
!--------------universal constants--------------------------------------
      parameter
     &(a=6376000.,twom=.00014584,r=287.04,cp=1004.6,g=9.806,plq=70000.)
!-----------------------------------------------------------------------
      parameter
!zj     &(w=.15,idtad=2,pi=3.141592654,dtr=pi/180.)
!101     &(w=.135,idtad=2,pi=3.141592654,dtr=pi/180.)
     &(w=.120,idtad=2,pi=3.141592654,dtr=pi/180.)

!zjpaper     &(w=.135/08.,idtad=2,pi=3.141592654,dtr=pi/180.)
!zjpaper     &(w=.135/10.,idtad=2,pi=3.141592654,dtr=pi/180.)
!zj     &(w=.15,idtad=2,pi=3.141592654,dtr=pi/180.)
!zj     &(w=.12,idtad=2,pi=3.141592654,dtr=pi/180.)
!zj     &(w=.00,idtad=2,pi=3.141592654,dtr=pi/180.)
!zj     &(w=.18,idtad=2,pi=3.141592654,dtr=pi/180.)
!--------------dissipation & turbulence---------------------------------
      parameter                          
CSN iskljucena hor. diff setvanjem COAC=0.0
!zj     &(coac=0.100,codamp=100.,tddamp=48.00,dfc=1.0,ddfc=1.0)
!zj     &(coac=0.100,codamp=020.,tddamp=48.00,dfc=1.0,ddfc=1.0)
!zjpaper     &(coac=0.0,codamp=010.,tddamp=48.00,dfc=1.0,ddfc=1.0)
!zjpaper     &(coac=0.0,codamp=5.,tddamp=48.00,dfc=1.0,ddfc=1.0)
!zjoperhyb     &(coac=0.250,codamp=6.4,tddamp=48.00,dfc=1.0,ddfc=1.0)
!     &(coac=0.250,codamp=025.,tddamp=48.00,dfc=1.0,ddfc=1.0)
!     &(coac=0.250,codamp=40.,tddamp=48.00,dfc=1.0,ddfc=1.0)
!     &(coac=0.250,codamp=50.,tddamp=48.00,dfc=1.0,ddfc=1.0)
     &(coac=0.250,codamp=6.4,tddamp=48.00,dfc=1.0,ddfc=1.0)
!zj     &(coac=0.250,codamp=20.,tddamp=48.00,dfc=1.0,ddfc=1.0)
!zj     &(coac=0.10000,codamp=0400.00,tddamp=48.00,dfc=1.0,ddfc=1.0)
!--------------old surface data-----------------------------------------
      parameter
     &(ros=1500.,cs=1339.2,ds=.050,aks=.0000005,dzg=02.850       
     &,tg0=258.16,tga=30.
     &,roi=916.6,ci=2060.0,di=.100,aki=.000001075,dzi=2.0
     &,ti0=271.16)                                                      
!-----------------------------------------------------------------------
      data
     & sldpth/0.10,0.30,0.60,1./,rtdpth/0.05,0.35,0.60,1./
!-----------------------------------------------------------------------
      dt=dtb
!
          do j=1,jm
      ihw(j)=-mod(j,2)
      ihe(j)=ihw(j)+1
      ivw(j)=-mod(j+1,2)
      ive(j)=ivw(j)+1
          enddo
!-----------------------------------------------------------------------
          do l=1,lm+1
      dfrlg(l)=dfl(l)                            
      dfl(l)=dfl(l)*g  
          enddo                          
          do l=1,lm+1
      etam1(l)=eta(l)
      etam11(l)=eta1(l)
      etam12(l)=eta2(l)
      etap2(l)=eta(l)
      etap21(l)=eta1(l)
      etap22(l)=eta2(l)
          enddo
          do l=1,lm
      detam1(l)=deta(l)
      detap2(l)=deta(l)
      aetam1(l)=aeta(l)
      aetap2(l)=aeta(l)
      detam11(l)=deta1(l)
      detam12(l)=deta2(l)
      detap21(l)=deta1(l)
      detap22(l)=deta2(l)
      aetam11(l)=aeta1(l)
      aetam12(l)=aeta2(l)
      aetap21(l)=aeta1(l)
      aetap22(l)=aeta2(l)
          enddo
!--------------derived geometrical constants----------------------------
      tph0=tph0d*dtr                                                    
      wb=wbd*dtr                                                        
      sb=sbd*dtr                                                        
      dlm=dlmd*dtr                                                      
      dph=dphd*dtr                                                      
      tdlm=dlm+dlm                                                      
      tdph=dph+dph                                                      
      rdlm=1./dlm                                                       
      rdph=1./dph                                                       
!                                                                       
      wbi=wb+tdlm                                                       
      sbi=sb+tdph                                                       
      ebi=wb+(im-2)*tdlm                                                   
      anbi=sb+(jm-3)*dph                                                   
!                                                                       
      stph0=sin(tph0)                                                   
      ctph0=cos(tph0)                                                   
!---------------time stepping related constants-------------------------
      tsph=3600./dt                                                     
      nddamp=tddamp*tsph+.5                                             
!                                                                       
      dtad=1.0                                                        
!--------------derived horizontal grid constants------------------------
      dy=a*dph                                                          
      cpgfv=-dt/(48.*dy)                                                
      en=dt/(4.*dy)*dtad                                              
      ent=dt/(16.*dy)*dtad                                              
!                                                                       
      tph=sb-dph                                                        
          do j=1,jm                                            
      tph=tph+dph                                               
      dxp=a*dlm*cos(tph)                                        
      dxj(j)=dxp                                                
!vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
!sd             wpdarj(j)=-dt*w/(32.*dxp*dy)                      
!sd             wpdarj(j)=-dt*w*100000./(32.*dxp*dy) 
      wpdarj(j)=-w*((a*dlm*amin1(cos(anbi),cos(sbi)))**2+dy**2)
     &         /(dt*32.*dxp*dy)
!aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
      cpgfuj(j)=-dt/(48.*dxp)                                   
      curvj(j)=.5*dt*tan(tph)/a                                 
      fcpj(j)=dt/(cp*192.*dxp*dy)                               
      fdivj(j)=1./(12.*dxp*dy)                                  
      emj(j)= dt/( 4.*dxp)*dtad                                 
      emtj(j)=dt/(16.*dxp)*dtad                                 
      fadj(j)=-dt/(48.*dxp*dy)*dtad                             
!
      acdt=dt*sqrt((a*dlm*amin1(cos(anbi),cos(sbi)))**2+dy**2)
!
      cddamp=codamp*acdt  !broken link with coac!!
!
      hdacj(j)=coac*acdt/(4.*dxp*dy)
!
      ddmpuj(j)=cddamp/dxp                                      
      ddmpvj(j)=cddamp/dy                                       
          enddo
!--------------spreading of upstream height-point advection factor------
      ja=0                                                              
          do j=3,5
      ja=ja+1                                                       
      khla(ja)=2                                              
      khha(ja)=im-1-mod(j+1,2)
      jra(ja)=j
      emt(ja)=emtj(j)
          enddo                                               
          do j=jm-4,jm-2
      ja=ja+1      
      khla(ja)=2          
      khha(ja)=im-1-mod(j+1,2)
      jra(ja)=j
      emt(ja)=emtj(j)    
          enddo
          do j=6,jm-5
      ja=ja+1
      khla(ja)=2
      khha(ja)=2+mod(j,2)
      jra(ja)=j
      emt(ja)=emtj(j)    
          enddo
          do j=6,jm-5
      ja=ja+1
      khla(ja)=im-2
      khha(ja)=im-1-mod(j+1,2)
      jra(ja)=j
      emt(ja)=emtj(j)    
          enddo
      print*,'ja=',ja,' jam=',jam
!--------------spreading of upstream velocity-point advection factor----
      ja=0                                                              
          do j=3,5                                              
      ja=ja+1                                                       
      kvla(ja)=2
      kvha(ja)=im-1-mod(j,2) 
      em(ja)=emj(j)                                                 
          enddo
          do j=jm-4,jm-2
      ja=ja+1                                                       
      kvla(ja)=2                                              
      kvha(ja)=im-1-mod(j,2) 
      em(ja)=emj(j)                                                 
          enddo
          do j=6,jm-5
      ja=ja+1                                                       
      kvla(ja)=2                                              
      kvha(ja)=2+mod(j+1,2)
      em(ja)=emj(j)
          enddo                                                 
          do j=6,jm-5                                            
      ja=ja+1                                                       
      kvla(ja)=im-2                                              
      kvha(ja)=im-1-mod(j,2)
      em(ja)=emj(j)                                                 
          enddo
      print*,'ja=',ja,' jam=',jam
!--------------coriolis parameter in tll system & related constants-----
      tph=sb-dph                                                
              do j=1,jm                                            
          tlm=wb-tdlm+mod(j,2)*dlm                                  
          tph=tph+dph                                               
          stph=sin(tph)                                             
          ctph=cos(tph)
!                                                                       
          do i=1,im                                              
      tlm=tlm+tdlm                                                      
      fp=twom*(ctph0*stph+stph0*ctph*cos(tlm))                          
      f(i,j)=0.5*dt*fp  
          enddo
              enddo                                                  
!--------------geographic lat and long of tll grid points---------------
      tph=sb-dph                                                
              do j=1,jm                                            
          tlm=wb-tdlm+mod(j+1,2)*dlm                                
          tph=tph+dph                                               
          stph=sin(tph)                                             
          ctph=cos(tph)                   
!                                                                       
          do i=1,im 
      tlm=tlm+tdlm                                                      
      sinphi=ctph0*stph+stph0*ctph*cos(tlm)                             
      glat(i,j)=asin(sinphi)
      coslam=ctph*cos(tlm)
     &      /(cos(glat(i,j))*ctph0)-tan(glat(i,j))*tan(tph0)
      if(coslam.gt.1.0) coslam=1.0
      fact=1.0
      if(tlm.gt.0.) fact=-1.0
      glon(i,j)=-tlm0d*dtr+fact*acos(coslam)
          enddo
              enddo
!--------------derived vertical grid constants--------------------------
      ef4t=.5*dt/cp                                                     
      f4q=-dt*dtad                                                  
      f4d=-.5*dt*dtad                                                  
          do l=1,lm                          
      rdeta(l)=1./deta(l)                        
      f4q2(l)=-.25*dt*dtad/deta(l)
          enddo
!--------------boundary masks-------------------------------------------
              do j=1,jm
          do i=1,im
      hbm2(i,j)=0.
      vbm2(i,j)=0.
      vbm3(i,j)=0.
          enddo
              enddo
              do j=3,jm-2
          do i=2,im-1-mod(j+1,2)
      hbm2(i,j)=1.
          enddo
          do i=2,im-1-mod(j,2)
      vbm2(i,j)=1.
          enddo
              enddo
              do j=4,jm-3
          do i=2+mod(j+1,2),im-2
      vbm3(i,j)=1.
          enddo
              enddo
!--------------topography masks & maximum vertical indices--------------
              do j=1,jm
          do i=1,im
      lmh(i,j)=lm
      lmv(i,j)=lm
          enddo
              enddo
                  do l=1,lm
              do j=1,jm
          do i=1,im
      htm(i,j,l)=1.
      vtm(i,j,l)=1.
          enddo
              enddo
                  enddo
!--------------topography masks & maximum vertical indices--------------
          if(.not.sigma)    then
!-----------------------------------------------------------------------
                  do j=1,jm
              do i=1,im
          do l=1,lm
          if(eta(l+1).ge.res(i,j)) then
      lmh(i,j)=l
      go to 100
          endif
          enddo
 100  continue
              enddo
                  enddo
!                  
                  do j=1,jm
              do i=1,im
          do l=1,lm
          if(eta(l+1).gt.res(i,j)) then
      htm(i,j,l)=0.
          endif
          enddo
              enddo
                  enddo
!
                  do j=2,jm-1
              do i=1+mod(j,2),im-1
          do l=1,lm
          if(eta(l+1).gt.res(i,j)) then
      vtm(i,j-1,l)=0.
      vtm(i+ihw(j),j,l)=0.
      vtm(i+ihe(j),j,l)=0.
      vtm(i,j+1,l)=0.
          endif
          enddo
              enddo
                  enddo
!
                  do j=1,jm
              do i=1,im
          do l=1,lm
          if(vtm(i,j,l).lt.0.9)    then
      lmv(i,j)=l-1
      go to 110
          endif
          enddo
 110  continue
              enddo
                  enddo
!-----------------------------------------------------------------------
          endif
!--------------spreading of latitude dependent constants----------------
              do j=1,jm                                            
          do i=1,im                                              
      dx(i,j)=dxj(j)                 
      wpdar(i,j)=wpdarj(j)*hbm2(i,j) 
      cpgfu(i,j)=cpgfuj(j)*vbm2(i,j)  
      curv(i,j)=curvj(j)*vbm2(i,j)                                 
      fcp(i,j)=fcpj(j)*hbm2(i,j) 
      fdiv(i,j)=fdivj(j)*hbm2(i,j)                 
      fad(i,j)=fadj(j)          
      hdacv(i,j)=hdacj(j)*vbm2(i,j)                                             
      hdac(i,j)=hdacj(j)*1.25*hbm2(i,j)
          enddo
              enddo
!--------------increasing diffusion along the boundaries----------------
      ja=0
              do j=3,5
              ja=ja+1
              ihl=khla(ja)
              ihh=khha(ja)
          do i=ihl,ihh
      hdac(i,j)=hdac(i,j)*dfc
          enddo
              enddo
              do j=jm-4,jm-2
              ja=ja+1
              ihl=khla(ja)
              ihh=khha(ja)
          do i=ihl,ihh
      hdac(i,j)=hdac(i,j)*dfc
          enddo
              enddo
              do j=6,jm-5
              ja=ja+1
              ihl=khla(ja)
              ihh=khha(ja)
          do i=ihl,ihh
      hdac(i,j)=hdac(i,j)*dfc
          enddo
              enddo
              do j=6,jm-5
              ja=ja+1
              ihl=khla(ja)
              ihh=khha(ja)
          do i=ihl,ihh
      hdac(i,j)=hdac(i,j)*dfc
          enddo
              enddo
      print*,'ja=',ja,' jam=',jam
!-----------------------------------------------------------------------
              do j=1,jm                                            
          do i=1,im                                            
      ddmpu(i,j)=ddmpuj(j)*vbm2(i,j)                  
      ddmpv(i,j)=ddmpvj(j)*vbm2(i,j)            
      hdacv(i,j)=hdacv(i,j)*vbm2(i,j)  
          enddo
              enddo                             
!--------------increasing diffusion along the boundaries----------------
      ja=0
              do j=3,5
              ja=ja+1
              ivl=kvla(ja)
              ivh=kvha(ja)
          do i=ivl,ivh
      ddmpu(i,j)=ddmpu(i,j)*ddfc
      ddmpv(i,j)=ddmpv(i,j)*ddfc
      hdacv(i,j)=hdacv(i,j)*dfc
          enddo
              enddo
              do j=jm-4,jm-2
              ja=ja+1
              ivl=kvla(ja)
              ivh=kvha(ja)
          do i=ivl,ivh
      ddmpu(i,j)=ddmpu(i,j)*ddfc
      ddmpv(i,j)=ddmpv(i,j)*ddfc
      hdacv(i,j)=hdacv(i,j)*dfc
          enddo
              enddo
              do j=6,jm-5
              ja=ja+1
              ivl=kvla(ja)
              ivh=kvha(ja)
          do i=ivl,ivh
      ddmpu(i,j)=ddmpu(i,j)*ddfc
      ddmpv(i,j)=ddmpv(i,j)*ddfc
      hdacv(i,j)=hdacv(i,j)*dfc
          enddo
              enddo
              do j=6,jm-5
              ja=ja+1
              ivl=kvla(ja)
              ivh=kvha(ja)
          do i=ivl,ivh
      ddmpu(i,j)=ddmpu(i,j)*ddfc
      ddmpv(i,j)=ddmpv(i,j)*ddfc
      hdacv(i,j)=hdacv(i,j)*dfc
          enddo
              enddo
      print*,'ja=',ja,' jam=',jam
!--------------surface parameters---------------------------------------
      open(unit=3,file='/ptmp/wx20hc/intrst22to22hyb/sst.bilin'
     &    ,status='old',form='unformatted')
      read(3) sst
      close(3)
      print*,'*** const read sst.bilin'
!
      open(unit=3,file='/ptmp/wx20hc/intrst22to22hyb/alb.bilin'
     &    ,status='old',form='unformatted')
      read(3) albedo
      close(3)
      print*,'*** const read alb.bilin'
!
      open(unit=3
     &    ,file='/ptmp/wx20hc/intrst22to22hyb/snow.nrst'
     &    ,status='old'
     1    ,form='unformatted')
      read(3) si
      close(3)
      print*,'*** const read snow.nrst'
!
      open(unit=3
     &    ,file='/ptmp/wx20hc/intrst22to22hyb/ivege.nrst'
     &    ,status='old'
     1    ,form='unformatted')
      read(3) ivgtyp
      close(3)
      print*,'*** const read ivege.nrst'
!
      open(unit=3
     &    ,file='/ptmp/wx20hc/intrst22to22hyb/isoil.nrst'
     &    ,status='old'
     1    ,form='unformatted')
      read(3) isltyp
      close(3)
      print*,'*** const read isoil.nrst'
!
      open(unit=3
     &    ,file='/ptmp/wx20hc/intrst22to22hyb/islop.nrst'
     &    ,status='old'
     1    ,form='unformatted')
      read(3) islope
      close(3)
      print*,'*** const read islop.nrst'
!
      open(unit=3
     &    ,file='/ptmp/wx20hc/intrst22to22hyb/vgfrc.mean'
     &    ,status='old'
     1    ,form='unformatted')
      read(3) vegfrc
      close(3)
      print*,'*** const read vgfrc.mean'
!-----------------------------------------------------------------------
      tph=sb-dph                                                
              do j=1,jm                                            
          tlm=wb-tdlm+mod(j+1,2)*dlm                                
          tph=tph+dph                                               
          stph=sin(tph)                                             
          ctph=cos(tph)                                             
!                                                                       
          do i=1,im                                             
      tlm=tlm+tdlm                                                      
      ctlm=cos(tlm)                                                     
      stlm=sin(tlm)                                                     
!                                                                       
      aph=asin(stph0*ctph*ctlm+ctph0*stph) 
!vvvv guessing snow, sea-ice, albedo, grnd wetness & sea surf. temp. vvv
!      si(i,j)=0.                    
!          if(fis(i,j).gt.12000.and.aph.gt.40.)    then
!      si(i,j)=(fis(i,j)-12000.)/60000.
!          endif
!      albedo(i,j)=0.20                                            
      wet(i,j)=(sin(aph-30.*dtr))**2
!      if(aph.le.30.*dtr)  wet(i,j)=0.    
!aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
      tg(i,j)=tg0+tga*cos(aph)+fis(i,j)/3333. 
          enddo
              enddo
!-----------------------------------------------------------------------
              do j=1,jm
          do i=1,im
!      if(sst(i,j).lt.271.5.and.sm(i,j).gt.0.50) si(i,j)=.2 
!
      sice(i,j)=0.                  
      sno (i,j)=0.                                              
      if(albedo(i,j).gt.0.60)    albedo(i,j)=0.60          
          if(sm(i,j).gt.0.50) then
      epsr(i,j)=.97                                    
      albedo(i,j)=0.06                       
      gffc(i,j)=0.          
      wet(i,j)=999.
      wfk(i,j)=999.                   
              if(si(i,j).gt.0.) then
          sm(i,j)=0.
          sice(i,j)=1.
          albedo(i,j)=0.60
          tg(i,j)=ti0                            
          gffc(i,j)=roi*ci*aki/dzi            
              endif                                                    
           else                         
      epsr(i,j)=1.0                              
      wfk(i,j)=.1125 
      gffc(i,j)=ros*cs*aks/dzg
      sice(i,j)=0.                         
      sno(i,j)=si(i,j)*.20
              if(sno(i,j).gt.0.) then
          wet(i,j)=wfk(i,j)
          albedo(i,j)=0.60
              endif                                                    
              if(wet(i,j).gt.wfk(i,j)) then
          wet(i,j)=wfk(i,j) 
              endif 
          endif
      if(sice(i,j).gt.0.5.or.sno(i,j).gt.0.) vegfrc(i,j)=0.
          enddo
              enddo
!-----------------------------------------------------------------------
              do j=1,jm
          do i=1,im
!vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
!      sst(i,j)=sst(i,j)*sm(i,j)
!aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
      gffc(i,j)=gffc(i,j)*hbm2(i,j)
      epsr(i,j)=epsr(i,j)*hbm2(i,j) 
          enddo
              enddo
!--------------coarse look-up table for saturation point----------------
      kthm=jtb                                                 
      kpm=itb                                                  
      kthm1=kthm-1                                                
      kpm1=kpm-1                               
!                                                                       
      thl=210.                                      
      thh=350.                     
      pl=pt                                         
      ph=105000.                                                        
csn NEDOSTAJALI PARAMETRI
      r1=r
      pt1=pt
csn NEDOSTAJALI PARAMETRI
!-----------------------------------------------------------------------
      call table(ptbl,ttbl,pt1
     &,          rdq,rdth,rdp,rdthe,pl,thl,qs0,sqs,sthe,the0)
      call tableq(ttblq,rdpq,rdtheq,plq,thl,stheq,the0q)
!-----------------------------------------------------------------------
      open(unit=8,file='/ptmp/wx20hc/intrst22to22hyb/nhibu2250'
     &    ,status='unknown',form='unformatted')
!
      write(8)                                     
     & nfcst,nbc,list
     &,dt,idtad,sigma                  
     &,khla,khha,kvla,kvha,idum1,idum2,idum3,idum4
!
      write(8) lmh
      write(8) lmv
      write(8)((hbm2(i,j),i=1,im),j=1,jm)
      write(8) vbm2
      write(8) vbm3
      write(8) sm
      write(8) sice
          do l=1,lm
      write(8) ((htm(i,j,l),i=1,im),j=1,jm)
          enddo
          do l=1,lm
      write(8) ((vtm(i,j,l),i=1,im),j=1,jm)
          enddo
      write(8) dy,cpgfv,en,ent,r,pt,tddamp
     &,            f4d,f4q,ef4t,pdtop,deta,aeta,f4q2,eta,dfl
     &,            deta1,aeta1,eta1
     &,            deta2,aeta2,eta2
     &,    em,emt
      write(8) dx
      write(8) wpdar
      write(8) cpgfu
      write(8) curv
      write(8) fcp
      write(8) fdiv
      write(8)((fad(i,j),i=1,im),j=1,jm)
      write(8) f
      write(8) ddmpu
      write(8) ddmpv
      write(8) pt,glat
      write(8) glon
      write(8) plq,rdpq,rdtheq,stheq,the0q
!
      write(8) ros,cs,ds,roi,ci,di
     &,    pl,thl,rdq,rdth,rdp,rdthe
     &,            detap2,aetap2,dfrlg
     &,            detap21,aetap21
     &,            detap22,aetap22
     &,    qs0,sqs,sthe,the0
!
      write(8) wfk
      write(8) epsr
      write(8) tg
      write(8) gffc
      write(8) sst
      write(8) albedo
!
      write(8) hdac
      write(8) hdacv
!
      write(8) ttblq
      write(8) ptbl,ttbl
     &,    r1,pt1,tsph
     &,    wbd,sbd,tlm0d,tph0d,dlmd,dphd,dum1,dum2
     &,    dum3,dum4,idum5,idum6
     &,            detam1,aetam1,etam1
     &,            detam11,aetam11,etam11
     &,            detam12,aetam12,etam12
!
      write(8) ivgtyp
      write(8) isltyp
      write(8) islope
!
      write(8) vegfrc
!
      write(8) sldpth
      write(8) rtdpth
      close(8)
!-----------------------------------------------------------------------
      return                                     
      end                                        
!+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
      SUBROUTINE TABLE(PTBL,TTBL,PT
     &,                RDQ,RDTH,RDP,RDTHE,PL,THL,QS0,SQS,STHE,THE0)
C     ******************************************************************
C     *                                                                *
C     *    GENERATE VALUES FOR LOOK-UP TABLES USED IN CONVECTION       *
C     *                                                                *
C     ******************************************************************
                             P A R A M E T E R
     & (ITB=076,JTB=134)
                             P A R A M E T E R
     & (THH=350.,PH=105000.
     &, PQ0=379.90516,A1=610.78,A2=17.2693882,A3=273.16,A4=35.86
     &, R=287.04,CP=1004.6,ELIWV=2.683E6,EPS=1.E-10)
                             D I M E N S I O N
     &  PTBL  (ITB,JTB),TTBL  (JTB,ITB),QSOLD (JTB),POLD  (JTB)
     &, QS0   (JTB),SQS   (JTB),QSNEW (JTB)
     &, Y2P   (JTB),APP   (JTB),AQP   (JTB),PNEW  (JTB)
     &, TOLD  (JTB),THEOLD(JTB),THE0  (ITB),STHE  (ITB)
     &, Y2T   (JTB),THENEW(JTB),APT   (JTB),AQT   (JTB),TNEW  (JTB)
C--------------COARSE LOOK-UP TABLE FOR SATURATION POINT----------------
      KTHM=JTB
      KPM=ITB
      KTHM1=KTHM-1
      KPM1=KPM-1
C
      PL=PT
C
      DTH=(THH-THL)/REAL(KTHM-1)
      DP =(PH -PL )/REAL(KPM -1)
C
      RDTH=1./DTH
      RDP=1./DP
      RDQ=KPM-1
C
      TH=THL-DTH
C-----------------------------------------------------------------------
              DO 500 KTH=1,KTHM
          TH=TH+DTH
          P=PL-DP
          DO 510 KP=1,KPM
      P=P+DP
      APE=(100000./P)**(R/CP)
      QSOLD(KP)=PQ0/P*EXP(A2*(TH-A3*APE)/(TH-A4*APE))
 510  POLD(KP)=P
C
      QS0K=QSOLD(1)
      SQSK=QSOLD(KPM)-QSOLD(1)
      QSOLD(1  )=0.
      QSOLD(KPM)=1.
C
          DO 520 KP=2,KPM1
      QSOLD(KP)=(QSOLD(KP)-QS0K)/SQSK
CWWWWWWWWWWWWWW FIX DUE TO CYBER HALF PREC. LIMITATION WWWWWWWWWWWWWWWWW
      IF((QSOLD(KP)-QSOLD(KP-1)).LT.EPS) QSOLD(KP)=QSOLD(KP-1)+EPS
CMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
 520  CONTINUE
C
      QS0(KTH)=QS0K
      SQS(KTH)=SQSK
C-----------------------------------------------------------------------
      QSNEW(1  )=0.
      QSNEW(KPM)=1.
      DQS=1./REAL(KPM-1)
C
          DO 530 KP=2,KPM1
 530  QSNEW(KP)=QSNEW(KP-1)+DQS
C
      Y2P(1   )=0.
      Y2P(KPM )=0.
C
      CALL SPLINE(JTB,KPM,QSOLD,POLD,Y2P,KPM,QSNEW,PNEW,APP,AQP)
C
          DO 540 KP=1,KPM
 540  PTBL(KP,KTH)=PNEW(KP)
C-----------------------------------------------------------------------
 500  CONTINUE
C--------------COARSE LOOK-UP TABLE FOR T(P) FROM CONSTANT THE----------
      P=PL-DP
              DO 550 KP=1,KPM
          P=P+DP
          TH=THL-DTH
          DO 560 KTH=1,KTHM
      TH=TH+DTH
      APE=(100000./P)**(R/CP)
      QS=PQ0/P*EXP(A2*(TH-A3*APE)/(TH-A4*APE))
      TOLD(KTH)=TH/APE
 560  THEOLD(KTH)=TH*EXP(ELIWV*QS/(CP*TOLD(KTH)))
C
      THE0K=THEOLD(1)
      STHEK=THEOLD(KTHM)-THEOLD(1)
      THEOLD(1   )=0.
      THEOLD(KTHM)=1.
C
          DO 570 KTH=2,KTHM1
      THEOLD(KTH)=(THEOLD(KTH)-THE0K)/STHEK
C
      IF((THEOLD(KTH)-THEOLD(KTH-1)).LT.EPS)
     1    THEOLD(KTH)=THEOLD(KTH-1)  +  EPS
C
 570  CONTINUE
C
      THE0(KP)=THE0K
      STHE(KP)=STHEK
C-----------------------------------------------------------------------
      THENEW(1  )=0.
      THENEW(KTHM)=1.
      DTHE=1./REAL(KTHM-1)
      RDTHE=1./DTHE
C
          DO 580 KTH=2,KTHM1
 580  THENEW(KTH)=THENEW(KTH-1)+DTHE
C
      Y2T(1   )=0.
      Y2T(KTHM)=0.
C
      CALL SPLINE(JTB,KTHM,THEOLD,TOLD,Y2T,KTHM,THENEW,TNEW,APT,AQT)
C
          DO 590 KTH=1,KTHM
 590  TTBL(KTH,KP)=TNEW(KTH)
C-----------------------------------------------------------------------
 550  CONTINUE
C
      RETURN
      END
C&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
      SUBROUTINE TABLEQ(TTBLQ
     &,                 RDP,RDTHE,PL,THL,STHE,THE0)
C     ******************************************************************
C     *                                                                *
C     *        GENERATE VALUES FOR FINER LOOK-UP TABLES USED           *
C     *                       IN CONVECTION                            *
C     *                                                                *
C     ******************************************************************
                             P A R A M E T E R
     & (ITB=152,JTB=440)
                             P A R A M E T E R
     & (THH=325.,PH=105000.
     &, PQ0=379.90516,A1=610.78,A2=17.2693882,A3=273.16,A4=35.86
     &, R=287.04,CP=1004.6,ELIWV=2.683E6,EPS=1.E-10)
                             D I M E N S I O N
     &  TTBLQ (JTB,ITB)
     &, TOLD  (JTB),THEOLD(JTB),THE0  (ITB),STHE  (ITB)
     &, Y2T   (JTB),THENEW(JTB),APT   (JTB),AQT   (JTB),TNEW  (JTB)
C--------------COARSE LOOK-UP TABLE FOR SATURATION POINT----------------
      KTHM=JTB
      KPM=ITB
      KTHM1=KTHM-1
      KPM1=KPM-1
C
      DTH=(THH-THL)/REAL(KTHM-1)
      DP =(PH -PL )/REAL(KPM -1)
C
      RDP=1./DP
      TH=THL-DTH
C--------------COARSE LOOK-UP TABLE FOR T(P) FROM CONSTANT THE----------
      P=PL-DP
              DO 550 KP=1,KPM
          P=P+DP
          TH=THL-DTH
          DO 560 KTH=1,KTHM
      TH=TH+DTH
      APE=(100000./P)**(R/CP)
      QS=PQ0/P*EXP(A2*(TH-A3*APE)/(TH-A4*APE))
      TOLD(KTH)=TH/APE
      THEOLD(KTH)=TH*EXP(ELIWV*QS/(CP*TOLD(KTH)))
 560  CONTINUE
C
      THE0K=THEOLD(1)
      STHEK=THEOLD(KTHM)-THEOLD(1)
      THEOLD(1   )=0.
      THEOLD(KTHM)=1.
C
          DO 570 KTH=2,KTHM1
      THEOLD(KTH)=(THEOLD(KTH)-THE0K)/STHEK
C
      IF((THEOLD(KTH)-THEOLD(KTH-1)).LT.EPS)
     1    THEOLD(KTH)=THEOLD(KTH-1)  +  EPS
C
 570  CONTINUE
C
      THE0(KP)=THE0K
      STHE(KP)=STHEK
C-----------------------------------------------------------------------
      THENEW(1  )=0.
      THENEW(KTHM)=1.
      DTHE=1./REAL(KTHM-1)
      RDTHE=1./DTHE
C
          DO 580 KTH=2,KTHM1
      THENEW(KTH)=THENEW(KTH-1)+DTHE
 580  CONTINUE
C
      Y2T(1   )=0.
      Y2T(KTHM)=0.
C
      CALL SPLINE(JTB,KTHM,THEOLD,TOLD,Y2T,KTHM,THENEW,TNEW,APT,AQT)
C
          DO 590 KTH=1,KTHM
      TTBLQ(KTH,KP)=TNEW(KTH)
 590  CONTINUE
C-----------------------------------------------------------------------
 550  CONTINUE
C
      RETURN
      END
!+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
      SUBROUTINE SPLINE(JTB,NOLD,XOLD,YOLD,Y2,NNEW,XNEW,YNEW,P,Q)           
C     ******************************************************************
C     *                                                                *
C     *  THIS IS A ONE-DIMENSIONAL CUBIC SPLINE FITTING ROUTINE        *
C     *  PROGRAMED FOR A SMALL SCALAR MACHINE.                         *
C     *                                                                *
C     *  PROGRAMER: Z. JANJIC, YUGOSLAV FED. HYDROMET. INST., BEOGRAD  *
C     *                                                                *
C     *                                                                *
C     *                                                                *
C     *  NOLD - NUMBER OF GIVEN VALUES OF THE FUNCTION.  MUST BE GE 3. *
C     *  XOLD - LOCATIONS OF THE POINTS AT WHICH THE VALUES OF THE     *
C     *         FUNCTION ARE GIVEN.  MUST BE IN ASCENDING ORDER.       *
C     *  YOLD - THE GIVEN VALUES OF THE FUNCTION AT THE POINTS XOLD.   *
C     *  Y2   - THE SECOND DERIVATIVES AT THE POINTS XOLD.  IF NATURAL *
C     *         SPLINE IS FITTED Y2(1)=0. AND Y2(NOLD)=0. MUST BE      *
C     *         SPECIFIED.                                             *
C     *  NNEW - NUMBER OF VALUES OF THE FUNCTION TO BE CALCULATED.     *
C     *  XNEW - LOCATIONS OF THE POINTS AT WHICH THE VALUES OF THE     *
C     *         FUNCTION ARE CALCULATED.  XNEW(K) MUST BE GE XOLD(1)   *
C     *         AND LE XOLD(NOLD).                                     *
C     *  YNEW - THE VALUES OF THE FUNCTION TO BE CALCULATED.           *
C     *  P, Q - AUXILIARY VECTORS OF THE LENGTH NOLD-2.                *
C     *                                                                *
C     ******************************************************************
C-----------------------------------------------------------------------
                             D I M E N S I O N                          
     & XOLD(JTB),YOLD(JTB),Y2(JTB),P(JTB),Q(JTB)                        
     &,XNEW(JTB),YNEW(JTB)                                              
C-----------------------------------------------------------------------
      NOLDM1=NOLD-1                                                     
C                                                                       
      DXL=XOLD(2)-XOLD(1)                                               
      DXR=XOLD(3)-XOLD(2)                                               
      DYDXL=(YOLD(2)-YOLD(1))/DXL                                       
      DYDXR=(YOLD(3)-YOLD(2))/DXR                                       
      RTDXC=.5/(DXL+DXR)                                                
C                                                                       
      P(1)= RTDXC*(6.*(DYDXR-DYDXL)-DXL*Y2(1))                          
      Q(1)=-RTDXC*DXR                                                   
C                                                                       
      IF(NOLD.EQ.3) GO TO 700                                           
C-----------------------------------------------------------------------
      K=3                                                               
C                                                                       
 100  DXL=DXR                                                           
      DYDXL=DYDXR                                                       
      DXR=XOLD(K+1)-XOLD(K)                                             
      DYDXR=(YOLD(K+1)-YOLD(K))/DXR                                     
      DXC=DXL+DXR                                                       
      DEN=1./(DXL*Q(K-2)+DXC+DXC)                                       
C                                                                       
      P(K-1)= DEN*(6.*(DYDXR-DYDXL)-DXL*P(K-2))                         
      Q(K-1)=-DEN*DXR                                                   
C                                                                       
      K=K+1                                                             
      IF(K.LT.NOLD) GO TO 100                                           
C-----------------------------------------------------------------------
 700  K=NOLDM1                                                          
C                                                                       
 200  Y2(K)=P(K-1)+Q(K-1)*Y2(K+1)                                       
C                                                                       
      K=K-1                                                             
      IF(K.GT.1) GO TO 200                                              
C-----------------------------------------------------------------------
      K1=1                                                              
C                                                                       
 300  XK=XNEW(K1)                                                       
C                                                                       
      DO 400 K2=2,NOLD                                                  
      IF(XOLD(K2).LE.XK) GO TO 400                                      
      KOLD=K2-1                                                         
      GO TO 450                                                         
 400  CONTINUE                                                          
      YNEW(K1)=YOLD(NOLD)                                               
      GO TO 600                                                         
C                                                                       
 450  IF(K1.EQ.1)   GO TO 500                                           
      IF(K.EQ.KOLD) GO TO 550                                           
C                                                                       
 500  K=KOLD                                                            
C                                                                       
      Y2K=Y2(K)                                                         
      Y2KP1=Y2(K+1)                                                     
      DX=XOLD(K+1)-XOLD(K)                                              
      RDX=1./DX                                                         
C                                                                       
      AK=.1666667*RDX*(Y2KP1-Y2K)                                       
      BK=.5*Y2K                                                         
      CK=RDX*(YOLD(K+1)-YOLD(K))-.1666667*DX*(Y2KP1+Y2K+Y2K)            
C                                                                       
 550  X=XK-XOLD(K)                                                      
      XSQ=X*X                                                           
C                                                                       
      YNEW(K1)=AK*XSQ*X+BK*XSQ+CK*X+YOLD(K)                             
C                                                                       
 600  K1=K1+1                                                           
      IF(K1.LE.NNEW) GO TO 300                                          
C-----------------------------------------------------------------------
                              RETURN                                    
                              END                                       
!+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
      subroutine albedo_vege(ivegetype,albedo)
      dimension albedo_veg(14)
!-----------------------------------------------------------------------
!     SSiB Vegetation Types (Dorman and Sellers, 1989; JAM)
!
!    1:   Broadleaf-evergreen trees  (tropical forest)
!    2:   Broadleaf-deciduous tress
!    3:   Broadleaf and needleleaf tress (mixed forest)
!    4:   Needleleaf-evergreen trees
!    5:   Needleleaf-deciduous tress (larch)
!    6:   Broadleaf tress with groundcover (savanna)
!    7:   Groundcover only (perennial)
!    8:   Broadleaf shrubs with perennial groundcover
!    9:   Broadleaf shrubs with bare soil
!   10:   Dwarf trees and shrubs with groundcover (tundra)
!   11:   Bare soil
!   12:   Cultivations (The same parameters for the Type 7)
!   13:   Glacial
!   14:   Water, according to eta sm
!-----------------------------------------------------------------------
      data albedo_veg/0.11,0.19,0.16,0.13,0.19,0.19,0.19,
     *                0.29,0.29,0.14,0.15,0.19,0.15,0.10/
      albedo=albedo_veg(ivegetype)
      return
      end
!+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
      subroutine z0_vege(ivegetype,fis,sm,z0)
      dimension z0_veg(14)
      parameter (fcm=.00001)
!
      data z0_veg/2.653,0.826,0.563,1.089,0.854,0.856,0.075,
     &            0.238,0.065,0.076,0.011,0.075,0.011,0.001/
      z0=sm*z0_veg(14)
     &  +(1.-sm)*(fis*fcm+z0_veg(ivegetype))
!-----------------------------------------------------------------------
      return
      end

