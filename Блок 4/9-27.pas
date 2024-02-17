{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Treinteicuatro(input, output);
const
    n = 5;
var
    A: array [1..n, 1..n] of integer;
    i, j: integer;
    fl: boolean;
begin
    writeln('Путнев Аркадий, Группа №110, 9.27');
    writeln;
    
    write('Вводите Матрицу: ');
    for i:= 1 to n do 
        for j := 1 to n do 
            read(A[i, j]);
    fl := True;
    i := 1;
    while (i <> n + 1) and fl do begin
        j := i + 1;
        while (j <> n + 1) and fl do begin
            if A[i, j] <> A[j, i] then
                fl := False;
            j := j + 1;
        end;
        i := i + 1;
    end;
    if fl then
        writeln('Матрица симметричная')
    else
        writeln('Матрица не симметричная');
end.
