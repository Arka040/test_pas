{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Dop81(t1, output);
uses heaptrc;
type
    str = packed array [1..15] of char;
    list = ^node;
    node = record
        elem: str;
        next: list;
    end;
var
    name: str;
    L, pt: list;
    k, count, n: integer;
    t1: text;
    
procedure Clear;
var
    j: integer;
begin
    for j := 1 to 15 do
        name[j] := ' ';
end;
    
procedure Input;
var
    p: list;
    i, numero: integer;
begin
    read(n);
    if n > 15 then
        n := 15;
    numero := 1;
    L := nil;
    while not eof(t1) and (numero <= n) do begin
        Clear;
        i := 1;
        while not eoln(t1) do begin
            read(t1, name[i]);
            i := i + 1;
        end;
        writeln(numero, ' ', name);
        new(p);
        p^.next := nil;
        p^.elem := name;
        if L = nil then begin
            L := p;
            pt := L;
        end
        else begin
            pt^.next := p;
            pt := p;
        end;
        readln(t1);
        numero := numero + 1;
    end;
    pt^.next := L;
end;

procedure Delete(var L: list; per: integer);
var
    i, del: integer;
    p: list;
begin
    del := per;
    if per > n then
        del := per mod n;
    if del = 0 then
        del := n;
    count := 1;
    while n <> 1 do begin
        n := n - 1;
        for i := 1 to del - 1 do
            pt := pt^.next;
        writeln(count, '_', pt^.next^.elem);
        p := pt^.next;
        pt^.next := p^.next;
        dispose(p);
        count := count + 1;
    end;
    writeln(count, '_', pt^.elem);
    dispose(pt);
end;

begin
    writeln('Путнев Аркадий, Группа 110, Доп(Блок 8), Задание № 16-42');
    writeln;
    assign(t1, 'friends.txt');
    reset(t1);
    write('Введите количество человек (до 15): ');
    Input;
    write('Введите номер удаляемого: ');
    read(k);
    Delete(L, k);
    close(t1);
end.
