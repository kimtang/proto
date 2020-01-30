/ proto:localhost:8888::

\l unparse.q
\l proto.q


{@[`.;key x;:;value x]} .proto

"big numbers"

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
