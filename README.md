Lab №3. Iteration Cycles
--------------------
***
#### Task:
![The task](https://i.imgur.com/ItIPmqT.png)

>The program displays a table with the values of the functions **f1** and **f2** for given x and determines the number of steps necessary to achieve the specified accuracies in the function 2

**Language**: Delphi

**Algorithm scheme**: ![Algorithm scheme](https://raw.githubusercontent.com/N1ghtF1re/lab3/master/algorithm_scheme.jpg)

**Code:**
```
program lab3;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var x,dx,f1,f2,z,epsilon,PrevTerm,CurrTerm,prevf2,coef,ecurrent:real;
k:integer;
j,ExecutionsNum,CurrentNum,steps:Byte;
begin
  x:=-0.6; // initial values
  ExecutionsNum:= 20; // number of function values to be found
  dx:= 0.05; // step
  CurrentNum:=1;

  writeln('------------------------------------------------------------------------');
  writeln('|       |        |     e=10^-2     |     e=10^-3     |     e=10^-4     |');
  writeln('|   x   |  f1(x) |------------------------------------------------------');
  writeln('|       |        |  f2(x) |   N    |  f2(x) |   N    |  f2(x) |   N    |');
  writeln('------------------------------------------------------------------------');

  while(CurrentNum <= ExecutionsNum) do
  begin

    z:=Sqrt(1+sqr(x));
    f1:=Ln(x+z)/z;  // get the value of the first function
    write('|',(Trunc(x*1E6)/1E6):7:2,'|',f1:8:4,'|');


    epsilon:=1E-2;
    f2:=x;
    PrevTerm:=x;
    ecurrent:=1;
    k:=1;
    steps:=1;
    coef:=(-1)*4*x*x;
    while(ecurrent>=1E-4) do
    begin
      CurrTerm:=PrevTerm*(k*k)*coef/((2*k+1)*2*k);
      prevf2:=f2;
      f2:=f2+CurrTerm;
      PrevTerm:=CurrTerm;
      ecurrent:=Abs(f2-prevf2);
      if (ecurrent < epsilon/10) and (steps<3) and (prevf2-f2 <> 0) then
      begin
        {
        If the current accuracy is already
        more than the accuracy of the next cell,
        the current cell is skipped
        }
        write('not achieved  ':17,'|');
        Inc(steps);
        if (ecurrent<1E-4) then
        begin
          {
          If required final accuracy already
          reached, then all previous blank
          cells are skipped
          }
          for j:=1 to (3-steps) do
             write('not achieved  ':17,'|');
          Inc(steps);
        end;
      end;
      if (prevf2-f2 = 0) then
        Write('The function does not change           |':54)
      else
      begin

        if((ecurrent < epsilon)) then
        begin
          write(f2:8:4,'|',(k+1):8,'|');
          epsilon:=epsilon/10;
          Inc(steps);
        end

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


```

