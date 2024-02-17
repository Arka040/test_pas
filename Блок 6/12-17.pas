{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Cuarentaiocho(input, output);

procedure print;
var
    x: integer;
begin
    read(x);
    if x = 0 then
    else
        if x < 0 then begin
            write(x, ' ');
            print;
        end
        else begin
            print;
            write(x, ' ');
        end;
        
end;

begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 12.17');
    writeln;
    write('Вводите последовательность: ');
    print;
end.
