C Copyright(c) 1997, Space Science and Engineering Center, UW-Madison
C Refer to "McIDAS Software Acquisition and Distribution Policies"
C in the file  mcidas/data/license.txt

C *** $Id: m0fhrnge.f,v 1.5 1998/04/01 16:38:04 billl Rel $ ***

C 1 MCFHRNGE.FOR 18-Sep-95,12:53:30,`SUEG' initial release (5671)
C 2 MCFHRNGE.FOR 26-Sep-95,13:43:10,`SCOTTL' Minor bugfix in target yyddd,hms
C 3 MCFHRNGE.FOR 20-Oct-95,16:47:42,`USER' Released

*| Name:
*|      m0fhrnge - given a Julian day, time and grid header, determine
*|		   whether the valid time of the grid corresponds
*|		   to the given Julian day and time
*|
*| Interface:
*|      integer function
*|      m0fhrnge(integer header, integer targyd, integer targhs)
*|
*| Input:
*|      header - grid header
*|      targyd - Julian day to check whether vt of grid matches
*|      targhs - time to check whether vt of grid matches
*|
*| Input and Output:
*|      none
*|
*| Output:
*|      none
*|
*| Return values:
*|      1 - grid does contain valid time equivalent to targyd/targhs
*|      0 - grid does not contain valid time equivalent to targyd/targhs
*|     -1 - invalid julian day or time
*|     -2 - error occurred
*|
*| Remarks:
*|      This routine determines whether a grid contains data that is
*|      valid at a particular day, or time, or day and time.  The
*|	legality of the input is checked prior to the function call.
*|
*| Categories:
*|      grid

        integer FUNCTION m0fhrnge(header, targyd, targhs)
        implicit none
        integer header(64)              ! grid header
        integer targyd                  ! target julian day
        integer targhs                  ! target time

C --- external functions

        integer mccydtoiyd      ! convert ccyyddd to yyyddd
        integer mcdaytimetosec  ! convert day,time to secs since 1/1/70
        integer mciydtocyd      ! convert yyyddd to ccyyddd
        integer mcsectodaytime  ! convert secs since 1/1/70 to day,time
        integer sksecs          ! external absolute time computation function

C --- local variables

        integer elapse                  ! elapse time of grid
        integer ghhmmss                 ! hhmmss of grid
        integer gyyddd                  ! julian day of grid
        integer ifun                    ! return from function calls
        integer isec                    ! return from mcdaytimetosec
        integer nhhmmss                 ! hhmmss of ghhmmss + elapse
        integer nyyddd                  ! yearday of gyyddd + elapse
        integer temp_nyyddd             ! intermediate value of nyyddd

        if (targyd .lt. 0 .and. targhs  .lt. 0)  then
          m0fhrnge = -1
          return
        endif

C-------pick up elapse time from grid, and julian day and HHMMSS from grid

        elapse = header(6)
        ifun   = mciydtocyd(header(4),gyyddd)
        ghhmmss = header(5)

C-------use mcdaytimetosec to compute time between 00:00:00 on 1970001 
C                and hhmmss on gyyddd

        ifun = mcdaytimetosec(gyyddd,ghhmmss,isec)
        if (ifun.lt.0) then
           m0fhrnge=-2
           return
        endif

C-------add the elapse time to isec to get the new # seconds past 1972
C          elapse is stored as a number of hours (12 = 12 hour forecast)

        isec = isec + elapse*3600

C-------the call to mcsectodaytime will convert the seconds to a julian
C        day and an hhmmss format

        ifun=mcsectodaytime(isec, temp_nyyddd, nhhmmss)

C-------Change nyyddd to yyy format so the input targyd can be compared
C       with it.

        ifun=mccydtoiyd(temp_nyyddd,nyyddd)

C-------check to see if the target date/time are the same as the date/time
C        computed

        if ( ( nyyddd  .eq.  targyd  .and.  nhhmmss.eq.targhs ) .or.
     &       ( nyyddd  .eq.  targyd  .and.  targhs .eq. -1 ) .or.
     &       ( targyd  .eq.  -1  .and.  nhhmmss.eq.targhs ) ) then
          m0fhrnge = 1
        else
          m0fhrnge = 0
        endif

        return
        end
