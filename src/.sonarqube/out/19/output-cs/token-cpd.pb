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
},, …)
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
,$$O P
orderDto$$Q Y
)$$Y Z
;$$Z [
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
?00& '
Ok00( *
(00* +
orders00+ 1
)001 2
:003 4
	NoContent005 >
(00> ?
)00? @
;00@ A
}11 	
[33 	
HttpGet33	 
(33 
$str33 "
)33" #
]33# $
[44 	 
ProducesResponseType44	 
(44 
(44 
int44 "
)44" #
HttpStatusCode44# 1
.441 2
OK442 4
)444 5
]445 6
[55 	 
ProducesResponseType55	 
(55 
(55 
int55 "
)55" #
HttpStatusCode55# 1
.551 2
NotFound552 :
)55: ;
]55; <
public66 
async66 
Task66 
<66 
IActionResult66 '
>66' (
Get66) ,
(66, -
Guid66- 1
transactionId662 ?
)66? @
{77 	
var88 
order88 
=88 
await88 
_service88 &
.88& '
GetById88' .
(88. /
transactionId88/ <
)88< =
;88= >
return:: 
order:: 
.:: 
Status:: 
!=::  "
TransferOrderStatus::# 6
.::6 7
Error::7 <
.::< =
ToString::= E
(::E F
)::F G
?;; 
Ok;; 
(;; 
new;; 
{;; 
order;;  
.;;  !
TransactionId;;! .
,;;. /
order;;0 5
.;;5 6
Status;;6 <
};;= >
);;> ?
:<< 
NotFound<< 
(<< 
order<<  
)<<  !
;<<! "
}== 	
}>> 
}AA œ
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
}** Ç
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
' (
init

) -
;

- .
}

/ 0
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
} 	
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
} ¤F
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
is00! #
null00$ (
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
;22K L
}33 	
public55 
async55 
Task55 
<55  
TransferOrderReadDto55 .
>55. /
CreateOrder550 ;
(55; <
TransferOrderDto55< L
orderDto55M U
)55U V
{66 	
try77 
{88 
TransferOrder99 
order99 #
=99$ %
orderDto99& .
.99. /
ToTransferOrder99/ >
(99> ?
)99? @
;99@ A
var:: 
result:: 
=:: 
await:: "
ValidateOrder::# 0
(::0 1
order::1 6
)::6 7
;::7 8
var;; 
readDto;; 
=;; 
new;; ! 
TransferOrderReadDto;;" 6
(;;6 7
order;;7 <
);;< =
;;;= >
if== 
(== 
result== 
is== 
false== #
)==# $
{>> 
var?? 
errorMsg??  
=??! "
$"??# %
$str??% Q
{??Q R
order??R W
.??W X
TransactionId??X e
}??e f
$str??f h
{??h i
order??i n
.??n o
ErrorMessage??o {
}??{ |
"??| }
;??} ~
_logger@@ 
.@@ 
LogError@@ $
(@@$ %
errorMsg@@% -
,@@- .
order@@/ 4
.@@4 5
TransactionId@@5 B
,@@B C
order@@D I
.@@I J
ErrorMessage@@J V
,@@V W
order@@X ]
)@@] ^
;@@^ _
}AA 
returnCC 
readDtoCC 
;CC 
}EE 
catchFF 
(FF 
ArgumentExceptionFF $
aeFF% '
)FF' (
{GG 
_loggerHH 
.HH 
LogErrorHH  
(HH  !
aeHH! #
,HH# $
aeHH% '
.HH' (
MessageHH( /
)HH/ 0
;HH0 1
returnII 
newII  
TransferOrderReadDtoII /
(II/ 0
aeII0 2
.II2 3
MessageII3 :
)II: ;
;II; <
}JJ 
}KK 	
privateMM 
asyncMM 
TaskMM 
<MM 
boolMM 
>MM  
ValidateOrderMM! .
(MM. /
TransferOrderMM/ <
orderMM= B
)MMB C
{NN 	
varOO 
(OO 
sourceOO 
,OO 
destinationOO $
)OO$ %
=OO& '
awaitOO( -
GetOrderAccountsOO. >
(OO> ?
orderOO? D
)OOD E
;OOE F
ifQQ 
(QQ 
ValidAccountsQQ 
(QQ 
sourceQQ $
,QQ$ %
destinationQQ& 1
)QQ1 2
&&QQ3 5
ValidTransferQQ6 C
(QQC D
sourceQQD J
,QQJ K
orderQQL Q
)QQQ R
)QQR S
{RR 
awaitSS 
_orderCommanderSS %
.SS% &
CreateSS& ,
(SS, -
orderSS- 2
)SS2 3
;SS3 4
returnTT 
trueTT 
;TT 
}UU 
returnVV 
falseVV 
;VV 
}WW 	
privateYY 
boolYY 
ValidAccountsYY "
(YY" #
AccountYY# *
sourceYY+ 1
,YY1 2
AccountYY3 :
destinationYY; F
)YYF G
{ZZ 	
return[[ 
source[[ 
.[[ 
IsValid[[ !
([[! "
)[[" #
&&[[$ &
destination[[' 2
.[[2 3
IsValid[[3 :
([[: ;
)[[; <
;[[< =
}\\ 	
private^^ 
bool^^ 
ValidTransfer^^ "
(^^" #
Account^^# *
sourceAccount^^+ 8
,^^8 9
TransferOrder^^: G
order^^H M
)^^M N
{__ 	
return`` 
sourceAccount``  
.``  !
Balance``! (
>=``) +
order``, 1
.``1 2
Value``2 7
;``7 8
}aa 	
privatecc 
asynccc 
Taskcc 
<cc 
(cc 
Accountcc #
sourceAccountcc$ 1
,cc1 2
Accountcc3 :
destinationAccountcc; M
)ccM N
>ccN O
GetOrderAccountsccP `
(cc` a
TransferOrdercca n
orderDtocco w
)ccw x
{dd 	
ifee 
(ee 
orderDtoee 
.ee 
IsValidee  
(ee  !
)ee! "
)ee" #
{ff 
vargg 
sourceAccountNumbergg '
=gg( )
orderDtogg* 2
.gg2 3
SourceAccountNumbergg3 F
;ggF G
varhh 
sourceAccounthh !
=hh" #
awaithh$ )
_accountQuerierhh* 9
.hh9 :
GetByAccountNumberhh: L
(hhL M
sourceAccountNumberhhM `
)hh` a
;hha b
varjj $
destinationAccountNumberjj ,
=jj- .
orderDtojj/ 7
.jj7 8$
DestinationAccountNumberjj8 P
;jjP Q
varkk 
destinationAccountkk &
=kk' (
awaitkk) .
_accountQuerierkk/ >
.kk> ?
GetByAccountNumberkk? Q
(kkQ R$
destinationAccountNumberkkR j
)kkj k
;kkk l
returnmm 
(mm 
sourceAccountmm %
,mm% &
destinationAccountmm' 9
)mm9 :
;mm: ;
}nn 
throwoo 
newoo 
ArgumentExceptionoo '
(oo' (
orderDtooo( 0
.oo0 1
ErrorMessageoo1 =
)oo= >
;oo> ?
}pp 	
}qq 
}rr ž&
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