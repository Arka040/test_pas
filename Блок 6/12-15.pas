{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Cuarentaiseis(input, output);

function digits: integer;
var
    c: char;
begin
    read(c);
    if c = '.' then
        digits := 0
    else
        if ('0' <= c) and (c <= '9') then
            digits := digits + 1
        else
            digits := digits;
end;

begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 12.15');
    writeln;
    write('Вводите текст: ');
    writeln('Количество цифр: ', digits);
end.
