obj = VideoReader('Most_Popular_Programming_Languages_1965_-_2019.mp4');%������Ƶλ��
NOF=obj.NumberOfFrames;% ֡������
mkdir([cd,'/images']);%����Ŀ¼
directory=[cd,'/images/'];
 
for i=1:NOF
    Img_I=read(obj,i); %��ȡ��Ƶ
    imwrite(Img_I,[directory,[num2str(i) '.jpg'];]); %ÿһ֡���һ��jpg
end;

% ��Ϊ����38֡һ���ȣ�ÿ19֡ȡһ֡���ӿ�����ʱ��
% ���Ҳ��ܱ�֤����ȡ������ĳ���ȵ�ͼƬ���ݻ᲻������ص������Թ淶��������������ȫ����ȡ�����ٽ�����һ��������
% i = 1;
% while i<NOF
%     Img_I=read(obj,i); 
%     imwrite(Img_I,[directory,[num2str(i) '.jpg'];]);
%     i = i+19; %�����ǰ���ȡһ֡
% end