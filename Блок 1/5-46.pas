{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Diez(output, input);
var
    x, y, k, n: integer;
begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 5.46');
    writeln();
    
    write('Сколько будет чисел: ');
    read(n);
    write('Вводите числа: ');
    read(x);
    k := 1;
    for n := 2 to n do begin
        read(y);
        if y > x then
           k := k + 1;
        x := y;
    end;
    writeln('Разных чисел: ', k);
end.
