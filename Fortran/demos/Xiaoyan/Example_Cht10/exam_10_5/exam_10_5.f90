program exam_10_5

    type node
        integer score
        type(node),pointer:: next
    end type node

    type(node),pointer :: head,Q,P

    integer::score,num=0

    nullify(head) !置head为空指针，即空表

    print *,'输入学生成绩，以-1结束;'
    read *,score

    do while (score/=-1)
        allocate(Q)     !创建一个新结点Q
        Q%score=score   !将成绩赋予结点成绩数据域
        Q%next=>head    !将表头指针赋予Q的next域
        head=>Q         !将指针Q赋予表头指针head
        read *,score    !输入下一个成绩
    enddo

    if(.not.associated(head)) then
        print *,'无效学生成绩数据，删除失败.'
    else
        Q=>head                         !删除不及格学生的成绩
        do while (associated(Q))
            if(Q%score<60 .AND. associated(Q,head)) then
                head=>Q%next            !删除表头结点
                num=num+1
                deallocate(Q)
				Q=>head
                elseif (Q%score<60 .AND. .NOT. associated(Q,head)) then
					P%next=>Q%next      !删除非表头结点
					num=num+1
					deallocate(Q)
					Q=>P%next
                else
                    P=>Q
					Q=>Q%next
                endif
        enddo
    endif

    print "(A,I3)",'不及格学生人数:',num
    write (*,"('及格以上学生成绩有:'\)")

    Q=>head                             !输出链表中的成绩
    do while (associated(Q))
        write (*,"(I5\)") Q.score
        Q=>Q.next
    enddo
    print *

end program exam_10_5