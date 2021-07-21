Ò
C:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Application\Controllers\AccountController.cs
	namespace 	
FundTransfer
 
. 
Application "
." #
Controllers# .
{		 
[

 
ApiController

 
]

 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
AccountsController #
:$ %
ControllerBase& 4
{ 
private 
readonly #
IAccountQueryRepository 0
_accountRepository1 C
;C D
public 
AccountsController !
(! "#
IAccountQueryRepository" 9
accountRepository: K
)K L
{ 	
_accountRepository 
=  
accountRepository! 2
;2 3
} 	
[ 	
HttpGet	 
] 
[ 	 
ProducesResponseType	 
( 
( 
int "
)" #
HttpStatusCode# 1
.1 2
OK2 4
)4 5
]5 6
[ 	 
ProducesResponseType	 
( 
( 
int "
)" #
HttpStatusCode# 1
.1 2
	NoContent2 ;
); <
]< =
public 
async 
Task 
< 
IActionResult '
>' (
Get) ,
(, -
)- .
{ 	
var 
accounts 
= 
await  
_accountRepository! 3
.3 4
GetAll4 :
(: ;
); <
;< =
return 
Ok 
( 
accounts 
) 
;  
} 	
[ 	
HttpGet	 
( 
$str "
)" #
]# $
[ 	 
ProducesResponseType	 
( 
( 
int "
)" #
HttpStatusCode# 1
.1 2
OK2 4
)4 5
]5 6
[   	 
ProducesResponseType  	 
(   
(   
int   "
)  " #
HttpStatusCode  # 1
.  1 2
NotFound  2 :
)  : ;
]  ; <
public!! 
async!! 
Task!! 
<!! 
IActionResult!! '
>!!' (
Get!!) ,
(!!, -
string!!- 3
accountNumber!!4 A
)!!A B
{"" 	
var## 
account## 
=## 
await## 
_accountRepository##  2
.##2 3
GetByAccountNumber##3 E
(##E F
accountNumber##F S
)##S T
;##T U
return%% 
account%% 
.%% 
IsValid%% "
(%%" #
)%%# $
?&& 
Ok&& 
(&& 
account&& 
)&& 
:'' 
NotFound'' 
('' 
)'' 
;(( 
})) 	
}++ 
},, Í,
…C:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Application\Controllers\TransferOrderController.cs
	namespace

 	
FundTransfer


 
.

 
Application

 "
.

" #
Controllers

# .
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class "
FundTransferController '
:( )
ControllerBase* 8
{ 
private 
readonly  
TransferOrderService -
_service. 6
;6 7
public "
FundTransferController %
(% & 
TransferOrderService& :
service; B
)B C
{ 	
_service 
= 
service 
; 
} 	
[ 	
HttpPost	 
] 
[ 	 
ProducesResponseType	 
( 
( 
int "
)" #
HttpStatusCode# 1
.1 2
Created2 9
)9 :
]: ;
[ 	 
ProducesResponseType	 
( 
( 
int "
)" #
HttpStatusCode# 1
.1 2

BadRequest2 <
)< =
]= >
public 
async 
Task 
< 
IActionResult '
>' (
Post) -
(- .
[. /
FromBody/ 7
]7 8
TransferOrderDto9 I
orderDtoJ R
)R S
{ 	
var 
order 
= 
await 
_service &
.& '
CreateOrder' 2
(2 3
orderDto3 ;
); <
;< =
if 
( 
order 
. 
Status 
!= 
TransferOrderStatus  3
.3 4
Error4 9
.9 :
ToString: B
(B C
)C D
)D E
{ 
var   
response   
=   
new   "
{  # $
order  % *
.  * +
TransactionId  + 8
}  9 :
;  : ;
return!! 
CreatedAtAction!! &
(!!& '
nameof!!' -
(!!- .
Get!!. 1
)!!1 2
,!!2 3
response!!4 <
,!!< =
response!!> F
)!!F G
;!!G H
}"" 
return## 

BadRequest## 
(## 
order## #
)### $
;##$ %
}$$ 	
[&& 	
HttpGet&&	 
]&& 
['' 	 
ProducesResponseType''	 
('' 
('' 
int'' "
)''" #
HttpStatusCode''# 1
.''1 2
OK''2 4
)''4 5
]''5 6
[(( 	 
ProducesResponseType((	 
((( 
((( 
int(( "
)((" #
HttpStatusCode((# 1
.((1 2
	NoContent((2 ;
)((; <
]((< =
public)) 
async)) 
Task)) 
<)) 
IActionResult)) '
>))' (
Get))) ,
()), -
)))- .
{** 	
var++ 
orders++ 
=++ 
await++ 
_service++ '
.++' (
GetOrderStatus++( 6
(++6 7
)++7 8
;++8 9
return-- 
orders-- 
.-- 
Count-- 
(--  
)--  !
>--" #
$num--$ %
?.. 
Ok.. 
(.. 
orders.. 
... 
Select.. "
(.." #
order..# (
=>..) +
new.., /
{..0 1
order..2 7
...7 8
TransactionId..8 E
,..E F
order..G L
...L M
Status..M S
}..T U
)..U V
)..V W
:// 
	NoContent// 
(// 
)// 
;// 
}00 	
[22 	
HttpGet22	 
(22 
$str22 "
)22" #
]22# $
[33 	 
ProducesResponseType33	 
(33 
(33 
int33 "
)33" #
HttpStatusCode33# 1
.331 2
OK332 4
)334 5
]335 6
[44 	 
ProducesResponseType44	 
(44 
(44 
int44 "
)44" #
HttpStatusCode44# 1
.441 2
NotFound442 :
)44: ;
]44; <
public55 
async55 
Task55 
<55 
IActionResult55 '
>55' (
Get55) ,
(55, -
Guid55- 1
transactionId552 ?
)55? @
{66 	
var77 
order77 
=77 
await77 
_service77 &
.77& '
GetById77' .
(77. /
transactionId77/ <
)77< =
;77= >
return99 
order99 
.99 
Status99 
!=99  "
TransferOrderStatus99# 6
.996 7
Error997 <
.99< =
ToString99= E
(99E F
)99F G
?:: 
Ok:: 
(:: 
new:: 
{:: 
order::  
.::  !
TransactionId::! .
,::. /
order::0 5
.::5 6
Status::6 <
}::= >
)::> ?
:;; 
NotFound;; 
(;; 
new;; 
{;;  
order;;! &
.;;& '
ErrorMessage;;' 3
};;4 5
);;5 6
;;;6 7
}<< 	
}== 
}@@ œ
wC:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Application\Dtos\TransferOrderDto.cs
	namespace 	
FundTransfer
 
. 
Application "
." #
Dtos# '
{ 
public 

class 
TransferOrderDto !
{ 
[		 	
Required			 
(		 
AllowEmptyStrings		 #
=		$ %
false		& +
)		+ ,
,		, -
	MinLength		. 7
(		7 8
$num		8 9
)		9 :
]		: ;
public

 
string

 
SourceAccountNumber

 )
{

* +
get

, /
;

/ 0
init

1 5
;

5 6
}

7 8
[ 	
Required	 
( 
AllowEmptyStrings #
=$ %
false& +
)+ ,
,, -
	MinLength. 7
(7 8
$num8 9
)9 :
]: ;
public 
string $
DestinationAccountNumber .
{/ 0
get1 4
;4 5
init6 :
;: ;
}< =
[ 	
Required	 
, 
Range 
( 
$num 
, 
double "
." #
PositiveInfinity# 3
)3 4
]4 5
public 
decimal 
Value 
{ 
get "
;" #
init$ (
;( )
}* +
public 
bool 
IsValid 
( 
) 
{ 	
var 
sameAccountNumbers "
=# $
SourceAccountNumber% 8
.8 9
Equals9 ?
(? @$
DestinationAccountNumber@ X
)X Y
;Y Z
var 
sourceAccountValid "
=# $
false% *
.* +
Equals+ 1
(1 2
String2 8
.8 9
IsNullOrEmpty9 F
(F G
SourceAccountNumberG Z
)Z [
)[ \
;\ ]
var #
destinationAccountValud '
=( )
false* /
./ 0
Equals0 6
(6 7
String7 =
.= >
IsNullOrEmpty> K
(K L$
DestinationAccountNumberL d
)d e
)e f
;f g
var 

validValue 
= 
Value "
>=# %
Decimal& -
.- .
Zero. 2
;2 3
return 
! 
sameAccountNumbers &
&&' )
sourceAccountValid* <
&&= ?#
destinationAccountValud@ W
&&X Z

validValue[ e
;e f
} 	
public 
TransferOrder 
ToTransferOrder ,
(, -
)- .
{ 	
if 
( 
IsValid 
( 
) 
) 
return 
new 
TransferOrder (
(( )
)) *
{   
SourceAccountNumber!! '
=!!( )
SourceAccountNumber!!* =
,!!= >$
DestinationAccountNumber"" ,
=""- .
SourceAccountNumber""/ B
,""B C
Value## 
=## 
Value## !
,##! "
}$$ 
;$$ 
throw&& 
new&& 
ArgumentException&& '
(&&' (
$str&&( Y
)&&Y Z
;&&Z [
}'' 	
}(( 
})) Û
{C:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Application\Dtos\TransferOrderReadDto.cs
	namespace 	
FundTransfer
 
. 
Application "
." #
Dtos# '
{ 
public 

class  
TransferOrderReadDto %
{		 
public

 
Guid

 
TransactionId

 !
{

" #
get

$ '
;

' (
private

) 0
set

1 4
;

4 5
}

6 7
[ 	
EnumDataType	 
( 
typeof 
( 
TransferOrderStatus 0
)0 1
)1 2
]2 3
public 
string 
Status 
{ 
get "
;" #
init$ (
;( )
}* +
public 
string 
ErrorMessage "
{# $
get% (
;( )
init* .
;. /
}0 1
public  
TransferOrderReadDto #
(# $
string$ *
errorMessage+ 7
)7 8
{ 	
TransactionId 
= 
Guid  
.  !
Empty! &
;& '
Status 
= 
TransferOrderStatus (
.( )
Error) .
.. /
ToString/ 7
(7 8
)8 9
;9 :
ErrorMessage 
= 
errorMessage '
;' (
} 	
public  
TransferOrderReadDto #
(# $
TransferOrder$ 1
order2 7
)7 8
{ 	
TransactionId 
= 
order !
.! "
TransactionId" /
;/ 0
Status 
= 
order 
. 
Status !
.! "
ToString" *
(* +
)+ ,
;, -
ErrorMessage 
= 
order  
.  !
ErrorMessage! -
;- .
} 	
} 
}   ÷
C:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Application\Migrations\20210716194004_Initial Migration.cs
	namespace 	
FundTransfer
 
. 
Application "
." #

Migrations# -
{ 
public 

partial 
class 
InitialMigration )
:* +
	Migration, 5
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{		 	
migrationBuilder

 
.

 
CreateTable

 (
(

( )
name 
: 
$str &
,& '
columns 
: 
table 
=> !
new" %
{ 
TransactionId !
=" #
table$ )
.) *
Column* 0
<0 1
Guid1 5
>5 6
(6 7
type7 ;
:; <
$str= C
,C D
nullableE M
:M N
falseO T
)T U
,U V
	CreatedAt 
= 
table  %
.% &
Column& ,
<, -
DateTime- 5
>5 6
(6 7
type7 ;
:; <
$str= Z
,Z [
nullable\ d
:d e
falsef k
)k l
,l m
	UpdatedAt 
= 
table  %
.% &
Column& ,
<, -
DateTime- 5
>5 6
(6 7
type7 ;
:; <
$str= Z
,Z [
nullable\ d
:d e
falsef k
)k l
,l m
SourceAccountNumber '
=( )
table* /
./ 0
Column0 6
<6 7
string7 =
>= >
(> ?
type? C
:C D
$strE K
,K L
nullableM U
:U V
falseW \
)\ ]
,] ^$
DestinationAccountNumber ,
=- .
table/ 4
.4 5
Column5 ;
<; <
string< B
>B C
(C D
typeD H
:H I
$strJ P
,P Q
nullableR Z
:Z [
false\ a
)a b
,b c
Value 
= 
table !
.! "
Column" (
<( )
decimal) 0
>0 1
(1 2
type2 6
:6 7
$str8 A
,A B
nullableC K
:K L
falseM R
)R S
,S T
Status 
= 
table "
." #
Column# )
<) *
int* -
>- .
(. /
type/ 3
:3 4
$str5 >
,> ?
nullable@ H
:H I
falseJ O
)O P
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 8
,8 9
x: ;
=>< >
x? @
.@ A
TransactionIdA N
)N O
;O P
} 
) 
; 
} 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{ 	
migrationBuilder 
. 
	DropTable &
(& '
name 
: 
$str &
)& '
;' (
}   	
}!! 
}"" ø
šC:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Application\Migrations\20210717224526_errorMessage for TransferOrder.cs
	namespace 	
FundTransfer
 
. 
Application "
." #

Migrations# -
{ 
public 

partial 
class (
errorMessageforTransferOrder 5
:6 7
	Migration8 A
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder		 
.		 
	AddColumn		 &
<		& '
string		' -
>		- .
(		. /
name

 
:

 
$str

 $
,

$ %
table 
: 
$str '
,' (
type 
: 
$str 
, 
nullable 
: 
true 
) 
;  
} 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{ 	
migrationBuilder 
. 

DropColumn '
(' (
name 
: 
$str $
,$ %
table 
: 
$str '
)' (
;( )
} 	
} 
} ë
iC:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Application\Program.cs
	namespace 	

AcessoTest
 
. 
FundTransfer !
.! "
Application" -
{ 
public		 

static		 
class		 
Program		 
{

 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
CreateHostBuilder 
( 
args "
)" #
. 

UseSerilog 
( 
) 
. 
Build 
( 
) 
. 
Run 
( 
) 
; 
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} ªF
C:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Application\Services\TransferOrderService.cs
	namespace 	
FundTransfer
 
. 
Application "
." #
Services# +
{ 
public 

class  
TransferOrderService %
{ 
private 
readonly #
IAccountQueryRepository 0
_accountQuerier1 @
;@ A
private 
readonly +
ITransferOrderCommandRepository 8
_orderCommander9 H
;H I
private 
readonly )
ITransferOrderQueryRepository 6
_orderQuerier7 D
;D E
private 
readonly 
ILogger  
<  ! 
TransferOrderService! 5
>5 6
_logger7 >
;> ?
public  
TransferOrderService #
(# $#
IAccountQueryRepository #
accountQuerier$ 2
,2 3+
ITransferOrderCommandRepository +
orderCommander, :
,: ;)
ITransferOrderQueryRepository )
orderQuerier* 6
,6 7
ILogger 
<  
TransferOrderService (
>( )
logger* 0
)0 1
{ 	
_accountQuerier 
= 
accountQuerier ,
;, -
_orderCommander 
= 
orderCommander ,
;, -
_orderQuerier 
= 
orderQuerier (
;( )
_logger   
=   
logger   
;   
}!! 	
public## 
async## 
Task## 
<## 
IEnumerable## %
<##% & 
TransferOrderReadDto##& :
>##: ;
>##; <
GetOrderStatus##= K
(##K L
)##L M
{$$ 	
var%% 
orders%% 
=%% 
await%% 
_orderQuerier%% ,
.%%, -
GetAll%%- 3
(%%3 4
)%%4 5
;%%5 6
var&& 

readOrders&& 
=&& 
orders&& #
.&&# $
Select&&$ *
(&&* +
order&&+ 0
=>&&1 3
new&&4 7 
TransferOrderReadDto&&8 L
(&&L M
order&&M R
)&&R S
)&&S T
;&&T U
return(( 

readOrders(( 
;(( 
})) 	
public++ 
async++ 
Task++ 
<++  
TransferOrderReadDto++ .
>++. /
GetById++0 7
<++7 8
T++8 9
>++9 :
(++: ;
T++; <
orderId++= D
)++D E
{,, 	
var-- 
order-- 
=-- 
await-- 
_orderQuerier-- +
.--+ ,
GetById--, 3
(--3 4
orderId--4 ;
)--; <
;--< =
var// 
orderDto// 
=// 
order//  
is//! #
not//$ '
null//( ,
?00 
new00  
TransferOrderReadDto00 *
(00* +
order00+ 0
)000 1
:11 
new11  
TransferOrderReadDto11 *
(11* +
$str11+ J
)11J K
;11K L
return33 
orderDto33 
;33 
}44 	
public66 
async66 
Task66 
<66  
TransferOrderReadDto66 .
>66. /
CreateOrder660 ;
(66; <
TransferOrderDto66< L
orderDto66M U
)66U V
{77 	
try88 
{99 
TransferOrder:: 
order:: #
=::$ %
orderDto::& .
.::. /
ToTransferOrder::/ >
(::> ?
)::? @
;::@ A
var;; 
result;; 
=;; 
await;; "
ValidateOrder;;# 0
(;;0 1
order;;1 6
);;6 7
;;;7 8
var<< 
readDto<< 
=<< 
new<< ! 
TransferOrderReadDto<<" 6
(<<6 7
order<<7 <
)<<< =
;<<= >
if>> 
(>> 
result>> 
is>> 
false>> #
)>># $
{?? 
var@@ 
errorMsg@@  
=@@! "
$"@@# %
$str@@% Q
{@@Q R
order@@R W
.@@W X
TransactionId@@X e
}@@e f
$str@@f h
{@@h i
order@@i n
.@@n o
ErrorMessage@@o {
}@@{ |
"@@| }
;@@} ~
_loggerAA 
.AA 
LogErrorAA $
(AA$ %
errorMsgAA% -
,AA- .
orderAA/ 4
.AA4 5
TransactionIdAA5 B
,AAB C
orderAAD I
.AAI J
ErrorMessageAAJ V
,AAV W
orderAAX ]
)AA] ^
;AA^ _
}BB 
returnDD 
readDtoDD 
;DD 
}FF 
catchGG 
(GG 
ArgumentExceptionGG $
aeGG% '
)GG' (
{HH 
_loggerII 
.II 
LogErrorII  
(II  !
aeII! #
,II# $
aeII% '
.II' (
MessageII( /
)II/ 0
;II0 1
returnJJ 
newJJ  
TransferOrderReadDtoJJ /
(JJ/ 0
aeJJ0 2
.JJ2 3
MessageJJ3 :
)JJ: ;
;JJ; <
}KK 
}LL 	
privateNN 
asyncNN 
TaskNN 
<NN 
boolNN 
>NN  
ValidateOrderNN! .
(NN. /
TransferOrderNN/ <
orderNN= B
)NNB C
{OO 	
varPP 
(PP 
sourcePP 
,PP 
destinationPP $
)PP$ %
=PP& '
awaitPP( -
GetOrderAccountsPP. >
(PP> ?
orderPP? D
)PPD E
;PPE F
ifRR 
(RR 
ValidAccountsRR 
(RR 
sourceRR $
,RR$ %
destinationRR& 1
)RR1 2
&&RR3 5
ValidTransferRR6 C
(RRC D
sourceRRD J
,RRJ K
orderRRL Q
)RRQ R
)RRR S
{SS 
awaitTT 
_orderCommanderTT %
.TT% &
CreateTT& ,
(TT, -
orderTT- 2
)TT2 3
;TT3 4
returnUU 
trueUU 
;UU 
}VV 
returnWW 
falseWW 
;WW 
}XX 	
privateZZ 
boolZZ 
ValidAccountsZZ "
(ZZ" #
AccountZZ# *
sourceZZ+ 1
,ZZ1 2
AccountZZ3 :
destinationZZ; F
)ZZF G
=>ZZH J
source[[ 
.[[ 
IsValid[[ 
([[ 
)[[ 
&&[[ 
destination[[  +
.[[+ ,
IsValid[[, 3
([[3 4
)[[4 5
;[[5 6
private]] 
bool]] 
ValidTransfer]] "
(]]" #
Account]]# *
sourceAccount]]+ 8
,]]8 9
TransferOrder]]: G
order]]H M
)]]M N
=>]]O Q
sourceAccount^^ 
.^^ 
Balance^^ !
>=^^" $
order^^% *
.^^* +
Value^^+ 0
;^^0 1
private`` 
async`` 
Task`` 
<`` 
(`` 
Account`` #
sourceAccount``$ 1
,``1 2
Account``3 :
destinationAccount``; M
)``M N
>``N O
GetOrderAccounts``P `
(``` a
TransferOrder``a n
orderDto``o w
)``w x
{aa 	
ifbb 
(bb 
orderDtobb 
.bb 
IsValidbb  
(bb  !
)bb! "
)bb" #
{cc 
vardd 
sourceAccountNumberdd '
=dd( )
orderDtodd* 2
.dd2 3
SourceAccountNumberdd3 F
;ddF G
varee 
sourceAccountee !
=ee" #
awaitee$ )
_accountQuerieree* 9
.ee9 :
GetByAccountNumberee: L
(eeL M
sourceAccountNumbereeM `
)ee` a
;eea b
vargg $
destinationAccountNumbergg ,
=gg- .
orderDtogg/ 7
.gg7 8$
DestinationAccountNumbergg8 P
;ggP Q
varhh 
destinationAccounthh &
=hh' (
awaithh) .
_accountQuerierhh/ >
.hh> ?
GetByAccountNumberhh? Q
(hhQ R$
destinationAccountNumberhhR j
)hhj k
;hhk l
returnjj 
(jj 
sourceAccountjj %
,jj% &
destinationAccountjj' 9
)jj9 :
;jj: ;
}kk 
throwll 
newll 
ArgumentExceptionll '
(ll' (
orderDtoll( 0
.ll0 1
ErrorMessagell1 =
)ll= >
;ll> ?
}mm 	
}nn 
}oo Ç'
iC:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Application\Startup.cs
	namespace 	

AcessoTest
 
. 
FundTransfer !
.! "
Application" -
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{ 	
services 
. 
AddControllers #
(# $
)$ %
. 
AddJsonOptions 
(  
options  '
=>( *
options 
. !
JsonSerializerOptions 1
.1 2

Converters2 <
.< =
Add= @
(@ A
newA D#
JsonStringEnumConverterE \
(\ ]
)] ^
)^ _
)   
;   
services## 
.## 
AddApplicationInfra## (
(##( )
Configuration##) 6
)##6 7
;##7 8
services$$ 
.$$ 
	AddScoped$$ 
<$$  
TransferOrderService$$ 3
>$$3 4
($$4 5
)$$5 6
;$$6 7
services&& 
.&& 
AddSwaggerGen&& "
(&&" #
c&&# $
=>&&% '
{'' 
c(( 
.(( 

SwaggerDoc(( 
((( 
$str(( !
,((! "
new((# &
OpenApiInfo((' 2
{((3 4
Title((5 :
=((; <
$str((= W
,((W X
Version((Y `
=((a b
$str((c g
}((h i
)((i j
;((j k
})) 
))) 
;)) 
}** 	
public-- 
void-- 
	Configure-- 
(-- 
IApplicationBuilder-- 1
app--2 5
,--5 6
IWebHostEnvironment--7 J
env--K N
,--N O
ILoggerFactory--P ^
loggerFactory--_ l
,--l m
IConfiguration--n |
configuration	--} Š
,
--Š ‹!
FundTransferContext
--Œ Ÿ
context
--  §
)
--§ ¨
{.. 	
if// 
(// 
context// 
.// 
Database//  
.//  !

CanConnect//! +
(//+ ,
)//, -
)//- .
{00 
context11 
.11 
Database11  
.11  !
Migrate11! (
(11( )
)11) *
;11* +
}22 
Log44 
.44 
Logger44 
=44 
new44 
LoggerConfiguration44 0
(440 1
)441 2
.55 
ReadFrom55 
.55 
Configuration55 '
(55' (
configuration55( 5
)555 6
.66 
Enrich66 
.66 
FromLogContext66 &
(66& '
)66' (
.77 
WriteTo77 
.77 

PostgreSQL77 #
(77# $
configuration77$ 1
.771 2
GetConnectionString772 E
(77E F
$str77F P
)77P Q
,77Q R
$str77S Y
,77Y Z
needAutoCreateTable77[ n
:77n o
true77p t
)77t u
.88 
CreateLogger88 
(88 
)88 
;88  
if:: 
(:: 
env:: 
.:: 
IsDevelopment:: !
(::! "
)::" #
)::# $
{;; 
app<< 
.<< %
UseDeveloperExceptionPage<< -
(<<- .
)<<. /
;<</ 0
app== 
.== 

UseSwagger== 
(== 
)==  
;==  !
app>> 
.>> 
UseSwaggerUI>>  
(>>  !
c>>! "
=>>># %
c>>& '
.>>' (
SwaggerEndpoint>>( 7
(>>7 8
$str>>8 R
,>>R S
$str>>T q
)>>q r
)>>r s
;>>s t
}?? 
appAA 
.AA 
UseHttpsRedirectionAA #
(AA# $
)AA$ %
;AA% &
appCC 
.CC 

UseRoutingCC 
(CC 
)CC 
;CC 
appEE 
.EE 
UseAuthorizationEE  
(EE  !
)EE! "
;EE" #
appGG 
.GG 
UseEndpointsGG 
(GG 
	endpointsGG &
=>GG' )
{HH 
	endpointsII 
.II 
MapControllersII (
(II( )
)II) *
;II* +
}JJ 
)JJ 
;JJ 
}KK 	
}LL 
}MM 