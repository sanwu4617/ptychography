function [ x ] = SetBlackWhite( A )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    [m,n]=size(A);
    for i=1:m
        for j=1:n
            if(A(i,j)>=128)
                delta=A(i,j)-255;
                A(i,j)=255;
            else
                delta=A(i,j);
                A(i,j)=0;
            end;
            if(j<n)
                A(i,j+1)=A(i,j+1)+delta*7/16;
            end;
            if(j<n && i<m)
                A(i+1,j+1)=A(i+1,j+1)+delta*1/16;
            end;
            if(i<m)
                A(i+1,j)=A(i+1,j)+delta*5/16;
            end;
            if(i<m && j>1)
                A(i+1,j-1)=A(i+1,j-1)+delta*3/16;
            end;
        end;
    end;
    x=A;
end

