{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Treinteiuno(input, output);
var
    c: array ['a'..'z'] of integer;
    
    txt, i: char;
begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 8.56');
    writeln;
    
    write('Введите текст: ');
    for i := 'a' to 'z' do
        c[i] := 0;
    read(txt);
    while txt <> '.' do begin
        c[txt] := c[txt] + 1;
        read(txt);
    end;
    write('Буквы по 1 разу: ');
    for i := 'a' to 'z' do 
        if c[i] = 1 then
            write(i, ' ');
end.
