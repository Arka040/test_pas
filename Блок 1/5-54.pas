{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Trece(output, input);
var
    n, i: integer;
    p: boolean;
begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 5.54');
    writeln();
    
    write('Введите конец диапазона: ');
    read(n);
    writeln('Простые числа:');
    for n := 2 to n do begin
        i := 2;
        p := True;
        while (i*i <= n) and (p <> False) do begin
            if n mod i = 0 then
                p := False;
            i := i + 1;
        end;
        if p = True then
            writeln(n);
    end;
end.
