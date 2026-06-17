teaches(john, math).
teaches(jane, english).
teaches(bob, science).
teaches(sue, history).

takes(alice, math).
takes(alice, science).
takes(bob2, english).
takes(bob2, science).
takes(carol, history).
takes(dave, math).

teaching_subjects(Teacher, Subject) :-
    teaches(Teacher, Subject).

taking_students(Subject, Student) :-
    takes(Student, Subject).