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
},, ™,
…C:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Application\Controllers\TransferOrderController.cs
	namespace 	
FundTransfer
 
. 
Application "
." #
Controllers# .
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class "
FundTransferController '
:( )
ControllerBase* 8
{ 
private 
readonly  
TransferOrderService -
_service. 6
;6 7
public "
FundTransferController %
(% & 
TransferOrderService& :
service; B
)B C
{ 	
_service 
= 
service 
; 
} 	
[ 	
HttpPost	 
] 
[ 	 
ProducesResponseType	 
( 
( 
int "
)" #
HttpStatusCode# 1
.1 2
Created2 9
)9 :
]: ;
[ 	 
ProducesResponseType	 
( 
( 
int "
)" #
HttpStatusCode# 1
.1 2

BadRequest2 <
)< =
]= >
public 
async 
Task 
< 
IActionResult '
>' (
Post) -
(- .
[. /
FromBody/ 7
]7 8
TransferOrderDto9 I
orderDtoJ R
)R S
{ 	
var   
order   
=   
await   
_service   &
.  & '
CreateOrder  ' 2
(  2 3
orderDto  3 ;
)  ; <
;  < =
if"" 
("" 
order"" 
."" 
Status"" 
!="" 
TransferOrderStatus""  3
.""3 4
Error""4 9
.""9 :
ToString"": B
(""B C
)""C D
)""D E
{## 
return$$ 
CreatedAtAction$$ &
($$& '
nameof$$' -
($$- .
Get$$. 1
)$$1 2
,$$2 3
new$$4 7
{$$8 9
order$$: ?
.$$? @
TransactionId$$@ M
}$$N O
,$$O P
order$$Q V
.$$V W
TransactionId$$W d
)$$d e
;$$e f
}%% 
return&& 

BadRequest&& 
(&& 
order&& #
)&&# $
;&&$ %
}'' 	
[)) 	
HttpGet))	 
])) 
[** 	 
ProducesResponseType**	 
(** 
(** 
int** "
)**" #
HttpStatusCode**# 1
.**1 2
OK**2 4
)**4 5
]**5 6
[++ 	 
ProducesResponseType++	 
(++ 
(++ 
int++ "
)++" #
HttpStatusCode++# 1
.++1 2
	NoContent++2 ;
)++; <
]++< =
public,, 
async,, 
Task,, 
<,, 
IActionResult,, '
>,,' (
Get,,) ,
(,,, -
),,- .
{-- 	
var.. 
orders.. 
=.. 
await.. 
_service.. '
...' (
GetOrderStatus..( 6
(..6 7
)..7 8
;..8 9
return00 
orders00 
.00 
Count00 
(00  
)00  !
>00" #
$num00$ %
?11 
Ok11 
(11 
orders11 
.11 
Select11 "
(11" #
order11# (
=>11) +
new11, /
{110 1
order112 7
.117 8
TransactionId118 E
,11E F
order11G L
.11L M
Status11M S
}11T U
)11U V
)11V W
:22 
	NoContent22 
(22 
)22 
;22 
}33 	
[55 	
HttpGet55	 
(55 
$str55 "
)55" #
]55# $
[66 	 
ProducesResponseType66	 
(66 
(66 
int66 "
)66" #
HttpStatusCode66# 1
.661 2
OK662 4
)664 5
]665 6
[77 	 
ProducesResponseType77	 
(77 
(77 
int77 "
)77" #
HttpStatusCode77# 1
.771 2
NotFound772 :
)77: ;
]77; <
public88 
async88 
Task88 
<88 
IActionResult88 '
>88' (
Get88) ,
(88, -
Guid88- 1
transactionId882 ?
)88? @
{99 	
var:: 
order:: 
=:: 
await:: 
_service:: &
.::& '
GetById::' .
(::. /
transactionId::/ <
)::< =
;::= >
return<< 
order<< 
.<< 
Status<< 
!=<<  "
TransferOrderStatus<<# 6
.<<6 7
Error<<7 <
.<<< =
ToString<<= E
(<<E F
)<<F G
?== 
Ok== 
(== 
new== 
{== 
order==  
.==  !
TransactionId==! .
,==. /
order==0 5
.==5 6
Status==6 <
}=== >
)==> ?
:>> 
NotFound>> 
(>> 
new>> 
{>>  
order>>! &
.>>& '
ErrorMessage>>' 3
}>>4 5
)>>5 6
;>>6 7
}?? 	
}@@ 
}CC œ
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
public 
bool 
IsValid 
( 
) 
{ 	
var 
sameAccountNumbers "
=# $
SourceAccountNumber% 8
.8 9
Equals9 ?
(? @$
DestinationAccountNumber@ X
)X Y
;Y Z
var 
sourceAccountValid "
=# $
false% *
.* +
Equals+ 1
(1 2
String2 8
.8 9
IsNullOrEmpty9 F
(F G
SourceAccountNumberG Z
)Z [
)[ \
;\ ]
var #
destinationAccountValud '
=( )
false* /
./ 0
Equals0 6
(6 7
String7 =
.= >
IsNullOrEmpty> K
(K L$
DestinationAccountNumberL d
)d e
)e f
;f g
var 

validValue 
= 
Value "
>=# %
Decimal& -
.- .
Zero. 2
;2 3
return 
! 
sameAccountNumbers &
&&( *
sourceAccountValid+ =
&&> @#
destinationAccountValudA X
&&Y [

validValue] g
;g h
} 	
public 
TransferOrder 
ToTransferOrder ,
(, -
)- .
{ 	
if 
( 
IsValid 
( 
) 
) 
return 
new 
TransferOrder (
(( )
)) *
{ 
SourceAccountNumber   '
=  ( )
SourceAccountNumber  * =
,  = >$
DestinationAccountNumber!! ,
=!!- .
SourceAccountNumber!!/ B
,!!B C
Value"" 
="" 
Value"" !
,""! "
}## 
;## 
throw%% 
new%% 
ArgumentException%% '
(%%' (
$str%%( Y
)%%Y Z
;%%Z [
}&& 	
}'' 
}(( Û
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
7 8
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
} îF
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
private 
readonly #
IAccountQueryRepository 0
_accountQuerier1 @
;@ A
private 
readonly +
ITransferOrderCommandRepository 8
_orderCommander9 H
;H I
private 
readonly )
ITransferOrderQueryRepository 6
_orderQuerier7 D
;D E
private 
readonly 
ILogger  
<  ! 
TransferOrderService! 5
>5 6
_logger7 >
;> ?
public  
TransferOrderService #
(# $#
IAccountQueryRepository #
accountQuerier$ 2
,2 3+
ITransferOrderCommandRepository +
orderCommander, :
,: ;)
ITransferOrderQueryRepository )
orderQuerier* 6
,6 7
ILogger 
<  
TransferOrderService (
>( )
logger* 0
)0 1
{ 	
_accountQuerier 
= 
accountQuerier ,
;, -
_orderCommander 
= 
orderCommander ,
;, -
_orderQuerier   
=   
orderQuerier   (
;  ( )
_logger!! 
=!! 
logger!! 
;!! 
}"" 	
public$$ 
async$$ 
Task$$ 
<$$ 
IEnumerable$$ %
<$$% & 
TransferOrderReadDto$$& :
>$$: ;
>$$; <
GetOrderStatus$$= K
($$K L
)$$L M
{%% 	
var&& 
orders&& 
=&& 
await&& 
_orderQuerier&& ,
.&&, -
GetAll&&- 3
(&&3 4
)&&4 5
;&&5 6
var'' 

readOrders'' 
='' 
orders'' #
.''# $
Select''$ *
(''* +
order''+ 0
=>''1 3
new''4 7 
TransferOrderReadDto''8 L
(''L M
order''M R
)''R S
)''S T
;''T U
return)) 

readOrders)) 
;)) 
}** 	
public,, 
async,, 
Task,, 
<,,  
TransferOrderReadDto,, .
>,,. /
GetById,,0 7
<,,7 8
T,,8 9
>,,9 :
(,,: ;
T,,; <
orderId,,= D
),,D E
{-- 	
var.. 
order.. 
=.. 
await.. 
_orderQuerier.. +
...+ ,
GetById.., 3
(..3 4
orderId..4 ;
)..; <
;..< =
var00 
orderDto00 
=00 
order00  
is00! #
not00$ '
null00( ,
?11 
new11  
TransferOrderReadDto11 *
(11* +
order11+ 0
)110 1
:22 
new22  
TransferOrderReadDto22 *
(22* +
$str22+ J
)22J K
;22K L
return44 
orderDto44 
;44 
}55 	
public77 
async77 
Task77 
<77  
TransferOrderReadDto77 .
>77. /
CreateOrder770 ;
(77; <
TransferOrderDto77< L
orderDto77M U
)77U V
{88 	
try99 
{:: 
TransferOrder;; 
order;; #
=;;$ %
orderDto;;& .
.;;. /
ToTransferOrder;;/ >
(;;> ?
);;? @
;;;@ A
var<< 
result<< 
=<< 
await<< "
ValidateOrder<<# 0
(<<0 1
order<<1 6
)<<6 7
;<<7 8
var== 
readDto== 
=== 
new== ! 
TransferOrderReadDto==" 6
(==6 7
order==7 <
)==< =
;=== >
if?? 
(?? 
result?? 
is?? 
false?? #
)??# $
{@@ 
varAA 
errorMsgAA  
=AA! "
$"AA# %
$strAA% Q
{AAQ R
orderAAR W
.AAW X
TransactionIdAAX e
}AAe f
$strAAf h
{AAh i
orderAAi n
.AAn o
ErrorMessageAAo {
}AA{ |
"AA| }
;AA} ~
_loggerBB 
.BB 
LogErrorBB $
(BB$ %
errorMsgBB% -
,BB- .
orderBB/ 4
.BB4 5
TransactionIdBB5 B
,BBB C
orderBBD I
.BBI J
ErrorMessageBBJ V
,BBV W
orderBBX ]
)BB] ^
;BB^ _
}CC 
returnEE 
readDtoEE 
;EE 
}GG 
catchHH 
(HH 
ArgumentExceptionHH $
aeHH% '
)HH' (
{II 
_loggerJJ 
.JJ 
LogErrorJJ  
(JJ  !
aeJJ! #
,JJ# $
aeJJ% '
.JJ' (
MessageJJ( /
)JJ/ 0
;JJ0 1
returnKK 
newKK  
TransferOrderReadDtoKK /
(KK/ 0
aeKK0 2
.KK2 3
MessageKK3 :
)KK: ;
;KK; <
}LL 
}MM 	
privateOO 
asyncOO 
TaskOO 
<OO 
boolOO 
>OO  
ValidateOrderOO! .
(OO. /
TransferOrderOO/ <
orderOO= B
)OOB C
{PP 	
varQQ 
(QQ 
sourceQQ 
,QQ 
destinationQQ $
)QQ$ %
=QQ& '
awaitQQ( -
GetOrderAccountsQQ. >
(QQ> ?
orderQQ? D
)QQD E
;QQE F
ifSS 
(SS 
ValidAccountsSS 
(SS 
sourceSS $
,SS$ %
destinationSS& 1
)SS1 2
&&SS3 5
ValidTransferSS6 C
(SSC D
sourceSSD J
,SSJ K
orderSSL Q
)SSQ R
)SSR S
{TT 
awaitUU 
_orderCommanderUU %
.UU% &
CreateUU& ,
(UU, -
orderUU- 2
)UU2 3
;UU3 4
returnVV 
trueVV 
;VV 
}WW 
returnXX 
falseXX 
;XX 
}YY 	
private[[ 
bool[[ 
ValidAccounts[[ "
([[" #
Account[[# *
source[[+ 1
,[[1 2
Account[[3 :
destination[[; F
)[[F G
{\\ 	
return]] 
source]] 
.]] 
IsValid]] !
(]]! "
)]]" #
&&]]$ &
destination]]' 2
.]]2 3
IsValid]]3 :
(]]: ;
)]]; <
;]]< =
}^^ 	
private`` 
bool`` 
ValidTransfer`` "
(``" #
Account``# *
sourceAccount``+ 8
,``8 9
TransferOrder``: G
order``H M
)``M N
{aa 	
returnbb 
sourceAccountbb  
.bb  !
Balancebb! (
>=bb) +
orderbb, 1
.bb1 2
Valuebb2 7
;bb7 8
}cc 	
privateee 
asyncee 
Taskee 
<ee 
(ee 
Accountee #
sourceAccountee$ 1
,ee1 2
Accountee3 :
destinationAccountee; M
)eeM N
>eeN O
GetOrderAccountseeP `
(ee` a
TransferOrdereea n
orderDtoeeo w
)eew x
{ff 	
ifgg 
(gg 
orderDtogg 
.gg 
IsValidgg  
(gg  !
)gg! "
)gg" #
{hh 
varii 
sourceAccountNumberii '
=ii( )
orderDtoii* 2
.ii2 3
SourceAccountNumberii3 F
;iiF G
varjj 
sourceAccountjj !
=jj" #
awaitjj$ )
_accountQuerierjj* 9
.jj9 :
GetByAccountNumberjj: L
(jjL M
sourceAccountNumberjjM `
)jj` a
;jja b
varll $
destinationAccountNumberll ,
=ll- .
orderDtoll/ 7
.ll7 8$
DestinationAccountNumberll8 P
;llP Q
varmm 
destinationAccountmm &
=mm' (
awaitmm) .
_accountQueriermm/ >
.mm> ?
GetByAccountNumbermm? Q
(mmQ R$
destinationAccountNumbermmR j
)mmj k
;mmk l
returnoo 
(oo 
sourceAccountoo %
,oo% &
destinationAccountoo' 9
)oo9 :
;oo: ;
}pp 
throwqq 
newqq 
ArgumentExceptionqq '
(qq' (
orderDtoqq( 0
.qq0 1
ErrorMessageqq1 =
)qq= >
;qq> ?
}rr 	
}ss 
}tt Ç'
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
(// 
context// 
.// 
Database// 
.//  

CanConnect//  *
(//* +
)//+ ,
)//, -
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