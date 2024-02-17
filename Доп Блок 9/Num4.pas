{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Dop91(t1, output);
uses heaptrc;
type
    // queue
    list = ^node;
    node = record
        elem: integer;
        next: list;
    end;
    queue = record
        head: list;
        tail: list;
    end;
var
    Q2, Q3, Q5: queue;
    k, n, x: integer;
    
procedure NewQueue(var Q: queue; i: integer);
var
    p: list;
begin
    Q.head := nil;
    Q.tail := nil;
    new(p);
    p^.elem := i;
    p^.next := nil;
    Q.head := p;
    Q.tail := p;
end;

procedure AddToQueue(var Q: queue; i: integer);
var
    p: list;
begin
    new(p);
    p^.elem := i;
    p^.next := nil;
    if Q.head = nil then
        Q.head := p
    else
        Q.tail^.next := p;
    Q.tail := p;
end;

procedure RemoveFromQueue(var Q: queue; var x: integer);
var
    p: list;
begin
    p := Q.head;
    x := p^.elem;
    Q.head := p^.next;
    dispose(p);
    if Q.head = nil then
        Q.tail := nil;
end;

function EmptyQueue(Q: queue): boolean;
begin
    EmptyQueue := Q.head = nil;
end;

begin
    writeln('Путнев Аркадий, Группа № 110, Блок 9 Задание 4');
    writeln;
    
    write('Введите число: ');
    read(n);
    NewQueue(Q2, 2);
    NewQueue(Q3, 3);
    NewQueue(Q5, 5);
    k := 0;
    while k <> n do begin
        k := k + 1;
        if (Q2.head^.elem = Q3.head^.elem) then
            RemoveFromQueue(Q3, x);
        if (Q2.head^.elem = Q5.head^.elem) then
            RemoveFromQueue(Q5, x);
        if (Q3.head^.elem = Q5.head^.elem) then
            RemoveFromQueue(Q5, x);
        if (Q2.head^.elem < Q3.head^.elem) and (Q2.head^.elem < Q5.head^.elem) then begin
            RemoveFromQueue(Q2, x);
            write(x, ' ');
        end
        else
            if (Q2.head^.elem > Q3.head^.elem) and (Q3.head^.elem < Q5.head^.elem) then begin
                RemoveFromQueue(Q3, x);
                write(x, ' ');
            end
            else begin
                RemoveFromQueue(Q5, x);
                write(x, ' ');
            end;
        AddToQueue(Q2, x*2);
        AddToQueue(Q3, x*3);
        AddToQueue(Q5, x*5);
    end;
    while not EmptyQueue(Q2) do
        RemoveFromQueue(Q2, x);
    while not EmptyQueue(Q3) do
        RemoveFromQueue(Q3, x);
    while not EmptyQueue(Q5) do
        RemoveFromQueue(Q5, x);
end.




