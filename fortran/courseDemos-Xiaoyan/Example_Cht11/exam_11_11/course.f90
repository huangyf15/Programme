module course_type

implicit none

type course
	character(9)  name           
    integer(4)    credit
    real(4) ::    score = 0.0    ! ȱʡ��ʼ��
end type

end module