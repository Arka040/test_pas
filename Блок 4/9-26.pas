{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Treinteitres(input, output);
const
    m = 3;
var
    A, B, C: array [1..m, 1..m] of integer;
    i, j, d, n, s, k: integer;
begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 9.26');
    writeln;
    
    write('Введите матрицу: ');
    for i := 1 to m do
        for j:= 1 to m do begin
            read(A[i, j]);
            if i = j then
                B[i, j] := 1
            else
                B[i, j] := 0;
        end;
    write('Введите степень: ');
    read(n);
    for d := 1 to n do begin
        for i := 1 to m do
            for j := 1 to m do begin
                s := 0;
                for k := 1 to m do
                    s := s + A[i, k] * B[k, j];
                C[i, j] := s;
            end;
        B := C;
    end;
    for i := 1 to m do begin
        for j := 1 to m do
            write(C[i, j], ' ');
        writeln;
    end;
end.
