
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

(::)x:parse"a+x*2 + a:x"

(::)data:((::),`x`y`a)!(::),1 3 4
(::)u:untree x

(::)u0:adata[u]data

(::)r:s[a;o]/[`u`data!(u;data)]
r[`u;0;`e]

(::)data:((::),`x`y`z)!(::),1 3 4
(::)f:get {b:a+x*2 + a:3*y;z+b+1}

(::)f:-1 _ 1 _ last f

/ "["~f 0
/ (::)f:(1+first where "]"=f) _ f

(::)exn:untree@'$[";"~exn 0 ;1 _;::] exn:parse f
(::)l:enlist[data] , -1_exn
(::)data:{[a;o;x;y] s[a;o]/[`data`u!(x;y)] `data}[a;o]/[l]
res:s[a;o]/[`u`data!(last exn;data )][`u;0;`e]
operator0[`Return;`fnc] res

f:{[x;y]b:a+x*2 + a:3*y;b+1}

p:proto[a;o]

p[f][1;7]
p[{1+x}][1]

p[{b:a+x*2 + a:3*y;z+b+1}] . 1 7 8

p[{[a;b;c;d]b:c*a+a*2 + a:3*b;d+b+1}]

p[{2*1+x+y}][0wj - 1;1]

/ linreg["y~~intercept:1,log x";data]

/

(::)data:((::),b[`arg])!(::),(1;3)

proto_[a;o;b`exn;data]

/

(::)n:(`g xgroup u)[max u`p;`e]

(::)r:$[not(:)~n[0];0 n;::]




/

operator:1!update tipe:type@'e,fnc:e from update e:(first first parse@)@'e from flip`e`nme!flip 2 cut ("a!b";`ExclamationMark;"a#b";`Number;"a$b";`Dollar;"a%b";`Procenttecken;"a&b";`Ampersand;"a+'b";`SingleQuote;"a*b";`Multiply;"a+b";`Plus;"a,b";`Comma;"a-b";`Hyphen;"a . b";`Dot;"a+/b";`Slash;"a:b";`Colon;"a<b";`LessThan;"a=b";`Equals;"a>b";`GreaterThan;"a?b";`QuestionMark;"a@b";`At;"a^b";`Caret;"a _ b";`Underscore;"a|b";`VerticalBar;"a~b";`Tilde;"a+/:b";`EachRight;"a+\\:b";`EachLeft;"a+':b";`EachPrior;"a::b";`GenericNull)

(::)atom0:1!update fnc:(::) from{`num xasc x,update num:abs num,tipe:`${(upper x[0]),1_x}@'string tipe from x}([]num:neg 2+til 18; tipe:`boolean`guid`byte`short`int`long`real`float`char`symbol`timestamp`month`date`datetime`timespan`minute`second`time)


(::)x:parse"x*3 2 + 3 4*y"

untree:{{update ind:i,p:(ind!i) p from raze {if[1=count x`e;:enlist x];if[100h>type first x`e;:enlist x]; update p:(p[0],1 _ ind) from ungroup enlist x} @'x}/[([]ind:til count x;p:0;e:x)]}

"big numbers"

cns:{(til count r)!"J"$'r:reverse string x}
pnum:{(x+key y)!value y}
norm:{{sum pnum'[key x;cns@'value x]}/[x]}
plus:{norm x + y}
multiply:{ norm sum {(enlist sum x) ! enlist prd y}'[key r;value r:x cross y] }


(::)x:parse"x*3+ 3*y"

(::)u:untree x

data:((::),`x`y)!(::),1 3

/ grouping step
(::)u:update g:@[ind;where p=max p;:;max p]from u

/ data step
(::)u:update e:data e from u where g = max g,{$[x;y;z]}'[-11h=type@'e;e;`]in\:key data

/ i need terminal here

adefine:{[k;f;op] ((enlist k)!enlist f),op}

/ .proto.define[`Asterisk;{}] .proto.define[`Plus;{}]()!()
/ .proto.define[`Asterisk;{}] .proto.define[`long;{}]()!()

/ terminal step

(::)a:adefine[`float;cns] adefine[`long;cns]()!()
atom1:{ atom0 lj ([tipe:key x]fnc:value x)}a
atom:{atom1["j"$type x;`fnc] x}
(::)u:update e:atom@'e from u where g = max g,100h>type@'e

/ operator step
odefine:{[k;f;op] ((enlist k)!enlist f),op}
(::)o:odefine[`Plus;plus] odefine[`Multiply;multiply]()!()
op1:{ operator lj ([nme:key x]fnc:value x)}o
op:{op1[x;`fnc]}

(::)u:update e:op@'e from u where g = max g,99h<type@'e
(::)n:(`g xgroup u)[max u`p;`e]

(::)r:$[not(:)~n[0];0 n;::]

\p

tree:{{select ind:ind[;0],p:p[;0],e:{$[1=count x;first x;x]}@'e from`g xgroup update g:@[ind;where p=max p;:;max p]from x}/[x] . 0,`e}

/


t:([]nme:`ExclamationMark`DoubleQuotes`Number`Dollar`Procenttecken`Ampersand`SingleQuote`OpenParenthesis`CloseParenthesis`Asterisk`Plus`Comma`Hyphen`Dot`Slash`Zero`One`Two`Three`Four`Five`Six`Seven`Eight`Nine`Colon`Semicolon`LessThan`Equals`GreaterThan`QuestionMark`At`UCA`UCB`UCC`UCD`UCE`UCF`UCG`UCH`UCI`UCJ`UCK`UCL`UCM`UCN`UCO`UCP`UCQ`UCR`UCS`UCT`UCU`UCV`UCW`UCX`UCY`UCZ`OpeningBracket`Backslash`ClosingBracket`Caret`Underscore`GraveAccent`LCA`LCB`LCC`LCD`LCE`LCF`LCG`LCH`LCI`LCJ`LCK`LCL`LCM`LCN`LCO`LCP`LCQ`LCR`LCS`LCT`LCU`LCV`LCW`LCX`LCY`LCZ`OpeningBrace`VerticalBar`ClosingBrace`Tilde;str:enlist@'"c"$33_til 127);

update t:`a from `t where str[;0]in .Q.A;
update t:`A from `t where str[;0]in .Q.A;
update t:`n from `t where str[;0]in .Q.n;

update e:@[parse;;`error]@'str from`t;


1!`t;

`t upsert (`EachRight;"/:";`;.[parse"a +/:b"]0 0 );
`t upsert (`EachLeft;"\\:";`;.[parse"a +\\:b"]0 0);
`t upsert (`EachPrior;"':";`;.[parse"a +':b"]0 0 );
`t upsert (`GenericNull;"::";` ;parse"::");

update tipe:type@'e from`t;

t:`e xkey t

op:select from t where tipe > 99h

s:`num xasc ([]num:neg 2+til 18; tipe:`boolean`guid`byte`short`int`long`real`float`char`symbol`timestamp`month`date`datetime`timespan`minute`second`time),([]num:2+til 18; tipe:`Boolean`Guid`Byte`Short`Int`Long`Real`Float`Char`Symbol`Timestamp`Month`Date`Datetime`Timespan`Minute`Second`Time)

update f:(::) from`s


/
(::)s:{([]num:"h"$x;t:("h"$x){.[$;(x;y);`error]}\:())}1+til 20
delete from `s where `error~'t
update e:1#'t,k:key@'t from `s
s
\

/
 100h is the boundary. Something below 99h (inclusive) is a data structure
 Something above is a function or operator.
 How to integrate user defined key words?
\


untree:{{update ind:i,p:(ind!i) p from raze {if[1=count x`e;:enlist x]; update p:(p[0],1 _ ind) from ungroup enlist x} @'x}/[([]ind:til count x;p:0;e:x)]}

tree:{{select ind:ind[;0],p:p[;0],e:{$[1=count x;first x;x]}@'e from`g xgroup update g:@[ind;where p=max p;:;max p]from x}/[x] . 0,`e}

(::)t0:parse "3 + (x+2)*(3 1+ x) "

(::)e:untree t0

"untree and tree should be the same"
t0~tree e

/ we need terminal to decide what to do, then redefine the operator then everything should be good
/
 Different terminal
 * numbers
 * variable like
\

/
 context should be a dictionary with special keywords from t or s
 better somehthing like
 .proto.define[`Asterisk;{}] .proto.define[`Plus;{}]()!()
 .proto.define[`Asterisk;{}] .proto.define[`long;{}]()!()
 create a list of possible terminals
\

context:()!()
(::)t1:untree t0
(::)data:(enlist`x)!(enlist 3)
(::)t1:update g:@[ind;where p=max p;:;max p] from t1

update t:type@'e from t1

update f::: from `s

s0:(!) . s`num`f

/ update from s0 where num = -7h

atom:{[context;data;e] s0[type e;e]}
operator:{[context;data;e] t[e;e]}
eval0:{[context;data;e]$[98h > type e;atom;operator][context;data;e]}

update e:eval0[context;data]@'e from t1 where p=max p
show""
/


/
eval0:{[context;data;e] $[98h > type e;atom;operator][context;data;e]}
atom:{[context;data;e] s[type e]e}
operator:{[context;data;e] t[e]}

update e:eval0[context;data;]@'e from t1 where g =  max p

/ atom or list

([]terminal:`boolean`guid`byte`short`int`long`real`float`char`symbol`timestamp`month`date`datetime`timespan`minute`second`time`sym)

/

update e:3 from `t1 where ind=8
update e:cns@'e from `t1 where p=6,-7h=type@'e
update e:enlist plus from `t1 where ind=6

0(`g xgroup update  g:@[ind;where p=max p;:;max p] from t1) . 6,`e



define:{[grammar;fnc;context]context}



parse "$[a;b;c;d]"


eval0:{[context;data;expression]}

tag:`bn

context:()!()
data:(enlist`x)!enlist 9876
expression:t0


/ now we need a framework to define a dsl

"big numbers"

cns:{(til count r)!"J"$'r:reverse string x}
pnum:{(x+key y)!value y}
norm:{{sum pnum'[key x;cns@'value x]}/[x]}

a:b:cns[8888]
(::)r:a+b

norm r

plus:{norm x + y}

multiply:{ norm sum {(enlist sum x) ! enlist prd y}'[key r;value r:x cross y] }

plus[a;b]

multiply[a;b]

e lj t





/

(::)expression:parse"x*y+2*x"

eval0:{[context;data;expression]}

evalList:{0 eval0@'x}

x:2;y:3

eval0@'expression

tag:`nb

/

/ here we have everything to implement proto

terminal

grammar

context

/

.unp.unp parse "x*y+2*x"

/

iv:{min ``tag`value in x}
tv:{``tag`value!(::;x;y)}
gv:{x`value}
gt:{x`tag}
bn:{tv[`bn]}





/

/ Define terminals
/ Define Grammar

arity:{``value_type`result_type!(::;x;type x)}


(::)r:parse "arity[3] + arity[2]"

select from t where p ~'r 0
