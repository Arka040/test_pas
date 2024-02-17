{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Veintidos(input, output);
var
    x: char;
    fl: boolean;
    s: integer;
begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 6.41(б)');
    writeln;
    
    write('Вводите: ');
    read(x);
    fl := True;
    s := 0;
    repeat
        if (ord(x) >= ord('0')) and (ord(x) <= ord('6')) then 
            s := s + (ord(x) - ord('0'))
        else
            fl := False;
        read(x);
    until (x = '.') or (not fl);
    if fl then 
        if s mod 2 = 0 then
            writeln('Четное')
        else
            writeln('Нечетное')
    else
        writeln('Не удовлетворяет условию');
end.
