		UH SEA LEVEL CENTER/JOINT ARCHIVE FOR SEA LEVEL
		               'ARCHIVING' FORMAT 
			   FOR DAILY SEA LEVEL DATA

FILE NAME CONVENTION: 
 
INHOUSE METHOD:
          Each file is given a name dsssv.dat where sss denotes the
     the UHSLC/JASL inhouse station number and v denotes the version.
     For example, d003b.dat is the 1987 observed daily data file in 
     the permanent archive for Baltra-B.  Baltra is a station with
     more than one independent series due to a station replacement
     that is not linked to the bench marks of the original station.
     
FORMAT DESCRIPTION:
          A file exists for every independent series of each station.
     Either data or a missing data flag (9999) exists for each day in
     the year, which consists of 31 fixed-length, 80-byte records.  12
     data values exist on each record execpt for the last one of the
     year which will have either 5 or 6 values followed by space-filler
     flags (-9999) to complete the fixed-length record.  Only one header 
     per file is given.
     
          The unique header for each file is coded as:
	  
     
          field          bytes   length             comment
     -----------------  -------  ------  ------------------------------------
     station number        1-3     3     exactly 3 digits
     station version         4     1     letter from A to Z 
     station name         6-23    18     Abbreviated if necessary     
     region/country      25-43    19     Abbreviated if necessary     
     start year          45-48     4
     dash (-)               49     1     for clarity
     end year            50-53     4
     latitude            55-60     6     degrees, minutes, tenths
                                         (implied decimal), and hemisphere
     longitude           62-68     7     degrees, minutes, tenths
                                         (implied decimal), and hemisphere
     decimation method      70     1     Coded as 1 : filtered
                                                  2 : simple average of all
						      hourly values for a day
						  3 : other
     reference offset    72-76     5     constant offset to be added to each
                                         each data value for data to be 
					 relative to tide staff zero or primary
					 datum in same units as data
     reference code         77     1     R = data referenced to datum
                                         X = data not referenced to datum
     units               79-80     2     always millimeters, MM
					 

          The data records are coded as:
	  
          field          bytes   length             comment
     -----------------  -------  ------  ------------------------------------
     station number        1-3     3     exactly 3 digits
     station version         4     1     letter from A to Z 
     station name          6-9     4     Abbreviated if necessary          
     year                11-14     4
     julian day          16-18     3     day count from 1 Jan for 1st data
                                         point of each record
     fixed letter (J)       19     1     for clarity
     sea level data      21-80    60     12 daily values
     
     For example:
     
001A PONAPE             FD ST MICRONESIA    1974-1987 06594N 158138E 1 00000R MM
001A PONA 1985 001J  1201 1202 1202 1201 1205 1203 1201 1200 1199 1232 9999 9999
001A PONA 1985 013J  1220 1210 1201 9999 9999 9999 9999 1212 1210 1209 1207 1203
001A PONA 1985 025J    .                     .                  .
 .    .                .                     .                  .
001A PONA 1985 361J  1230 1229 1228 1222 1223-9999-9999-9999-9999-9999-9999-9999


The following FORTRAN source code can be utilized to convert to a two-column
output (year.fraction data).  The code may need minor modifications, depending
on the compiler.

c..  rqdsday.f      
c..  read in 'Archive" Format  daily sea level data create 
c..  two column format output  time(year)  and height(in millimeter).  
c..  input (infile) : put in input file name             (e.g. d001a.dat) 
c..  output(outfile): internally created from input file (e.g. d001a.out)
c..  execute as e.g. " rqdsday.x d001a.dat "  
c..
      character*50 infile,outfile,name
      character*5  fname
      real*8       t
      dimension    idata(12)

C*** if command line input is not allowed change replace by next 2 statements
      write(6,*) ' put the input file name e.g. d001a.dat '
      read(5,'(a50)') infile

c      iarg=1
c      call getarg(iarg, infile)

c.. opening input file 
      open(unit=15,file=infile)

      read(15,'(a50)') name
 7100 format(a50)
      read(infile, '(a5)') fname
      write(6,' ( a50) ') name
      write(unit=outfile,8000) fname
 8000 format(a5,'.out')
      open(unit=30, file=outfile)
      read(15,7000) jyear     
      write(6,*) 'starting year = ', jyear
      alim=365. 
      if(mod(jyear,4).eq.0) then
         alim=366.
      end if
      back space 15
c.. start reading in daily data one record at a time


 0001 read(15,7000,end=9000) iyear,jl, idata 
 7000 format(10x,i4,1x,i3,2x,12i5)
      if ( iyear .eq. jyear ) then
         jh=jl+11
         if(jh.gt.365) then
            jh=nint(alim)
         end if
         do 10 j=jl,jh
            t=dble(iyear) + dble(j-0.5)/alim
            write(30, *) t, idata(j-jl+1)
 0010    continue
      else 
         jyear = iyear
         alim=365.
         if (mod(jyear,4) .eq. 0) then
            alim=366.
         end if 
         back space 15
      end if
      go to 1
 9000 stop
      end

