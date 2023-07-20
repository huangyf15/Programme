!====================================
! 打印数组元素
!====================================
subroutine external_list(x, y)
implicit none
integer(4), intent(in):: x(:,:)
real(4), intent(in)::    y(:)
integer(4) i, j

print *
print *, '--- External list ---'
print *, 'x: '
do i = 1, ubound(x,1)
   print *, (x(i,j), j = 1, ubound(x,2))
enddo

print *, 'y: ', y

end
