{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Dop92(t1, output);
uses heaptrc;
type
    // стек
    list = ^node;
    node = record
        count: integer;
        next: list;
    end;
    stack = list;
var
    S: stack;

procedure Numeration;
var
    c: char;
    i: integer;
    
procedure ClearStack(var S: stack);
begin
    S := nil;
end;

procedure AddToStack(var S: stack);
var 
    p: list;
begin
    new(p);
    p^.next := S;
    p^.count := i;
    S := p;
end;

begin
    ClearStack(S);
    i := 0;
    read(c);
    while c <> '.' do begin
        i := i + 1;
        if c = '(' then
            AddToStack(S);
        if c = ')' then
            write(S);
        
        
    end;    
end;
begin
    Numeration(S);
end.
