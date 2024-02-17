{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Veintitres(input, output);
var
    x: char;
    s, y: integer;
    fl: boolean;
begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 6.41(в)');
    writeln;
    
    write('Вводите: ');
    read(x);
    fl := True;
    s := 0;
    repeat  
        if (ord(x) >= ord('0')) and (ord(x) <= ord('9')) then begin 
            s := s + (ord(x) - ord('0'));
            y := (ord(x) - ord('0'));
        end
        else 
            fl := False;
        read(x);
    until (x = '.') or (not fl);
    if fl then 
        if (s mod 3 = 0) and (y mod 2 = 0) then 
            writeln('Является')
        else
            writeln('Не является')
    else
        writeln('Вообще мимо');
end.
