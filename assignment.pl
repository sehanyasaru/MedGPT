symptom(fever).
symptom(cough).
symptom(fatigue).
symptom(sneezing).
symptom(headache).
symptom(sorethroat).

symptom_duration(Duration,Risk):-(
                                 Duration<1 ->Risk='Verylow';
                                 Duration==1 ->Risk='Low';
                                 Duration>1,Duration<2-> Risk='Average';
                                 Duration>=2,Duration<3->Risk='High';
                                 Risk='Dangerouse').
message(Symptom,Value,Message):- (Symptom ==cough->
                                 (Value=='Verylow'-> Message='You are having You are likely experiencing mild symptoms. It\'s advisable to rest and stay hydrated. If symptoms persist, consult a healthcare professional.Do not have any cool water and do not spend much time with water specialy at night!';
                                 Value=='Low'-> Message='Your symptoms are mild. Consider taking over-the-counter medications and getting plenty of rest. If symptoms worsen, seek medical advice.';
                                 Value=='Average'->Message= 'Your symptoms are moderate. It is recommended to monitor your condition closely and consider consulting a healthcare provider for further evaluation.';
                                 Value=='High'->Message='Your symptoms are severe. It\'s important to seek medical attention promptly for proper diagnosis and treatment.';
                                 Value=='Dangerouse'->Message='Your symptoms are critical. Please seek immediate medical assistance.Do not delay seeking help.')).


alert(Symptom,Duration,Message):-symptom_duration(Duration,Risk),message(Symptom,Risk,Message).



disease(Symptoms, Result):-
    (   member(sorethroat, Symptoms),
        member(cough, Symptoms),
        member(fatigue, Symptoms),
        member(headache, Symptoms),
        member(sneezing, Symptoms)
    ),
    Result = cold.
disease(Symptoms, Result):-
    (   member(fever, Symptoms),
        member(cough, Symptoms),
        member(fatigue, Symptoms),
        member(headache, Symptoms),
        member(sneezing, Symptoms)
    ),
    Result = flu.
disease(Symptoms, Result):-
    (   member(sorethroat, Symptoms),
        member(fever, Symptoms),
        member(cough, Symptoms),
        member(fatigue, Symptoms),
        member(headache, Symptoms)
    ),
    Result = covid.
disease(Symptoms, Result):-
    (   member(sneezing, Symptoms),
        member(sorethroat, Symptoms)
    ),
    Result = seasonal_allergies.
disease(Symptoms, Result):-
    (   member(fever, Symptoms),
        member(fatigue, Symptoms),
        member(sorethroat, Symptoms)
    ),
    Result = mono.
disease(Symptoms, Result):-
    (   member(fever, Symptoms),
        member(headache, Symptoms),
        member(sneezing, Symptoms)
    ),
    Result = sinusitis.
disease(Symptoms, Result):-
    (   member(fever, Symptoms),
        member(cough, Symptoms),
        member(fatigue, Symptoms),
        member(headache, Symptoms)
    ),
    Result = pneumonia.
disease(Symptoms, Result):-
    (   member(fever, Symptoms),
        member(sorethroat, Symptoms)
    ),
    Result = strep_throat.


