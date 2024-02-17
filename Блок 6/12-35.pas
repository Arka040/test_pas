{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Cincuentaicinco(input, output);
const
    n = 10;
type
    r = array [1..n, 1..n] of boolean;
var
    Roads: r;
    first, last, i, j, k: integer;
    
function IsPath(var Roads: r; first, last: integer): boolean;
var
    Visited: array [1..n] of boolean;
    Way: array [1..n] of 0..n;
    Length, i: integer;
function IsPath1(t1, t2: integer): boolean;
var
    t: integer;
    fl: boolean;
begin
    if t1 = t2 then
        IsPath1 := True
    else begin
        t := 0;
        fl := False;
        repeat
            t := t + 1;
            if (Roads[t1, t] = True) and (Visited[t] = False) then begin
                Visited[t] := True;
                Length := Length + 1;
                Way[Length] := t;
                if IsPath1(t, t2) then
                    fl := True
                else
                    Length := Length - 1;
            end;
        until fl or (t = n);
        IsPath1 := fl;
    end;
end;
begin
    for i := 1 to n do begin
        Way[i] := 0;
        Visited[i] := false;
    end;
    Visited[first] := true;
    Way[1] := first;
    Length := 1;
    IsPath := IsPath1(first, last);
    
    i := 0;
    repeat
        i := i + 1;
        write(Way[i], ' ');
    until (i > n) or (Way[i] = last);
end;



begin
    for i := 1 to n do
        for j := 1 to n do 
            Roads[i, j] := false;
            
    k := 1;
    while (k <= n) do begin
        read(i , j);
        if (i = 0) or (j = 0) then
            k := n + 1
        else begin
            Roads[i, j] := True;
            Roads[j, i] := True;
            k := k + 1;
        end;
    end;
    write('Пиши Конец и начало: ');
    read(first, last);
    writeln(IsPath(Roads, first, last));
    writeln;
end.
    
    
