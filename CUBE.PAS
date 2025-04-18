Program Three_Dimensional;

Uses Crt,Graph;

Type
  pair = array[1..2] of integer;

Var
  P:array[1..3,1..8] of real;
  T:array[1..3,1..3] of real;
  G:array[1..3,1..8] of real;
  d:array[1..8] of pair;
  Xr,Yr,Zr:real;
  Graphdriver,Graphmode:integer;
  Centerx,Centery:real;

  Procedure Set_P;
  Begin
    P[1,1] :=  1.0;
    P[2,1] :=  1.0;
    P[3,1] :=  1.0;
    P[1,2] := -1.0;
    P[2,2] :=  1.0;
    P[3,2] :=  1.0;
    P[1,3] := -1.0;
    P[2,3] := -1.0;
    P[3,3] :=  1.0;
    P[1,4] :=  1.0;
    P[2,4] := -1.0;
    P[3,4] :=  1.0;
    P[1,5] :=  1.0;
    P[2,5] :=  1.0;
    P[3,5] := -1.0;
    P[1,6] := -1.0;
    P[2,6] :=  1.0;
    P[3,6] := -1.0;
    P[1,7] := -1.0;
    P[2,7] := -1.0;
    P[3,7] := -1.0;
    P[1,8] :=  1.0;
    P[2,8] := -1.0;
    P[3,8] := -1.0;
  End;

  Procedure Set_T;
  Begin
    T[1,1] :=  Cos(zr)*Cos(yr);
    T[1,2] :=  Cos(zr)*Sin(yr)*Sin(xr)-Sin(zr)*Cos(xr);
    T[1,3] :=  Cos(zr)*Sin(yr)*Cos(xr)+Sin(zr)*Sin(xr);
    T[2,1] :=  Cos(yr)*Sin(zr);
    T[2,2] :=  Sin(zr)*Sin(yr)*Sin(xr)+Cos(zr)*Cos(xr);
    T[2,3] :=  Sin(zr)*Sin(yr)*Cos(xr)-Cos(zr)*Sin(xr);
    T[3,1] :=  -Sin(yr);
    T[3,2] :=  Cos(yr)*Sin(xr);
    T[3,3] :=  Cos(yr)*Cos(xr);
  End;

  Procedure Generate_G;
    Var I,J,K:Integer;
    S:real;
    Begin
      For I:= 1 to 3 do
      Begin
        For J:= 1 to 8 do
          Begin
            S:=0;
            For K:= 1 to 3 do
              S:= T[I,K]*P[K,J] + S;
            G[I,J]:=S;
          End;
      End;
    End;

    Procedure Graph_Set;
    Begin
      Graphdriver:=detect;
      InitGraph(Graphdriver,Graphmode,'c:\usr\tp\bgi');
      Centerx:=Round(Getmaxx/2);
      Centery:=Round(Getmaxy/2);
    End;

    Procedure Graphing;
    var a,b,c,iter,
    xp,yp,I,k,j:integer;
    xi,yi:real;
    forecolor:integer;
    backcolor:integer;
    Begin
      iter:=0;
      forecolor:=9;
      backcolor:=8;
      j:=0;
      k:=75;
      xi:=0.5;
      yi:=0.5;
      setbkcolor(0);
      setlinestyle(0,0,0);
      Repeat
      for a:= 0 to 360 do
      begin
        xr:=(a/360)*3.14159*2;
        yr:=(a/360)*3.14159*2;
        zr:=(a/360)*3.14159*2;
        setcolor(forecolor);
        For I:= 1 to 8 do
          Begin
            centery:=centery+yi;
            {was 125}
            if centery<60 then yi:=0.25;
            {was 360}
            if centery>425 then yi:=-0.25;
            centerx:=centerx+xi;
            {was 500}
            if centerx>=600 then xi:=-0.25;
            {was 125}
            if centerx<=60 then xi:=0.25;
            xp:=round( G[1,I]*k+centerx);
            yp:=round(-G[2,I]*k+centery);
            D[I,1]:=xp;
            D[I,2]:=yp;
          end;
        For I:= 1 to 3 do
          Line(d[I,1],d[I,2],d[I+1,1],d[I+1,2]);
        Line(d[1,1],d[1,2],d[4,1],d[4,2]);
        For I:= 5 to 7 do
          Line(d[I,1],d[I,2],d[I+1,1],d[I+1,2]);
        Line(d[5,1],d[5,2],d[8,1],d[8,2]);
        For I:= 1 to 4 do
          Line(d[I,1],d[I,2],d[I+4,1],d[I+4,2]);

        Set_t;
        Generate_g;
        Delay(5);

        setcolor(backcolor);
        For I:= 1 to 3 do
          Line(d[I,1],d[I,2],d[I+1,1],d[I+1,2]);
        Line(d[1,1],d[1,2],d[4,1],d[4,2]);
        For I:= 5 to 7 do
          Line(d[I,1],d[I,2],d[I+1,1],d[I+1,2]);
        Line(d[5,1],d[5,2],d[8,1],d[8,2]);
        For I:= 1 to 4 do
          Line(d[I,1],d[I,2],d[I+4,1],d[I+4,2]);

        iter:=iter+1;
        if iter=1000 then
          begin
            iter:=0;
            backcolor:=backcolor+1;
          end;
      end;
      Until Keypressed;
    End;

Begin
  Clrscr;
  xr:= (xr/360)*3.14159*2;
  yr:= (yr/360)*3.14159*2;
  zr:= (zr/360)*3.14159*2;
  Set_P;
  Set_T;
  Generate_G;
  Graph_set;
  SetBkColor(15);
  Graphing;
  Restorecrtmode;
End.
