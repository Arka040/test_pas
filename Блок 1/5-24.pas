{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Cuatro(input, output);
const
    eps = 1E-5;
var
    pi, e, x, l, r: real;
begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 5-24');
    writeln;
    
    e := exp(1);
    pi := 4 * arctan(1);
    l := -1;
    r := 1;
    repeat
        x := (l + r)/2;
        if (pi*x*x*x - e*x*x + (2*e + 1)*x + pi*pi) > 0 then
            r := x
        else
            l := x
    until (r-l) < eps;
    writeln('x = ', (l + r)/2:0:4)
end.
