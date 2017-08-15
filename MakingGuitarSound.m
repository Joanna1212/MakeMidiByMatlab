t = 2; 
fs=44100;
f = 100;
N= round(fs*t); %次数
p = fs/f;
l = ceil(p);
%需要把part重复多少遍
np = floor( N / p ) - 1;%p的数量

r= 0.2; %0.2 变化稍微慢一点，0.8变化很快嗷。

y=zeros(1,N);
part = rand(1,l) - 0.5;
part = part - mean(part); %减去他的平均数，那就使得平均为0，不会过多的分布于横轴上方或下方。
for  i = 1:np
    
    part= part * r + ([part(end),part(1: end - 1)])*( 1 - r );
    pos = floor( (i-1) * p + 1);
    y ( pos : pos + l - 1) = part;
    
end

m=linspace(1,0,length(y));
y = y .* m; %形成一个递减到零的形状。

audiowrite('string.wav',y,fs);

plot(y);