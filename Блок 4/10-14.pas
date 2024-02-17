{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Treinteiseis(input, output);
var
    r: array [1..9] of packed array [1..4] of char;
    i, t: integer;
begin
    writeln('Аркадий Путнев, Группа № 110, Задание № 10.14');
    writeln;
    
    r[1] := 'I';
    r[2] := 'II';
    r[3] := 'III';
    r[4] := 'IV';
    r[5] := 'V';
    r[6] := 'VI';
    r[7] := 'VII';
    r[8] := 'IIX';
    r[9] := 'IX';
    
    write('Введите число: ');
    read(t);
    write('Число в римской системе: ');
    i := t mod 10;
    while t > 9 do begin
        t := t - 10;
        write('X');
    end;
    if i <> 0 then
        write(r[i]);
end.
