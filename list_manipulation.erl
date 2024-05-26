-module(list_manipulation).
-export([reverse/1, list_length/1, is_palindrome/1, test/0]).

%% Reverses the  list.
reverse(List) when is_list(List) ->
    lists:reverse(List);
reverse(_) ->
    throw({error, not_a_list}).

%% Finds length of list.
list_length(List) when is_list(List) ->
    erlang:length(List);
list_length(_) ->
    throw({error, not_a_list}).

%% Checks if list is a palindrome.
is_palindrome(List) when is_list(List) ->
    List == lists:reverse(List);
is_palindrome(_) ->
    throw({error, not_a_list}).

%% Test function to demonstrate the functionality and exception handling.
test() ->
    try
        io:format("Reversed list: ~p~n", [reverse([1, 2, 3, 4, 8, 6, 9, 20])]),
        io:format("Length of list: ~p~n", [list_length([1, 2, 3, 4, 5, 6, 8, 9, 10])]),
        io:format("Is palindrome: ~p~n", [is_palindrome([1, 2, 1])]),
        
        %% Intentionally causing an exception
        reverse(not_a_list)
    catch
        throw:{error, not_a_list} ->
            io:format("Caught exception: Input is not a list~n")
    end,

    try
        %% Another intentional exception
        list_length(123)
    catch
        throw:{error, not_a_list} ->
            io:format("Caught exception: Input is not a list~n")
    end,

    try
        %% Another intentional exception
        is_palindrome("string")
    catch
        throw:{error, not_a_list} ->
            io:format("Caught exception: Input is not a list~n")
    end,

    ok.

%     erlc list_manipulation.erl
% erl -noshell -s list_manipulation test -s init stop