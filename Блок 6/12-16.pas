{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Cuarentaisiete(input, output);

procedure print;
var
    c: char;
begin
    read(c);
    if c = '.' then
        write('Текст наоборот: ')
    else begin
        print;
        write(c);
    end;
end;

begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 12.16');
    writeln;
    write('Вводите текст: ');
    print;
    
end.
