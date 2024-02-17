{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Once(output, input);
var
    x, k, n, max: integer;
begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 5.48');
    writeln();
    
    write('Сколько будет чисел: ');
    read(n);
    write('Вводите числа: ');
    k := 0;
    max := 0;
    for n := 1 to n do begin
        read(x);
        if x = 0 then begin
            k := k + 1;
            if k > max then
                max := k;
            end
        else
            k := 0;
        end;
    write('Максимально нулей подряд: ');
    writeln(max);
end.
