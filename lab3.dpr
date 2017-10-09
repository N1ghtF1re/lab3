program lab3;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var x, f1,f2:real;
N,i,a,b:integer;
stringx:string;
first:boolean;
begin
//x:=1.112131;

N:=123;
first:=false;
repeat
writeln('Enter the value of x. To exit, enter "N" or "None" or "Exit"');
readln(stringx);
Val(stringx,x,b);
if(b=0) then
begin
  if(first=false) then
  begin
    writeln('------------------------------------------------------------------------');
    writeln('|       |        |      e=10^2     |      e=10^3     |      e=10^4     |');
    writeln('|   x   |  f1(x) |------------------------------------------------------');
    writeln('|       |        |  f2(x) |   N    |  f2(x) |   N    |  f2(x) |   N    |');
    writeln('------------------------------------------------------------------------');
   end;
f1:=0;
f2:=0;

if (first=true) then
  writeln('------------------------------------------------------------------------');
first:=true;

write('|',x:7:3,'|',f1:8:3,'|');
for i:= 1 to 3 do begin
write(f2:8:3,'|',N:8,'|');
end;
writeln;
writeln('------------------------------------------------------------------------');
end;
until(b>0);

end.
 