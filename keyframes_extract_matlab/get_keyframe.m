%ͼƬ���ϵ��������������ͼ������ϵ������������ͼ��֡�������ԡ�
 
%ͼ������
NOF=8457;

mkdir([cd,'/keyframes_images']);%����Ŀ¼

directory1=[cd,'\images\']; % ����ͼ���ļ���
directory2=[cd,'\keyframes_images\']; % ���ͼ���ļ���
 
img_path_list = dir(strcat(directory1,'*.jpg'));%��ȡ���ļ���������jpg��ʽ��ͼ��
 
for i=1:NOF-1
    image_name_i = strcat(num2str(i),'.jpg'); %ͼ����
    img_i = imread(strcat(file_path,image_name_i)); %��ȡ��ͼ��
    img_i_cut = imcrop(img_i,[800 550 500 150]); %��ȡͼ��
    image_name_i_plus = strcat(num2str(i+1),'.jpg');% ��һ��ͼ����
    img_i_plus = imread(strcat(file_path,image_name_i_plus)); %��ȡ��һ��ͼ��
    img_i_plus_cut = imcrop(img_i_plus,[800 550 500 150]); %��ȡͼ��
    img_sim(i)=corr2(img_i_cut(:,:,1),img_i_plus_cut(:,:,1))+corr2(img_i_cut(:,:,2),img_i_plus_cut(:,:,2))+corr2(img_i_cut(:,:,3),img_i_plus_cut(:,:,3)); %����ǰ������ͼ������ƶ�
    img_sim(i)=img_sim(i)/3;
end

disp(['img_sim end']);

Threshold=0.98; %���ƶ���ֵ
 
disp(['print begin']);
for i=1:length(img_sim)
    if img_sim(i)<Threshold
        disp(i);
        Img_I=imread([directory1,[num2str(i) '.jpg'];]);
        imwrite(Img_I,[directory2,[num2str(i) '.jpg'];]); %���ؼ�֡ͼƬ����һ���ļ�����
    end
end
disp(['print end']);