{$mode TP}
{$codepage UTF-8}
{$R+,B+}
{ Путнев Аркадий}
Program Putnev(input, output);
uses CRT;
type 
    integer = longint;
    number = packed array [1..16] of char; 
var
    e: char;
    SumCF, SumOF, SubCF, SubOf, SumSF, SumZF, SubSF, SubZF: boolean;
    x, y, k, d, s, nx, ny, wx, wy, SumNS, SumWS, SubNS, SubWS: integer;
    num1, num2, nums, numm: number;
procedure Transfer(x: integer; var num: number);
var
    j, i, ost: integer;
begin  
    if x < 0 then
        x := s + x;
    for j := 1 to k do 
        num[j] := '0';
    i := k;
    while x <> 0 do begin
        ost := x mod 2;
        num[i] := char(ord('0') + ost);
        x := x div 2;
        i := i - 1;
    end;
    writeln(num);
end;

procedure Borders(k: integer; var d, s: integer);
var
    i: integer;
begin
    d := 1;
    s := 1;
    for i := 1 to k-1 do begin
        d := d*2;
        s := s*2;
    end;
    d := -d;
    s := s*2;
end;

function NoSign(x: integer): integer;
begin
    if x < 0 then 
        NoSign := s + x 
    else
        NoSign := x;
end;

function WithSign(x: integer): integer;
begin
    if x >= s div 2 then 
        WithSign := x - s
    else
        WithSign := x;
end;

procedure Summa(x, y: integer; var num: number);
var
    sum: integer;
begin
    sum := x + y;
    if sum >= s then
        sum := sum - s;
    Transfer(sum, num);
end;

procedure Subs(x, y: integer; var num: number);
var
    sub: integer;
begin
    sub := x - y;
    if sub < 0 then 
        sub := s + sub;
    Transfer(sub, num);
end;

function SumNoSign(x, y: integer; var fl: boolean): integer;
var
    sum: integer;
begin
    sum := x + y;
    if sum >= s then begin
        fl := True;
        sum := sum - s;
    end
    else
        fl := False;
    SumNoSign := sum;
end;

function SumWithSign(x, y: integer; var SumOF, SF, ZF: boolean): integer;
var
    sum: integer;
begin
    sum := x + y;
    SumOF := False;
    SumSF := False;
    SumZF := False;
    if sum < d then begin
        sum := s + sum;
        SumOF := True;
    end;
    if sum >= -d then begin
        sum := sum - s;
        SumOF := True;
    end;
    if sum < 0 then
        SumSF := True;
    if sum = 0 then
        SumZF := True;
    SumWithSign := sum;
end;

function SubNoSign(x, y: integer; var fl: boolean): integer;
var
    sub: integer; 
begin
    sub := x - y;
    fl := False;
    if sub < 0 then begin
        sub := sub + s;
        fl := True;
    end;
    SubNoSign := sub;
end;    

function SubWithSign(x, y: integer; var SubOF, SubSF, SubZF: boolean): integer;
var
    sub: integer;
begin
    sub := x - y;
    SubOF := False;
    SubSF := False;
    SubZF := False;
    if sub < d then begin
        sub := s + sub;
        SubOF := True;
    end;
    if sub >= -d then begin
        sub := sub - s;
        SubOF := True;
    end;
    if sub < 0 then
        SubSF := True;
    if sub = 0 then
        SubZF := True;
    SubWithSign := sub;
end;

procedure Table;

procedure Walls(i, j: integer);
var
    k: integer;
begin
    for k := j to j + 7 do begin
        GotoXY(i, k);
        write('|');
    end;
end;

procedure FirstLines(j: integer);
var
    k: integer;
begin
    for k := 3 to 58 do begin
        GotoXY(k, j);
        write('-');
    end;
end;

procedure SecondLines(j: integer);
var
    k: integer;
begin
    for k := 3 to 81 do begin
        GotoXY(k ,j);
        write('-');
    end;
end;
begin
    FirstLines(6);
    FirstLines(9);
    FirstLines(11);
    FirstLines(13);
    Walls(3, 6);
    Walls(11, 6);
    Walls(31, 6);
    Walls(45, 6);
    Walls(59, 6);
    
    SecondLines(18);
    SecondLines(21);
    SecondLines(23);
    SecondLines(25);
    Walls(3, 18);
    Walls(14, 18);
    Walls(34, 18);
    Walls(48, 18);
    Walls(62, 18);
    Walls(67, 18);
    Walls(72, 18);
    Walls(77, 18);
    Walls(82, 18);
    
    GotoXY(5, 7); write('Числа');
    GotoXY(15, 7); write('В ячейке ЭВМ');
    GotoXY(33, 7); write('В 10-й с.c.');
    GotoXY(34, 8); write('без знака');
    GotoXY(47, 7); write('В 10-й с.с.');
    GotoXY(48, 8); write('со знаком');
    
    GotoXY(6, 10); write('№1');
    GotoXY(6, 12); write('№2');
    
    GotoXY(5, 19); write('Машинная');
    GotoXY(5, 20); write('операция');
    GotoXY(18, 19); write('В ячейке ЭВМ');
    GotoXY(36, 19); write('В 10-й с.с.');
    GotoXY(37, 20); write('без знака');
    GotoXY(50, 19); write('В 10-й с.с.');
    GotoXY(51, 20); write('со знаком');
    GotoXY(64, 19); write('CF');
    GotoXY(69, 19); write('OF');
    GotoXY(74, 19); write('SF');
    GotoXY(79, 19); write('ZF');
    
    GotoXY(6, 22); write('Сумма');
    GotoXY(5, 24); write('Разность');
    
end;

Procedure Values;
begin
    GotoXY(1, 1);
    write('Задайте размер ячейки памяти: ');
    readln(k);
    Borders(k, d, s);
    writeln('Представимы числа из [', d, '...', s-1, ']');
    write('Первое число: ');
    readln(x);
    write('Второе число: ');
    readln(y);
    GotoXY(14, 10); Transfer(x, num1);
    GotoXY(14, 12); Transfer(y, num2);
    GotoXY(36, 10); nx := NoSign(x); write(nx);
    GotoXY(36, 12); ny := NoSign(y); write(ny);
    GotoXY(50, 10); wx := WithSign(x); write(wx);
    GotoXY(50, 12); wy := WithSign(y); write(wy);
    GotoXY(16, 22); Summa(nx, ny, nums);
    GotoXY(16, 24); Subs(nx, ny, numm);
    GotoXY(38, 22); SumNS := SumNoSign(nx, ny, SumCF);
    write(SumNS, ' ', not(SumCF));
    GotoXY(38, 24); SubNS := SubNoSign(nx, ny, SubCF);
    write(SubNS, ' ', not(SubCF));
    GotoXY(52, 22); SumWS := SumWithSign(wx, wy, SumOF, SumSF, SumZF);
    write(SumWS, ' ', not(SumOF));
    GotoXY(52, 24); SubWS := SubWithSign(wx, wy, SubOF, SubSF, SubZF);
    write(SubWS, ' ', not(SubOF));
    GotoXY(64, 22); write(ord(SumCF));
    GotoXY(64, 24); write(ord(SubCF));
    GotoXY(69, 22); write(ord(SumOF));
    GotoXY(69, 24); write(ord(SubOF));
    GotoXY(74, 22); write(ord(SumSF));
    GotoXY(74, 24); write(ord(SubSF));
    GotoXY(79, 22); write(ord(SumZF));
    GotoXY(79, 24); write(ord(SubZF));
    
end;

begin
    e := 'y';
    while e <> 'n' do begin
        clrscr;
        Table;
        Values;
        GotoXY(50, 3);
        write('ЕЩЕ?(n\y)');
        read(e);
    end;
end.
