
%end_goal variable will be used later
prompt = 'Input the file you are looking for: ';
end_goal = input(prompt, 's');

%User inputs the ID's whose 0001.pos files need to be found.
next_iter = true;
ID_list = cell(1, 1);
ctr = 1;
while(next_iter)
    prompt2 = 'Input subject'' ID number. Enter ''done'' when finished: ';
    param = input(prompt2, 's');
    
    if(strcmpi('done', param))
        next_iter = false; 
    else 
        ID_list(ctr,:) = cellstr(param);
        ctr = ctr + 1;
    end
end
% display(ID_list);

%Compiles list of files that the folders of ID subjects contains.
fileList = cell(1, 1);
for ee=1: size(ID_list,1)
    dir = ID_list{ee,:};
    to_Add = getAllFiles(dir);
    fileList = vertcat(fileList, to_Add);
end

% display(fileList);

%Searches folders for the 0001.pos files. Culled is the list that contains
%all pos files.
ctr = 1;
culled = cell(1, 1);
for ii=1: size(fileList, 1);
    check_name = fileList{ii, :};
%     display(check_name);
    ID = ID_list{ee,:};
%     display(ID);
    temp = strfind(check_name, end_goal); 
%     display(temp);

    %check = temp(1, 1);
    if ~isempty(temp);
%         display('here');
        culled{ctr, :} = check_name;
%         display(culled);
        ctr = ctr + 1;
    end
end

%appends 'data\' to all paths of value
for xx=1: size(culled, 1)
    temp = strcat('data\', culled{xx,:});
    culled{xx,:} = temp;
%     strcat('data\', culled);
end

display(culled);


