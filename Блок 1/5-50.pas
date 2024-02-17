{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Doce(output, input);
var 
    x, s1, s: real;
begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 5.50');
    writeln();
    
    write('Вводите числа: ');
    read(x);
    s1 := 0;
    s := 0;
    while x >= 0 do begin
        s1 := s1 + x;
        s := s + s1;
        read(x);
    end;
    writeln('Ответ: ', s:0:4);
end.
