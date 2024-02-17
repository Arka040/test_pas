{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Dop5(output, input);
var
    n, d, k, t: integer;
    fl: boolean;
    
begin
    writeln('Путнев Аркадий, Группа № 110, Доп Задание № 5');
    writeln;
    
    write('Введите число: ');
    read(n);
    fl := True;
    while n div 10 > 0 do begin
        d := n mod 10;
        t := n;
        k := 1;
        while t > 9 do begin
            t := t div 10;
            k := k * 10;
        end;
        if (d <> t) or (d = 0) or (t = 0) then
            fl := False;
        n := n div 10;
        n := n mod (k div 10);
    end;
    if fl then
        writeln('Палиндром')
    else
        writeln('Не Палиндром');
end.
