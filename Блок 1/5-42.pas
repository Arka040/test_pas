{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Ocho(output, input);
var
    x, y, r: real;
    n: integer;
begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 5.42');
    writeln();
    
    write('Введите количество точек: ');
    read(n);
    write('Вводите координаты x, y: ');
    r := 0;
    for n := 1 to n do begin
        read(x, y);
        if r < (sqrt(sqr(x) + sqr(y))) then
            r := sqrt(sqr(x) + sqr(y));
    end;
    writeln(r:0:4);
end.
