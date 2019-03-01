module add

use iso_c_binding, only: c_double, c_int

contains

subroutine add1(n1,n2,A) bind(c)

	integer(c_int), intent(in):: n1,n2
	real(c_double), intent(inout):: A(n1*n2)

	A(3)=A(3)+1
    write(*,*) "[add1_1D.f90] n1=", n1
    write(*,*) "[add1_1D.f90] A=",A
    return
	
end subroutine add1

end module
