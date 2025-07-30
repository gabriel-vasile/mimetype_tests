      subroutine chlml(a,b,mi,na,nb,odiag)
c$$$  subprogram documentation block
c                .      .    .                                       .
c subprogram:    chlml       cholesky factorization routine
c   prgmmr: purser           org: w/nmc20    date: 94-02-10
c
c abstract: obtain cholesky factors of symmetric matrix.
c
c program history log:
c   94-02-10  purser
c
c     call chlml(a,b,mi,na,nb,odiag)
c   input argument list:
c     a        - input matrix
c     mi       - dimension of a
c     na       - leading dimension of a in calling program
c     nb       - leading dimension of b in calling program
c
c   output argument list:
c     b        - output cholesky factor
c     odiag    - .false.--no problems, .true.--non-positive matrix
c
c attributes:
c   language: cft77
c   machine:  cray ymp
c
c$$$
c
           dimension a(na,1),b(nb,1)
           logical omul,odiag
c-----
      odiag=.false.
      do 225 j=1,mi
        jm=j-1
        jp=j+1
        s=a(j,j)
        do 226 k=1,jm
226       s=s-b(j,k)**2
        if(s.lt.0.)then
          write(6,6000)j,s
6000      format(1x,'chlml neg diag:',1x,i5,1x,e12.6)
          s=-s
          odiag=.true.
        endif
        b(j,j)=sqrt(s)
        bjji=1./b(j,j)
        do 227 i=jp,mi
          s=a(i,j)
          do 228 k=1,jm
228         s=s-b(i,k)*b(j,k)
227       b(i,j)=s*bjji
        do 229 i=1,jm
229       b(i,j)=0.
225   continue
      return
      end
