{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Veinte(input, output);
var
    x: char;
    d, t, p, u: integer;
begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 6.33');
    writeln;
    
    write('Введите число в восьмеричной с. с. : ');
    d := 0;
    p := 0;
    u := 1;
    read(x);
    repeat
        d := (ord(x) - ord('0')) + d * 8;
        read(x);
    until x = '.';
    while d > 0 do begin;
        t := d mod 5;
        d := d div 5;
        p := p + t*u;
        u := u * 10;
    end;
    writeln('Число в пятеричной с. с. : ', p);
end.
