{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Catorce(input, output);
var
    c: char;
    k: integer;
begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 6.21');
    writeln;
    
    write('Введите текст: ');
    read(c);
    k := 0;
    while c <> '.' do begin
        if c = 'a' then begin
            read(c);
            if c = 'b' then begin
                read(c);
                if c = 'c' then
                    k := k + 1
            end;
        end
        else
            read(c);
    end;
    writeln('Количество троек abc: ', k);
end.
