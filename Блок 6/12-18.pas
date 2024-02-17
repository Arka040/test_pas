{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Cuarentainueve(input, output);
var
    a, b: integer;

function NODmin(a, b: integer): integer;
begin  
    if a = b then
        NODmin := a
    else
        if a > b then begin
            a := a - b;
            NODmin := NODmin(a, b);
        end
        else begin
            b := b - a;
            NODmin := NODmin(a, b);
        end;
end;

function NODdel(a, b: integer): integer;
var
    t: integer;
begin
    if a > b then begin
        t := a;
        a := b;
        b := t;
    end;
    if a = 0 then
        NODdel := b
    else begin
        b := b mod a;
        NODdel := NODdel(a, b);
    end;
end;

begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 12.18');
    writeln;
    write('Введите числа: ');
    read(a, b);
    writeln('НОД через вычитание: ', NODmin(a, b));
    writeln('НОД через деление: ', NODdel(a, b));
end.

