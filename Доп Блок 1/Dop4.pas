{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Dop4(output, input);
var
    n, a, b, c: longint;
    fl, ok: boolean;
    
begin
    writeln('Путнев Аркадий, Группа № 110, Доп Задание № 4');
    writeln;
    
    write('Введите число: ');
    read(n);
    fl := False;
    a := 1;
    while (sqr(a) < n) and  not fl do begin
        ok := True;
        b := 1;
        while (b <= a) and ok do begin 
            c := sqr(a) + sqr(b);
            if c = n then begin
                fl := True;
                ok := False;
            end
            else if c > n then
                ok := False;
            b := b + 1;
        end;
        a := a + 1;
        writeln(a, ' ', b)
    end;
    if fl then
        writeln('a = ', a-1, ', ', 'b = ',  b-1)
    else
        writeln('None');
end.
