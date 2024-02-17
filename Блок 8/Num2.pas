{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Sesentaitres(output, t1, t2);
uses heaptrc;
type
    str = packed array [1..6] of char;
    list = ^node;
    node = record
        count: integer;
        elem: str;
        next: list;
    end;
    
var
    m: array [1..6] of list;
    L: list;
    c: str;
    i, j: integer;
    x: char;
    
procedure Input(var L: list);
var
    p: list;
begin
    if L = nil then begin
        new(L);
        L^.elem := c;
        L^.count := 1;
        L^.next := nil;
    end
    else begin
        if c > L^.elem then
            Input(L^.next)
        else 
            if c = L^.elem then
                L^.count := L^.count + 1
            else begin
                new(p);
                p^.next := L;
                p^.elem := c;
                p^.count := 1;
                L := p;
            end;
    end;
end;

procedure Print(var ls: list);
begin
    if ls <> nil then begin
        writeln(ls^.count, ' ', ls^.elem);
        Print(ls^.next);
    end;
end;

procedure Destroy(var L: list);
var
    p: list;
begin
    if L <> nil then begin
        p := L;
        L := L^.next;
        dispose(p);
        Destroy(L);
    end;
end;

begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 2');
    writeln;
    
    write('Вводите текст: ');
    for i := 1 to 6 do begin
        L := nil;
        m[i] := L;
    end;
    read(x);
    while x <> '.' do begin
        i := 1;
        for j := 1 to 6 do 
            c[j] := ' ';
        while (x <> ',') and (x <> '.') do begin
            c[i] := x;
            read(x);
            i := i + 1;
        end;
        Input(m[i - 1]);
        
        if x = ',' then
            read(x);
    end;
    for i := 1 to 6 do begin
        Print(m[i]);
        if m[i] <> nil then
            writeln;
    end;
    write('Введите длину строки (1-6) : ');
    read(i);
    if m[i] = nil then
        writeln('Empty')
    else
        Print(m[i]);
    for i := 1 to 6 do 
        Destroy(m[i]);
end.
