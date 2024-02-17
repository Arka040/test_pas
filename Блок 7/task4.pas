{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Sesenta(output, t1, t2);
uses heaptrc;
type 
    str = packed array[1..10] of char;
    stud = record { информация об одном студенте }
    fn: record fam, name: str end; { фамилия, имя }
    sex: (M,W); { пол: муж (M), жен (W) }
    marks: array[1..5] of 2..5 { пять оценок }
end;
    course = file of stud;
    
    TE = stud;
    list = ^node;
    node = record
        elem: TE;
        next: list;
    end;
    
    
var
    t2: text;
    t1: course;
    c, d: stud;
    L, temp: list;
    i: integer;


function analise(var c: stud): boolean;
var
    j: integer;
    fl, k4: boolean;
begin
    with c do begin
        fl := True;
        j := 1;
        while (j <= 5) and fl do begin
            if marks[j] < 4 then
                fl := False
            else
                if marks[j] = 4 then
                    k4 := True;
            j := j + 1;
        end;
    end;
    analise := fl = k4;
end;

procedure Append(var L: list; c: stud);
var
    p: list;
begin
    if L = nil then begin
        new(L);
        L^.elem := c;
        L^.next := nil;
    end
    else
        if c.fn.fam > L^.elem.fn.fam then
            Append(L^.next, c)
        else begin
            new(p);
            p^.elem := c;
            p^.next := L;
            L := p;
        end;
            
        
end;

procedure destroy(var L: list);
var
    p: List;
begin
    if L <> nil then begin  
        p := L;
        L := L^.next;
        dispose(p);
        destroy(L);
    end;
        
end;

begin
    assign(t1, 'course.bin');
    assign(t2, 'ans.txt');
    reset(t1);
    rewrite(t2);
    L := nil;
    while not eof(t1) do begin
        read(t1, c);
        if analise(c) then
            Append(L, c);
    end;
    temp := L;
    while temp <> nil do begin   
        d := temp^.elem;
        with d do begin
            write(t2, fn.fam, ' ', fn.name);
            if M = sex then
                write(t2, 'M', '    ')
            else
                write(t2, 'W', '    ');
            for i := 1 to 5 do
                write(t2, marks[i], ' ');
        end;
        writeln(t2);
        temp := temp^.next;
    end;
    close(t1);
    close(t2);
    destroy(L);
end.
