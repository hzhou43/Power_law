	function ran1(idum,inext,inextp,ma)
C	This code returns a unfirm random number between 0 and 1.  Set
C	idum to a negative value to initialize sequence.
C
	parameter (mbig=1000000000,mseed=161803398,mz=0,fac=1.0/mbig)

	dimension ma(55)

	if (idum .lt. 0) then
	   mj=mseed-iabs(idum)
	   mj=mod(mj,mbig)
	   ma(55)=mj
	   mk=1
	   do i=1,54
	      ii=mod(21*i,55)
	      ma(ii)=mk
	      mk=mj-mk
	      if (mk .lt. mz) mk=mk+mbig
	      mj=ma(ii)
	   enddo
	   do k=1,4
	      do i=1,55
	         ma(i)=ma(i)-ma(1+mod(i+30,55))
	         if (ma(i) .lt. mz) ma(i)=ma(i)+mbig
	      enddo
	   enddo
	   inext=0
	   inextp=31
	   idum=1
	endif

	inext=inext+1
	if (inext .eq. 56) inext=1
	inextp=inextp+1
	if (inextp .eq. 56) inextp=1
	mj=ma(inext)-ma(inextp)
	if (mj .lt. mz) mj=mj+mbig
	ma(inext)=mj
	ran1=mj*fac

	return
	end
