{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Dop3(output, input);
var
    n, t, k, d, ost, m, i, ch: integer;
begin
    writeln('Путнев Аркадий, Группа № 110, Доп Задание № 3');
    writeln;
    
    write('Введите число: ');
    read(n);
    t := n;
    k := 0;
    m := 0;
    while t > 0 do begin
        d := 1;
        for i := 1 to k do
            d := d * 10;
        ost := n mod d;
        t := t div 10;
        ch := t * d + ost;
        if ch > m then
            m := ch;
        k := k + 1;
    end;
    writeln('Максимальное число: ', m);
end.
