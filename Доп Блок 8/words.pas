{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Dop83(t1, output);
uses heaptrc;
type
    list = ^node1;
    node1 = record
        elem: char;
        next: list;
    end;
    words = ^node2;
    node2 = record
        elem: list;
        next: words;
    end;
    
var
    t1: text;
    L: list;
    W: words;
    length: integer;
    
    
procedure ReadWord(var L: list);
var
    c: char;
    p, pt: list;
begin
    L := nil;
    length := 0;
    while not eoln(t1) do begin
        read(t1, c);
        length := length + 1;
        new(p);
        p^.elem := c;
        p^.next := nil;
        if L = nil then begin
            L := p;
            pt := L;
        end
        else begin
            pt^.next := p;
            pt := p; 
        end;
    end;
end;

procedure Print(L: list);
begin
    if L <> nil then begin
        write(L^.elem);
        Print(L^.next);
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
    assign(t1, 'words.txt');
    reset(t1);
    
    while not eof(t1) do begin
        ReadWord(L);
        Print(L);
        Destroy(L);
        writeln;
        readln(t1);
    end;
    close(t1);
end.
