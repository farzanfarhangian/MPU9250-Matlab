% Developed by Farzan Farhangian
instrreset()
s = serial("COM3");  % you should add your serial port
set(s,'BaudRate',115200); % add your baudrate
Tmax=5; % add the time you want to recorc the data in seconds
tic;
f=[];
fopen(s);
t=[];  tt=-0.01;
% time
while toc<Tmax
    out = fgetl(s);
    tt=tt+0.01;
    t=[t;tt];
    fprintf('%s\n',out);
f=[f, str2num(out)];
end
fclose(s);
% recording
freq=zeros(length(f)/10,1);
accel=zeros(length(f)/10,3);
gyro=zeros(length(f)/10,3);
magno=zeros(length(f)/10,3);
j=0;
% saving
for i=1:length(f)/10
    freq(i,:)=f(i+j);
    accel(i,:)=f(i+j+1:i+j+3);
    gyro(i,:)=f(i+j+4:i+j+6);
    magno(i,:)=f(i+j+7:i+j+9);
    j=j+9;
end

