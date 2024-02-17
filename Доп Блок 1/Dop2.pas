{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Dop2(output, input);
var
    n, c, d, i, k: integer;
begin
    writeln('Путнев Аркадий, Группа № 110, Доп Задание № 2');
    writeln;
    
    write('Введите число: ');
    read(n);
    c := 0;
    k := 0;
    while n > 0 do begin
        d := n mod 10;
        if d <> 3 then begin
            for i := 1 to k do 
                d := d * 10;
            c := c + d;
            k := k + 1;
        end;
        n := n div 10;
    end;
    writeln('Число без троек: ', c);
end.
