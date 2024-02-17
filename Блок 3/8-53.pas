{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Diecinueve(input, output);
const
    n = 10;
var
    x, y: array [1..n] of integer;
    i, j, n1, n2: integer;
    max, k: real;
begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 8.53');
    writeln;
    
    write('Вводите точки: ');
    max := 0;
    for i := 1 to n do begin
        read(x[i]);
        read(y[i]);
    end;
    for i := 1 to n - 1 do begin
        for j := i + 1 to n do begin
            k := (sqr(x[i] - x[j]) + sqr(y[i] - y[j])); 
            if k > sqr(max) then begin
                max := sqrt(k);
                n1 := i;
                n2 := j;
            end;
        end;
    end;
    writeln('Номер первой точки: ', n1);
    writeln('Номер второй точки: ', n2);
end.
