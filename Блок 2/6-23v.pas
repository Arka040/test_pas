{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program quince(input, output);
var
    x: char;
begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 6.23 (в)');
    writeln;
    
    write('Вводите последовательность: ');
    read(x);
    while x <> '.' do begin
        if x = 'c' then begin
            write(x);
            read(x);
            if x = 'b' then
                read(x);
        end
        else begin
            write(x);
            read(x);
        end;
    end;
    
end.
