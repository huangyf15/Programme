program exam_10_5

    type node
        integer score
        type(node),pointer:: next
    end type node

    type(node),pointer :: head,Q,P

    integer::score,num=0

    nullify(head) !��headΪ��ָ�룬���ձ�

    print *,'����ѧ���ɼ�����-1����;'
    read *,score

    do while (score/=-1)
        allocate(Q)     !����һ���½��Q
        Q%score=score   !���ɼ�������ɼ�������
        Q%next=>head    !����ͷָ�븳��Q��next��
        head=>Q         !��ָ��Q�����ͷָ��head
        read *,score    !������һ���ɼ�
    enddo

    if(.not.associated(head)) then
        print *,'��Чѧ���ɼ����ݣ�ɾ��ʧ��.'
    else
        Q=>head                         !ɾ��������ѧ���ĳɼ�
        do while (associated(Q))
            if(Q%score<60 .AND. associated(Q,head)) then
                head=>Q%next            !ɾ����ͷ���
                num=num+1
                deallocate(Q)
				Q=>head
                elseif (Q%score<60 .AND. .NOT. associated(Q,head)) then
					P%next=>Q%next      !ɾ���Ǳ�ͷ���
					num=num+1
					deallocate(Q)
					Q=>P%next
                else
                    P=>Q
					Q=>Q%next
                endif
        enddo
    endif

    print "(A,I3)",'������ѧ������:',num
    write (*,"('��������ѧ���ɼ���:'\)")

    Q=>head                             !��������еĳɼ�
    do while (associated(Q))
        write (*,"(I5\)") Q.score
        Q=>Q.next
    enddo
    print *

end program exam_10_5