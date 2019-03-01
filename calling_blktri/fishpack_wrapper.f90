! Wrapper inspired in ../src_rrtmg/rrtmg_lw_wrapper.f90
! which was imported from PyCLES
! Add approppriate copyrights

module fishpack_wrapper

use iso_c_binding, only: c_double, c_int
! USE fish
implicit none

contains

subroutine c_blktri &
            (iflg, np, n, an, bn, cn, mp, &
             m, am, bm, cm, idimy, y, &
             ierror,w,k) bind(c,name="c_blktri")
      integer(c_int), intent(in):: iflg       ! initialization flag
                                              ! 0: initialization only. work array w
                                              ! 1: initialized quantities used to solve x
      integer(c_int), intent(in):: np         ! 0: if an(1) and cn(n) are not zero: periodic BCs
                                              ! 1: if an(1) and cn(n) are zero
      integer(c_int), intent(in):: n          ! number of unknowns in the j direction
      real(c_double), intent(in):: an(n)      ! arrays of length n ~ coefficients
      real(c_double), intent(in):: bn(n)
      real(c_double), intent(in):: cn(n)
      integer(c_int), intent(in):: mp         ! 0: if an(1) and cn(n) are not zero: periodic BCs
                                              ! 1: if an(1) and cn(n) are zero
      integer(c_int), intent(in):: m          ! number of unknowns in the i direction
      real(c_double), intent(in):: am(m)      ! arrays of length m ~ coefficients
      real(c_double), intent(in):: bm(m)
      real(c_double), intent(in):: cm(m)
      integer(c_int), intent(in):: idimy      ! row dimension of the 2d array Y, at least m
      real(c_double), intent(inout):: y(m,n)  ! in: 2D array for the right hand side
                                              ! out: solution X
      integer(c_int), intent(in) ::k
      real(c_double), intent(inout):: w(k)    ! IF NP=1 DEFINE K=INT(LOG2(N))+1 AND
                                              ! SET L=2**(K+1) THEN W MUST HAVE DIMENSION
                                              ! (K-2)*L+K+5+MAX(2N,6M)
      ! TYPE (fishworkspace), SAVE :: W
      integer(c_int), intent(inout):: ierror     ! error flag
                                              ! 0  NO ERROR.
                                              ! 1  M IS LESS THAN 5
                                              ! 2  N IS LESS THAN 5
                                              ! 3  IDIMY IS LESS THAN M.
                                              ! 4  BLKTRI FAILED WHILE COMPUTING RESULTS
                                              !    THAT DEPEND ON THE COEFFICIENT ARRAYS
                                              !    AN, BN, CN.  CHECK THESE ARRAYS.
                                              ! 5  AN(J)*CN(J-1) IS LESS THAN 0 FOR SOME J.
    integer :: j, kk, ii
    !PRINT *, "n = ", n, " m = ", m, " idimy = ", idimy

    call blktri &
            (iflg, np, n, an, bn, cn, mp, &
             m, am, bm, cm, idimy, y, &
             ierror, w)

    PRINT *, "In Fortran, w(k)=", w(k)
    PRINT *, "In Fortran, y(1,1)=", y(1,1)
    PRINT *, "In Fortran, y(10,1)=", y(10,1)
    PRINT *, "In Fortran, ", ierror
!    if (iflg .eq. 1) then
!        DO kk=1,n ! x Direction
            ! PRINT *, "In Fortran, i at ", kk, " : ", an(kk), bn(kk), cn(kk)
            ! PRINT *, "m: ", am(kk), bm(kk), cm(kk)
!           DO ii=1,m ! Z Direction
              !PRINT *, "In Fortran, y at ", kk, " and ", ii, " : ", y(ii,kk)
!           ENDDO
!        ENDDO
!    end if
    ! PRINT *, 'After: ', y
end subroutine c_blktri

end module
