C       Find min and max of random numbers distributed according to
C       power law.
C
        implicit none

        integer NN,Nrepeat
        parameter (Nrepeat=100)

        real a,b,alpha,beta
        parameter (a=1.0,b=100.0,alpha=2.5)

        integer idum,inext,inextp,ma(55)
        real ran1,ran2,x

        integer n,nr
        real min,max
        real*8 minav,maxav,minsd,maxsd

        beta=-alpha+1

        idum=-314
        ran2=ran1(idum,inext,inextp,ma)

        read*,NN

        minav=0.0D0
        maxav=0.0D0
        minsd=0.0D0
        maxsd=0.0D0
        do nr=1,Nrepeat
        
        min=1.0E+10
        max=-1.0
        do n=1,NN
           ran2=ran1(idum,inext,inextp,ma)
           x=(a**beta*(1.0-ran2)+b**beta*ran2)**(1.0/beta)
           if (x .lt. min) min=x
           if (x .gt. max) max=x
        enddo
C       print '(E12.6,6X,E12.6)',min,max

        minav=minav+min
        maxav=maxav+max
        minsd=minsd+min**2
        maxsd=maxsd+max**2

        enddo

        minav=minav/dble(Nrepeat)
        maxav=maxav/dble(Nrepeat)
        minsd=(minsd/dble(Nrepeat)-minav**2)**5.0D-1
        maxsd=(maxsd/dble(Nrepeat)-maxav**2)**5.0D-1
C       print*,minav,minsd
        print*,maxav,maxsd

        end

