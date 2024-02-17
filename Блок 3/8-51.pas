{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Dieciocho(input, output);
const
    n = 10;
var
    c: array [1..n] of integer;
    i, max, maxind, min, minind, s: integer;
begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 8.51');
    writeln;
    
    write('Вводите массив ');
    for i := 1 to n do 
        read(c[i]);
    max := c[1];
    min := c[1];
    maxind := 1;
    minind := 1;
    for i := 2 to n do begin
        if c[i] > max then begin
            max := c[i];
            maxind := i;
        end;
        if c[i] < min then begin
            min := c[i];
            minind := i;
        end;
    end;
    s := 0;
    if maxind > minind then 
        for i := maxind downto minind do
            s:= s + c[i]
    else
        for i := maxind to minind do
            s:= s + c[i];
    
    writeln('Cумма: ', s);
end.
