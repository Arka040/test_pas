{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program cuarentaitres(input, output);
var
    n, i, k: integer;
    
function Simple(c: integer): boolean;
var
    fl: boolean;
    i: integer;
begin
    fl := True;
    i := 2;
    if (c = 0) or (c = 1) then
        fl := False;
    while (i*i <= c) and fl do begin
        if c mod i = 0 then
            fl := False;
        i := i + 1;
    end;
    Simple := fl;
end;

begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 11.55');
    writeln;
    
    write('Введите конец диапазона: ');
    read(n);
    write('Простые числа: ');
    writeln;
    k := -5;
    for i := 2 to n do begin
        if Simple(i) then begin
            if (i - 2) = k then
                writeln(k, ' ', i);
            k := i;    
        end;
    end;
end.
