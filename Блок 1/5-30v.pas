{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Cinco(output, input);
var
    n, x, y, i, d: integer;
begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 5-30(в)');
    writeln();
    
    write('Сколько будет чисел в пос-ти: ');
    read(n);
    write('Вводите числа: ');
    read(x);
    read(y);
    d := y - x;
    i := 2;
    while (i <> n) and ((y - x) = d) do begin
        x := y;
        read(y);
        if y - x = d then
            i := i + 1;
    end;
    if i = n then
        writeln('Да, пос-ть арифметическая')
    else
        writeln('Нет, пос-ть не арифметическая')
end.
