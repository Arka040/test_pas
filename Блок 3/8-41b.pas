{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Diecisinco(input, output);
const
    n = 10;
var
    i, k, w, t: integer;
    c: array [1..n] of integer;
begin
    writeln('Путнев Аркадий, Группа № 110, Задача № 8.41(б)');
    writeln;
    
    write('Введите массив: ');
    w := n;
    for i := 1 to n do
        read(c[i]);
    repeat 
        k := 0;
        for i := 1 to w - 1 do begin
            if c[i] > c[i+1] then begin
                t := c[i];
                c[i] := c[i+1];
                c[i+1] := t;
                k := k + 1;
            end;
        end;
        w := w - 1;
    until (k = 0) or (w = 1);
    write('Отсортированный массив: ');
    for i := 1 to n do
        write(c[i], ' ');
end.
