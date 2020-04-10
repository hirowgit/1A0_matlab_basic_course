% this_file_tag='lec1_step1';

%% publish individual codes and thier results
suffST={'m','html','pdf','latex','xml','doc','ppt'}; typeST={'MATLAB','HTML','PDF','LaTeX','XML','Microsoft Word','Microsoft PowerPoint'}; 
 
try    
    f_name(1:length(suffST))={this_file_tag};
    f_name2=cellfun(@(s1,s2) [s1,'.',s2],f_name,suffST,'UniformOutput',false);
    currT=clock; date_stamp=sprintf("%d/%d/%d",currT(1:3)); 
catch
    disp('Please do not delete the first line with "this_file_tag" ')
end

if ~exist(this_file_tag,'dir'); mkdir(this_file_tag); end
for i=2:length(suffST)   % (For doc and ppt error may happen in publish in some platform like mac) 
    try
        publish(f_name2{1},'format',suffST{i},'outputDir',this_file_tag);
        fprintf('successfully published as %s files ! See in folder "%s".\r\n',typeST{i},this_file_tag);
    catch
        fprintf('sfailed to publish into %s files ...\r\n',typeST{i});
    end

end
web([this_file_tag,'/',f_name2{2}]);
%%
