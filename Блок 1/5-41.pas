{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Siete(output, input);
var
    x, y, k: integer;
begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 5.41');
    writeln();
    
    write('Вводите последовательность: ');
    read(x);
    read(y);
    k := 0;
    while y <> 0 do begin 
        if ((y > 0) and (x < 0)) or ((y < 0) and (x > 0)) then
            k := k + 1;
        x := y;
        read(y);
    end;
    writeln('Знак поменялся ', k, ' раз(а)');
end.
