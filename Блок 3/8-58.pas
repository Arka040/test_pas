{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Treinteidos(input, output);
const
    n = 10;
var
    txt: char;
    c: array [1..n] of char;
    i, j, k, cnt: integer;
begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 8.58');
    writeln;
    
    write('Введите массив: ');
    k := 1;
    read(txt);
    while (k <> n) and (txt <> '.') do begin
        c[k] := txt;
        k := k + 1;
        read(txt);
    end;
    cnt := 1;
    for i := 1 to k - 2 do begin
        j := i;
        repeat
            j := j + 1
        until (c[i] = c[j]) or (j = k - 1);
        if (c[i] <> c[j]) then
            cnt := cnt + 1;
    end;
    writeln('Количество разных символов: ', cnt);
end.
