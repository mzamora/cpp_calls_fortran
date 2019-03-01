program test_blktri

implicit none

integer, parameter :: n=64
integer, parameter :: m=64
integer, parameter :: k=1676
integer :: ierror,np,mp
real, dimension(n):: an,bn,cn
real, dimension(m):: am,bm,cm
real, dimension(k):: w
real, dimension(m,n):: y  !Right hand size

    ! Setup parameters
    np=0; mp=0;

    ! Define columns to be used
    am(1:m)=1.;
    cm(1:m)=1.;
    bm(1:m)=-am-cm;
    an(1:n)=1.;
    cn(1:n)=1.;
    bn(1:n)=-an-cn;

    ! Right hand side
    y(:,:)=4.;

call blktri(0,np,n,an,bn,cn,mp,m,am,bm,cm,m,y,ierror,w)
write(*,*) 'Error initializing ',ierror
write(*,*) 'w(k)=',w(k)
write(*,*) 'y(1,1)=',y(1,1)
write(*,*) 'y(10,1)=',y(10,1)

call blktri(1,np,n,an,bn,cn,mp,m,am,bm,cm,m,y,ierror,w)
write(*,*) 'Error running ',ierror
write(*,*) 'w(k)=',w(k)
write(*,*) 'y(1,1)=',y(1,1)
write(*,*) 'y(10,1)=',y(10,1)


open (10, file = 'test_fout.csv')
write(10,*) 'ix,iy,f'
do np=1,n
	do mp=1,m
		write(10,*) mp,',',np,',',y(mp,np)
	enddo
enddo
close(10)

end
