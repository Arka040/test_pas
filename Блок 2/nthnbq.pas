{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program lepglgpr(input, output);
var
    x, y: char;
begin
    read(x);
    while x <> '.' do begin
        if (x = 'G') or (x = 'T') then begin
            y := x;
            read(x);
            if x = 'O' then begin
                read(x);
            end
            else 
                write(y);
        end
        else begin
            write(x);
            read(x);
        end;
    end;
end.
