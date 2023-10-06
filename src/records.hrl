%% Records
%%
%% Tuples in desguise so they have same storage and perf characteristics
%% as tuples.
%% 
%% Records should be use in the following cases:
%% - When you can represent your date using a fixed number of predetermined atoms
%% - When the number of elements in the record and the names of the elements
%%   will not change in time.
%% - When storage is an issue, typically when you have a large array of tuples
%%   and each tuple has the same structure.

-record(todo, {status=reminder, who=charlie, text}).