A=imread('test1.png');
A=rgb2gray(A);
[m,n]=size(A);
two1=uint8([255,255;0,0]);
two2=uint8([255,0;255,0]);
two3=uint8([255,0;0,255]);
two4=uint8([0,255;255,0]);
two5=uint8([0,255;0,255]);
two6=uint8([0,0;255,255]);
ans1=int8(floor(unifrnd(1,7,m,n)));
image1=uint8(zeros(2*m,2*n));
image2=uint8(zeros(2*m,2*n));
for i=1:m
    for j=1:n
        if(A(i,j)>=128)  %±íÊ¾°×É«
            switch ans1(i,j)
            case 1
                image1(2*i-1:2*i,2*j-1:2*j)=two1;
                image2(2*i-1:2*i,2*j-1:2*j)=two1;
            case 2
                image1(2*i-1:2*i,2*j-1:2*j)=two2;
                image2(2*i-1:2*i,2*j-1:2*j)=two2;
            case 3
                image1(2*i-1:2*i,2*j-1:2*j)=two3;
                image2(2*i-1:2*i,2*j-1:2*j)=two3;
            case 4
                image1(2*i-1:2*i,2*j-1:2*j)=two4;
                image2(2*i-1:2*i,2*j-1:2*j)=two4;
            case 5
                image1(2*i-1:2*i,2*j-1:2*j)=two5;
                image2(2*i-1:2*i,2*j-1:2*j)=two5;
            otherwise
                image1(2*i-1:2*i,2*j-1:2*j)=two6;
                image2(2*i-1:2*i,2*j-1:2*j)=two6;
            end;
        else
            switch ans1(i,j)
            case 1
                image1(2*i-1:2*i,2*j-1:2*j)=two1;
                image2(2*i-1:2*i,2*j-1:2*j)=two6;
            case 2
                image1(2*i-1:2*i,2*j-1:2*j)=two2;
                image2(2*i-1:2*i,2*j-1:2*j)=two5;
            case 3
                image1(2*i-1:2*i,2*j-1:2*j)=two3;
                image2(2*i-1:2*i,2*j-1:2*j)=two4;
            case 4
                image1(2*i-1:2*i,2*j-1:2*j)=two4;
                image2(2*i-1:2*i,2*j-1:2*j)=two3;
            case 5
                image1(2*i-1:2*i,2*j-1:2*j)=two5;
                image2(2*i-1:2*i,2*j-1:2*j)=two2;
            otherwise
                image1(2*i-1:2*i,2*j-1:2*j)=two6;
                image2(2*i-1:2*i,2*j-1:2*j)=two1;
            end;
        end;
    end;
end;
imwrite(image1,'bw_image1.png');
imwrite(image2,'bw_image2.png');