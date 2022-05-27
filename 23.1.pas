const n=4;
const K=['0'..'9'];
const L=[1,3,5,7,8,10,12];
type date=record
	day:integer;
	mon:integer;
	year:integer end;
massive=array [1..n] of date;
var i, j, kr, vr: integer;
	m: massive;
	b,f,f1:boolean;
	c:char;	
procedure Reading;
var c, v:char; j:integer;
begin
	m[i].day:=0; m[i].mon:=0; m[i].year:=0;
	read(c); //первая цифра дня
	if not (c in K)then begin b:=true; exit end;
	m[i].day:=ord(c)-48;
	read(c); //вторая цифра дня ИЛИ точка
	if not (c in (K+['.'])) then begin b:=true; exit end;
	if c in K then begin m[i].day:=m[i].day*10+ord(c)-48; read(c) end;
	if (m[i].day>31) or (m[i].day<1) then begin b:=true; exit end;
	if not (c in ['.']) then begin b:=true; exit end
	else begin 
  //writeln(m[i].day);
		read(c); //первая цифра месяца
		if not (c in K)then begin b:=true; exit end;
		v:=c;
		m[i].mon:=ord(c)-48;
	//writeln(m[i].mon);
		read(c) end;//вторая цифра месяца ИЛИ точка
	if not (c in K+['.']) then begin b:=true; exit end;
	if (v in ['0','1'])  then  
	  if not (c in ['.']) then begin m[i].mon:=m[i].mon*10+ord(c)-48; read(c); end;
	if not (c in ['.']) then begin b:=true; exit end; 
	//считали точку
	//writeln(m[i].mon);
	if (not (m[i].mon in L) and (m[i].day = 31)) or (m[i].mon >=13) or (m[i].mon <=0) then begin b:=true; exit end;
	if (m[i].mon <=0) or (m[i].mon=2) and (m[i].day>=30) then begin b:=true; exit end;
	read(c); //считали первую цифру года
	if not (c in K) then begin b:=true; exit end;
	m[i].year:=ord(c)-48;
	//writeln(m[i].year);
	read(c); //считали вторую цифру года 
	if not (c in K) then begin b:=true; exit end
	else begin m[i].year:=m[i].year*10+ord(c)-48; read(c) end;	//3
	if not (c in K) then begin b:=true; exit end
	else begin m[i].year:=m[i].year*10+ord(c)-48; read(c) end;	//4
	if not (c in K) then begin b:=true; exit end
	else m[i].year:=m[i].year*10+ord(c)-48;
	//writeln(m[i].year);
	read (c)
end;
	
procedure Output;
var k:integer;
begin
	for k:=1 to n do begin
		write(m[k].day);
		write('.');
		write(m[k].mon);
		write('.');
		write(m[k].year); 
		write(' ') end;
		writeln
end;
		
procedure Comparison(var i:integer);
begin
	if m[i].year<m[i+1].year then f:=true
	else if (m[i].year=m[i+1].year) and (m[i].mon<m[i+1].mon) then f:=true
	else if (m[i].year=m[i+1].year) and (m[i].mon=m[i+1].mon) and (m[i].day<=m[i+1].day) then f:=true
	else f:=false
end;
procedure Comparison2 (var x,y,z,i:integer);
begin
	if m[i].year>z then f1:=true
	else if m[i].year<z then f1:=false
	else if (m[i].year=z) and (m[i].mon>y) then f1:=true
	else if (m[i].year=z) and (m[i].mon<y) then f1:=false
	else if (m[i].year=z) and (m[i].mon=y) and (m[i].day>x) then f1:=true
	else if (m[i].year=z) and (m[i].mon=y) and (m[i].day<=x) then f1:=false
end;

procedure Sorting;
var x,y,z,j,i:integer;
begin
	for j:=2 to n do 
	begin
		x:=m[j].day; y:=m[j].mon; z:=m[j].year;
		i:=j-1;
		Comparison2(x,y,z,i);
		while (i>0) and f1 do 
		begin
			m[i+1].day:=m[i].day; m[i+1].mon:=m[i].mon; m[i+1].year:=m[i].year;
			i:=i-1; 
			if (i>0) then Comparison2(x,y,z,i)
		end;
		if not ((m[i+1].day=x) and (m[i+1].mon=y) and (m[i+1].year=z)) then 
		begin
			m[i+1].day:=x; m[i+1].mon:=y; m[i+1].year:=z;
			Output 
		end
	end
end;
			
begin
	b:=false;
	kr:=0;
	for i:=1 to n do begin
		Reading;
		if b then begin writeln('Error'); exit end end;
	for i:=1 to n-1 do begin
		vr:=i;
		Comparison(vr);
		if f then kr:=kr+1
		else break end; 
	if kr<n-1 then Sorting
	else Output
end.		
		
	
	
