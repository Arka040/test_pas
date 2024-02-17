{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Cuarentaicuatro(input, output);
const
    n = 5;
    m = 4;
type
    matrix = array [1..n, 1..m] of integer;
var
    a, b, c: matrix;
    max, strA, strB, strC: integer;

procedure InputMatrix(var p: matrix);
var
    i, j: integer;
begin
    for i := 1 to n do
        for j := 1 to m do 
            read(p[i, j]);
end;

function Null(var p: matrix): integer;
var
    fl: boolean;
    i, j, k: integer;
begin
    k := 0;
    for i := 1 to n do begin
        fl := True;
        j := 1;
        while (j <= m) and fl do begin
            if p[i, j] <> 0 then
                fl := False;
            j := j + 1;
        end;    
        if fl then
            k := k + 1;
    end;
    Null := k;
end;

procedure MatrixOutput(var p: matrix);
var
    i, j: integer;
begin
    for i := 1 to n do begin
        for j := 1 to m do 
            write(p[i, j], ' ');
        writeln;
    end;    
end;

begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 11.60');
    writeln;
    
    write('Вводите матрицы: ');
    InputMatrix(a);
    InputMatrix(b);
    InputMatrix(c);
    strA := Null(a);
    strB := Null(b);
    strC := Null(c);
    write('Ответ: ');
    writeln;
    max := strA;
    if max < strB then begin
        max := strB;
        if strC > max then
            max := strC;
    end;
    if strA = max then begin
        MatrixOutput(a);
        writeln;
    end;
    if strB = max then begin
        MatrixOutput(b);
        writeln;
    end;
    if strC = max then begin
        MatrixOutput(c);
        writeln;
    end;
    
    
end.
