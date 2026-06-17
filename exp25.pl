initial_state(state(at_door, on_floor, at_window, has_not_eaten)).

final_state(state(_, _, _, has_eaten)).

action(
    state(at_window, on_floor, at_window, has_not_eaten),
    grasp,
    state(at_window, on_floor, at_window, has_eaten)
).

action(
    state(at_door, on_floor, _, HB),
    walk_to_window,
    state(at_window, on_floor, at_window, HB)
).

solve([]) :-
    initial_state(S),
    final_state(S).

solve([Action | Rest]) :-
    initial_state(S0),
    action(S0, Action, S1),
    final_state(S1),
    Rest = [].