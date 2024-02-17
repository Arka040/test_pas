{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Treinteidos(input, output);
const
    n = 10;
var
    A, B: array [1..n, 1..n] of integer;
    i, j: integer;
begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 9.14');
    writeln;
    
    for i := 0 to n - 1 do 
        for j := 1 to n do 
            A[i + 1, j] := i * 10 + j;
    
    for i := 1 to n do 
        for j := 1 to n do 
            if j < i then 
                B[i, j] := 0
            else
                B[i, j] := j - i + 1;
    
    for i := 1 to n do begin
        for j := 1 to n do
            write(A[i, j]:3 , ' ');
        writeln;
    end;
    writeln;
    for i := 1 to n do begin
        for j := 1 to n do
            write(B[i, j]:3 , ' ');
        writeln;
    end;
end.
