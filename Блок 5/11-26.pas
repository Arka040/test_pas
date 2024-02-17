{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Cuarenta(input, output);
const
    n = 4;
type
    vector = array [1..n] of integer;
var
    max, MinX, MinY, MinZ: integer;
    a, b, c, x, y, z: vector;
    
procedure Vvod(var v: vector);
var
    i: integer;
begin
    for i := 1 to n do
        read(v[i]);
end;

function Min(var v: vector): integer;
var
    mini, i: integer;
begin
    mini := v[1];
    for i := 2 to n do
        if mini > v[i] then
            mini := v[i];
    Min := mini;
end;

function Scalar(var v, w: vector): integer;
var
    s, i: integer;
begin
    s := 0;
    for i := 1 to n do
        s := s + v[i]*w[i];
    Scalar := s;
end;

begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 11.26');
    writeln;
    
    write('Вводите векторы: ');
    Vvod(x);
    Vvod(y);
    Vvod(z);
    MinX := Min(x);
    MinY := Min(y);
    MinZ := Min(z);
    max := MinX;
    a := x;
    b := y;
    c := z;
    if max < MinY then begin
        max := MinY;
        a := y;
        b := x;
        c := z;
    end;
    if max < MinZ then begin
        max := MinZ;
        a := z;
        b := x;
        c := y;
    end;
    writeln('Скалярное произведение равно: ', Scalar(a,a) - Scalar(b, c));
end.
