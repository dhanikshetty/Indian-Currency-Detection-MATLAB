function [  ] = getDBInfo(  )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
clc;
if (exist('currency_db.mat')==2)
    load('currency_db.mat','-mat');
    msgbox('Database is not empty','Database result','help');
else
    msgbox('Database is empty.','Database result','help');
end

end

