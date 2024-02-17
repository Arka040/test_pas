{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Treinteiciete(input, output);
const
    n = 30;
    k = 5;
var
    A: array [1..n] of packed array [1..5] of char;
    i, j: integer;
    c: char;
begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 10-16 (в)');
    writeln;
    
    write('Вводите слова: ');
    i := 1;
    repeat
        read(c);
        j := 1;
        repeat
            A[i, j] := c;
            j := j + 1;
            read(c);
        until (c = '.') or (c = ',');
        while j < k do begin
            A[i, j] := ' ';
            j := j + 1;
        end;
        i := i + 1;
    until (c = '.');
    for i := 1 to n - 1 do 
        for j := i + 1 to n do
            if (A[i] = A[j]) then
                A[j] := '     ';
    write('Слова без повторений: ');
    for i := 1 to n do
        if A[i] <> '     ' then
            write(A[i]);
   
end.
