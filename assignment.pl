symptom(fever).
symptom(cough).
symptom(fatigue).
symptom(sneezing).
symptom(headache).

disease(cold, [fever, cough, fatigue]).
disease(cold, [fever, cough, fatigue,headache]).

disease(cold, [sneezing, cough,headache]).
disease(cold, [fever,sneezing,headache]).
disease(cold, [sneezing]).
disease(flu, [fever, cough, fatigue, sore_throat]).

predict_disease(Symptoms, Disease) :-disease(Disease,DiseaseSymptoms),sublist(DiseaseSymptoms, Symptoms).

sublist([], _).
sublist([H|T], List) :- member(H, List),sublist(T, List).
