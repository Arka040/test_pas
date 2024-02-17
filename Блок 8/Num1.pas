{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Sesentaidos(output, t1, t2);
uses heaptrc;
type
    TE = char;
    list = ^node;
    node = record
        elem: TE;
        next: list;
    end;
var
    t1, t2: text;
    L, pt: list;
    ok: boolean;
procedure Create(var L: list; var ok: boolean);
var
    p: list;
    c: char;
begin
    L := nil;
    while not eoln(t1) do begin
        read(t1, c);
        
        new(p);
        p^.next := nil;
        p^.elem := c;
        ok := False;
        if L = nil then begin
            L := p;
            pt := L;
        end
        else begin
            pt^.next := p;
            pt := p;
        end;
    end;
    if c in ['1', '3', '5', '7', '9'] then
        ok := True;
end;

procedure Move(var L: list);
begin
    if L <> nil then begin
        write(t2, L^.elem);
        Move(L^.next);
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
    assign(t1, 'file1.txt');
    assign(t2, 'file2.txt');
    reset(t1);
    rewrite(t2);
    while not eof(t1) do begin
        if not eoln(t1) then begin
            Create(L, ok);
            if ok then begin
                Move(L);
                writeln(t2);
            end;
            Destroy(L);
        end;
        readln(t1);
    end;
    Destroy(L);
    close(t1);
    close(t2);
end.
