C    File Version using SCCS:    @(#)auto.f     1.7     (C) 7/6/92
  
c   AUTO.FOR or AUTOSYS.FOR
cm
cm    this version is 1.2.1 7-2-89 7-20-89
cm    update version 1.0.0 For the connection machine
cm    written:    joseph c. Coughlan and documented 5-2-89.
cm    modified for the connection machine on 7-20-89.
Cm    contains:   program auto
cm    subroutine model
cm    tested: mtclim to mtclim done with rhungerford- its okay
cc    calls:
cc    call filego(
cc    call readat(
cc    call init(
cc    call readpoly(
cc    if (ncols .Eq. Bcols)  call mtclim
cc    call model(
cc    call readpoly(
cc    call header(
cc    call zerogs(
cc    call zerogs(
cc    call zcomp(
cc    call h20
cc    call doflow
cc    call output (
cc    call zerogs(
cc    (* ******************************* *)
cm    designed to work with the connection machine parallel processor
cm    (* ******************************* *)
cd    tree diagram of the calling structure in autosys
cd
cd    autosys_
cd    '      |
cd    '      +--filego
cd    '      |
cd    '      +--readat
cd    '      |
cd    '      +--init
cd    '      |
cd    '      +--readpoly
cd    '      |
cd    '      +--mtclim
cd    '      |   |
cd    '      |   +--transm
cd    '      |   |   |
cd    '      |   |   +--exp
cd    '      |   |
cd    '      |   +--shrad
cd    '      |   |   |
cd    '      |   |   +--ifix,amin1,cos,sin,acos,sqrt
cd    '      |   |   |
cd    '      |   |   +--conv
cd    '      |   |
cd    '      |   +--fltrad
cd    '      |   |   |
cd    '      |   |   +--ifix,amin1,cos,sin,acos,sqrt
cd    '      |   |   |
cd    '      |   |   +--conv
cd    '      |   |
cd    '      |   +--temp
cd    '      |   |   |
cd    '      |   |   +--amin1,amax1
cd    '      |   |
cd    '      |   +--rain
cd    '      |
cd    '      +--fixsnow
cd    '      |
cd    '      +--model
cd    '          |
cd    '          +--header
cd    '          |
cd    '          +--zerogs
cd    '          |
cd    '          +--zcomp
cd    '          |   |
cd    '          |   +--amax1,exp,sin
cd    '          |
cd    '          +--h20
cd    '          |   |
cd    '          |   +--amin1,amax1,exp,log
cd    '          |   |
cd    '          |   +--penmon
cd    '          |       |
cd    '          |       +--exp
cd    '          |
cd    '          +--doflow
cd    '          |
cd    '          +--output
cd    '              |
cd    '              +--mod
cd
cd    the following routines are defined but not used in autosys
cd
cd    '     humd
cd    '      |
cd    '      +--exp
cd
cd    '     m2f
cd
cd    '     f2c
cd
cd    '     f2m
cd
cd    '     c2f
cd
cd
cd
cd    description of modules
cd    '     o     this is a program which automates the mtclim and
cd    '           forest-bgc models.
Cd    '     o     it is possible to run both mtclim and forest-bgc or to
cd    '           run forest-bgc only.  See "input options" below.
Cd    '     o     this file contains the program control routines, main
cd    '           program and main ecosystem model coordinating module,
cd    '           model.  It should read like a main model calling
cd    '           subordinate modules with minimal low level code.
Cd    '     o     system output is done via modules called from this file
cd    '     o     si units assumed for all files
cd
cf    input / output
cd    '     o     inputs are taken from a file, called a cartridge,
cd    '           which has site specific data, topography, lai, soils,
cd    '           and area.  Each site is a record in the cartridge
cf    '           file.
Cd    '     o     output is for each record (site).
Cd    '     o     it has two forms, 1) summary 2) dynamic.
Cd    '     o     summary output is year end totals for any variable,
cd    '           x[6] for example is seasonal psn.
Cd    '     o     dynamic output are year to date totals, x[6] on
cd    '           yearday 200.
Cd    '     o     dynamic output is done every x days, currently x is
cd    '           set to 5.  Each 5 day period, the year to date total
cd    '           is sent to a file.
Cd    '     o     after a cartridge file is completed the dynamic output
cd    '           files have 365 mod x (x=5 then 73) entries per site.
Cd    '           the second site's output for yearday 5 is the 74th
cd    '           entry.
Cd    '     o     a summary program is needed to read in the output and
cd    '           compute watershed totals for a particular yearday.
Cd    '     o     dynamic output is necessary to find seasonal dynamics
cd    '           for a variable across a watershed.
Cd    '     o     new file format for mtc files. Si units. Ppt in cm!
Cd
cd    '     o   7/20/89 new option for connection machine
cd    '     o     binary output in place of formatted writes
cd    '           decision is made at run time with response to the
cd    '           system. (Yes or no)
cd
cd    input options
cd    '     o     new option to do binary writes. Answer at prompt
cd    '     o     forest-bgc takes minimal time relative to mtclim.
Cd    '     o     using forest-bgc alone is possible.
Cd    '     o     to "play" with forest-bgc without varying climate pleas
cd    '           follow the instructions below otherwise ignore.
Cd    '        -  set up the input as usual for one site.
Cd    '        -  enter module mtclim, found in file aumtclim.For and
cd    '            change the commented write statement so it will print
cd    '            daily site microclimate to the screen.
Cd    '        -  recomplie and link a new auto system.
Cd    '        -  run auto as usual except redirect the output to a file
cd    '           (suggest using a .Clm extension for the file)
cd    '        -  edit the .Clm file so that it has a comment line follow
cd    '            by 1 site's climate data (up to 365 days) then an eof.
Cd    '        -  edit this file, auto.For:
cd    '             change a line of code in this file to use the .Clm fi
cd    '             set the variable ncols from bcols to scols
cd    '                     ncols = scols
cd    '             it is the first executable line in the code.
Cd    '             this will cause the program to adjust to a new
cd    '             microclimatic input format.
Cd    '        -  compile and link the new auto program
cd    '        -  run the program, it will ignore mtclim and use the
cd    '        -  .Clm file as input for forest bgc.
Cd    '        -  enter the .Clm file for the climate file
cd    '       -  enter the same dat, cartridge file, for site data
cd    '            as used with the old auto system.
Cd    '        -  it is possible to run this new auto program with
cd    '            cartridges except that it uses the same climate file
cd    '            for all sites.
Cd
cf    files:
cf    '   in    :climate file, for either mtclim or forest-bgc
cf    '   inp   :cartridge file with sites to simulate
cf    '   outpsn:psn, x[6], written x days per site
cf    '   outet :et, x[4], or x[4]&x[5] written x days per site
c     (* ******************************* *)
  
      PROGRAM autosys
  
c     (* ******************************* *)
cv    variables
cv    bdat    :base station met data (raw) for mtclim
cv    sdat    :site data output from mtclim for forest-bgc
cv    bcols   :number of fields for base data; flag for using mtclim
cv    scols   :number of fields for forest-bgc;
cv    soilawi :available soil water from soil's map.
Cv    pidnum   :site id number; read from cartridge
cv    psize   :area of pidnumon or pixel number; read from cartridge
cv    ndays   :number of days to simulate; count of climate records
cv    moredat :true if another site is in cartridge
cv    usemtc  :true if mtclim is to be used before forest-bgc
cv    bino   :true if binary i/o files are used
c     (* ******************************* *)

         implicit none
      include 'auto.blk'
        include 'aiblock.inc'

      REAL selev,slat,saspct,sslope,bisoh,
     & sisoh,sehorz,swhorz,salbdo,falbdo,
     & belev
c     (* bdat=base met.Data;  sdat=site met.Data *)
      REAL bdat(370,7)
      REAL sdat(sdatdays,sdatfields)
      REAL soilawi,lai,pidnum,psize
      REAL fixsnow
      REAL trans(sdatdays)
        REAL clim(ncellsv,ndaysv,nfieldsv)
      INTEGER in, outet, outpsn, inp, initf, outbgc, outmtc
      INTEGER insoil
      INTEGER cellinf
      INTEGER ndays, bcols, scols, interv, simcycle, ncols
      INTEGER kountr
        INTEGER loop, i, idnum
      LOGICAL moredat, usemtc, bino, doep, dobgc, domtc, dodbf
      character*80 sccswhat
      DATA bcols/4/ scols/sdatfields/, usemtc/.FALSE./
  
C     begin
c     (* to run both models use bcols, forest-bgc only use scols *)
C   CC   CC   CC   CC   CC   CC   CC   CC   CC   C
C       Definition of a variable to add SCCS WHAT string
        DATA sccswhat /' @(#)auto.f     1.7 7/6/92   AU JCC'/
C       End SCCS definition 
C   CC   CC   CC   CC   CC   CC   CC   CC   CC   C

      ncols = bcols
      WRITE(*,*)' Begin RHESSys'
c     # of cols determines if the into climate dataset is MTC or CLM      
      usemtc=  ( ncols .EQ. Bcols) 

c     (* initialize auto, forest-bgc & mtclim, i/o files *)
      CALL filego( initf, in, inp, outet, outpsn, outbgc,
     & outmtc, bino,cellinf, insoil)
     
      CALL autoinit(initf, x, b, slat, bisoh, sisoh, sehorz,
     & swhorz, salbdo, falbdo, belev, interv, simcycle, doep,
     & dobgc, domtc, dodbf, bino)

c     (* read either forest-bgc climate or mt-clim climate file *)
*      IF (usemtc) THEN
*          CALL readat(in,bdat,ndays,ncols)
*      ELSE
*          CALL readat(in,sdat,ndays,ncols)
*      ENDIF
*      WRITE(*,*)' the number of days are ',ndays
        ndays=ndaysv

*       read the vemap climate for all sites in Oregon.
        CALL AIREAD(clim)
  
c     (* read 1st site to simulate *)
      CALL readpoly(inp, moredat, soilawi, lai, saspct, selev,
     & sslope, pidnum, psize, bino, insoil)
 
*      WRITE(*,*) 'Begin timing for simulations'
      CALL newelev(cellinf,psize,belev)

c     (* while moredat do *)
      moredat = .TRUE.
      kountr=1
20    IF (moredat) THEN
*           IF(mod(kountr,1000) .eq. 0) WRITE(*,*) kountr     
           idnum=psize
*           CALL siteclim(clim,idnum,sdat)
           CALL sitemtc(clim,idnum,bdat)

           IF (ncols .EQ. Bcols)  CALL mtclim
     &     (slat, selev, saspct, sslope,
     &     sisoh, sehorz, swhorz, salbdo, falbdo, belev,
     &     bisoh, bdat, sdat, ndays, lai, trans)

*           CALL jsum(bdat,sdat,ndays,psize)

          CALL model(x, b, soilawi, lai, sdat, ndays, outet,
     &     outpsn, bino, selev, belev, sisoh, bisoh, interv, simcycle,
     &     doep, domtc, dobgc, dodbf, outbgc, outmtc, pidnum ,psize, 
     &     trans)
*           write(97,*) soilawi, lai, saspct, selev, sslope, pidnum
  
c         (* next site to simulate, if not then moredat=.False. *)
          CALL readpoly(inp, moredat, soilawi, lai, saspct, selev,
     &     sslope, pidnum, psize, bino, insoil)
     
          CALL newelev(cellinf,psize,belev)
          kountr=kountr+1
          GOTO 20
      ENDIF
c     (* endwhile *)
      WRITE(*,*)' Stop - Program Terminated.'
      STOP
      END
  
c (* * ****************************** *)
cm    module:      model
cm    prototype:   model(soilawi,lai,sdat,ndays,outet,outpsn)
cm    modified:    7-20-89 by jcc
cm    o  removed common blocks; threaded data through
cd    description: runs ecological part of forest-bgc.
Cv    variables:
cvi   input:
cvi   '      soilawi
cvi   '      lai
cvi   '      sdat
cvi   '      ndays
cvi   '      psize
cvi   '      bino : binary  i/o files
cvo   output:      !None!
Cvf   file i/o:    writes to 2 files which are maintained by other modu l
cf    files:       outet   : file of et
cf    files:       outpsn  : file of psn
  
  
      SUBROUTINE model(x,b,soilawi,lai,sdat,ndays,
     & outet,outpsn,bino,selev,belev,sisoh,bisoh,interv,simcycle,
     & doep, domtc, dobgc, dodbf, outbgc, outmtc, pidnum, psize, trans)
      include 'auto.blk'
      REAL soilawi,lai,et,psn
      REAL sdat(sdatdays,sdatfields)
      REAL selev, belev, sisoh, bisoh, pidnum, psize
      REAL ave, total
      REAL trans(sdatdays)
      INTEGER outet, outpsn, yeard, irun, interv, simcycle,
     & outmtc, outbgc, counter
      LOGICAL bino, doep, domtc, dobgc, dodbf, resetlwp, IncLAI
c     (* initialize forest-bgc *)
      CALL autorest(x,b,lai,soilawi,selev,belev,sisoh,bisoh)
        CALL zerofs(f)
* Potential LAI code -- can be kept commented out or in - loop disengaged
        IncLAI = .TRUE. 
19      IF (IncLAI)  THEN

      DO 9 irun = 1, simcycle
          summax=0.0
          summin=0.0
          sumrad=0.0
          sumppt=0.0
          CALL resetx(x)
c         (* blank all intermediate values; all =100 *)
          CALL zerogs(g, 100)
c         (*  while current-day < last-day do *)
          yeard=0
10        IF (yeard .LT. Ndays) THEN
c             (* blank daily intermediate values *)
              CALL zerogs(g, 89)
c             (* read & compute forest-bgc daily climate data *)
              CALL zcomp(yeard, sdat, x, z, b)
c             (* daily water and carbon dynamics *)
              CALL h20( f, x, z, b, g)
c             (* update compartments in forest-bgc *)
              CALL doflow(f, x)
              IF (irun .EQ. simcycle) THEN
c                 et in cms
                  et = (x(4)+x(5))/100.0
C                 carbon in (mg) carbon ha-1
                  psn = x(6)/1000.0
*                  IF (doep)  CALL output (outet, outpsn, et,
*     &             psn, yeard, bino, interv)
*                  IF (dobgc) CALL outputbgc
*     &             (outbgc, x, g, yeard, bino, interv, pidnum)
*                  IF (domtc) CALL outputmtc
*     &             (outmtc, sdat, yeard, bino, interv)
                  ijk= int(z(2))
                  CALL sumclm(sdat,ijk,summin,summax,
     &             sumrad,sumppt)
                  resetlwp = (yeard .LE. 1)
                  CALL lwpave(ave, total, g(10), z(7),
     &             resetlwp)

                  CALL outputday(outbgc, x,
     &             yeard, counter, bino, interv,summax,
     &             summin, sumrad,sumppt,pidnum,ave,total, psize)
                  CALL uniqio(outbgc, x,
     &             yeard, counter, bino, interv,summax,
     &             summin, sumrad,sumppt,pidnum,ave,total, psize)
    
              ENDIF
*             WRITE(81,'(8F8.0,1F8.2)')Z(2),(x(ii),ii=1,7),g(10)
              GOTO 10
          ENDIF
c         (* end while for each day *)
          CALL zerogs(g, 100)
9     CONTINUE
*     end of annual recycle loop
* Code to compute potential LAI.
*       idnum=pidnum
*      CALL LAI_INC(ave,total,x(8), idnum, IncLAI)
*        IncLAI =.false.
*       goto 19

        ENDIF
*         (* end while for IncLAI*)
*      write(*,*) idnum, IncLAI, ave, x(8), z(10), ' making LAI'

      RETURN
      END
  
c     ******************************************************
c     *      subroutine resetx(x)                          *
c     *                                                    *
c     * fortran 77 comment guide * template 1.0  11/5/1989 *
C     ******************************************************
cf    file   : auto.For
cm    module : resetx
cma   author : j.C.Coughlan
cms   system : autosystem
c     *** tlib_ver *** "%v"
cmv   version:""
cmx   status : alpha test routine
cvf   vfile  : no files used
cvi   vinput : x(i)
cvo   voutput: x(i)
cr    returns: void
cd    descrip:
cd    resets x(3) to x(6) = 0
cn    notes  : none
cb    bugs   : n/a
cc    compile: n/a
ca    archive: n/a
cl    library: none
ch    created: 11/30/89
c     ******************************************************
      SUBROUTINE resetx(x)
      REAL x(10)
      x(3)=0.0
      x(4)=0.0
      x(5)=0.0
      x(6)=0.0
      x(7)=0.0
      RETURN
      END
  
      SUBROUTINE sumclm(sdat,yeard,summin,summax,sumrad,sumppt)
      include 'auto.blk'
      REAL summin, summax, sumrad, sumppt
      REAL sdat(sdatdays,sdatfields)
      INTEGER yeard
      summax=summax+sdat(yeard,2)
      summin=summin+sdat(yeard,3)
      sumrad=sumrad+sdat(yeard,5)
      sumppt=sumppt+sdat(yeard,6)
      RETURN
      END

      SUBROUTINE jsum(bdat,sdat,ndaysi,id)
      include 'auto.blk'
      REAL summin, summax, sumrad, sumppt
      REAL sdat(sdatdays,sdatfields)
      REAL bdat(sdatdays,7)
      REAL id
      INTEGER yeard
      summax=0.0
      summin=0.0
      sumrad=0.0
      sumppt=0.0
      do yeard =1, ndays
      summax=summax+sdat(yeard,2)
      summin=summin+sdat(yeard,3)
      sumrad=sumrad+sdat(yeard,5)
      sumppt=sumppt+sdat(yeard,6)
      enddo
      RETURN
      END
