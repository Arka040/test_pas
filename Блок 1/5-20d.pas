{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Tres(input, output);
const
    eps = 1E-5;
var
    x, y, u, i: real;
begin
    writeln('Путнев Аркадий, ', 'Группа № 110, ', 'Задние № 5-20(д)');
    writeln();
    
    write('Введите число: ');
    read(x);
    u := x;
    y := x;
    i := 1;
    repeat
        i := i + 2;
        u := -(u*x*x)*(i-2)/i;
        y := y + u;
    until abs(u) < eps;
    writeln('С помощью суммы: arctg(x) = ', y:0:4);
    writeln('С помощью встроенной функции: arctg(x) = ', arctan(x):0:4);
end.
