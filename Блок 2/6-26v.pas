{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Diecisiete(input, output);
var
    k: integer;
    c, x, y: char;
begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 6.26(в)');
    writeln;
    
    write('Вводите слова: ');
    k := 0;
    repeat
        read(c);
        x := c;
        repeat
            y := c;
            read(c);
        until (c = '.') or (c = ',');
        if x = y then
            k := k + 1;
    until c = '.';
    writeln('Количество слов с одинаковой первой и последней буквой: ', k);
end.
