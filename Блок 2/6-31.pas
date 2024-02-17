{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Dieciocho(input, output);
var
    x, i, n, d: integer;
    
begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 6.31');
    writeln;
    
    write('Введите диапазон: ');
    read(x);
    writeln('Все числа в троичной системе: ');
    for i := 0 to x do begin
        n := i;
        d := 1;
        while n div d > 2 do begin
            d := d * 3;
        end;
        repeat
            write(chr(ord('0') + n div d));
            n := n mod d;
            d := d div 3;
        until d = 0;
        writeln;
        end;
end.
