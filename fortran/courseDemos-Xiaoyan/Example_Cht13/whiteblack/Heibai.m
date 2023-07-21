function Heibai()
 
figure(1)
axis([0 12 0 12]);
hold on
axis off
for i = 1:11%??????
    line([1 11],[i i]);
    line([i i],[1 11]);
end
axis equal
drawthego(5.5,5.5,1);
drawthego(5.5,6.5,0);
drawthego(6.5,5.5,0);
drawthego(6.5,6.5,1);%??????????��???
qishou = 1; % ???????????????????????��?��???��??????2?��??????
boardstatus = zeros(10);% ????��??????��????0????????1???��????2????
boardstatus([5 6],[5 6]) = [1 2;2 1];
 
while 1
    hold on
    posflag = 1;  % ?????????????????????��????1???��?????????��??????????
    while posflag
        [xpos,ypos] = ginput(1);
        xpos = 0.5*(floor(xpos)+ceil(xpos));
        ypos = 0.5*(floor(ypos)+ceil(ypos));
        if xpos<=0.5|xpos>=11|ypos<=0.5|ypos>=11% ????????????
            continue
        end        
        rx = floor(xpos);
        ry = floor(ypos);
        if boardstatus(rx,ry)==1|boardstatus(rx,ry)==2%??????????????��?
            continue;
        end
        if ~ischange(boardstatus,rx,ry,qishou)
            continue;
        end
        posflag = 0;
    end
    if qishou==1
        drawthego(xpos,ypos,qishou);
        boardstatus(floor(xpos),floor(ypos))=1;
        qishou = 2;
    else
        drawthego(xpos,ypos,qishou);
        boardstatus(floor(xpos),floor(ypos))=2;
        qishou = 1;
    end
    boardstatus = change(boardstatus,rx,ry,converse(qishou));%?��??????????
    % ????????
    for i = 1:10
        for j = 1:10
            if boardstatus(i,j)~=0
                drawthego(i+0.5,j+0.5,boardstatus(i,j))
            end
        end
    end    
       
    if isempty(find(boardstatus~=0))% ???????��?????????��??
        [n1,m1] = find(boardstatus==1);
        [n2,m2] = find(boardstatus==2);
        count1 = length(n1);
        count2 = length(n2);
        if count1>count2
            msg = ['���????' num2str(count1) ' ??????' num2str(count1) ' ���?��'];
        elseif count1<count2
            msg = ['���????' num2str(count1) ' ??????' num2str(count1) ' ???��'];
        else
            msg = ['���????' num2str(count1) ' ??????' num2str(count1) ' ????'];
        end
        msgbox(msg)
        return
    end
    
    if ~isplay(boardstatus,qishou)%???��??????????????
        if qishou ==1
            msg = '���??????????????��?????????';
        else
            msg = '????????????????��?????????';
        end
        msgbox(msg);
        return;
    end
    
    axis([0 12 0 12]);
    axis equal
end
 
figure(1)
axis([0 10 0 10]);
axis equal
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
function y = converse(x)
if x==1
    y=2;
else
    y=1;
end
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
function drawthego(x,y,flag)
% ??(x,y)??????????��?
% flag??1?��???��??
% flag??0?��??????
t = 0:pi/10:2*pi;
rx = x+0.5*cos(t);
ry = y+0.5*sin(t);
if flag==1
    fill(rx,ry,'w');
else
    fill(rx,ry,'k');
end
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
function w = isplay(board,flag)
 
w = 0;
[n,m] = find(board==0);
for i = 1:length(n)
    if ischange(board,n(i),m(i),flag)
        w = 1;
        return;
    end
end
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
function w = ischange(board,x,y,qishou)
% ?????��?��????????????x,y??????��?????????��???��?????
%???????????��?????��????
 
w = 0;
flag = qishou;% ?��?��????????????
 
% ?��?????��
if x~=10&board(x+1,y)~=0&board(x+1,y)~=flag%????��???????????????????????????????????
    for i = x+2:10
        if board(i,y)==flag
            w=1;
            return;
        elseif board(i,y)==0
            break;
        end
    end
end
 
% ?������???��
if x~=1&board(x-1,y)~=0&board(x-1,y)~=flag%????��?����??????����????????????????????????
    for i = x-2:-1:1
        if board(i,y)==flag
            w=1;
            return;
        elseif board(i,y)==0
            break;
        end
    end
end
 
% ?��?????��
if y~=10&board(x,y+1)~=0&board(x,y+1)~=flag%????��???????????????????????????????????
    for i = y+2:10
        if board(x,i)==flag
            w=1;
            return;
        elseif board(x,i)==0
            break;
        end
    end
end
 
% ?��?????��
if y~=1&board(x,y-1)~=0&board(x,y-1)~=flag%????��???????????????????????????????????
    for i = y-2:-1:1
        if board(x,i)==flag
            w=1;
            return;
        elseif board(x,i)==0
            break;
        end
    end
end
 
% ?��???????��
if x~=10&y~=10&board(x+1,y+1)~=flag&board(x+1,y+1)~=0%????????????????????????????
    for i = 2:10
        if x+i>10|y+i>10
            break;
        end
        if board(x+i,y+i)==flag
            w = 1;
            return;
        elseif board(x+i,y+i)==0
            break;
        end
    end
end
 
% ?������?????��
if x~=1&y~=10&board(x-1,y+1)~=flag&board(x-1,y+1)~=0%����??????????????????????????
    for i = 2:10
        if x-i<0|y+i>10
            break;
        end
        if board(x-i,y+i)==flag
            w = 1;
            return;
        elseif board(x-i,y+i)==0
            break;
        end
    end
end
 
% ?������?????��
if x~=1&y~=1&board(x-1,y-1)~=flag&board(x-1,y-1)~=0%����??????????????????????????
    for i = 2:10
        if x-i<=0|y-i<=0
            break;
        end
        if board(x-i,y-i)==flag
            w = 1;
            return;
        elseif board(x-i,y-i)==0
            break;
        end
    end
end
 
% ?��???????��
if x~=10&y~=1&board(x+1,y-1)~=flag&board(x+1,y-1)~=0%����??????????????????????????
    for i = 2:10
        if x+i>10|y-i<=0
            break;
        end
        if board(x+i,y-i)==flag
            w = 1;
            return;
        elseif board(x+i,y-i)==0
            break;
        end
    end
end
 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
function w = change(board,x,y,qishou)  % ?��??????????
 
flag = qishou;% ?��?��????????????
 
% ?��?????��
if x~=10&board(x+1,y)~=0&board(x+1,y)~=flag%????��???????????????????????????????????
    row = board(x:10,y);
    con = length(find(row==flag));
    if con>=2
        for i = x+1:10
            if board(i,y)==flag
                break;
            elseif board(i,y)==0
                break;
            end
            board(i,y)=flag;
        end
    end
end
 
% ?������???��
if x~=1&board(x-1,y)~=0&board(x-1,y)~=flag%????��?����??????����????????????????????????
    row = board(1:x,y);
    con = length(find(row==flag));
    if con>=2
        for i = x-1:-1:1
            if board(i,y)==flag
                break;
            elseif board(i,y)==0
                break;
            end
            board(i,y)=flag;
        end
    end
end
 
% ?��?????��
if y~=10&board(x,y+1)~=0&board(x,y+1)~=flag%????��???????????????????????????????????
    col = board(x,y:10);
    con = length(find(col==flag));
    if con>=2
        for i = y+1:10
            if board(x,i)==flag
                break;
            elseif board(x,i)==0
                break;
            end
            board(x,i) = flag;
        end
    end
end
 
% ?��?????��
if y~=1&board(x,y-1)~=0&board(x,y-1)~=flag%????��???????????????????????????????????
    col = board(x,1:y);
    con = length(find(col==flag));
    if con>=2
        for i = y-1:-1:1
            if board(x,i)==flag
                break;
            elseif board(x,i)==0
                break;
            end
            board(x,i)=flag;
        end
    end
end
 
% ?��???????��
if x~=10&y~=10&board(x+1,y+1)~=flag&board(x+1,y+1)~=0%????????????????????????????
    con = 0;
    for i = 0:10
        if x+i>10|y+i>10
            break;
        end
        if board(x+i,y+i)==flag
            con = con+1;
        end
    end
    if con>=2
        for i = 1:10
            if x+i>10|y+i>10
                break;
            end
            if board(x+i,y+i)==flag
                break;
            elseif board(x+i,y+i)==0
                break;
            end
            board(x+i,y+i)=flag;
        end
    end
end
 
% ?������?????��
if x~=1&y~=10&board(x-1,y+1)~=flag&board(x-1,y+1)~=0%����??????????????????????????
    con = 0;
    for i = 0:10
        if x-i<=0|y+i>10
            break;
        end
        if board(x-i,y+i)==flag
            con = con+1;
        end
    end
    if con>=2
        for i = 1:10
            if x-i<0|y+i>10
                break;
            end
            if board(x-i,y+i)==flag
                break;
            elseif board(x-i,y+i)==0
                break;
            end
            board(x-i,y+i)=flag;
        end
    end
end
 
% ?������?????��
if x~=1&y~=1&board(x-1,y-1)~=flag&board(x-1,y-1)~=0%����??????????????????????????
    con = 0;
    for i = 0:10
        if x-i<=0|y-i<=0
            break;
        end
        if board(x-i,y-i)==flag
            con=con+1;
        end
    end
    if con>=2
        for i = 1:10
            if x-i<=0|y-i<=0
                break;
            end
            if board(x-i,y-i)==flag
                break;
            elseif board(x-i,y-i)==0
                break;
            end
            board(x-i,y-i)=flag;
        end
    end
end
 
% ?��???????��
if x~=10&y~=1&board(x+1,y-1)~=flag&board(x+1,y-1)~=0%����??????????????????????????
    con = 0;
    for i = 0:10
        if x+i>10|y-i<=0
            break;
        end
        if board(x+i,y-i)==flag
            con = con+1;
        end
    end
    if con>=2
        for i = 1:10
            if x+i>10|y-i<=0
                break;
            end
            if board(x+i,y-i)==flag
                break;
            elseif board(x+i,y-i)==0
                break;
            end
            board(x+i,y-i)=flag;
        end
    end
end
w = board;
