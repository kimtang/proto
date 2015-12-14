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
/
/ (::)o:odefine[`Colon;{[x;y]show .Q.s1 (x;y);y}]()!()
(::)o:odefine[`Colon;{[x;y]show .Q.s1 (x;y);y}] odefine[`Plus;{[x;y]x+y}]()!()
(::)o: odefine[`Plus;{[x;y]x+y}]()!()
(::)r:proto[()!();o;{b:3+a:1+x;1+b}][1]


/
{
  [a:()!();o;f:{a:1+x;a}]
  d:getb[f],`a`o!(a;o);
  proto0[count d`arg][d]
 }

proto0[1]:{
  [d;x0:1]
  data:((::),d[`arg])!(::;x0);
  proto_[d`a;d`o;d`exn;data]
 }

proto_:{[a;o;exn;data]
 [a:d`a;o:d`o;exn:d`exn;data]
 exn:untree@'$[";"~first exn ;1 _;enlist[(+;0;1);]] exn:parse exn;
 l:enlist[data] , -1_exn;
 data:{[a;o;x;y]
  s[a;o][x:`data`u!(l 0;l 1)]
  `data}[a;o]/[l];
 res:s[a;o]/[`u`data!(last exn;data )] [`u;0;`e];
 o:{x[y;`fnc]} .proto.operator0 lj ([nme:key o]fnc:value o);
 o[`Return] res
 }


{[a;o;x]
  data:x`data;u:x`u;
 u0:adata[u]data;

 {[u;data] update e:data e from
  update e:data e from addg[u] where not prev(:)~'e,g = max g,{$[x;y;z]}'[-11h=type@'e;e;`]in\:key data
}

meta addg[u]

 u1:atom[u0;a];
 u2:operator[u1;o];
 e:(`g xgroup u2)[max u2`p;`e];
 r:eval0 e;
 data:udata[o;data;e;r];
 u:update ind:ind[;0],p:p[;0],e:e[;0] from `g xgroup u2;
 u:delete g from update e:enlist r from u where g = max g;
 `u`data!(u;data)}



