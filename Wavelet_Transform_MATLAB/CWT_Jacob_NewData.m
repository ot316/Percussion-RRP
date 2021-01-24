clc;
clear all;

% ======================================== Read multiple audio files ========================================

AudioData=dir('RRP Final Percussion Recordings');
AudioData([AudioData.isdir]==1)=[];

VarNames = {'Sample', 'Type','Depth','RawData','NormData','SG_Data','fs','Clips'};
VarTypes = {'cellstr','cellstr','cellstr','cell','cell','cell','cell','cell'};
T = table('Size', [0 length(VarNames)],'VariableNames', VarNames, 'VariableTypes', VarTypes);

%% Read the data, filter it, and read into a table  T 

SG_order = 3;
SG_framelen = 41;

for i=1:length(AudioData)-1
    filename=AudioData(i).name;
    filepath=AudioData(i).folder;
    
    [dat,fs_now] = audioread([filepath filesep filename]);
    dat_sg = sgolayfilt(dat,SG_order,SG_framelen);
    
    dat_norm = normalize(dat); 
%     dat_norm = normalize(dat, 'center'); 
%     dat_norm = rescale(dat_norm,-1,1); <---- Plots shifted if scaled.
    
    filename_short=split(filename,'.');
    filename_short=filename_short(1);
    filename_split=split(filename_short,'_');
    
    samp=char(filename_split(1));
    type=char(filename_split(2));
    depth=char(filename_split(3));
    
    newrow={samp(end),type,depth(1:2),dat,dat_norm,dat_sg,fs_now,{}};
    T=[T;newrow];
end

%% Trim continuos data into percussion events by thresholding SG filtered signals
threshold=0.5;
fill_time=0.2;

for i=1:size(T,1)
    sample=T.SG_Data{i};
    sample_norm=T.NormData{i};
    
    idx=find(sample>threshold,length(sample),'first');
    ipts=findchangepts(idx,'Statistic','linear','MaxNumChanges',500);
    peaks=idx(ipts);
    
    for j=1:length(peaks)-1
        clip{j,:}=sample_norm(peaks(j)-fill_time*T.fs{i}:peaks(j+1)-fill_time*T.fs{i});
    end
    samplesz=cellfun(@length,clip,'uni',false);
    min_length(i)=min(cell2mat(samplesz));
    T.Clips(i)={clip};
end

%% Trim percussion events to be the same length
trim_end=min(min_length);
for i=1:size(T,1)
    samples=T.Clips{i};
    for j=1:length(samples)-1
        data=samples{j};
        samples_cut{j,:}=data(1:trim_end);
    end
    T.Clips{i}=samples_cut;
end

%% Compute the average of the clips for each sample

n=min(cell2mat(cellfun(@length,T.Clips,'uni',false)));

for i=1:size(T,1)
    samples=T.Clips{i};
    samp_means(i,:)=mean(horzcat(cell2mat(samples(1:n)')),2);
end

T.ClipMean=samp_means;

%% Wavelet diagrams
tiledlayout(6,5,'TileSpacing','compact')

for i=1:2:29
nexttile
CWTcoeffs_A_avg = cwt(T.ClipMean(i,8000:12000),5:5:1000,'sym10','plot');
[cfs_A,frq_A] = cwt(T.ClipMean(i,8000:12000),fs_now);     %cwt for continuous 1D wavelet transform

colormap jet; 
% h = colorbar;
% set(get(h,'label'),'string','C-Values');

title([T.Sample{i} '-' T.Type{i} '-' T.Depth{i} ],'fontsize',10)
% xlabel('Index','fontsize',14);
% ylabel('Frequency (Hz)','fontsize',14)
% set(gca,'FontSize',14)
set(gca,'YTickLabel',[]);
set(gca,'XTickLabel',[]);
xlabel('')
ylabel('')
end
for i=2:2:30
nexttile
CWTcoeffs_A_avg = cwt(T.ClipMean(i,8000:12000),5:5:1000,'sym10','plot');
[cfs_A,frq_A] = cwt(T.ClipMean(i,8000:12000),fs_now);     %cwt for continuous 1D wavelet transform

colormap jet; 
% h = colorbar;
% set(get(h,'label'),'string','C-Values');

title([T.Sample{i} '-' T.Type{i} '-' T.Depth{i} ],'fontsize',10)
% xlabel('Index','fontsize',14);
% ylabel('Frequency (Hz)','fontsize',14)
% set(gca,'FontSize',14)
set(gca,'YTickLabel',[]);
set(gca,'XTickLabel',[]);
xlabel('')
ylabel('')
end

%% Spectrogram
% figure(1);
% for m = 23
%     [s,w,t,ps,fc,tc] = spectrogram(T.ClipMean(m,:));
%     spectrogram(T.ClipMean(m,:),'yaxis');
% end
% 
%% Plot Check

sample_data=T.Clips{10};
figure
for i=1:length(sample_data)
    plot(sample_data{i});
    hold on
end
hold off
    
    