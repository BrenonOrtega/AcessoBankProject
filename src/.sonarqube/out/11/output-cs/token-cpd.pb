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
}.. øJ
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
(% &#
IAccountQueryRepository #
accountQuerier$ 2
,2 3+
ITransferOrderCommandRepository +"
transferOrderCommander, B
,B C)
ITransferOrderQueryRepository ) 
transferOrderQuerier* >
,> ?
ILogger 
< "
FundTransferController *
>* +
logger, 2
)2 3
{ 	
_accountQuerier 
= 
accountQuerier ,
;, -#
_transferOrderCommander #
=$ %"
transferOrderCommander& <
;< =!
_transferOrderQuerier !
=" # 
transferOrderQuerier$ 8
;8 9
_logger   
=   
logger   
;   
}!! 	
[## 	
HttpPost##	 
]## 
[$$ 	 
ProducesResponseType$$	 
($$ 
($$ 
int$$ "
)$$" #
HttpStatusCode$$# 1
.$$1 2
Created$$2 9
)$$9 :
]$$: ;
[%% 	 
ProducesResponseType%%	 
(%% 
(%% 
int%% "
)%%" #
HttpStatusCode%%# 1
.%%1 2

BadRequest%%2 <
)%%< =
]%%= >
public&& 
async&& 
Task&& 
<&& 
IActionResult&& '
>&&' (
Post&&) -
(&&- .
[&&. /
FromBody&&/ 7
]&&7 8
TransferOrderDto&&9 I
orderDto&&J R
)&&R S
{'' 	
var(( 
((( 
sourceAccount(( 
,(( 
destinationAccount((  2
)((2 3
=((4 5
await((6 ;
GetOrderAccounts((< L
(((L M
orderDto((M U
)((U V
;((V W
if** 
(** $
IsOperationAccountsValid** (
(**( )
sourceAccount**) 6
,**6 7
destinationAccount**8 J
)**J K
)**K L
{++ 
TransferOrder,, 
order,, #
=,,$ %
orderDto,,& .
.,,. /
ToTransferOrder,,/ >
(,,> ?
),,? @
;,,@ A
if.. 
(.. 
!.. 
order.. 
... 
IsValid.. "
(.." #
)..# $
)..$ %
{// 
string00 
errorMsg00 #
=00$ %
$"00& (
$str00( T
{00T U
order00U Z
.00Z [
TransactionId00[ h
}00h i
$str00i k
{00k l
order00l q
.00q r
ErrorMessage00r ~
}00~ 
"	00 €
;
00€ 
_logger11 
.11 
LogError11 $
(11$ %
errorMsg11% -
,11- .
order11/ 4
)114 5
;115 6
return22 

BadRequest22 %
(22% &
new22& )
{22* +
message22, 3
=224 5
errorMsg226 >
,22> ?
order22A F
=22G H
new22I L
{22M N
order22O T
.22T U
TransactionId22U b
,22b c
order22d i
.22i j
ErrorMessage22j v
}22w x
}22y z
)22z {
;22{ |
}33 
await55 #
_transferOrderCommander55 -
.55- .
Create55. 4
(554 5
order555 :
)55: ;
;55; <
var77 
result77 
=77 
new77  
{77! "
order77# (
.77( )
TransactionId77) 6
}777 8
;778 9
return88 
CreatedAtAction88 &
(88& '
nameof88' -
(88- .
Get88. 1
)881 2
,882 3
new884 7
{888 9
result88: @
.88@ A
TransactionId88A N
}88O P
,88P Q
result88R X
)88X Y
;88Y Z
}99 
return;; 

BadRequest;; 
(;; 
new;; !
{;;" #
Message;;$ +
=;;, -
$str;;. H
};;I J
);;J K
;;;K L
}<< 	
[>> 	
HttpGet>>	 
]>> 
[?? 	 
ProducesResponseType??	 
(?? 
(?? 
int?? "
)??" #
HttpStatusCode??# 1
.??1 2
OK??2 4
)??4 5
]??5 6
public@@ 
async@@ 
Task@@ 
<@@ 
IActionResult@@ '
>@@' (
Get@@) ,
(@@, -
)@@- .
{AA 	
varBB 
ordersBB 
=BB 
awaitBB !
_transferOrderQuerierBB 4
.BB4 5
GetAllBB5 ;
(BB; <
)BB< =
;BB= >
varCC 
statusCC 
=CC 
ordersCC 
.CC  
SelectCC  &
(CC& '
orderCC' ,
=>CC- /
newCC0 3
{CC4 5
orderCC6 ;
.CC; <
TransactionIdCC< I
,CCI J
orderCCK P
.CCP Q
StatusCCQ W
}CCX Y
)CCY Z
;CCZ [
returnDD 
OkDD 
(DD 
statusDD 
)DD 
;DD 
}EE 	
[GG 	
HttpGetGG	 
(GG 
$strGG "
)GG" #
]GG# $
[HH 	 
ProducesResponseTypeHH	 
(HH 
(HH 
intHH "
)HH" #
HttpStatusCodeHH# 1
.HH1 2
OKHH2 4
)HH4 5
]HH5 6
[II 	 
ProducesResponseTypeII	 
(II 
(II 
intII "
)II" #
HttpStatusCodeII# 1
.II1 2
NotFoundII2 :
)II: ;
]II; <
publicJJ 
asyncJJ 
TaskJJ 
<JJ 
IActionResultJJ '
>JJ' (
GetJJ) ,
(JJ, -
GuidJJ- 1
transactionIdJJ2 ?
)JJ? @
{KK 	
varLL 
orderLL 
=LL 
awaitLL !
_transferOrderQuerierLL 3
.LL3 4
GetByIdLL4 ;
(LL; <
transactionIdLL< I
)LLI J
;LLJ K
returnNN 
orderNN 
.NN 
IsValidNN  
(NN  !
)NN! "
?NN# $
OkNN% '
(NN' (
newNN( +
{NN, -
orderNN. 3
.NN3 4
TransactionIdNN4 A
,NNA B
orderNNC H
.NNH I
StatusNNI O
}NNP Q
)NNQ R
:NNS T
NotFoundNNU ]
(NN] ^
orderNN^ c
)NNc d
;NNd e
}OO 	
privateQQ 
boolQQ $
IsOperationAccountsValidQQ -
(QQ- .
AccountQQ. 5
sourceQQ6 <
,QQ< =
AccountQQ> E
destinationQQF Q
)QQQ R
{RR 	
returnSS 
sourceSS 
.SS 
IsValidSS !
(SS! "
)SS" #
&&SS$ &
destinationSS' 2
.SS2 3
IsValidSS3 :
(SS: ;
)SS; <
;SS< =
}TT 	
privateVV 
asyncVV 
TaskVV 
<VV 
(VV 
AccountVV #
sourceAccountVV$ 1
,VV1 2
AccountVV3 :
destinationAccountVV; M
)VVM N
>VVN O
GetOrderAccountsVVP `
(VV` a
TransferOrderDtoVVa q
orderDtoVVr z
)VVz {
{WW 	
varXX 
sourceAccountNumberXX #
=XX$ %
orderDtoXX& .
.XX. /
SourceAccountNumberXX/ B
;XXB C
varYY 
sourceAccountYY 
=YY 
awaitYY  %
_accountQuerierYY& 5
.YY5 6
GetByAccountNumberYY6 H
(YYH I
sourceAccountNumberYYI \
)YY\ ]
;YY] ^
var[[ $
destinationAccountNumber[[ (
=[[) *
orderDto[[+ 3
.[[3 4$
DestinationAccountNumber[[4 L
;[[L M
var\\ 
destinationAccount\\ "
=\\# $
await\\% *
_accountQuerier\\+ :
.\\: ;
GetByAccountNumber\\; M
(\\M N$
destinationAccountNumber\\N f
)\\f g
;\\g h
return^^ 
(^^ 
sourceAccount^^ !
,^^! "
destinationAccount^^# 5
)^^5 6
;^^6 7
}__ 	
}`` 
}cc œ
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