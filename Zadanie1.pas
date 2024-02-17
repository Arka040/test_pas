{$mode TP}
{$codepage UTF-8}
{$R+,B+}
{ Путнев Аркадий}
program Putnev(input, output);
type TF = function(x: real): real;

const
    eps = 0.001;

var
    a, b, eps1, eps2, xfg, xfh, xgh, int1, int2, int3, S: real;
    
function f(x: real): real;
begin
    f := x;
end;

function g(x: real): real;
begin
    g := sin(x);
end;

function h(x: real): real;
begin
    h := -5/x;
end;    

procedure root(f, g: TF; a, b, eps1: real; var x: real);
var
    cond1, cond2: boolean;
    c: real;
    
function fg (x: real): real;
    begin
        fg := f(x) - g(x);
    end;
begin
    c := (a*fg(b) - b*fg(a)) / (fg(b) - fg(a));
    cond1 := fg(a) > 0;
    cond2 := fg((a+b) / 2) > (fg(a) + fg(b)) / 2;
    if cond1 = cond2 then
        while (fg(c)*fg(c + eps1)) >= 0 do begin
            a := c;
            c := (a*fg(b) - b*fg(a)) / (fg(b) - fg(a));
        end
    else
        while fg(c)*fg(c - eps1) >= 0 do begin
            b := c;
            c := (a*fg(b) - b*fg(a)) / (fg(b) - fg(a));
        end;
    x := c;
end;

function integral(f: TF; a, b, eps2: real): real;
const
    p = 1/15;
var
    n, j: integer;
    I, PRED, SUMDO, S, x, h: real;
begin
    n := 1;
    h := (b - a) / n;
    SUMDO := f(a) + f(a + h);
    I := 0;
    repeat
        PRED := I;
        n := n * 2;
        if n = 2 then begin
            S := 4*F(a + (b-a)/n);
            PRED := SUMDO + S;
            SUMDO := SUMDO + S/2;
            n := n * 2;
        end;
        S := 0;
        h := (b - a) / n;
        x := a + h;
        for j := 1 to n div 2 do begin
            S := S + 4*f(x);
            x := x + 2*h;
        end;
        I := h/3*(SUMDO + S);
        SUMDO := S/2 + SUMDO;
    until (p*abs(I-PRED)) < eps2;
    integral := I;
end;

begin
    eps1 := eps / 10;
    eps2 := eps / 10;
    a := -0.1;
    b := 0.1;
    root(f, g, a, b, eps1, xfg);
    {root(f, h, a, b, eps1, xfh);
    root(g, h, a, b, eps1, xgh);}
    
    writeln('Путнев Аркадий, Группа № 110');
    writeln('Задание № 1. Вычисление корней уравнений и определенных интегралов');
    writeln('Вариант тройки функций: 8');
    writeln('Название метода поиска корня: метод хорд');
    writeln('Название метода вычисления определенного интеграла: метод парабол');
    writeln('Абсциссы: ', {xfh:7:4, xgh:8:4,} xfg:7:4);
    {int1 := integral(f, xfh, xfg, eps2);
    int2 := integral(g, xgh, xfg, eps2);
    int3 := integral(h, xfh, xgh, eps2);
    S := int2 + int3 - int1;
    writeln('Площадь: ', S:0:3);}
    
    
end.
