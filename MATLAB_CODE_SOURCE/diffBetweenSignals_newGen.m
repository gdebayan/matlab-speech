function [matches] = diffBetweenSignals_newGen(word,alphabet,Fs)

%Fs typiquement 11000

acronyme = detectVoiced(word, Fs); %divise le signal
%disp(length(acronyme));
[acro_rows,acro_cols] = size(acronyme); %trouver le nombre de lettres
%mfccDico = cell(1,length(alphabet));%Cr�ation du tableau de cellule de longueur de l'alphabet

%for i=1:length(alphabet)
%    mfccDico{i} = melcepst(alphabet{i},8000);%Extraction des coefficients Mfcc de chaque lettre de l'alphabet
%end

matches = cell(1,acro_cols);%Tableau contenant le r�sultat de la comparaison
%currentLetter = 0;%La lettre en cours de comparaison
disp(size(acronyme));
disp(size(alphabet));

for i=1:acro_cols
    temp = 0; %valeur de diff�rence entre les signaux
    for j=1:length(alphabet)
        
        result=MFCC_Extraction_2(acronyme{1,i}, alphabet{j,1}, Fs);
        disp('resultat comparaison numero  ');
        disp(j);
        disp('= ');
        disp(result);
        if(temp<result)
            temp=result;
            matches{1,i}=j;
        end
%         k = waitforbuttonpress
    end
   % matches(i) = currentLetter;
   % currentLetter = 0;
   % temp = 9999;
end
end