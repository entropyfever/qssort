%% empty_queue(-Queue)
% make an empty queue
empty_queue(queue(0, Q, Q)).

%% queue_head(?Queue, ?Head, ?Queue0)
% Queue, with Head removed, is Queue0
queue_head(queue(s(X), [H|Q], Q0), H, queue(X, Q, Q0)).

%% queue_last(+Queue0, +Last, -Queue)
% Queue0, with Last at its back, is Queue
queue_last(queue(X, Q, [L|Q0]), L, queue(s(X), Q, Q0)).


create_queue_from_list([], Q) :- empty_queue(Q).
create_queue_from_list([H|T], Q) :- create_queue_from_list(T, Q_), queue_head(Q, H, Q_).

empty([]).
sorted([]).
sorted([_|[]]).
sorted([X, Y|T]) :- X =< Y, sorted([Y|T]).


empty_stack(stack([])).
push(stack(S), X, stack([X|S])).
pop(stack([X|S]), X, stack(S)).


empty_q(q([])).
enque(q(X), E, q(Y)) :- append(X, [E], Y).
deque(q([H|T]), H, q(T)).
ordered_q(q(X)) :- sorted(X).



init_state(Q, S, A, state(Q, S, A)).

empty_state(state()).


action_q(state(Q, _, _), St) :- empty_q(Q), empty_state(St), !. 
action_q(state(Q, S, A), state(Q_, S_, A_)) :- deque(Q, E, Q_), push(S, E, S_), string_concat(A, "Q", A_), !.

action_s(state(_, S, _), St) :- empty_stack(S), empty_state(St), !.
action_s(state(Q, S, A), state(Q_, S_, A_)) :- pop(S, E, S_), enque(Q, E, Q_), string_concat(A, "S", A_), !.


mark_as_visited(state(Q, S, _)) :- term_hash([Q, S], Hash), assertz(v(Hash)), !.
is_visited(state(Q, S, _)) :- term_hash([Q, S], Hash), v(Hash), !.


extend_states(Prev, state(), state(), Prev).
extend_states(Prev, state(), S_state, Next) :- queue_last(Prev, S_state, Next).
extend_states(Prev, Q_state, state(), Next) :- queue_last(Prev, Q_state, Next).
extend_states(Prev, Q_state, S_state, Next) :- queue_last(Prev, Q_state, Next_), queue_last(Next_, S_state, Next).


visited_middleware(S, S) :- empty_state(S), !.
visited_middleware(S, St) :- is_visited(S), empty_state(St), !.
visited_middleware(S, S) :- mark_as_visited(S), !.


bfs(States, _) :- empty_queue(States), writeln("404: Solution not found or hash collision"), !, fail.
bfs(States, state(Q, S, A)) :- queue_head(States, state(Q, S, A), _), empty_stack(S), ordered_q(Q), !.
bfs(States, Goal) :- queue_head(States, CurrState, RestStates),
					action_q(CurrState, Q_state_),
					action_s(CurrState, S_state_),
					visited_middleware(Q_state_, Q_state),
					visited_middleware(S_state_, S_state),
					extend_states(RestStates, Q_state, S_state, NextStates),
					!,
					bfs(NextStates, Goal).


formatAns("", "empty").
formatAns(W, W).

read_input(File, N, C) :-
    open(File, read, Stream),
    read_line(Stream, [N]),
    read_line(Stream, C).

read_line(Stream, L) :-
    read_line_to_codes(Stream, Line),
    atom_codes(Atom, Line),
    atomic_list_concat(Atoms, ' ', Atom),
    maplist(atom_number, Atoms, L).


qssort(Filename, Ans) :- set_prolog_flag(stack_limit,  2000000000),
						read_input(Filename, _Unused, Numbers),
						empty_stack(S),
						init_state(q(Numbers), S, "",  St),
						mark_as_visited(St),
						create_queue_from_list([St], InitStates),
						bfs(InitStates, state(_, _, A)), formatAns(A, Ans), !.


main() :- qssort('qs10.txt', Answer), writeln(Answer), fail.


