t = 2; 
fs=44100;
f = 100;
N= round(fs*t); %����
p = fs/f;
l = ceil(p);
%��Ҫ��part�ظ����ٱ�
np = floor( N / p ) - 1;%p������

r= 0.2; %0.2 �仯��΢��һ�㣬0.8�仯�ܿ�໡�

y=zeros(1,N);
part = rand(1,l) - 0.5;
part = part - mean(part); %��ȥ����ƽ�������Ǿ�ʹ��ƽ��Ϊ0���������ķֲ��ں����Ϸ����·���
for  i = 1:np
    
    part= part * r + ([part(end),part(1: end - 1)])*( 1 - r );
    pos = floor( (i-1) * p + 1);
    y ( pos : pos + l - 1) = part;
    
end

m=linspace(1,0,length(y));
y = y .* m; %�γ�һ���ݼ��������״��

audiowrite('string.wav',y,fs);

plot(y);