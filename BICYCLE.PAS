program bicycle;
uses graph, crt;
type
cycle = object
d, N, x, y, r: integer;
procedure Init(x1, y1, d1, N1: integer);
procedure DrawC;
procedure MoveF1(i: integer);virtual;
procedure MoveF2(i: integer);
constructor InitCon;
end;
shesternya = object(cycle)
procedure MoveF(t: integer);virtual;
constructor InitCon;
end;
sun = object
procedure Draw(j: integer);
procedure Clear(j: integer);
end;
procedure cycle.Init(x1, y1, d1, N1: integer);
begin
x:= x1;
y:= y1;
d:= d1;
N:= N1;
r:= round(d/2);
end;
procedure cycle.DrawC;
begin
circle(x, y, r);
end;
procedure cycle.MoveF1(i: integer);
var x1, y1, x2, y2: integer;
begin
x1:= round(r*sin((i*pi/N))+x);
y1:= round(-r*cos((i*pi/N))+y);
x2:= round(r*sin((i*pi/N+pi))+x);
y2:= round(-r*cos((i*pi/N+pi))+y);
line(x1, y1, x2, y2);
end;
procedure cycle.MoveF2(i: integer);
var x1, y1, x2, y2: integer;
begin
x1:= round(r*sin(((0.5+i)*pi/N))+x);
y1:= round(-r*cos(((0.5+i)*pi/N))+y);
x2:= round(r*sin(((0.5+i)*pi/N+pi))+x);
y2:= round(-r*cos(((0.5+i)*pi/N+pi))+y);
line(x1, y1, x2, y2);
end;
constructor cycle.InitCon;
begin
end;
procedure shesternya.MoveF(t: integer);
var x1, y1, x2, y2: integer;
begin
x1:= round(r*1.5*sin((t*pi/8))+x);
y1:= round(-r*1.5*cos((t*pi/8))+y);
x2:= round(r*1.5*sin((t*pi/8+pi))+x);
y2:= round(-r*1.5*cos((t*pi/8+pi))+y);
line(x1, y1, x2, y2);
end;
constructor shesternya.InitCon;
begin
end;
procedure sun.Draw(j: integer);
begin
circle(639-10*j, 1, 100);
setfillstyle(solidfill, yellow);
floodfill(639-9*j, 1, yellow);
end;
procedure sun.Clear(j: integer);
begin
setcolor(magenta);
circle(639-10*j, 1, 100);
setfillstyle(solidfill, magenta);
floodfill(639-9*j, 1, magenta);
setcolor(yellow);
end;

var gd, gm: integer;
d1, d2, d3, N: integer;
r1, r2, r3, i, j, t, time: integer;
x01, y01, x02,y02, x03, y03: integer;
k1, kx3, ky3, dx3, dy3, ds1: real;
flag: boolean;
arrow: char;
cycle1, cycle2, shest2: cycle;
shest1: shesternya;
sun1: sun;

begin
writeln('‚ўҐ¤ЁвҐ а §¬Ґа Є®«Ґб');
write('d1 = ');
readln(d1);
writeln('‚ўҐ¤ЁвҐ а §¬Ґа ўҐ¤®¬®© иҐбвҐа­Ё');
write('d2 = ');
readln(d2);
writeln('‚ўҐ¤ЁвҐ а §¬Ґа ўҐ¤гйҐ© иҐбвҐа­Ё');
write('d3 = ');
readln(d3);
writeln('‚ўҐ¤ЁвҐ Є®«ЁзҐбвў® бЇЁж');
write('N = ');
readln(N);
if d1 > 200 then
d1:= 200;
if d2 > round(d1*0.75) then
d2:= round(d1*0.75);
if d3 > round(d1*0.35) then
d3:= round(d1*0.35);
if d2 < round(d1*0.1) then
d2:= round(d1*0.1);
if d3 < round(d1*0.1) then
d3:= round(d1*0.1);
if N > 25 then
N:= 25;
if N = 0 then
N:= 1;
r1:= round(d1/2);
r2:= round(d2/2);
r3:= round(d3/2);
time:= 300;
k1:= 1.8;
kx3:= 0.7;
ky3:= 0.2;
ds1:= 1.8*d1;
dx3:= 0.7*d1;
dy3:= 0.2*d1;
x01:= 150;
y01:= 290;
if d1 < 60 then
y01:= 370;
x02:= round(x01 + ds1);
y02:= y01;
x03:= round(x01 + dx3);
y03:= round(y01 + dy3);
Initgraph(gd, gm, 'c:\tp\bgi');
setbkcolor(magenta);
setfillstyle(solidfill, lightred);
bar(1, 320, 640, 480);

cycle1.InitCon;
cycle2.InitCon;
shest2.InitCon;
shest1.InitCon;

setcolor(lightgray);
setlinestyle(0, 0, 3);
cycle1.Init(x01, y01, d1, N);
cycle1.DrawC;
cycle2.Init(x02, y02, d1, N);
cycle2.DrawC;
setlinestyle(0, 0, 1);
setcolor(darkgray);
shest2.Init(x01, y01, d2, N);
shest2.DrawC;
shest1.Init(x03, y03, d3, N);
shest1.DrawC;
setlinestyle(0, 0, 3);
{жҐЇм}
line(x01, y01+r2, x03, y03+r3);
line(x01, y01-r2, x03, y03-r3);
{а ¬ }
setcolor(lightcyan);
line(x01+r1, y01, round(x01+1.5*r1), y01);
line(round(x01+1.5*r1), y01, x02, round(y02-1.5*r1));
{аг«м}
setcolor(lightgreen);
line(x02, round(y02-1.5*r1), round(x02-0.5*r1), round(y02-1.5*r1));
line(x02, y02-r1, x02, round(y02-1.5*r1));
line(round(x02-0.5*r1), round(y02-1.5*r1), round(x02-0.7*r1), round(y02-1.65*r1));
setcolor(white);
line(round(x02-0.7*r1), round(y02-1.65*r1), round(x02-0.9*r1), round(y02-1.8*r1));
setcolor(yellow);
setlinestyle(0, 0, 1);
t:= 0;
setwritemode(xorput);
for j:= 0 to 65 do begin
for i:= 0 to N-1 do
begin
cycle1.MoveF1(i);
cycle2.MoveF1(i);
end;
shest1.MoveF(t);
sun1.Draw(j);
if time = 25 then
flag:= false
else
flag:= true;
arrow:= readkey;
case arrow of
#72: time:= time;
#75: time:= time + 25;
#77: time:= time - 25;
end;
if time <= 0 then
time:= time + 25;
if ((time = 25) and (flag = true)) or ((time > 25) and (flag = false)) then
begin
setcolor(white);
setwritemode(copyput);
line(round(x01-1.25*r1), y01, round(x01-2*r1), y01);
line(round(x01-1.25*r1), round(y01-0.4*r1), round(x01-2.5*r1), round(y01-0.4*r1));
line(round(x01-1.25*r1), round(y01+0.4*r1), round(x01-1.5*r1), round(y01+0.4*r1));
outtextXY(370, 100, 'New record!!!');
outtextXY(370, 110, 'Your speed is just like light!');
outtextXY(370, 120, 'V ~ C');
setcolor(yellow);
setwritemode(xorput);
end;
delay(time);
for i:=0 to N-1 do begin
cycle1.MoveF1(i);
cycle2.MoveF1(i);
end;
shest1.MoveF(t);
t:= t + 1;
for i:=0 to N-1 do begin
cycle1.MoveF2(i);
cycle2.MoveF2(i);
end;
shest1.MoveF(t);
delay(time);
for i:=0 to N-1 do begin
cycle1.MoveF2(i);
cycle2.MoveF2(i);
end;
shest1.MoveF(t);
sun1.Clear(j);
t:= t + 1;
end;
Closegraph;
end.