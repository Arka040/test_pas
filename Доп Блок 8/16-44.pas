{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Dop82(t1, t2, output);
uses heaptrc;
type
    list = ^node;
    node = record
        next: list;
        previous: list;
        elem: char;
    end;

var
    L: list;
    t1, t2: text;
    
procedure Add(var L: list);
var
    c: char;
    p, pt, q: list;
    count: integer;
    
procedure WriteInText(L: list);
begin
    if L <> nil then
        if L^.next <> nil then begin
            write(t2, L^.elem);
            WriteInText(L^.next);
        end
        else begin
            write(t2, L^.elem);
            writeln(t2);
        end;
end;    
    
begin
    L := nil;
    pt := L;
    while not eoln(t1) do begin
        read(t1, c);
        if L = nil then begin
            new(L);
            L^.next := nil;
            L^.previous := nil;
            L^.elem := c;
            pt := L;
        end
        else begin
            new(p);
            p^.previous := pt;
            p^.elem := c;
            p^.next := nil;
            pt^.next := p;
            pt := p;
        end;
    end;
    count := 0;
    while pt <> nil do begin
        if pt^.elem = '#' then begin
            count := count + 1;
            q := pt;
            if pt^.previous <> nil then
                pt^.previous^.next := pt^.next
            else
                L := pt^.next;
            if pt^.next <> nil then
                pt^.next^.previous := pt^.previous;
            pt := pt^.previous;
            dispose(q);
            
        end
        else begin
            if count > 0 then begin
                q := pt;
                if pt^.previous <> nil then
                    pt^.previous^.next := pt^.next
                else
                    L := pt^.next;
                if pt^.next <> nil then
                    pt^.next^.previous := pt^.previous;
                
                pt := pt^.previous;
                dispose(q);
                count := count - 1;
            end
            else
                pt := pt^.previous;
        end;
    end;
    WriteInText(L);
end;

procedure Destroy(var L: list);
var
    p: list;
begin
    
    if L <> nil then begin
        p := L;
        L := L^.next;
        dispose(p);
        destroy(L);
    end;
end;

begin
    assign(t1, 't1.txt');
    assign(t2, 't2.txt');
    reset(t1);
    rewrite(t2);
    while not eof(t1) do begin
        Add(L);
        Destroy(L);
        readln(t1);
    end;
    close(t1);
    close(t2);
end.
