      subroutine yearday (iy, nday)
*
c compute number of days of year iy
*
      nday = 365
      if (mod(iy,4) .eq. 0) nday = 366
      return
      end
