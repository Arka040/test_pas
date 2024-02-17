{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Cuarentaicinco(input, output);

function max: integer;
var 
    x, t: integer;
begin
    read(x);
    if x = 0 then
        max := 0
    else begin
        t := max;
        if x > t then
            max := x
        else
            max := t;
    end;
end;

begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 12.14');
    writeln;
    write('Вводите последовательность: ');
    writeln('Максимальный элемент: ', max);
end.
