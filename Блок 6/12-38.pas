{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program sesentaicinco(input, output);
const
    n = 4;
var
    m: array [1..n] of integer;
    i: integer;
procedure Generate(k: integer);
var
    j, i, t: integer;
begin
    if k = 1 then begin
        for j := 1 to n do
            write(m[j], ' ');
        writeln;
    end
    else begin
        Generate(k - 1);
        for i := k - 1 downto 1 do begin
            t := m[k];
            m[k] := m[i];
            m[i] := t;
            Generate(k - 1);
            m[i] := m[k];
            m[k] := t;
        end;
    end;
end;

begin
    write('Путнев Аркадий, Группа 110, Задание № 12.38');
    writeln;
    
    write('Введите числа: ');
    for i := 1 to n do
        read(m[i]);
    writeln;
    Generate(n);
end.


