{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program pl(input, output);
var
    x: real;
    k: integer;
begin
    writeln('Путнев Аркадий');
    writeln('Группа 110');
    writeln('Задание № 5.12');
    writeln();
    
    k := 0;
    x := 0;
    writeln('x':4, 'cos(x)':9, 'sin(x)':7);
    writeln('--------------------');
    while k <> 11 do begin
        writeln(x:6:4, sin(x):7:4, cos(x):7:4);
        x := x + 0.1;
        k := k + 1;
    end;
end.
