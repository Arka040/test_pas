{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Uno(input, output);
var
    x, max, k: integer;
begin
    writeln('Путнев Аркадий, ', 'Групаа № 110, ', '№ 5-7(д)');
    writeln();
    
    write('Введите последовательность чисел: ');
    k := 0;
    read(x);
    max := x;
    while x > 0 do begin
        if x = max then
            k := k + 1;
        if x > max then begin
            max := x;
            k := 1;
        end;
        read(x);
    end;
    writeln('Максимально число встречается: ', k, ' раз(а)');
end.
