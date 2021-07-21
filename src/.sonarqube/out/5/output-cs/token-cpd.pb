ó
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
;C D
private 
readonly 
ILogger  
_logger! (
;( )
public 
AccountsController !
(! "#
IAccountQueryRepository" 9
accountRepository: K
,K L
ILoggerM T
<T U
AccountsControllerU g
>g h
loggeri o
)o p
{ 	
_accountRepository 
=  
accountRepository! 2
;2 3
_logger 
= 
logger 
; 
} 	
[ 	
HttpGet	 
] 
[ 	 
ProducesResponseType	 
( 
( 
int "
)" #
HttpStatusCode# 1
.1 2
OK2 4
)4 5
]5 6
[ 	 
ProducesResponseType	 
( 
( 
int "
)" #
HttpStatusCode# 1
.1 2
	NoContent2 ;
); <
]< =
public 
async 
Task 
< 
IActionResult '
>' (
Get) ,
(, -
)- .
{ 	
var 
accounts 
= 
await  
_accountRepository! 3
.3 4
GetAll4 :
(: ;
); <
;< =
return 
Ok 
( 
accounts 
) 
;  
} 	
[   	
HttpGet  	 
(   
$str   "
)  " #
]  # $
[!! 	 
ProducesResponseType!!	 
(!! 
(!! 
int!! "
)!!" #
HttpStatusCode!!# 1
.!!1 2
OK!!2 4
)!!4 5
]!!5 6
["" 	 
ProducesResponseType""	 
("" 
("" 
int"" "
)""" #
HttpStatusCode""# 1
.""1 2
NotFound""2 :
)"": ;
]""; <
public## 
async## 
Task## 
<## 
IActionResult## '
>##' (
Get##) ,
(##, -
string##- 3
accountNumber##4 A
)##A B
{$$ 	
var%% 
account%% 
=%% 
await%% 
_accountRepository%%  2
.%%2 3
GetByAccountNumber%%3 E
(%%E F
accountNumber%%F S
)%%S T
;%%T U
return'' 
account'' 
.'' 
IsValid'' "
(''" #
)''# $
?(( 
Ok(( 
((( 
account(( 
)(( 
:)) 
NotFound)) 
()) 
))) 
;** 
}++ 	
}-- 
}.. ÑI
…C:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Application\Controllers\TransferOrderController.cs
	namespace 	
FundTransfer
 
. 
Application "
." #
Controllers# .
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class "
FundTransferController '
:( )
ControllerBase* 8
{ 
private 
readonly #
IAccountQueryRepository 0
_accountQuerier1 @
;@ A
private 
readonly +
ITransferOrderCommandRepository 8#
_transferOrderCommander9 P
;P Q
private 
readonly )
ITransferOrderQueryRepository 6!
_transferOrderQuerier7 L
;L M
private 
readonly 
ILogger  
<  !"
FundTransferController! 7
>7 8
_logger9 @
;@ A
public "
FundTransferController %
(% &+
ITransferOrderCommandRepository +"
transferOrderCommander, B
,B C)
ITransferOrderQueryRepository ) 
transferOrderQuerier* >
,> ?
ILogger 
< "
FundTransferController *
>* +
logger, 2
)2 3
{ 	#
_transferOrderCommander #
=$ %"
transferOrderCommander& <
;< =!
_transferOrderQuerier !
=" # 
transferOrderQuerier$ 8
;8 9
_logger 
= 
logger 
; 
} 	
[!! 	
HttpPost!!	 
]!! 
["" 	 
ProducesResponseType""	 
("" 
("" 
int"" "
)""" #
HttpStatusCode""# 1
.""1 2
Created""2 9
)""9 :
]"": ;
[## 	 
ProducesResponseType##	 
(## 
(## 
int## "
)##" #
HttpStatusCode### 1
.##1 2

BadRequest##2 <
)##< =
]##= >
public$$ 
async$$ 
Task$$ 
<$$ 
IActionResult$$ '
>$$' (
Post$$) -
($$- .
[$$. /
FromBody$$/ 7
]$$7 8
TransferOrderDto$$9 I
orderDto$$J R
)$$R S
{%% 	
var&& 
(&& 
sourceAccount&& 
,&& 
destinationAccount&&  2
)&&2 3
=&&4 5
await&&6 ;
GetOrderAccounts&&< L
(&&L M
orderDto&&M U
)&&U V
;&&V W
if(( 
((( $
IsOperationAccountsValid(( (
(((( )
sourceAccount(() 6
,((6 7
destinationAccount((8 J
)((J K
)((K L
{)) 
TransferOrder** 
order** #
=**$ %
orderDto**& .
.**. /
ToTransferOrder**/ >
(**> ?
)**? @
;**@ A
if,, 
(,, 
!,, 
order,, 
.,, 
IsValid,, "
(,," #
),,# $
),,$ %
{-- 
string.. 
errorMsg.. #
=..$ %
$"..& (
$str..( T
{..T U
order..U Z
...Z [
TransactionId..[ h
}..h i
$str..i k
{..k l
order..l q
...q r
ErrorMessage..r ~
}..~ 
"	.. €
;
..€ 
_logger// 
.// 
LogError// $
(//$ %
errorMsg//% -
,//- .
order/// 4
)//4 5
;//5 6
return00 

BadRequest00 %
(00% &
new00& )
{00* +
message00, 3
=004 5
errorMsg006 >
,00> ?
order00A F
=00G H
new00I L
{00M N
order00O T
.00T U
TransactionId00U b
,00b c
order00d i
.00i j
ErrorMessage00j v
}00w x
}00y z
)00z {
;00{ |
}11 
await33 #
_transferOrderCommander33 -
.33- .
Create33. 4
(334 5
order335 :
)33: ;
;33; <
var55 
result55 
=55 
new55  
{55! "
order55# (
.55( )
TransactionId55) 6
}557 8
;558 9
return66 
CreatedAtAction66 &
(66& '
nameof66' -
(66- .
Get66. 1
)661 2
,662 3
new664 7
{668 9
result66: @
.66@ A
TransactionId66A N
}66O P
,66P Q
result66R X
)66X Y
;66Y Z
}77 
return99 

BadRequest99 
(99 
new99 !
{99" #
Message99$ +
=99, -
$str99. H
}99I J
)99J K
;99K L
}:: 	
[<< 	
HttpGet<<	 
]<< 
[== 	 
ProducesResponseType==	 
(== 
(== 
int== "
)==" #
HttpStatusCode==# 1
.==1 2
OK==2 4
)==4 5
]==5 6
public>> 
async>> 
Task>> 
<>> 
IActionResult>> '
>>>' (
Get>>) ,
(>>, -
)>>- .
{?? 	
var@@ 
orders@@ 
=@@ 
await@@ !
_transferOrderQuerier@@ 4
.@@4 5
GetAll@@5 ;
(@@; <
)@@< =
;@@= >
varAA 
statusAA 
=AA 
ordersAA 
.AA  
SelectAA  &
(AA& '
orderAA' ,
=>AA- /
newAA0 3
{AA4 5
orderAA6 ;
.AA; <
TransactionIdAA< I
,AAI J
orderAAK P
.AAP Q
StatusAAQ W
}AAX Y
)AAY Z
;AAZ [
returnBB 
OkBB 
(BB 
statusBB 
)BB 
;BB 
}CC 	
[EE 	
HttpGetEE	 
(EE 
$strEE "
)EE" #
]EE# $
[FF 	 
ProducesResponseTypeFF	 
(FF 
(FF 
intFF "
)FF" #
HttpStatusCodeFF# 1
.FF1 2
OKFF2 4
)FF4 5
]FF5 6
[GG 	 
ProducesResponseTypeGG	 
(GG 
(GG 
intGG "
)GG" #
HttpStatusCodeGG# 1
.GG1 2
NotFoundGG2 :
)GG: ;
]GG; <
publicHH 
asyncHH 
TaskHH 
<HH 
IActionResultHH '
>HH' (
GetHH) ,
(HH, -
GuidHH- 1
transactionIdHH2 ?
)HH? @
{II 	
varJJ 
orderJJ 
=JJ 
awaitJJ !
_transferOrderQuerierJJ 3
.JJ3 4
GetByIdJJ4 ;
(JJ; <
transactionIdJJ< I
)JJI J
;JJJ K
returnLL 
orderLL 
.LL 
IsValidLL  
(LL  !
)LL! "
?LL# $
OkLL% '
(LL' (
newLL( +
{LL, -
orderLL. 3
.LL3 4
TransactionIdLL4 A
,LLA B
orderLLC H
.LLH I
StatusLLI O
}LLP Q
)LLQ R
:LLS T
NotFoundLLU ]
(LL] ^
orderLL^ c
)LLc d
;LLd e
}MM 	
privateOO 
boolOO $
IsOperationAccountsValidOO -
(OO- .
AccountOO. 5
sourceOO6 <
,OO< =
AccountOO> E
destinationOOF Q
)OOQ R
{PP 	
returnQQ 
sourceQQ 
.QQ 
IsValidQQ !
(QQ! "
)QQ" #
&&QQ$ &
destinationQQ' 2
.QQ2 3
IsValidQQ3 :
(QQ: ;
)QQ; <
;QQ< =
}RR 	
privateTT 
asyncTT 
TaskTT 
<TT 
(TT 
AccountTT #
sourceAccountTT$ 1
,TT1 2
AccountTT3 :
destinationAccountTT; M
)TTM N
>TTN O
GetOrderAccountsTTP `
(TT` a
TransferOrderDtoTTa q
orderDtoTTr z
)TTz {
{UU 	
varVV 
sourceAccountNumberVV #
=VV$ %
orderDtoVV& .
.VV. /
SourceAccountNumberVV/ B
;VVB C
varWW 
sourceAccountWW 
=WW 
awaitWW  %
_accountQuerierWW& 5
.WW5 6
GetByAccountNumberWW6 H
(WWH I
sourceAccountNumberWWI \
)WW\ ]
;WW] ^
varYY $
destinationAccountNumberYY (
=YY) *
orderDtoYY+ 3
.YY3 4$
DestinationAccountNumberYY4 L
;YYL M
varZZ 
destinationAccountZZ "
=ZZ# $
awaitZZ% *
_accountQuerierZZ+ :
.ZZ: ;
GetByAccountNumberZZ; M
(ZZM N$
destinationAccountNumberZZN f
)ZZf g
;ZZg h
return\\ 
(\\ 
sourceAccount\\ !
,\\! "
destinationAccount\\# 5
)\\5 6
;\\6 7
}]] 	
}^^ 
}aa œ
wC:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Application\Dtos\TransferOrderDto.cs
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
TransferOrderDto !
{		 
[

 	
Required

	 
(

 
AllowEmptyStrings

 #
=

$ %
false

& +
)

+ ,
,

, -
	MinLength

. 7
(

7 8
$num

8 9
)

9 :
]

: ;
public 
string 
SourceAccountNumber )
{* +
get, /
;/ 0
init1 5
;5 6
}7 8
[ 	
Required	 
( 
AllowEmptyStrings #
=$ %
false& +
)+ ,
,, -
	MinLength. 7
(7 8
$num8 9
)9 :
]: ;
public 
string $
DestinationAccountNumber .
{/ 0
get1 4
;4 5
init6 :
;: ;
}< =
[ 	
Required	 
, 
Range 
( 
$num 
, 
double "
." #
PositiveInfinity# 3
)3 4
]4 5
public 
decimal 
Value 
{ 
get "
;" #
init$ (
;( )
}* +
public 
bool 
IsValid 
( 
) 
{ 	
var 
sameAccountNumbers "
=# $
SourceAccountNumber% 8
.8 9
Equals9 ?
(? @$
DestinationAccountNumber@ X
)X Y
;Y Z
var 
sourceAccountValid "
=# $
false% *
.* +
Equals+ 1
(1 2
String2 8
.8 9
IsNullOrEmpty9 F
(F G
SourceAccountNumberG Z
)Z [
)[ \
;\ ]
var #
destinationAccountValud '
=( )
false* /
./ 0
Equals0 6
(6 7
String7 =
.= >
IsNullOrEmpty> K
(K L$
DestinationAccountNumberL d
)d e
)e f
;f g
var 

validValue 
= 
Value "
>=# %
Decimal& -
.- .
Zero. 2
;2 3
return 
! 
sameAccountNumbers &
&&( *
sourceAccountValid+ =
&&> @#
destinationAccountValudA X
&&Y [

validValue] g
;g h
} 	
public 
TransferOrder 
ToTransferOrder ,
(, -
)- .
{ 	
if 
( 
IsValid 
( 
) 
) 
return   
new   
TransferOrder   (
(  ( )
)  ) *
{!! 
SourceAccountNumber"" '
=""( )
SourceAccountNumber""* =
,""= >$
DestinationAccountNumber## ,
=##- .
SourceAccountNumber##/ B
,##B C
Value$$ 
=$$ 
Value$$ !
,$$! "
}%% 
;%% 
throw'' 
new'' 
ArgumentException'' '
(''' (
$str''( Y
)''Y Z
;''Z [
}(( 	
})) 
}** ð
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
' (
set

) ,
;

, -
}

. /
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
;" #
set$ '
;' (
}) *
public 
string 
ErrorMessage "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
static 
implicit 
operator ' 
TransferOrderReadDto( <
(< =
TransferOrder= J
orderK P
)P Q
{ 	
return 
new  
TransferOrderReadDto +
(+ ,
), -
{ 
TransactionId 
= 
order  %
.% &
TransactionId& 3
,3 4
Status 
= 
order 
. 
Status %
.% &
ToString& .
(. /
)/ 0
,0 1
ErrorMessage 
= 
order $
.$ %
ErrorMessage% 1
} 
; 
} 	
} 
} ÷
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
} ž&
iC:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Application\Startup.cs
	namespace 	

AcessoTest
 
. 
FundTransfer !
.! "
Application" -
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{ 	
services 
. 
AddControllers #
(# $
)$ %
. 
AddJsonOptions 
(  
options  '
=>( *
options 
. !
JsonSerializerOptions 1
.1 2

Converters2 <
.< =
Add= @
(@ A
newA D#
JsonStringEnumConverterE \
(\ ]
)] ^
)^ _
) 
; 
services"" 
."" 
AddApplicationInfra"" (
(""( )
Configuration"") 6
)""6 7
;""7 8
services$$ 
.$$ 
AddSwaggerGen$$ "
($$" #
c$$# $
=>$$% '
{%% 
c&& 
.&& 

SwaggerDoc&& 
(&& 
$str&& !
,&&! "
new&&# &
OpenApiInfo&&' 2
{&&3 4
Title&&5 :
=&&; <
$str&&= W
,&&W X
Version&&Y `
=&&a b
$str&&c g
}&&h i
)&&i j
;&&j k
}'' 
)'' 
;'' 
}(( 	
public++ 
void++ 
	Configure++ 
(++ 
IApplicationBuilder++ 1
app++2 5
,++5 6
IWebHostEnvironment++7 J
env++K N
,++N O
ILoggerFactory++P ^
loggerFactory++_ l
,++l m
IConfiguration++n |
configuration	++} Š
,
++Š ‹!
FundTransferContext
++Œ Ÿ
context
++  §
)
++§ ¨
{,, 	
if-- 
(-- 
context-- 
.-- 
Database-- 
.--  

CanConnect--  *
(--* +
)--+ ,
)--, -
{.. 
context// 
.// 
Database//  
.//  !
Migrate//! (
(//( )
)//) *
;//* +
}00 
Log22 
.22 
Logger22 
=22 
new22 
LoggerConfiguration22 0
(220 1
)221 2
.33 
ReadFrom33 
.33 
Configuration33 '
(33' (
configuration33( 5
)335 6
.44 
Enrich44 
.44 
FromLogContext44 &
(44& '
)44' (
.55 
WriteTo55 
.55 

PostgreSQL55 #
(55# $
configuration55$ 1
.551 2
GetConnectionString552 E
(55E F
$str55F P
)55P Q
,55Q R
$str55S Y
,55Y Z
needAutoCreateTable55[ n
:55n o
true55p t
)55t u
.66 
CreateLogger66 
(66 
)66 
;66  
if88 
(88 
env88 
.88 
IsDevelopment88 !
(88! "
)88" #
)88# $
{99 
app:: 
.:: %
UseDeveloperExceptionPage:: -
(::- .
)::. /
;::/ 0
app;; 
.;; 

UseSwagger;; 
(;; 
);;  
;;;  !
app<< 
.<< 
UseSwaggerUI<<  
(<<  !
c<<! "
=><<# %
c<<& '
.<<' (
SwaggerEndpoint<<( 7
(<<7 8
$str<<8 R
,<<R S
$str<<T q
)<<q r
)<<r s
;<<s t
}== 
app?? 
.?? 
UseHttpsRedirection?? #
(??# $
)??$ %
;??% &
appAA 
.AA 

UseRoutingAA 
(AA 
)AA 
;AA 
appCC 
.CC 
UseAuthorizationCC  
(CC  !
)CC! "
;CC" #
appEE 
.EE 
UseEndpointsEE 
(EE 
	endpointsEE &
=>EE' )
{FF 
	endpointsGG 
.GG 
MapControllersGG (
(GG( )
)GG) *
;GG* +
}HH 
)HH 
;HH 
}II 	
}JJ 
}KK 