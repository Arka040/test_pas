{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Veintiuno(input, output);
var
    x: char;
    s: integer;
begin
    writeln('Путнев Аркадий, Группа № 110, Задача № 6.34');
    writeln;
    
    write('Вводите выражение: ');
    read(x);
    s := (ord(x) - ord('0'));
    repeat
        if x = '+' then begin
            read(x);
            s := s + (ord(x) - ord('0'));
        end;
        if x = '-' then begin
            read(x);
            s := s - (ord(x) - ord('0'));
        end;
        read(x);
    until x = '.';
    writeln('Ответ: ', s);
end.
