C    File Version using SCCS:    %W%     (C) %G%
**f   (* --------------------------------------------------------------- *)
**f   (* ***************************************************** *)
**f   (*                Begin file  AUIO.FOR                   *)
**f   (* ***************************************************** *)
**f   (* ***************************************************** *)
**fn  filenam: AUIO.FOR
**************** TLIB_Ver *** "Version: %v"
**fv  ""
**fc  compile: MS FORTRAN 5.0  DOS3.X, OS/2 1.2
**fl  library: none
**fa  archive: AUIO.F$R
**fd  descrip:  Description of file:
**fd  |           Designed for the "auto" system.
**fd  |           This version is 1.2.1 On 7-2-89
**fd  |           7-2-89: added binary file support
**fd  |           Major modifications 12/10/89.
**fd  |
**fd  |        contains:     subroutine output
**fd  |                      subroutine outputbgc
**fd  |                      subroutine outputmtc
**fd  |                      subroutine readpoly
**fd  |                      subroutine readata
**fd  (* ***************************************************** *)
c
**md  (* c c c c c c c c c c c c c c c c c c c c c c c c c c c *)
c
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
**mn  Module : SUBROUTINE filego( initf, in, inp, outet, outpsn, outbgc,
**mn                              outmtc, bino)
**mn           INTEGER  initf, in, inp, outet, outpsn, outbgc, outmtc
**mn           LOGICAL  bino
**me  Example: CALL SUBROUTINE filego( initf, in, inp, outet, outpsn,
**me                                   outbgc, outmtc, bino)
**mr  Returns: none
**ma  Authors: Joseph C. Coughlan
**ms  System : AUTOSYS
**mv  Version: 2.0
**mf  Filenam: AUIO.FOR
**mhc Created: 5-10-89
**mhm Modify : 12-10-89, 1-5-90; 2-17-90-jcc;
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
**md  Descrip:     Module Description
**md  |        o   Queries for initalization filename.
**md  |        o   Reads I/O file filenames.
**md  |        o   Opens I/O files for Binary or ASCII I/O.
**md  |
**mdn Notes  :
**mdn |        n   NOTE that either all files are binary or all ASCII
**mdn |            there is no mixing of IO.
**mdn |        n   Climate and Initalization file are always ASCII.
**mdn |        n   Added 6 INITIAL line feeds to ASCII BGC output file to make
**mdn |            its output match QPRO macros.  Good for only one site per
**mdn |            file. Done for testing Forest-BGC section with Macros.
**mdn |            2-17-90-jcc
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
**mv  Vars   :
**mvf Files  : in     - climate file.
**mvf |        inp    - cartridge file.
**mvf |        initf  - initalization file.
**mvf |        outet  - output file for et.
**mvf |        outpsn - output file for psn.
**mvf |        outbgc - output file for Forest-BGC data.
**mvf |        outmtc - output file for MTCLIM data.
**mvf |
**mvi Inputs : none
**mvi |
**mvo Outputs: bino  - filename for climate file.
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
**l   locals : mtcfn  - filename for climate file.
**l   |        crtfn  - filename for cartridge file.
**l   |        initfn - initalizatio filename.
**l   |        etfn   - et output filename.
**l   |        psnfn  - psn output filename.
**l   |        outmtcfn - mtclim output filename.
**l   |        bgcfn    - Forest-BGC output filename.
**l   |        bgc      - "BGC"
**l   |        mtc      - "MTC"
**l   |        respon   - 1 character response to questions.
**l   |        exists   - boolean - does the file exist?
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
  
      SUBROUTINE filego( initf, in, inp, outet, outpsn, outbgc,
     & outmtc, bino, cellinf, insoil)
      INTEGER      initf, in, inp, outet, outpsn, outbgc, outmtc
      INTEGER      cellinf, insoil
      LOGICAL      bino
  
c     (* Local Variables *)
      CHARACTER*99 mtcfn, crtfn, outfn, initfn, etfn, psnfn, et,
     & psn ,concatinate, outmtcfn, bgcfn, bgc, mtc, cellfn
      CHARACTER*1  respon
      LOGICAL      exists
      DATA         et/'.et'/psn/'.psn'/, bgc/'.day'/, mtc/'.clm'/
  
C   CC   CC   CC   CC   CC   CC   CC   CC   CC   C
C       Definition of a variable to add SCCS WHAT string
        character*80 sccswhat
        DATA sccswhat /' %W% %G%   AU JCC'/
C       End SCCS definition 
C   CC   CC   CC   CC   CC   CC   CC   CC   CC   C

c     Set file unit numbers.
      in=28
      inp=29
      outet=20
      outpsn=21
      initf=22
      outbgc=23
      outmtc=24
      cellinf=25
      insoil=27
  
c     format for reading filenames.
1     FORMAT(1a20)
c     Get the initalization filename and check if it exists.
      initfn='default.ini'
  10  IF(.NOT. exists) THEN
          INQUIRE(file=initfn,exist=exists)
          IF(.NOT. exists) THEN
              WRITE(*,*) 'Cannot find INItalization file: ', initfn
              WRITE(*,*) 'Enter name of INItalization file: [X.INI]'
              READ(*,'(a12)')  initfn
          ENDIF
          GOTO 10
      ENDIF
c     Open the initalization file  and begin reading filenames.
      OPEN(unit=initf, file=initfn)
      READ(initf,1)
      READ(initf,1)
      READ(initf,*)mtcfn
      READ(initf,*)crtfn
      READ(initf,*)outfn
c     Build two I/O filenames
      etfn=concatinate(outfn,et)
      psnfn=concatinate(outfn,psn)
      outmtcfn=concatinate(outfn,mtc)
      bgcfn=concatinate(outfn,bgc)

c     Determine if data is in ASCII or Binary.
      READ(initf,'(1a1)') respon
      bino = (respon .EQ. 'Y' .OR. respon .EQ. 'y')
      IF (bino) THEN
*          WRITE(*,*)' Using ASCII input and binary output files.'
      ELSE
*          WRITE(*,*)' Using ASCII I/O files.'
      ENDIF
  
c     Open the cartridge file.
      exists=.FALSE.
11    IF (.NOT. Exists) THEN
          INQUIRE(file=crtfn,exist=exists)
          IF (.NOT. Exists) THEN
              WRITE(*,*)' cannot find CaRTridge file ',crtfn
              WRITE(*,*)' try again!'
              WRITE(*,*)' CaRTridge file? '
              READ(*,1) crtfn
          ENDIF
          GOTO 11
      ENDIF
*     Using only ASCII input files and optional BINARY output files only.
      OPEN (unit=inp, file=crtfn)
  
      OPEN (unit=insoil, file='soil.dat')
  
c     Open the climate file.
      exists=.FALSE.
20    IF (.NOT. Exists) THEN
          INQUIRE(file=mtcfn,exist=exists)
          IF (.NOT. Exists) THEN
              WRITE(*,*)' cannot find MTClim file ', mtcfn
              WRITE(*,*)' try again!'
              WRITE(*,*)' MTClim climate file?'
              READ(*,1) mtcfn
          ENDIF
          GOTO 20
      ENDIF
      OPEN (unit=in,  file=mtcfn)
c
c
c     Open the VEMAP derived file with VEMAP cell info for Oregon.
      cellfn='/jraid2/josco/IMP/oregon.crt'
      OPEN (unit= cellinf, file =cellfn)

      OPEN (unit=in,  file=mtcfn)
      IF (bino) THEN 
          OPEN (unit= outet, file = etfn, 
     &     form='unformatted')
  
          OPEN (unit= outpsn, file = psnfn,
     &     form='unformatted')
  
          OPEN (unit= outbgc, file = bgcfn,
     &     form='unformatted')
  
          OPEN (unit= outmtc, file = outmtcfn,
     &     form='unformatted')
      ELSE
          OPEN (unit= outet, file = etfn,
     &     access='sequential')
  
          OPEN (unit= outpsn, file = psnfn,
     &     access='sequential')
  
          OPEN (unit= outbgc, file = bgcfn,
     &     access='sequential')
*          WRITE(outbgc,'(1x,//////)')

          OPEN (unit= outmtc, file = outmtcfn,
     &     access='sequential')
          
      ENDIF
*     WRITE(*,'(1a72)') etfn, psnfn, bgcfn,outmtcfn, bgcfn

  
c     Rewind the initilization, cartridge and climate file.
      REWIND(in)
      REWIND(inp)
      REWIND (initf)
      RETURN
      END
c     (* end of FILEGO *)
**md  (* c c c c c c c c c c c c c c c c c c c c c c c c c c c *)
c
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
**mn  Module : output( outet, outpsn, et, psn, yeard, bino, interv)
**mn  |        INTEGER outet, outpsn, yeard, interv
**mn  |        LOGICAL bino
**mn  |        REAL et, psn
**me  Example: output( outet, outpsn, et, psn, yeard, bino, interv)
**mr  Returns: n/a
**ma  Authors: Joseph C. Coughlan
**ms  System : AUTOSYS
**mv  Version: 2.0
**mf  Filenam: AUIO.FOR
**mhc Created: 5-3-89
**mhm Modify : 7-2-89, 1-5-90
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
**md  Descrip:     Module Description
**md  |        o   If print interval is even multiple of yearday then print.
**md  |        o   Print to two files.
**md  |        o   I/O in binary or ASCII.
**md  |
**mdn Notes  : n   None.
**mdn |
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
**mv  Vars
**mvf File   : outet  -binary or ASCII output file for ET.
**mvf |        outpsn -binary or ASCII output file for psn.
**mvf |
**mvi Input  : et     :real    -ET in scaled units.
**mvi |        psn    :real    -psn in scaled units.
**mvi |        yeard  :int     -forest bgc yearday
**mvi |        bino  :logical -use binary IO if true.
**mvi |
**mvo Output : none
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
**l   Local  : iet   integer - integer for binary output of et.
**l   |        ipsn  integer - integer for binary output of psn.
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
  
      SUBROUTINE output(outet, outpsn, et, psn, yeard, bino, interv)
      INTEGER outet, outpsn, yeard, interv
      LOGICAL bino
      REAL    et, psn
  
c     (* local variables *)
      INTEGER iet, ipsn
  
      IF (mod(yeard, interv) .EQ. 0) THEN
          IF (bino) THEN
              iet = IFIX(anint(et))
              ipsn= IFIX(anint(psn))
              WRITE(outet)iet
              WRITE(outpsn) ipsn
          ELSE
              WRITE(outet,*) et
              WRITE(outpsn, *) psn
          ENDIF
      ENDIF
      RETURN
      END
c     (* end of OUTPUT *)
c
**md  (* c c c c c c c c c c c c c c c c c c c c c c c c c c c *)
c
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
**mn  Module : outputbgc( outbgc, x, g, yeard, bino, interv)
**mn  |        INTEGER    outbgc, yeard, interv
**mn  |        LOGICAL    bino
**mn  |        REAL       x(10), g(100)
**me  Example: call outputbgc( outbgc, x, g, yeard, bino, interv)
**mr  Returns: n/a
**ma  Authors: Joseph C. Coughlan
**ms  System : AUTOSYS
**mv  Version: 2.0
**mf  Filenam: AUIO.FOR
**mhc Created: 12-12-89
**mhm Modify : 1-5-90; 2/17/90-jcc;
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
**md  Descrip:     Module Description
**md  |        o   If print interval is even multiple of yearday then print.
**md  |        o   I/O in binary or ASCII.
**md  |
**mdn Notes  : none
**mdn |        n   Modified output seqence to match Forest-BGC and let QPRO
**mdn |            macros work with the fellow. 2/17/90 -jcc
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
**mv  Vars   :
**mvf Files  : outbgc -binary or ASCII output file for ET.
**mvi Inputs : x      : real array state vars from forest-bgc.
**mvi |        g      : real array intermediate vars from forest-bgc.
**mvi |        yeard  : int     -forest-bgc yearday
**mvi |        bino  : logical -use binary IO if true.
**mvo Outputs: none
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
**l   Locals : i      : loop counter
**l   |        y      : real yearday value.
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
      SUBROUTINE outputbgc(outbgc, x, g, yeard, bino, interv, pidnum)
      INTEGER outbgc, yeard, interv
      LOGICAL bino
      REAL    x(10), g(100), pidnum
  
c     (* local variables *)
      REAL y
      INTEGER i
  
      IF (mod(yeard, interv) .EQ. 0) THEN
          IF (bino) THEN
              y =yeard
              WRITE(outbgc) y,(x(i),i=1,5),g(10),x(6),x(7)
          ELSE
              WRITE(outbgc,432) pidnum,yeard,
     &         x(1)/100.0, x(2)/100.0,
     &         x(3)/100.0, x(4)/100.0, x(5)/100.0, x(6), x(7)
          ENDIF
      ENDIF
432   FORMAT(f8.0,i4,5(f5.0),2(f7.0),2(f5.1),f7.0,f5.0)
1     FORMAT(1x,i3,5(1x,f7.0),1x,f7.2,2(f7.0))
      RETURN
      END
c     (* end of OUTPUTBGC *)
c
**md  (* c c c c c c c c c c c c c c c c c c c c c c c c c c c *)
c
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
**mn  Module : outputmtc( outmtc, dat, yeard, bino, interv)
**mn  |        INTEGER    outmtc, yeard, interv
**mn  |        LOGICAL    bino
**mn  |        REAL       dat(370,6)
**me  Example: call outputmtc( outmtc, dat, yeard, bino, interv)
**mr  Returns: n/a
**ma  Authors: Joseph C. Coughlan
**ms  System : AUTOSYS
**mv  Version: 2.0
**mf  Filenam: AUIO.for
**mhc Created: 12-12-89
**mhm Modify : 1-5-90
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
**md  Descrip:      Module Description
**md  |         o   if print interval is even multiple of yearday then print.
**md  |         o   I/O in binary or ASCII.
**md  |
**mdn Notes  :  none
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
**mv  Vars   :
**mvf Files  : outbgc -binary or ASCII output file for ET.
**mvi Inputs : x      : real array state vars from forest-bgc.
**mvi |        g      : real array intermediate vars from forest-bgc.
**mvi |        yeard  : int     -forest-bgc yearday
**mvi |        bino  : logical -use binary IO if true.
**mvo Outputs: none
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
**l   locals : i      : loop counter
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
  
      SUBROUTINE outputmtc(outmtc, dat, yeard, bino, interv)
      INTEGER outmtc, yeard, interv
      LOGICAL bino
      REAL    dat(370,6)
  
c     (* Local variables *)
      INTEGER i
  
      IF (mod(yeard, interv) .EQ. 0) THEN
          IF (bino) THEN
              WRITE(outmtc) (dat(yeard,i),i=1,6)
          ELSE
              WRITE(outmtc,1) (dat(yeard,i),i=1,6)
          ENDIF
      ENDIF
1     FORMAT(1x,6(1x,f10.2))
      RETURN
      END
c     (* end of OUTPUTMTC *)
c
**md  (* c c c c c c c c c c c c c c c c c c c c c c c c c c c *)
c
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
**mn  Module : readpoly( inp, moredat, soilawi, lai, aspect, elev,
**mn  |                   grad, polyg, psize, bino)
**mn  |        REAL soilawi, lai, aspect, elev, grad, polyg, psize
**mn  |        LOGICAL moredat, bino
**mn  |        INTEGER inp
**me  Example: call readpoly( inp, moredat, soilawi, lai, aspect,
**me  |                       elev, grad, polyg, psize, bino)
**mr  Returns: n/a
**ma  Authors: Joseph C. Coughlan
**ms  System : AUTOSYS
**mv  Version: 2.0
**mf  Filenam: AUIO.FOR
**mhc Created: 5-3-89
**mhm Modify : 7-2-89, 12-10-89, 1-5-90
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
**md  Descrip:      Description of Module
**md  |        o   Read until EOF Cartridge file.
**md  |        o   Free format read of each record
**md  |        o   Read each record and return
**mdn Notes  : n   Units for all data are implied and must be
**mdn |            strictly adhered to in the program to avoid errors.
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
**mv  Vars   :
**mvf Files  : inp - cartridge file, binary or ASCII.
**mvi Inputs : moredat :logical-are there more entries in cartridge fil e?
**mvo Outputs: soilawi :real-soilwaterhiolding capacity in M.
**mvo |        lai     :real-two sidded LAI.
**mvo |        aspect  :real-site aspect in degreees (0-360).
**mvo |        elev    :real-site elevation in M.
**mvo |        grad    :real-site gradient in Degrees(0-90).
**mvo |        polyg   :real-cartridge polygon number.
**mvo |        psize   :real-site; polygon area or raster number.
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
**l   locals : none
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
  
      SUBROUTINE READPOLY( inp, moredat, soilawi, lai,
     & aspect, elev, grad, polyg, psize, bino, insoil)
      REAL    soilawi, lai, aspect, elev, grad, polyg, psize
      LOGICAL moredat, bino
      INTEGER inp
      INTEGER insoil 
*      Assuming only BINARY output files. ASCII input! 
*      IF (bino) THEN
*          READ(inp,END=10)aspect,elev,grad,lai,soilawi,polyg,psize
*      ELSE
          READ(inp,*,END=10)aspect,elev,grad,lai,soilawi,polyg,psize
          READ(insoil,*,END=10)soilawi
*      ENDIF
*      WRITE(*,'(3f8.1,2F10.3,2F8.0)')
*     & Aspect,elev,grad,lai,soilawi,polyg,psize
      RETURN
10    moredat = .FALSE.


      RETURN
      END
c     (*          end of READPOLY *)
c     (* c c c c c c c c c c c c c c c c c c c c c c c c c c c *)
c
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
**mn  Module : readat(in,dat,ndays,ncols)
**mn           INTEGER in,ndays,ncols
**mn           REAL dat(370,6)
**me  Example: call readat(in,dat,ndays,ncols)
**mr  Returns: none
**ma  Authors: Joseph C. Coughlan
**ms  System : AUTOSYS
**mv  Version: 2.0
**mf  Filenam: AUIO.FOR
**mhc Created: 5-3-89
**mhm Modify : 7-2-89, 12-10-89, 1-5-90
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
**md  Descrip:     Module Description
**md  |        o   Reads in the climate data from file 'in'.
**md  |        o   END and ERR will stop the read loop as an EOF.
**md  |        o   ncols determines how many fields.
**md  |
**mdn Notes  : none
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
**mv  Vars   :
**mvf Files  : in    : Climate file.
**mvi Inputs : ncols : Number of fields in climate file
**mvi |                determines if FOREST-BGC or MTCLIM climate d ata.
**mvo Outputs: dat   : real array- climate data for MTCLIM or FOREST-BGC
**mvo |        ndays : int- number of days in climate file & simulation.
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
**l   locals : i     : loop counter
**l   |        j     : loop counter
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
  
      SUBROUTINE readat(in,dat,ndays,ncols)
      INTEGER in,ndays,ncols
      REAL    dat(370,6)
        integer t
         
  
c     (* Local variables *)
      INTEGER i,j
  
      I = 1
10    READ(in,*,END =100) t, (dat(i,j),j=1,ncols)
      WRITE(80,*) (dat(i,j),j=1,ncols)
      I = I + 1
      GO TO 10
100   ndays = i-1
      RETURN
      END
c     (* end of READAT *)
**md  (* c c c c c c c c c c c c c c c c c c c c c c c c c c c *)
c
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
**mn  Module : outputday( outbgc, x, g, yeard, bino, interv)
**mn  |        INTEGER    outbgc, yeard, interv
**mn  |        LOGICAL    bino
**mn  |        REAL       x(10), g(100)
**me  Example: call outputday( outbgc, x, g, yeard, bino, interv)
**mr  Returns: n/a
**ma  Authors: Joseph C. Coughlan
**ms  System : AUTOSYS
**mv  Version: 2.0
**mf  Filenam: AUIO.FOR
**mhc Created: 12-12-89
**mhm Modify : 1-5-90; 2/17/90-jcc;
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
**md  Descrip:     Module Description
**md  |        o   If print interval is even multiple of yearday then print.
**md  |        o   I/O in binary or ASCII.
**md  |
**mdn Notes  : none
**mdn |        n   Modified output seqence to match Forest-BGC and let QPRO
**mdn |            macros work with the fellow. 2/17/90 -jcc
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
**mv  Vars   :
**mvf Files  : outbgc -binary or ASCII output file for ET.
**mvi Inputs : x      : real array state vars from forest-bgc.
**mvi |        g      : real array intermediate vars from forest-bgc.
**mvi |        yeard  : int     -forest-bgc yearday.
**mvi |        bino  : logical -use binary IO if true.
**mvi |        ave    : ave - pd_lwp average for above freezing days.
**mvi |     total     : # of days above freezing for lwp ave
**mvo Outputs: none
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
**l   Locals : i      : loop counter
**l   |        y      : real yearday value.
**  ( . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
**md  (* c c c c c c c c c c c c c c c c c c c c c c c c c c c *)
c
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
*
      SUBROUTINE outputday(outbgc, x, yeard, counter, bino, interv,
     & summax,summin,sumrad,sumppt,polyg,ave,total, psize)
      INTEGER outbgc, yeard, interv, counter
      LOGICAL bino
      REAL    x(10), summax, summin, sumrad, sumppt, polyg, psize
      REAL    ave, total
  
c     (* local variables *)
      REAL y
      INTEGER i, t(10), round, irad, ippt
c     statement function ROUND
      round(a)=int(a+0.5)
  
      IF (mod(yeard, interv) .EQ. 0) THEN
          DO 10 i= 1,5
              t(i)=round(x(i)/10.0)
10        CONTINUE
          t(6)=x(6)
          t(7)=x(7)
          summax = summax / REAL(interv)
          summin = summin / REAL(interv)
          irad = round(sumrad / REAL(interv))
          ippt = round(sumppt)
          counter=int(polyg)
          IF (bino) THEN
             isummax=round(summax)
             isummin=round(summin)
             WRITE(outbgc) counter*1.0,t(2)*1.0,
     &       t(4)*1.0,t(5)*1.0,t(6)*1.0,t(7)*1.0,
     &       ippt*1.0,ave*1.0,psize*1.0

*             WRITE(outbgc) counter*1.0,yeard*1.0,(1.0*t(i), i = 1, 7),
*     &       isummax*1.0,isummin*1.0,irad*1.0,ippt*1.0,ave*1.0,
*     &       total*1.0,psize*1.0
          ELSE
*             WRITE(outbgc,2) counter,yeard,(t(i), i = 1, 7),
*     &       summax,summin,irad,ippt,ave,round(total), psize
*2            FORMAT(i7,' ', i4,' ', 5(i5,' '), 2(i9,' '), 
*     &       2(f10.1,' '), i9,' ',i5,' ',f10.3,' ',i5, ' ',f15.8)
  
             WRITE(outbgc,2) counter,(t(i), i = 2, 7),
     &       ave, psize
2            FORMAT(i7,' ', 4(i5,' '), 2(i9,' '), 
     &       g10.3,' ', f4.0)

c          WRITE(outbgc,2) counter,yeard,t(2),t(4)+t(5),t(6),ave   
c2         FORMAT(i7,',', i3,',', 1(i4,','), 2(i6,','), 1(f8.4))
          ENDIF

          summax=0.0
          summin=0.0
          sumrad=0.0
          sumppt=0.0
      ENDIF
      RETURN
      END
c     (* end of OUTPUTDAY *)
**md  (* c c c c c c c c c c c c c c c c c c c c c c c c c c c *)
c
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
*
**me  Example: call uniqio(outbgc, x, yeard, counter, bino, interv, summax,
**me  |                    summin,sumrad,sumppt,polyg,ave,total, psize)
**mr  Returns: n/a
**ma  Authors: Joseph C. Coughlan
**ms  System : AUTOSYS
**mv  Version: 2.0
**mf  Filenam: AUIO.FOR
**mhc Created: 7/7/92
**mhm Modify : 7/07/92 -jcc
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
**md  |   created to do specific IO for large data sets that will
**md  |   fill hardisk if all output is speficied.
**md  |   Basicaly, this is a hack of a routine.
**md  Descrip:     Module Description
**md  |        o   made from outputbgc code ( a hack)
**md  |        o   not all paramters are used in code ( but maybe )
**md  |        o   if the uniue time period is met then do I/O
**md  |        o   Output to OUTBGC file so switch off all other I/O.
**md  |        o   I/O ASCII.
**md  |
**mdn Notes  : none
**mdn |        n   Modified output seqence to match Forest-BGC and let QPRO
**mdn |            macros work with the fellow. 2/17/90 -jcc
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
**mv  Vars   :
**mvf Files  : outbgc -binary or ASCII output file for ET.
**mvi Inputs : x      : real array state vars from forest-bgc.
**mvi |        g      : real array intermediate vars from forest-bgc.
**mvi |        yeard  : int     -forest-bgc yearday.
**mvi |        bino  : logical -use binary IO if true.
**mvi |        ave    : ave - pd_lwp average for above freezing days.
**mvo Outputs: none
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
**l   Locals : i      : loop counter
**l   |        y      : real yearday value.
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
C
      SUBROUTINE uniqio(outbgc, x, yeard, counter, bino, interv,
     & summax,summin,sumrad,sumppt,polyg,ave,total, psize)
      INTEGER outbgc, yeard, interv, counter
      LOGICAL bino
      REAL    x(10), summax, summin, sumrad, sumppt, polyg, psize
      REAL    ave, total

c     (* local variables *)
      REAL y
      INTEGER i, t(10), round, irad, ippt
c     statement function ROUND
      round(a)=int(a+0.5)
      IF ((mod(yeard, interv).EQ.0) .or. (mod(yeard,360).eq.0)) THEN
          DO 10 i= 1,5
              t(i)=round(x(i)/10.0)
10        CONTINUE
          t(6)=x(6)
          t(7)=x(7)
          summax = summax / REAL(interv)
          summin = summin / REAL(interv)
          irad = round(sumrad / REAL(interv))
          ippt = round(sumppt)
          counter=int(polyg)
*          WRITE(78,2) counter,yeard,summax,summin,irad,ippt
2         FORMAT(i8,' ',i3,' ',2(f6.1), 2(i7))
          summax=0.0
          summin=0.0
          sumrad=0.0
          sumppt=0.0
      ENDIF
      RETURN
      END
c     (* end of UNIQIO *)
**md  (* c c c c c c c c c c c c c c c c c c c c c c c c c c c *)
c
**md  (* . . . . . . . . . . . . . . . . . . . . . . . . . . . *)
*
c
**md  (* c c c c c c c c c c c c c c c c c c c c c c c c c c c *)
**f   (* ***************************************************** *)
**f   (*       end file  AUIO.FOR                              *)
**f   (* --------------------------------------------------------------- *)
