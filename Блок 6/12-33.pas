{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program sesentaicuatro(input, output);
var
    a, b, c: char;
    n: integer;
procedure Move(n:integer; a, b, c: char);
begin
    if n <> 0 then begin
        Move((n - 1), a, c, b);
        write('Переместить кольцо с ', a, ' на ', c);
        writeln;
        Move((n - 1), b, a, c);
    end;
end;
begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 12.33');
    writeln;
    
    write('Введите названия колышек: ');
    read(a, b, c);
    write('Количество колец: ');
    read(n);
    Move(n, a, b, c)
end.
