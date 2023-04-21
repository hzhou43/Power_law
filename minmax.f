C       Find min and max of numbers generated from a known distribut.
C
        implicit none

        integer NM
        parameter (NM=10000)

        integer NN,Nrepeat

        integer n,nr
        real x,min,max
        real*8 minav,maxav,minsd,maxsd

        read*,NN
        Nrepeat=NM/NN

        minav=0.0D0
        maxav=0.0D0
        minsd=0.0D0
        maxsd=0.0D0
        open (10,file="Data")
        do nr=1,Nrepeat
        
        min=1.0E+10
        max=-1.0
        do n=1,NN
           read(10,*)x
           if (x .lt. min) min=x
           if (x .gt. max) max=x
        enddo
C       print '(E12.6,6X,E12.6)',min,max

        minav=minav+min
        maxav=maxav+max
        minsd=minsd+min**2
        maxsd=maxsd+max**2

        enddo
        close(10)

        minav=minav/dble(Nrepeat)
        maxav=maxav/dble(Nrepeat)
        minsd=(minsd/dble(Nrepeat)-minav**2)**5.0D-1
        maxsd=(maxsd/dble(Nrepeat)-maxav**2)**5.0D-1
C       print*,minav,minsd
        print*,maxav,maxsd

        end

