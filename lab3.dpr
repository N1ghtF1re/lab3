program lab3;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var x,dx,f1,f2,z,e,epsilon,prev,f2frac,ecurrent:real;
N:integer;
i,ExecutionsNum,CurrentNum,k:Byte;
begin
  x:=-0.6; // initial values
  ExecutionsNum:= 20; // number of function values to be found
  dx:= 0.05; // step
  CurrentNum:=1;
  e:=dx/1000;
  writeln('------------------------------------------------------------------------');
  writeln('|       |        |      e=10^2     |      e=10^3     |      e=10^4     |');
  writeln('|   x   |  f1(x) |------------------------------------------------------');
  writeln('|       |        |  f2(x) |   N    |  f2(x) |   N    |  f2(x) |   N    |');
  writeln('------------------------------------------------------------------------');

  while(CurrentNum <= ExecutionsNum) do
  begin

    f2:=0;

    z:=Sqrt(1+sqr(x));

    f1:=Ln(x+z)/z;
    write('|',x:7:2,'|',f1:8:3,'|');

    epsilon:=1E-2;
    N:=0;
    f2:=x;
    ecurrent:=1;
    k:=1;
    while(ecurrent>=1E-4) do
    begin

      f2frac:=((-1)*4*k*k*x*x)/((2*k+1)*2*k);
      prev:=f2;
      f2:=f2+f2*f2frac;
      ecurrent:=Abs(f2-prev);
      if (prev-f2 = 0) then Write('     The function does not change')
      else begin

        if(ecurrent < epsilon) then
        begin
          //Writeln('f2 = ', f2, 'epsilon = ', ecurrent, '/', epsilon);
          write(f2:8:3,'|',k:8,'|');
          epsilon:=epsilon/10;
        end;
      end;
      inc(k);
    end;
    writeln;
    writeln('------------------------------------------------------------------------');
    x:=x+dx;
    Inc(CurrentNum);
  end;
  Writeln;
  Writeln;
  Writeln('Press Enter to exit.');
  Readln;
end.
