{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Diecinueve(input, output);
var
    c, max: integer;
    x: char;
begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 6.32');
    writeln;
    
    write('Вводите последовательность: ');
    max := 0;
    repeat
        read(x);
        c := 0;
        while (x <> ' ') and (x <> '.') do begin
            c := (ord(x) - ord('0')) + c * 7;
            read(x);
        end;
        if max < c then
            max := c;
    until x = '.';
    writeln('Максимальное число: ', max);
end.
