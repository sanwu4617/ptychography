key1_image=rgb2gray(imread('a.png'));
key2_image=rgb2gray(imread('b.png'));
cipher_image=rgb2gray(imread('test1.png'));
[m,n]=size(key1_image);
two1=uint8([255,255;0,0]);
two2=uint8([255,0;255,0]);
two3=uint8([255,0;0,255]);
two4=uint8([0,255;255,0]);
two5=uint8([0,255;0,255]);
two6=uint8([0,0;255,255]);
three1=uint8([255,0;0,0]);
three2=uint8([0,255;0,0]);
three3=uint8([0,0;255,0]);
three4=uint8([0,0;0,255]);
ans1=int8(floor(unifrnd(1,5,m,n)));
key1=uint8(zeros(2*m,2*n));
key2=uint8(zeros(2*m,2*n));
key1_image=SetBlackWhite(key1_image);
key2_image=SetBlackWhite(key2_image);
cipher_image=SetBlackWhite(cipher_image);
%imwrite(key1_image,'key1_image1.png');
%imwrite(key2_image,'key2_image1.png');
%imwrite(cipher_image,'cipher_image1.png');
temps=uint8(zeros(m,n));
for i=1:m
    for j=1:n
        temp=key1_image(i,j)/255*4+key2_image(i,j)/255*2+cipher_image(i,j)/255;
        temps(i,j)=temp;
        switch temp
            case 0
                switch ans1(i,j)
                    case 1
                        key1(2*i-1:2*i,2*j-1:2*j)=three1;
                        key2(2*i-1:2*i,2*j-1:2*j)=three3;
                    case 2
                        key1(2*i-1:2*i,2*j-1:2*j)=three2;
                        key2(2*i-1:2*i,2*j-1:2*j)=three4;
                    case 3
                        key1(2*i-1:2*i,2*j-1:2*j)=three3;
                        key2(2*i-1:2*i,2*j-1:2*j)=three1;
                    case 4
                        key1(2*i-1:2*i,2*j-1:2*j)=three4;
                        key2(2*i-1:2*i,2*j-1:2*j)=three2;
                end;
            case 1
                switch ans1(i,j)
                    case 1
                        key1(2*i-1:2*i,2*j-1:2*j)=three1;
                        key2(2*i-1:2*i,2*j-1:2*j)=three1;
                    case 2
                        key1(2*i-1:2*i,2*j-1:2*j)=three2;
                        key2(2*i-1:2*i,2*j-1:2*j)=three2;
                    case 3
                        key1(2*i-1:2*i,2*j-1:2*j)=three3;
                        key2(2*i-1:2*i,2*j-1:2*j)=three3;
                    case 4
                        key1(2*i-1:2*i,2*j-1:2*j)=three4;
                        key2(2*i-1:2*i,2*j-1:2*j)=three4;
                end;
            case 2
                switch ans1(i,j)
                    case 1
                        key1(2*i-1:2*i,2*j-1:2*j)=three1;
                        key2(2*i-1:2*i,2*j-1:2*j)=two4;
                    case 2
                        key1(2*i-1:2*i,2*j-1:2*j)=three2;
                        key2(2*i-1:2*i,2*j-1:2*j)=two2;
                    case 3
                        key1(2*i-1:2*i,2*j-1:2*j)=three3;
                        key2(2*i-1:2*i,2*j-1:2*j)=two3;
                    case 4
                        key1(2*i-1:2*i,2*j-1:2*j)=three4;
                        key2(2*i-1:2*i,2*j-1:2*j)=two1;
                end;
            case 3
                switch ans1(i,j)
                    case 1
                        key1(2*i-1:2*i,2*j-1:2*j)=three1;
                        key2(2*i-1:2*i,2*j-1:2*j)=two1;
                    case 2
                        key1(2*i-1:2*i,2*j-1:2*j)=three2;
                        key2(2*i-1:2*i,2*j-1:2*j)=two5;
                    case 3
                        key1(2*i-1:2*i,2*j-1:2*j)=three3;
                        key2(2*i-1:2*i,2*j-1:2*j)=two6;
                    case 4
                        key1(2*i-1:2*i,2*j-1:2*j)=three4;
                        key2(2*i-1:2*i,2*j-1:2*j)=two3;
                end;
            case 4
                switch ans1(i,j)
                    case 1
                        key1(2*i-1:2*i,2*j-1:2*j)=two4;
                        key2(2*i-1:2*i,2*j-1:2*j)=three1;
                    case 2
                        key1(2*i-1:2*i,2*j-1:2*j)=two6;
                        key2(2*i-1:2*i,2*j-1:2*j)=three2;
                    case 3
                        key1(2*i-1:2*i,2*j-1:2*j)=two5;
                        key2(2*i-1:2*i,2*j-1:2*j)=three3;
                    case 4
                        key1(2*i-1:2*i,2*j-1:2*j)=two2;
                        key2(2*i-1:2*i,2*j-1:2*j)=three4;
                end;
            case 5
                switch ans1(i,j)
                    case 1
                        key1(2*i-1:2*i,2*j-1:2*j)=two1;
                        key2(2*i-1:2*i,2*j-1:2*j)=three1;
                    case 2
                        key1(2*i-1:2*i,2*j-1:2*j)=two4;
                        key2(2*i-1:2*i,2*j-1:2*j)=three2;
                    case 3
                        key1(2*i-1:2*i,2*j-1:2*j)=two6;
                        key2(2*i-1:2*i,2*j-1:2*j)=three3;
                    case 4
                        key1(2*i-1:2*i,2*j-1:2*j)=two3;
                        key2(2*i-1:2*i,2*j-1:2*j)=three4;
                end;
            case 6
                switch ans1(i,j)
                    case 1
                        key1(2*i-1:2*i,2*j-1:2*j)=two1;
                        key2(2*i-1:2*i,2*j-1:2*j)=two6;
                    case 2
                        key1(2*i-1:2*i,2*j-1:2*j)=two2;
                        key2(2*i-1:2*i,2*j-1:2*j)=two5;
                    case 3
                        key1(2*i-1:2*i,2*j-1:2*j)=two3;
                        key2(2*i-1:2*i,2*j-1:2*j)=two4;
                    case 4
                        key1(2*i-1:2*i,2*j-1:2*j)=two4;
                        key2(2*i-1:2*i,2*j-1:2*j)=two3;
                end;
            case 7
                switch ans1(i,j)
                    case 1
                        key1(2*i-1:2*i,2*j-1:2*j)=two1;
                        key2(2*i-1:2*i,2*j-1:2*j)=two2;
                    case 2
                        key1(2*i-1:2*i,2*j-1:2*j)=two2;
                        key2(2*i-1:2*i,2*j-1:2*j)=two3;
                    case 3
                        key1(2*i-1:2*i,2*j-1:2*j)=two5;
                        key2(2*i-1:2*i,2*j-1:2*j)=two4;
                    case 4
                        key1(2*i-1:2*i,2*j-1:2*j)=two6;
                        key2(2*i-1:2*i,2*j-1:2*j)=two5;
                end;
        end;
    end;
end;
imwrite(key1,'key1.png');
imwrite(key2,'key2.png');