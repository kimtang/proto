
/ proto:localhost:8888::

\l unparse.q

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
