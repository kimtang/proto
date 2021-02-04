args:.Q.def[`name`port!("dontcare.q";7766);].Q.opt .z.x

/ remove this line when using in production
/ dontcare.q:localhost:7766::
{ if[not x=0; @[x;"\\\\";()]]; value"\\p 7766"; } @[hopen;`:localhost:7766;0];

\l unparse.q
\l proto.q

{@[`.;key x;:;value x]} .proto

"big numbers"

m:()!()


prote[m;m;b:.Q.s1 (`a`b`c`d,1)!1 2 3,4 4f] []
prote[m;m;b:.Q.s1 `a`b`c`d!1 2 3,4f] []
prote[m;m;b:"([]a:1 2 3)" ] []
prote[m;m;b:"{1+1}" ] []
prote[m;m;b:"a:1;b:2" ] []

(::)o:odefine[`Colon;{[x;y]show .Q.s1 (x;y);x set y;y}]()!()

prote[m;o;b:"a:1;b:2" ] []

b

`a`o`exn set' (m;m;b)

prote:{[a;o;exn]
	d:`arg`exn`a`o!(1#`x;exn;a;o);proto0[count d`arg][d]  
 }

x0:(::)
{[d;x0]
 data:((::),d[`arg])!(::;x0);
 proto_[d`a;d`o;d`exn;data]
 } 

`a`o`exn`data set' (d`a;d`o;d`exn;data)

proto_:{[a;o;exn;data]
 exn:untree@'$[";"~first exn ;1 _;enlist[(+;0;1);]] exn:parse exn;
 exn 1
 exn:{update e:first each e from x where ((0h=type@'e) and (1={@[count;x;0]}@'e) and (11h=abs {type first x}@'e)) or (11h=type@'e) and 1=count@'e } @'exn;
 l:enlist[data] , -1_exn;
 data:{[a;o;x;y] s[a;o]/[`data`u!(x;y)] `data}[a;o]/[l];
 res:
 (s[a;o] [`u`data!(last exn;data )])`u 
 [`u;0;`e];
 o:{x[y;`fnc]} .proto.operator0 lj ([nme:key o]fnc:value o);
 o[`Return] res
 }



.proto.operator:{[u;o]
 o:{if[not y in (0!.proto.operator0)`e;:y ] ;x[y;`fnc]} operator0 lj ([nme:key o]fnc:value o);
 update e:o@'e from u where g = max g,99h<type@'e
 }

s:{[a;o;x]
 data:x`data;
 u:x`u;
 u0:adata[u]data;
 u1:atom[u0;a];
 u2:operator[u1;o];
 e:(`g xgroup u2)[p0:max u2`p;`e];
 r:eval0 e;
 data:udata[o;data;e;r];
 u:update ind:ind[;0],p:p[;0],e:e[;0] from `g xgroup u2;
 u:delete g from update e:enlist r from u where g = p0;
 `u`data!(u;data)}

cns:{(til count r)!"J"$'r:reverse string x}
pnum:{(x+key y)!value y}
norm:{{sum pnum'[key x;cns@'value x]}/[x]}
plus:{norm x + y}
multiply:{ norm sum {(enlist sum x) ! enlist prd y}'[key r;value r:x cross y] }
return:{r:raze string 0^x(reverse til 1+max key x);e:@[parse;r;r];if[10h~type e;:e];$[e<0wj;e;r] }

(::)a:adefine[`float;cns] adefine[`long;cns]()!()
(::)o:odefine[`Return;return] odefine[`Plus;plus] odefine[`Multiply;multiply]()!()

p:proto[a;o]

p[{1+2*x}][1]
p[{b:a+x*2 + a:3*y;z+b+1}] . 1 7 8
p[{[a;b;c;d]b:c*a+a*2 + a:3*b;d+b+1}][1;2;3;4]
p[{2*1+x+y}][0wj - 1;0]

"Logger"

(::)o:odefine[`Colon;{[x;y]show .Q.s1 (x;y);y}]()!()
(::)r:proto[()!();o;{b:3+a:1+x;1+b}][1]

/

parse .Q.s1 `a`b`c`d!1 2 3,4f
q) (!;enlist `a`b`c`d;(enlist;1j;2j;3j;4f))
.Q.s1 enlist `a`b`c`d
",`a`b`c`d"
q) enlist `a`b`c`d

type l:parse "`a`b`c`d"
count l
0(enlist;0(enlist;enlist `a`b`c`d))


parse .Q.s1 1 2 3 4
1 2 3 4j
0 parse .Q.s1 1 2 3 4!1 2 3,4f
0 (!;1 2 3 4j;0(enlist;1j;2j;3j;4f))
