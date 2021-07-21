Ý
C:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Application\Controllers\AccountController.cs
	namespace 	
FundTransfer
 
. 
Application "
." #
Controllers# .
{ 
[		 
ApiController		 
]		 
[

 
Route

 

(


 
$str

 
)

 
]

 
public 

class 
AccountsController #
:$ %
ControllerBase& 4
{ 
private 
readonly #
IAccountQueryRepository 0
_accountRepository1 C
;C D
private 
readonly 
ILogger  
_logger! (
;( )
public 
AccountsController !
(! "#
IAccountQueryRepository" 9
accountRepository: K
,K L
ILoggerM T
<T U
AccountsControllerU g
>g h
loggeri o
)o p
{ 	
_accountRepository 
=  
accountRepository! 2
;2 3
_logger 
= 
logger 
; 
} 	
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
IActionResult '
>' (
Get) ,
(, -
)- .
{ 	
var 
accounts 
= 
await  
_accountRepository! 3
.3 4
GetAll4 :
(: ;
); <
;< =
_logger 
. 
LogInformation "
(" #
$"# %
$str% /
{/ 0
nameof0 6
(6 7
Get7 :
): ;
}; <
$str< W
{W X
accountsY a
.a b
Countb g
(g h
)h i
}j k
$strk l
"l m
)m n
;n o
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
]# $
public 
async 
Task 
< 
IActionResult '
>' (
Get) ,
(, -
string- 3
accountNumber4 A
)A B
{   	
var!! 
account!! 
=!! 
await!! 
_accountRepository!!  2
.!!2 3
GetByAccountNumber!!3 E
(!!E F
accountNumber!!F S
)!!S T
;!!T U
return## 
account## 
.## 
IsValid## "
(##" #
)### $
?$$ 
Ok$$ 
($$ 
account$$ 
)$$ 
:%% 
NotFound%% 
(%% 
)%% 
;&& 
}'' 	
})) 
}** ýA
…C:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Application\Controllers\TransferOrderController.cs
	namespace 	
FundTransfer
 
. 
Application "
." #
Controllers# .
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class "
FundTransferController '
:( )
ControllerBase* 8
{ 
private 
readonly #
IAccountQueryRepository 0
_accountQuerier1 @
;@ A
private 
readonly +
ITransferOrderCommandRepository 8#
_transferOrderCommander9 P
;P Q
private 
readonly )
ITransferOrderQueryRepository 6!
_transferOrderQuerier7 L
;L M
private 
readonly 
ILogger  
<  !"
FundTransferController! 7
>7 8
_logger9 @
;@ A
public "
FundTransferController %
(% &#
IAccountQueryRepository #
accountQuerier$ 2
,2 3+
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
{ 	
_accountQuerier 
= 
accountQuerier ,
;, -#
_transferOrderCommander #
=$ %"
transferOrderCommander& <
;< =!
_transferOrderQuerier !
=" # 
transferOrderQuerier$ 8
;8 9
_logger 
= 
logger 
; 
}   	
["" 	
HttpPost""	 
]"" 
public## 
async## 
Task## 
<## 
IActionResult## '
>##' (
Post##) -
(##- .
[##. /
FromBody##/ 7
]##7 8
TransferOrderDto##9 I
orderDto##J R
)##R S
{$$ 	
var%% 
(%% 
sourceAccount%% 
,%% 
destinationAccount%%  2
)%%2 3
=%%4 5
await%%6 ;
GetOrderAccounts%%< L
(%%L M
orderDto%%M U
)%%U V
;%%V W
if'' 
('' $
IsOperationAccountsValid'' (
(''( )
sourceAccount'') 6
,''6 7
destinationAccount''8 J
)''J K
)''K L
{(( 
TransferOrder)) 
order)) #
=))$ %
orderDto))& .
.)). /
ToTransferOrder))/ >
())> ?
)))? @
;))@ A
if++ 
(++ 
!++ 
order++ 
.++ 
IsValid++ "
(++" #
)++# $
)++$ %
{,, 
string-- 
errorMsg-- #
=--$ %
$"--& (
$str--( T
{--T U
order--U Z
.--Z [
TransactionId--[ h
}--h i
$str--i k
{--k l
order--l q
.--q r
ErrorMessage--r ~
}--~ 
"	-- €
;
--€ 
_logger.. 
... 
LogError.. $
(..$ %
errorMsg..% -
,..- .
order../ 4
)..4 5
;..5 6
return// 

BadRequest// %
(//% &
new//& )
{//* +
message//, 3
=//4 5
errorMsg//6 >
,//> ?
order//@ E
.//E F
TransactionId//F S
,//S T
order//U Z
.//Z [
ErrorMessage//[ g
}//h i
)//i j
;//j k
}00 
await22 #
_transferOrderCommander22 -
.22- .
Create22. 4
(224 5
order225 :
)22: ;
;22; <
var44 
result44 
=44 
new44  
{44! "
order44# (
.44( )
TransactionId44) 6
}447 8
;448 9
return55 
CreatedAtAction55 &
(55& '
nameof55' -
(55- .
Get55. 1
)551 2
,552 3
result554 :
.55: ;
TransactionId55; H
,55H I
result55J P
)55P Q
;55Q R
}66 
return88 

BadRequest88 
(88 
new88 !
{88" #
Message88$ +
=88, -
$str88. H
}88I J
)88J K
;88K L
}99 	
[;; 	
HttpGet;;	 
];; 
public<< 
async<< 
Task<< 
<<< 
IActionResult<< '
><<' (
Get<<) ,
(<<, -
)<<- .
{== 	
var>> 
orders>> 
=>> 
await>> !
_transferOrderQuerier>> 4
.>>4 5
GetAll>>5 ;
(>>; <
)>>< =
;>>= >
var?? 
status?? 
=?? 
orders?? 
.??  
Select??  &
(??& '
order??' ,
=>??- /
new??0 3
{??4 5
order??6 ;
.??; <
TransactionId??< I
,??I J
order??K P
.??P Q
Status??Q W
}??X Y
)??Y Z
;??Z [
return@@ 
Ok@@ 
(@@ 
status@@ 
)@@ 
;@@ 
}AA 	
[CC 	
HttpGetCC	 
(CC 
$strCC "
)CC" #
]CC# $
publicDD 
asyncDD 
TaskDD 
<DD 
IActionResultDD '
>DD' (
GetDD) ,
(DD, -
GuidDD- 1
transactionIdDD2 ?
)DD? @
{EE 	
varFF 
orderFF 
=FF 
awaitFF !
_transferOrderQuerierFF 3
.FF3 4
GetByIdFF4 ;
(FF; <
transactionIdFF< I
)FFI J
;FFJ K
returnHH 
orderHH 
.HH 
IsValidHH  
(HH  !
)HH! "
?HH# $
OkHH% '
(HH' (
newHH( +
{HH, -
orderHH. 3
.HH3 4
TransactionIdHH4 A
,HHA B
orderHHC H
.HHH I
StatusHHI O
}HHP Q
)HHQ R
:HHS T
NotFoundHHU ]
(HH] ^
orderHH^ c
)HHc d
;HHd e
}II 	
privateKK 
boolKK $
IsOperationAccountsValidKK -
(KK- .
AccountKK. 5
sourceKK6 <
,KK< =
AccountKK> E
destinationKKF Q
)KKQ R
{LL 	
returnMM 
sourceMM 
.MM 
IsValidMM !
(MM! "
)MM" #
&&MM$ &
destinationMM' 2
.MM2 3
IsValidMM3 :
(MM: ;
)MM; <
;MM< =
}NN 	
privatePP 
asyncPP 
TaskPP 
<PP 
(PP 
AccountPP #
sourceAccountPP$ 1
,PP1 2
AccountPP3 :
destinationAccountPP; M
)PPM N
>PPN O
GetOrderAccountsPPP `
(PP` a
TransferOrderDtoPPa q
orderDtoPPr z
)PPz {
{QQ 	
varRR 
sourceAccountNumberRR #
=RR$ %
orderDtoRR& .
.RR. /
SourceAccountNumberRR/ B
;RRB C
varSS 
sourceAccountSS 
=SS 
awaitSS  %
_accountQuerierSS& 5
.SS5 6
GetByAccountNumberSS6 H
(SSH I
sourceAccountNumberSSI \
)SS\ ]
;SS] ^
varUU $
destinationAccountNumberUU (
=UU) *
orderDtoUU+ 3
.UU3 4$
DestinationAccountNumberUU4 L
;UUL M
varVV 
destinationAccountVV "
=VV# $
awaitVV% *
_accountQuerierVV+ :
.VV: ;
GetByAccountNumberVV; M
(VVM N$
destinationAccountNumberVVN f
)VVf g
;VVg h
returnXX 
(XX 
sourceAccountXX !
,XX! "
destinationAccountXX# 5
)XX5 6
;XX6 7
}YY 	
}ZZ 
}]] œ
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