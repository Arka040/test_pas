{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}  
{ Путнев Аркадий}
program Cincuentaitres(input, output);
var
    N: integer;
function IsPrime(N: integer): boolean;
function divs(k: integer): integer;
    begin
        if k*k > N then
            divs := 0
        else
            if N mod k = 0 then
                divs := divs(k + 1) + 1
            else
                divs := divs(k + 1);
    end;
begin
    if divs(2) = 0 then
        IsPrime := True
    else
        IsPrime := False;
    
end;
begin
    writeln('Путнев Аркадий, Группа № 110, Задание (Простое число?)');
    writeln;
    write('Вводите число: ');
    read(N);
    writeln(IsPrime(N));
end.
