close all
clear all
clc
% X=imread('D:\segmentationcodes(26-06-14)\D:\segmentationcodes(26-06-14)\1.pgm');
% figure;imshow(X);
fet=zeros(1,14);
fileList = getAllFiles('D:\Segmentationcodes(26-06-14)\FOR LBP(DATABASE)numbered');
[xx, yy]=size(fileList);
for n=1:2
    X = imread(fileList{n}); 
%         X=imread(file_path,'jpeg');
% for k=1:xx
%     X = imread(fileList{k});  %% first you have to copy paste the getfile function in the Folder
% %     figure;imshow(I);
offsets0=[0,1]; %[0,1]=0,[-1,1]=45,[-1,0]=90,[-1,-1]=135.

GLCM2 = graycomatrix(X,'Offset',offsets0);
stats = GLCM_Features1(GLCM2,0);
Cont=stats.contr; % contrast
Hom=stats.homom; % homogeneity
entr=stats.entro; % entropy
avgr=stats.savgh; %mean
svar=stats.sosvh ;% Sum variance
maxprob=stats.maxpr; % maximum probability
engr=stats.energ; % energy
indvc=stats.idmnc; % inverse difference moment normalized
corrl=stats.corrm ; % Correlation: matlab 
sumentr=stats.senth  % Sum entropy [1] 
dvar=stats.dvarh; % Difference variance [4] 
infrcor=stats.inf1h ; % Information measure of correlation1 [1] 
idmon=stats.indnc; % Inverse difference normalized (INN) [3] 
indifmom=stats.idmnc;

FEATURES=[Cont Hom entr avgr svar maxprob engr indvc corrl sumentr dvar infrcor idmon indifmom];

fet=cat(1,fet,FEATURES);

end
% 
% FEATURES=[Features1 Features2 Features3 Features4 Features5 Features6 Features7 Features8 Features9];

% 
[x,y]=size(fet);
fet=(fet(2:x, 1:y));
%  save('feature324.mat','fet');
% csvwrite('features300itr.csv',fet);
% xlsxwrite('curveletfeatures324',fet);
