{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Nueve(output, input);
var
    x, y, z, i: integer;
begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 5.45');
    writeln();
    
    x := 0;
    y := 0;
    z := 0;
    write('Вводите числа: ');
    read(i);
    while i <> 0 do begin
        if i > x then begin
            z := y;
            y := x;
            x := i;
        end;
        if (i < x) and (i > y) then begin
            z := y;
            y := i;
        end;
        if (i < y) and (i > z) then
            z := i;
        read(i);
    end;
    writeln(x, ' ', y, ' ', z)
end.
