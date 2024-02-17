{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Dop1(output, input);
var
    P, Q, n, i, c: integer;
begin
    writeln('Путнев Аркадий, Группа № 110, Доп задание № 1');
    writeln;
    
    write('Введите P, Q и n: ');
    read(P, Q, n);
    write('Ответ: ', P div Q);
    c := (P mod Q);
    if n > 0 then
        write('.');
    for i := 1 to n do begin
        c := c * 10;
        write(c div Q);
        c := c mod Q;
    end;
end.
