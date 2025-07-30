      SUBROUTINE julian(IY,IM,ID,JY,JM,JD,julday)
C
C  julian day of jy, jm, jd from iy, im, id
C
      julday = 0
      if ( iy .eq. jy ) then
        if ( im .eq. jm ) then
          julday = jd - id
        else if ( im .lt. jm ) then
          call monthday(iy, im, nday)
          julday = nday - id + jd
          do k = im + 1, jm - 1
            call monthday(iy, k, nday)
            julday = julday + nday
          end do
        else
          call monthday(iy, jm, nday)
          julday = nday - id + jd
          do k = jm + 1, im - 1
            call monthday(iy, k, nday)
            julday = julday + nday
          end do
          julday = -julday
        end if
      else if ( iy .lt. jy ) then
        call monthday(iy, im, nday)
        julday = nday - id
        do k = im + 1, 12
          call monthday(iy, k, nday)
          julday = julday + nday
        end do
        do k = iy + 1, jy - 1
          call yearday(k, nday)
          julday = julday + nday
        end do
        do k = 1, jm -1
          call monthday(jy, k, nday)
          julday = julday + nday
        end do
        julday = julday + jd
      else 
        call monthday(jy, jm, nday)
        julday = nday - jd
        do k = jm + 1, 12
          call monthday(jy, k, nday)
          julday = julday + nday
        end do
        do k = jy + 1, iy - 1
          call yearday(k, nday)
          julday = julday + nday
        end do
        do k = 1, im -1
          call monthday(iy, k, nday)
          julday = julday + nday
        end do
        julday = julday + id
        julday = -julday
      end if
      return
      end
