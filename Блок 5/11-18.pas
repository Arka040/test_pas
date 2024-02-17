{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Treinteinueve(input, output);
var
    a, b, c: integer;
function NODminus(a, b: integer): integer;
    begin
        while a <> b do 
            if a > b then
                a := a - b
            else
                b := b - a;
        NODminus := b;
    end;

function NODdel(a, b: integer): integer;
    begin
        while (a <> 0) and (b <> 0) do
            if a > b then
                a := a mod b
            else
                b := b mod a;
        if a = 0 then 
            NODdel := b
        else
            NODdel := a;
    end;
    
begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 11.18');
    writeln;
    
    write('Введите 3 числа: ');
    read(a, b, c);
    writeln('НОД через вычитание: ', NODminus(a, NODminus(b, c)));
    writeln('НОД через деление: ', NODdel(a, NODdel(b, c)));
end.
