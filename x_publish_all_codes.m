%% get all file names in the target folder
dirflist=dir; 

%% Data structure transformation
% matlab struct data (obtained list data by "dir" command) to single list as cell that only contains file names

rfields = fieldnames(dirflist); keyST=cell(size(rfields)); keyST(:,:)={'name'};
keynum=cell2mat(cellfun(@(x1,x2) ~contains(x1,x2), rfields, keyST,'UniformOutput',false)); 
% if you have past version of matlab or compatible software, you can use
% "isempty" function instead such as:
% keynum=cell2mat(cellfun(@(x1,x2) isempty(strfind(x1,x2)), rfields, keyST,'UniformOutput',false));
flist=struct2cell(rmfield(dirflist,rfields(keynum))); 

%% Purification of target data
% extract matlab running codes denoted as ".m" file and remove similar file
% like ".mat" (matlab data file) and then remove other codes such as codes to publish. 
% (an endless loop will be happing if the program requests to publish a code including "publish" inside)

keyST=cell(size(flist)); keyRemove=keyST; keyST(:,:)={'.m'}; keyRemove(:,:)={[".mat","x_"]};
keynum=cell2mat(cellfun(@(x1,x2,x3) contains(x1,x2)&~contains(x1,x3), flist, keyST,keyRemove,'UniformOutput',false));
flist2=flist(keynum);

%% Publication of all matlab running codes
% run "publish" for making html and pdf files to explain individual matlab program 

for i=1:length(flist2)
    disp(i);
    getTag=strsplit(flist2{i},'.');
    this_file_tag=getTag{1};
    x_publish_all_codes_sub;
end

