{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Seis(output, input);
var
    A, B, C, F: boolean;
begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 5.39');
    writeln;
    
    writeln('------------------------');
    writeln('A':4, 'B':6, 'C':6, 'F':6);
    writeln('------------------------');
    for A := true downto false do begin
        for B := true downto false do begin
            for C := True downto False do begin
                F := (A and B) or not (B or C);
                writeln(A:5, ' ', B:5, ' ', C:5, ' ', F:5);
            end;
        end;
    end;
end.
