A=imread('test3.png');
A=uint16(A);
[m,n,p]=size(A);
two1=uint8([255,255;0,0]);
two2=uint8([255,0;255,0]);
two3=uint8([255,0;0,255]);
two4=uint8([0,255;255,0]);
two5=uint8([0,255;0,255]);
two6=uint8([0,0;255,255]);
ans1=int8(floor(unifrnd(1,7,m,n,3)));
image1=uint8(zeros(2*m,2*n,3));
image2=uint8(zeros(2*m,2*n,3));
for i=1:m
    for j=1:n
        for k=1:3
            if(A(i,j,k)>=128)
                delta=A(i,j,k)-255;
                A(i,j,k)=255;
            else
                delta=A(i,j,k);
                A(i,j,k)=0;
            end;
            if(j<n)
                A(i,j+1,k)=A(i,j+1,k)+delta*7/16;
            end;
            if(j<n && i<m)
                A(i+1,j+1,k)=A(i+1,j+1,k)+delta*1/16;
            end;
            if(i<m)
                A(i+1,j,k)=A(i+1,j,k)+delta*5/16;
            end;
            if(i<m && j>1)
                A(i+1,j-1,k)=A(i+1,j-1,k)+delta*3/16;
            end;
        end;
    end;
end;
imwrite(uint8(A),'test3_1.png');
for i=1:m
    for j=1:n
        for k=1:3
            if(A(i,j,k)<128)  %表示浅色
                switch ans1(i,j,k)
                case 1
                    image1(2*i-1:2*i,2*j-1:2*j,k)=two1;
                    image2(2*i-1:2*i,2*j-1:2*j,k)=two1;
                case 2
                    image1(2*i-1:2*i,2*j-1:2*j,k)=two2;
                    image2(2*i-1:2*i,2*j-1:2*j,k)=two2;
                case 3
                    image1(2*i-1:2*i,2*j-1:2*j,k)=two3;
                    image2(2*i-1:2*i,2*j-1:2*j,k)=two3;
                case 4
                    image1(2*i-1:2*i,2*j-1:2*j,k)=two4;
                    image2(2*i-1:2*i,2*j-1:2*j,k)=two4;
                case 5
                    image1(2*i-1:2*i,2*j-1:2*j,k)=two5;
                    image2(2*i-1:2*i,2*j-1:2*j,k)=two5;
                otherwise
                    image1(2*i-1:2*i,2*j-1:2*j,k)=two6;
                    image2(2*i-1:2*i,2*j-1:2*j,k)=two6;
                end;
            else
                switch ans1(i,j,k)
                case 1
                    image1(2*i-1:2*i,2*j-1:2*j,k)=two1;
                    image2(2*i-1:2*i,2*j-1:2*j,k)=two6;
                case 2
                    image1(2*i-1:2*i,2*j-1:2*j,k)=two2;
                    image2(2*i-1:2*i,2*j-1:2*j,k)=two5;
                case 3
                    image1(2*i-1:2*i,2*j-1:2*j,k)=two3;
                    image2(2*i-1:2*i,2*j-1:2*j,k)=two4;
                case 4
                    image1(2*i-1:2*i,2*j-1:2*j,k)=two4;
                    image2(2*i-1:2*i,2*j-1:2*j,k)=two3;
                case 5
                    image1(2*i-1:2*i,2*j-1:2*j,k)=two5;
                    image2(2*i-1:2*i,2*j-1:2*j,k)=two2;
                otherwise
                    image1(2*i-1:2*i,2*j-1:2*j,k)=two6;
                    image2(2*i-1:2*i,2*j-1:2*j,k)=two1;
                end;
            end;
        end;
    end;
end;
imwrite(image1,'color_image1.png');
imwrite(image2,'color_image2.png');
%下面合成图像
image1=uint16(image1);
image2=uint16(image2);
image_overlie=uint8(zeros(2*m,2*n,3));
image_compose=uint8(zeros(m,n,3));
for i=1:2*m
    for j=1:2*n
        for k=1:3
            image_overlie(i,j,k)=image1(i,j,k)+image2(i,j,k);
        end;
    end;
end;
for i=1:m
    for j=1:n
        for k=1:3
            a=uint16(image_overlie(2*i-1,2*j-1,k))+uint16(image_overlie(2*i-1,2*j,k))+ ...
                uint16(image_overlie(2*i,2*j-1,k))+uint16(image_overlie(2*i,2*j,k));
            if(a<512)   %注意：图像叠加时，
                image_compose(i,j,k)=0;
            else
                image_compose(i,j,k)=255;
            end;
        end;
    end;
end;
imwrite(image_overlie,'image_overlie.png');
imwrite(image_compose,'image_compose.png');