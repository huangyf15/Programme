module course_type

implicit none

type course
	character(9)  name           
    integer(4)    credit
    real(4) ::    score = 0.0    ! »± °≥ı ºªØ
end type

end module