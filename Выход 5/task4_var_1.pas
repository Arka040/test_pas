{Псевдокомментарии и комментарии - не удалять при сдаче программы!}
{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}      
(**********************************************************************)
{                    ЗАДАЧА 4 (вариант 1) 25 очков                     }
(***********************************************************************
СНАЧАЛА необходимо ознакомиться с  разделом типов (type) этой программы. 

ДАЛЕЕ дать описание логической функции  Everywhere(G, friends), 
определяющей, есть ли в группе G (типа group) хотя бы один человек, 
побывавший в гостях У ВСЕХ ОСТАЛЬНЫХ из этой группы (здесь G[х] – 
множество людей, бывших в гостях у человека с именем  х;  само значение 
x не принадлежит множеству G[x]). Если ДА (т.е. ЕСЛИ ЕСТЬ хотя бы один 
человек, погостивший у всех остальных), то функция Everywhere(G, friends)
в качестве "побочного эффекта" возвращает через параметр friends 
множество типа guests (которое составлено из имён людей, побывавших в 
гостях у всех остальных).
************************************************************************ 
ТРЕБОВАНИЯ к реализации функции Everywhere(G, friends): 1) Запрещено 
пользоваться операциями in, or, and;  2) Запрещены вложенные циклы; 
3)Нельзя описывать вспомогательные процедуры (или функции); 
4)Настоятельно рекомендуется использовать теоретико-множественные 
операции.
***********************************************************************)      
{В разделе операторов программы ничего не добавлять и ничего не менять !
ТЕСТ (единственный) задан непосредственно в разделе операторов программы}
(**********************************************************************)
program Task_4_var_1(input,output);
type  
    name = (Anna,Alex,Petr,Maria,Elena,Egor,Olga,Pavel,Nadya,Ivan,Igor);                   
    guests = set of name;
    group = array [name] of guests;
var
    G: group;
    friends: guests;
    
{======================================================================}    
{        здесь дать описание функции Everywhere(G, friends)            }
function Everywhere(var G: group; var friends: guests): boolean;
var
    i: name;
begin
    friends := [Anna..Igor];
    for i := Anna to Igor do 
        friends := friends * (G[i] + [i]);
    if friends <> [] then
        Everywhere := True
    else 
        Everywhere := False;

end;

{======================================================================}

{------------------ вывод содержимого множества: ----------------------}    
procedure Print(var friends: guests);
var 
    i: name;
begin
    for i := Anna to Igor do
        if i in friends then
            case i of
                Anna:  write('Anna ');
                Alex:  write('Alex ');
                Petr:  write('Petr ');
                Maria: write('Maria ');
                Elena: write('Elena ');
                Egor:  write('Egor ');
                Olga:  write('Olga ');
                Pavel: write('Pavel ');
                Nadya: write('Nadya ');
                Ivan:  write('Ivan ');
                Igor:  write('Igor ')
            end; {of case}
     writeln       
end;
{----------------------------------------------------------------------}

{----------------------------------------------------------------------}
begin 
    {В разделе операторов этой программы - НИЧЕГО НЕ МЕНЯТЬ !!!}
    writeln('=========================');
    writeln('Task_4_var_1 (Everywhere)');
    writeln('=========================');

    {Заполнение массива тестовыми данными (при сдаче оставить как было):}
    G[Anna]  := [Alex, Maria, Elena, Olga, Nadya, Ivan, Igor];
    G[Alex]  := [Petr, Maria, Elena, Olga, Pavel, Ivan, Igor];
    G[Petr]  := [Anna, Alex, Maria, Elena, Ivan];
    G[Maria] := [Anna, Petr, Elena, Egor, Olga, Ivan];
    G[Elena] := [Maria, Egor, Olga, Ivan, Igor];
    G[Egor]  := [Alex, Maria, Elena, Pavel, Ivan, Igor];
    G[Olga]  := [Alex, Maria, Elena, Nadya, Ivan];
    G[Pavel] := [Maria, Elena, Egor, Ivan];
    G[Nadya] := [Alex, Petr, Maria, Elena, Ivan, Igor];
    G[Ivan]  := [Alex, Petr, Maria, Elena, Olga, Pavel];
    G[Igor]  := [Anna, Alex, Petr, Maria, Elena, Ivan];    
    {Заметим, что Maria, Elena и Ivan побывали в гостях у всех остальных}
    {Вызов вашей функции Everywhere(G, friends):}
    if Everywhere(G, friends) then begin
        writeln('Yes:');
        print(friends) {должны быть напечатаны имена: Maria Elena Ivan}
    end else
        writeln('No!')
end.
