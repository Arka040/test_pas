{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Dieciseis(input, output);
const
    n = 10;
var
    c: array [1..n] of integer;
    x, y, i, j, k: integer;
begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 8.41(в)');
    writeln;
    
    write('Введите массив: ');
    for i := 1 to n do 
        read(c[i]);
    for i := 2 to n do begin
        j := i - 1;
        x := c[i];
        while ((j) > 0) and (x < c[j]) do begin
            y := c[j];
            c[j] := x;
            c[j + 1] := y;
            if (j-1) <> 0 then
                j := j - 1;
        end;
    end;
    write('Отсортированный массив: ');
    for i := 1 to n do 
        write(c[i], ' ');
end.
