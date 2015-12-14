
/ remove this line when using in production
/ proto test:localhost:7777::


\l ..\qlib\util\util.q
\l ..\qlib\test\test.q
\l ..\proto.q

t0:.proto.untree parse "x*3 2 + 3 4*y"


t) 5bfd36c1-5fc7-8aab-127f-61c9d151e1f4
 Untree
 (::)
 7~count t0

t) 83d0e0d0-0390-883f-19dd-3dba00b023e6
 Parse vector as terminal
 (::)
 3 4~t0 . 5,`e

t1:.proto.untree parse "x*3 + 3*y"

t) 64572ff9-5853-89d3-d693-3920c0f4d861
 Single message
 (::)
 7~count t1

"big numbers"

cns:{(til count r)!"J"$'r:reverse string x}
pnum:{(x+key y)!value y}
norm:{{sum pnum'[key x;cns@'value x]}/[x]}
plus:{norm x + y}
multiply:{ norm sum {(enlist sum x) ! enlist prd y}'[key r;value r:x cross y] }
return:{r:raze string 0^x(reverse til 1+max key x);@[parse;r;r] }

a: .proto.adefine[`float;cns] .proto.adefine[`long;cns]()!()
o: .proto.odefine[`Return;return] .proto.odefine[`Plus;plus] .proto.odefine[`Multiply;multiply]()!()

x:parse"a+x*2 + a:3*y"
data:((::),`x`y)!(::),1 3
u:.proto.untree x

r:.proto.s[a;o]/[`u`data!(u;data)]
r[`u;0;`e]

t) 198d05c2-03a2-4ffd-7ae0-c52d534fb0e9
 Single message
 {x~0 1 ! 0 2}
 r[`u;0;`e]

p:.proto.proto[a;o]

t) 4557a328-fe80-41cd-b8b5-b492194b7375
 Single message
 {(~) . x}
 ((p;::)@\:{1+x})@\:1


t) b5da4947-70cd-40db-8f29-68a38cac99d6
 Single message
 {(~) . x}
 ((p;::)@\:{b:a+x*2 + a:3*y;b+1}).\:1 7

t) 87dca475-64d4-458f-a001-347b261eedb4
 Single message
 {(~) . x}
 ((p;::)@\:{b:a+x*2 + a:3*y;z+b+1}) . \: 1 2 3

t) 719d6a1f-0a14-4e41-9cb7-b25241c29aa9
 Single message
 {(~) . x}
 ((p;::)@\:{[a;b;c;d]b:c*a+a*2 + a:3*b;d+b+1}) . \: 1 2 3 4

t) f9ebd076-4a74-42c4-8b65-31cc00e4c11d
 Single message
 {(~) . x}
 ((p;::)@\:{[a;b;c;d;e]e+b:c*a+a*2 + a:3*b;d+b+1}) . \: 1 2 3 4 5

t) 8f68c533-8159-4d1e-9cde-578df91631f0
 Single message
 {(~) . x}
 ((p;::)@\:{[a;b;c;d;e;f]e:f+b:c*a+a*2 + a:3*b;e+d+b+1}) . \: 1 2 3 4 5 6

t) acf105c4-471b-46cf-9101-7fb3199b8f1f
 Single message
 {(~) . x}
 ((p;::)@\:{[a;b;c;d;e;f;g]e:f+b:c*a+a*2 + a:g*3*b;e+d+b+1}) . \: 1 2 3 4 5 6 7

.t.result[]
