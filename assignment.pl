symptom(fever).
symptom(cough).
symptom(fatigue).
symptom(sneezing).
symptom(headache).


disease([],N,Result):-(N<=65->
                      Result =cold;
                      Result =flu).

disease([H|T],N,Result):-(H == fever-> N1 is N+25;
                  H == cough->N1 is N+30;
                  H == fatigue->N1 is N+40;
                  H == headache->N1 is N+35;
                  H == sneezing-> N1 is N+10),write(N1),disease(T,N1,Result).

%disease(cold, [fever, cough, fatigue]).
%disease(cold, [fever, cough, fatigue,headache]).

%disease(cold, [sneezing, cough,headache]).
%disease(cold, [fever,sneezing,headache]).
%disease(cold, [sneezing]).
%disease(flu, [fever, cough, fatigue, sore_throat]).

% predict_disease(Symptoms, Disease)
% :-disease(Disease,DiseaseSymptoms),sublist(DiseaseSymptoms, Symptoms).

%sublist([], _).
%sublist([H|T], List) :- member(H, List),sublist(T, List).
