{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Cuarentaiuno(input, output);
const
    n = 3;
type
    matrix = array [1..n, 1..n] of integer;
var
    a, b, mm: matrix;

procedure Vvod(var m: matrix);
var
    i, j: integer;
begin
    for i := 1 to n do
        for j := 1 to n do
            read(m[i, j]);
end;

function Track(var m: matrix): integer;
var
    s, i: integer;
begin
    s := 0;
    for i := 1 to n do
        s := s + m[i, i];
    Track := s;
end;

procedure Square(var m: matrix);
var
    element, k, i, j: integer;
begin
    for i := 1 to n do
        for j := 1 to n do begin
            element := 0;
            for k := 1 to n do
                element := element + m[i, k] * m[k, j];
            mm[i, j] := element;
        end;
end;

procedure Pechat(var m: matrix);
var
    i, j: integer;
begin
    for i := 1 to n do begin
        for j := 1 to n do 
            write(m[i, j], ' ');
        writeln;
    end;
end;

begin  
    writeln('Путнев Аркадий, Группа № 110, Задание № 11.27');
    writeln;
    
    write('Вводите матрицы: ');
    Vvod(a);
    Vvod(b);
    writeln('Квадрат матрицы с наибольшим следом: ');
    if Track(a) > Track(b) then begin
        Square(a);
        Pechat(mm);
    end
    else begin
        Square(b);
        Pechat(mm);
    end;
end.
