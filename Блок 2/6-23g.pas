{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Dieciseis(input, output);
var 
    x: char;
begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 6.23 (г)');
    writeln;
    
    write('Введите последовательность: ');
    read(x);
    while x <> '.' do begin
        if x = 'p' then begin
            read(x);
            if x = 'h'then begin 
                write('f');
                read(x);
            end
            else
                write('p');
        end
        else begin
            write(x);
            read(x);
        end;
    end;
                
    
            
end.
