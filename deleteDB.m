function [  ] = deleteDB(  )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
clc;
if (exist('currency_db.mat')==2)
    button = questdlg('Do you really want to remove the Database?');
    if strcmp(button,'Yes')
        delete('currency_db.mat');
        msgbox('Database was succesfully removed from the current directory.','Database removed','help');
    end
else
    warndlg('Database is empty.',' Warning ')
end

end

