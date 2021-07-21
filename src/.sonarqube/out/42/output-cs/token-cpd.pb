‡
tC:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Infra\Data\FundTransferContext.cs
	namespace 	
FundTransfer
 
. 
Infra 
. 
Data !
{ 
public 

class 
FundTransferContext $
:% &
	DbContext' 0
{ 
public 
FundTransferContext "
(" #
DbContextOptions# 3
options4 ;
); <
:= >
base? C
(C D
optionsD K
)K L
{		 	
}

 	
public 
DbSet 
< 
TransferOrder "
>" #
TransferOrders$ 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
} 
} Ω
yC:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Infra\Helpers\PostgresSerilogHelper.cs
	namespace 	
FundTransfer
 
. 
Infra 
. 
Helpers $
{ 
public 

static 
class !
PostgresSerilogHelper -
{		 
public

 
static

 
readonly

 
ImmutableDictionary

 2
<

2 3
string

3 9
,

9 :
ColumnWriterBase

; K
>

K L
columnWriters

M Z
=

[ \
new

] `

Dictionary

a k
<

k l
string

l r
,

r s
ColumnWriterBase	

t Ñ
>


Ñ Ö
(


Ö Ü
)


Ü á
{ 	
{ 
$str 
, 
new '
RenderedMessageColumnWriter 7
(7 8
NpgsqlDbType8 D
.D E
TextE I
)I J
}K L
,L M
{ 
$str 
,  
new! $'
MessageTemplateColumnWriter% @
(@ A
NpgsqlDbTypeA M
.M N
TextN R
)R S
}T U
,U V
{ 
$str 
, 
new 
LevelColumnWriter +
(+ ,
true, 0
,0 1
NpgsqlDbType2 >
.> ?
Varchar? F
)F G
}H I
,I J
{ 
$str 
, 
new !
TimestampColumnWriter 4
(4 5
NpgsqlDbType5 A
.A B
	TimestampB K
)K L
}M N
,N O
{ 
$str 
, 
new !
ExceptionColumnWriter 3
(3 4
NpgsqlDbType4 @
.@ A
TextA E
)E F
}G H
,H I
{ 
$str 
, 
new *
LogEventSerializedColumnWriter =
(= >
NpgsqlDbType> J
.J K
JsonbK P
)P Q
}R S
,S T
{ 
$str 
, 
new "
PropertiesColumnWriter 5
(5 6
NpgsqlDbType6 B
.B C
JsonbC H
)H I
}J K
,K L
{ 
$str 
, 
new  &
SinglePropertyColumnWriter! ;
(; <
$str< I
,I J
PropertyWriteMethodK ^
.^ _
ToString_ g
,g h
NpgsqlDbTypei u
.u v
Textv z
,z {
$str| 
)	 Ä
}
Å Ç
} 	
.	 
!
ToImmutableDictionary
 
(  
)  !
;! "
} 
} ˘
ÇC:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Infra\Helpers\Rabbitmq\RabbitmqConfiguration.cs
	namespace 	
FundTransfer
 
. 
Infra 
. 
Helpers $
.$ %
Rabbitmq% -
{ 
public 

class !
RabbitmqConfiguration &
{ 
public 
const 
string 
RabbitMQ $
=% &
$str' 1
;1 2
public 
string 
Hostname 
{  
get! $
;$ %
init& *
;* +
}, -
public 
int 
Port 
{ 
get 
; 
init #
;# $
}% &
public 
string 
	QueueName 
{  !
get" %
;% &
init' +
;+ ,
}- .
public		 
string		 
Username		 
{		  
get		! $
;		$ %
init		& *
;		* +
}		, -
public

 
string

 
Password

 
{

  
get

! $
;

$ %
init

& *
;

* +
}

, -
public 
int ,
 NetworkRecoveryIntervalInSeconds 3
{4 5
get6 9
;9 :
init; ?
;? @
}A B
public 
string 
Vhost 
{ 
get !
;! "
init# '
;' (
}) *
} 
} ÍC
qC:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Infra\Helpers\ServicesSetup.cs
	namespace 	
FundTransfer
 
. 
Infra 
. 
Helpers $
{ 
public 

static 
class 
ServicesSetup %
{ 
public 
static 
IServiceCollection (
AddApplicationInfra) <
(< =
this= A
IServiceCollectionB T
servicesU ]
,] ^
IConfiguration_ m
confign t
)t u
{ 	
services 
. 
AddConfigurations &
(& '
config' -
)- .
. 
AddRepositories  
(  !
)! "
. $
AddAccountApiIntegration )
() *
)* +
. (
AddTransferOrderMessageQueue -
(- .
). /
. +
AddTransferOrderMessageConsumer 0
(0 1
)1 2
;2 3
return 
services 
; 
} 	
public!! 
static!! 
IServiceCollection!! (
AddConfigurations!!) :
(!!: ;
this!!; ?
IServiceCollection!!@ R
services!!S [
,!![ \
IConfiguration!!] k
config!!l r
)!!r s
{"" 	
services## 
.## 
	Configure## 
<## !
RabbitmqConfiguration## 4
>##4 5
(##5 6
config##6 <
.##< =

GetSection##= G
(##G H!
RabbitmqConfiguration##H ]
.##] ^
RabbitMQ##^ f
)##f g
)##g h
;##h i
services$$ 
.$$ 
AddDbContext$$ !
<$$! "
FundTransferContext$$" 5
>$$5 6
($$6 7
optionsBuilder$$7 E
=>$$F H
{%% 
optionsBuilder&& 
.&& 
	UseNpgsql&& (
(&&( )
config&&) /
.&&/ 0
GetConnectionString&&0 C
(&&C D
$str&&D N
)&&N O
,&&O P
npgsqlBuilder&&Q ^
=>&&_ a
{'' 
npgsqlBuilder(( !
.((! "
MigrationsAssembly((" 4
(((4 5
$str((5 O
)((O P
;((P Q
})) 
))) 
;)) 
}** 
)** 
;** 
return,, 
services,, 
;,, 
}-- 	
public// 
static// 
IServiceCollection// (
AddRepositories//) 8
(//8 9
this//9 =
IServiceCollection//> P
services//Q Y
)//Y Z
{00 	
services11 
.11 
AddTransient11 !
<11! "#
IAccountQueryRepository11" 9
,119 :&
HttpAccountQueryRepository11; U
>11U V
(11V W
)11W X
;11X Y
services22 
.22 
AddTransient22 !
<22! "/
#IBalanceAdjustmentCommandRepository22" E
,22E F2
&HttpBalanceAdjustmentCommandRepository22G m
>22m n
(22n o
)22o p
;22p q
services33 
.33 
AddTransient33 !
<33! "+
ITransferOrderCommandRepository33" A
,33A B*
TransferOrderCommandRepository33C a
>33a b
(33b c
)33c d
;33d e
services44 
.44 
AddTransient44 !
<44! ")
ITransferOrderQueryRepository44" ?
,44? @(
TransferOrderQueryRepository44A ]
>44] ^
(44^ _
)44_ `
;44` a
return66 
services66 
;66 
}77 	
public99 
static99 
IServiceCollection99 ((
AddTransferOrderMessageQueue99) E
(99E F
this99F J
IServiceCollection99K ]
services99^ f
)99f g
{:: 	
services;; 
.;; 
AddSingleton;; !
<;;! ""
TransferOrderPublisher;;" 8
>;;8 9
(;;9 :
);;: ;
;;;; <
return== 
services== 
;== 
}>> 	
public@@ 
static@@ 
IServiceCollection@@ (+
AddTransferOrderMessageConsumer@@) H
(@@H I
this@@I M
IServiceCollection@@N `
services@@a i
)@@i j
{AA 	
servicesBB 
.BB 
AddHostedServiceBB %
<BB% &(
TransferOrderConsumerServiceBB& B
>BBB C
(BBC D
)BBD E
;BBE F
returnDD 
servicesDD 
;DD 
}EE 	
publicGG 
staticGG 
IServiceCollectionGG ($
AddAccountApiIntegrationGG) A
(GGA B
thisGGB F
IServiceCollectionGGG Y
servicesGGZ b
)GGb c
{HH 	
varII 
defaultTimeSpanII 
=II  !
TimeSpanII" *
.II* +
FromMinutesII+ 6
(II6 7
$numII7 8
)II8 9
;II9 :
servicesJJ 
.JJ 
AddHttpClientJJ "
<JJ" #
IAccountServiceJJ# 2
<JJ2 3
HttpResponseMessageJJ3 F
>JJF G
,JJG H
AccountServiceJJI W
>JJW X
(JJX Y
)JJY Z
.KK 
SetHandlerLifetimeKK #
(KK# $
defaultTimeSpanKK$ 3
)KK3 4
.LL 
AddPolicyHandlerLL !
(LL! "
GetRetryPolicyLL" 0
(LL0 1
)LL1 2
)LL2 3
;LL3 4
servicesNN 
.NN 
AddHttpClientNN "
<NN" #%
IBalanceAdjustmentServiceNN# <
,NN< =$
BalanceAdjustmentServiceNN> V
>NNV W
(NNW X
)NNX Y
.OO 
SetHandlerLifetimeOO #
(OO# $
defaultTimeSpanOO$ 3
)OO3 4
.PP 
AddPolicyHandlerPP !
(PP! " 
GetTransactionPolicyPP" 6
(PP6 7
)PP7 8
)PP8 9
;PP9 :
returnRR 
servicesRR 
;RR 
}SS 	
privateUU 
staticUU 
IAsyncPolicyUU #
<UU# $
HttpResponseMessageUU$ 7
>UU7 8
GetRetryPolicyUU9 G
(UUG H
)UUH I
{VV 	
returnWW  
HttpPolicyExtensionsWW '
.XX $
HandleTransientHttpErrorXX )
(XX) *
)XX* +
.YY 
OrResultYY 
(YY 
msgYY 
=>YY  
!YY! "
msgYY" %
.YY% &

StatusCodeYY& 0
.YY0 1
EqualsYY1 7
(YY7 8
HttpStatusCodeYY8 F
.YYF G
NotFoundYYG O
)YYO P
&&YYQ S
msgYYT W
.YYW X
IsSuccessStatusCodeYYX k
.YYk l
EqualsYYl r
(YYr s
falseYYs x
)YYx y
)YYy z
.ZZ $
WaitAndRetryForeverAsyncZZ )
(ZZ) *
retryAttemptZZ* 6
=>ZZ7 9
TimeSpanZZ: B
.ZZB C
FromSecondsZZC N
(ZZN O
MathZZO S
.ZZS T
PowZZT W
(ZZW X
$numZZX Y
,ZZY Z
retryAttemptZZ[ g
)ZZg h
)ZZh i
)ZZi j
;[[ 
}\\ 	
private^^ 
static^^ 
IAsyncPolicy^^ #
<^^# $
HttpResponseMessage^^$ 7
>^^7 8 
GetTransactionPolicy^^9 M
(^^M N
)^^N O
{__ 	
return``  
HttpPolicyExtensions`` '
.aa $
HandleTransientHttpErroraa )
(aa) *
)aa* +
.bb 
OrResultbb 
(bb 
resultbb  
=>bb! #
resultbb$ *
.bb* +
IsSuccessStatusCodebb+ >
.bb> ?
Equalsbb? E
(bbE F
falsebbF K
)bbK L
&&bbM O
!bbP Q
resultbbQ W
.bbW X

StatusCodebbX b
.bbb c
Equalsbbc i
(bbi j
HttpStatusCodebbj x
.bbx y

BadRequest	bby É
)
bbÉ Ñ
)
bbÑ Ö
.cc $
WaitAndRetryForeverAsynccc )
(cc) *
retryAttemptcc* 6
=>cc7 9
TimeSpancc: B
.ccB C
FromSecondsccC N
(ccN O
MathccO S
.ccS T
PowccT W
(ccW X
$numccX Y
,ccY Z
retryAttemptcc[ g
)ccg h
)cch i
)cci j
;dd 
}ee 	
}ff 
}gg Ä#
òC:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Infra\Repositories\Commands\HttpBalanceAdjustmentCommandRepository.cs
	namespace

 	
FundTransfer


 
.

 
Infra

 
.

 
Repositories

 )
.

) *
Commands

* 2
{ 
public 

class 2
&HttpBalanceAdjustmentCommandRepository 7
:8 9/
#IBalanceAdjustmentCommandRepository: ]
{ 
private 
readonly %
IBalanceAdjustmentService 2
_service3 ;
;; <
private 
readonly 
ILogger  
<  !2
&HttpBalanceAdjustmentCommandRepository! G
>G H
_loggerI P
;P Q
public 2
&HttpBalanceAdjustmentCommandRepository 5
(5 6%
IBalanceAdjustmentService6 O
serviceP W
,W X
ILoggerY `
<` a3
&HttpBalanceAdjustmentCommandRepository	a á
>
á à
logger
â è
)
è ê
{ 	
_service 
= 
service 
; 
_logger 
= 
logger 
; 
} 	
public 
async 
Task 
PostAdjustment (
(( )
BalanceAdjustment) :

adjustment; E
)E F
{ 	
try 
{ 
await 
_service 
. 
PostAdjustmentAsync 2
(2 3

adjustment3 =
)= >
;> ?
} 
catch 
(  
HttpRequestException '
	httpResEx( 1
)1 2
{ 
_logger   
.   
LogCritical   #
(  # $
	httpResEx  $ -
,  - .
	httpResEx  / 8
.  8 9
Message  9 @
)  @ A
;  A B
}!! 
}"" 	
public$$ 
async$$ 
Task$$ 
PostDebitAdjustment$$ -
($$- .
string$$. 4
accountNumber$$5 B
,$$B C
decimal$$D K
value$$L Q
)$$Q R
{%% 	
var&& 
debitAdjustment&& 
=&&  !
new&&" %
BalanceAdjustment&&& 7
(&&7 8
)&&8 9
{'' 
AccountNumber(( 
=(( 
accountNumber((  -
,((- .
Type)) 
=)) '
BalanceAdjustmentOperations)) 2
.))2 3
Debit))3 8
,))8 9
Value** 
=** 
value** 
}++ 
;++ 
await-- 
PostAdjustment--  
(--  !
debitAdjustment--! 0
)--0 1
;--1 2
_logger// 
.// 
LogInformation// "
(//" #
$str00 >
+00? @
$str11 B
,11B C'
BalanceAdjustmentOperations22 +
.22+ ,
Debit22, 1
,221 2
DateTime33 
.33 
Now33 
,33 
accountNumber44 
,44 
value55 
)66 
;66 
}77 	
public99 
async99 
Task99  
PostCreditAdjustment99 .
(99. /
string99/ 5
accountNumber996 C
,99C D
decimal99E L
value99M R
)99R S
{:: 	
var;; 
creditAdjustment;;  
=;;! "
new;;# &
BalanceAdjustment;;' 8
(;;8 9
);;9 :
{<< 
AccountNumber== 
=== 
accountNumber==  -
,==- .
Type>> 
=>> '
BalanceAdjustmentOperations>> 2
.>>2 3
Credit>>3 9
,>>9 :
Value?? 
=?? 
value?? 
}@@ 
;@@ 
awaitBB 
PostAdjustmentBB  
(BB  !
creditAdjustmentBB! 1
)BB1 2
;BB2 3
_loggerDD 
.DD 
LogInformationDD "
(DD" #
$strEE >
+EE? @
$strFF B
,FFB C'
BalanceAdjustmentOperationsGG +
.GG+ ,
CreditGG, 2
,GG2 3
DateTimeHH 
.HH 
NowHH 
,HH 
accountNumberII 
,II 
valueJJ 
)KK 
;KK 
}LL 	
}MM 
}NN ı
êC:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Infra\Repositories\Commands\TransferOrderCommandRepository.cs
	namespace 	
FundTransfer
 
. 
Infra 
. 
Repositories )
.) *
Commands* 2
{		 
public

 

class

 *
TransferOrderCommandRepository

 /
:

0 1+
ITransferOrderCommandRepository

2 Q
{ 
private 
readonly "
TransferOrderPublisher /

_publisher0 :
;: ;
private 
readonly 
FundTransferContext ,
_context- 5
;5 6
private 
readonly 
ILogger  
<  !*
TransferOrderCommandRepository! ?
>? @
_loggerA H
;H I
public *
TransferOrderCommandRepository -
(- ."
TransferOrderPublisher. D
	publisherE N
,N O
FundTransferContextP c
contextd k
,k l
ILoggerm t
<t u+
TransferOrderCommandRepository	u ì
>
ì î
logger
ï õ
)
õ ú
{ 	

_publisher 
= 
	publisher "
;" #
_context 
= 
context 
; 
_logger 
= 
logger 
; 
} 	
public 
async 
Task 
< 
bool 
> 
Create  &
(& '
TransferOrder' 4
model5 :
): ;
{ 	
_context 
. 
TransferOrders #
.# $
Add$ '
(' (
model( -
)- .
;. /

_publisher 
. 
PostMessage "
(" #
model# (
)( )
;) *
await 
_context 
. 
SaveChangesAsync +
(+ ,
), -
;- .
_logger 
. 
LogInformation "
(" #
$str# X
,X Y
modelZ _
)_ `
;` a
return   
true   
;   
}!! 	
public## 
async## 
Task## 
<## 
bool## 
>## 
Update##  &
<##& '
Guid##' +
>##+ ,
(##, -
Guid##- 1
id##2 4
,##4 5
TransferOrder##6 C
model##D I
)##I J
{$$ 	
_context%% 
.%% 
TransferOrders%% #
.%%# $
Update%%$ *
(%%* +
model%%+ 0
)%%0 1
;%%1 2
await&& 
_context&& 
.&& 
SaveChangesAsync&& +
(&&+ ,
)&&, -
;&&- .
return'' 
true'' 
;'' 
}(( 	
})) 
}** à)
ãC:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Infra\Repositories\Queries\HttpAccountQueryRepository.cs
	namespace 	
FundTransfer
 
. 
Infra 
. 
Repositories )
.) *
Queries* 1
{ 
public 

class &
HttpAccountQueryRepository +
:, -#
IAccountQueryRepository. E
{ 
private 
readonly 
IAccountService (
<( )
HttpResponseMessage) <
>< =
_service> F
;F G
private 
readonly 
ILogger  
_logger! (
;( )
public &
HttpAccountQueryRepository )
() *
IAccountService* 9
<9 :
HttpResponseMessage: M
>M N
serviceO V
,V W
ILoggerX _
<_ `&
HttpAccountQueryRepository` z
>z {
logger	| Ç
)
Ç É
{ 	
_service 
= 
service 
; 
_logger 
= 
logger 
; 
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
Account& -
>- .
>. /
GetAll0 6
(6 7
)7 8
{ 	
var 
response 
= 
await  
_service! )
.) *
GetAccounts* 5
(5 6
)6 7
;7 8
var 
content 
= 
await 
response  (
.( )
Content) 0
.0 1 
ReadAsByteArrayAsync1 E
(E F
)F G
;G H
var 
encodedContent 
=  
Encoding! )
.) *
UTF8* .
.. /
	GetString/ 8
(8 9
content9 @
)@ A
;A B
var   
accounts   
=   
JsonSerializer   )
.  ) *
Deserialize  * 5
<  5 6
IEnumerable  6 A
<  A B
Account  B I
>  I J
>  J K
(  K L
encodedContent  L Z
,  Z [
new  \ _!
JsonSerializerOptions  ` u
(  u v#
JsonSerializerDefaults	  v å
.
  å ç
Web
  ç ê
)
  ê ë
)
  ë í
;
  í ì
_logger"" 
."" 
LogInformation"" "
(""" #
$str""# d
,""d e
accounts""f n
.""n o
Count""o t
(""t u
)""u v
,""v w
DateTime	""x Ä
.
""Ä Å
Now
""Å Ñ
)
""Ñ Ö
;
""Ö Ü
return$$ 
accounts$$ 
;$$ 
}%% 	
public'' 
async'' 
Task'' 
<'' 
Account'' !
>''! "
GetByAccountNumber''# 5
(''5 6
string''6 <
accountNumber''= J
)''J K
{(( 	
var)) 
response)) 
=)) 
await))  
_service))! )
.))) *
GetByAccountNumber))* <
())< =
accountNumber))= J
)))J K
;))K L
if++ 
(++ 
response++ 
.++ 

StatusCode++ #
.++# $
Equals++$ *
(++* +
HttpStatusCode+++ 9
.++9 :
NotFound++: B
)++B C
)++C D
{,, 
_logger-- 
.-- 

LogWarning-- "
(--" #
$str.. b
+..c d
$str// @
,//@ A
accountNumber00 !
,00! "
DateTime00# +
.00+ ,
Now00, /
)00/ 0
;000 1
return22 
new22 
Account22 "
(22" #
)22# $
;22$ %
}33 
var55 
content55 
=55 
await55 
response55  (
.55( )
Content55) 0
.550 1 
ReadAsByteArrayAsync551 E
(55E F
)55F G
;55G H
var66 
encodedContent66 
=66  
Encoding66! )
.66) *
UTF866* .
.66. /
	GetString66/ 8
(668 9
content669 @
)66@ A
;66A B
var77 
account77 
=77 
JsonSerializer77 (
.77( )
Deserialize77) 4
<774 5
Account775 <
>77< =
(77= >
encodedContent77> L
,77L M
new77N Q!
JsonSerializerOptions77R g
(77g h"
JsonSerializerDefaults77h ~
.77~ 
Web	77 Ç
)
77Ç É
)
77É Ñ
;
77Ñ Ö
_logger99 
.99 
LogInformation99 "
(99" #
$str:: X
+::Y Z
$str;; <
,;;< =
accountNumber<< 
,<< 
DateTime== 
.== 
Now== 
)== 
;== 
return?? 
account?? 
;?? 
}@@ 	
}AA 
}BB ù
çC:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Infra\Repositories\Queries\TransferOrderQueryRepository.cs
	namespace 	
FundTransfer
 
. 
Infra 
. 
Repositories )
.) *
Queries* 1
{		 
public

 

class

 (
TransferOrderQueryRepository

 -
:

. /)
ITransferOrderQueryRepository

0 M
{ 
private 
readonly 
FundTransferContext ,
_context- 5
;5 6
public (
TransferOrderQueryRepository +
(+ ,
FundTransferContext, ?
context@ G
)G H
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
TransferOrder& 3
>3 4
>4 5
GetAll6 <
(< =
)= >
{ 	
return 
await 
_context !
.! "
TransferOrders" 0
.0 1
ToListAsync1 <
(< =
)= >
;> ?
} 	
public 
async 
Task 
< 
TransferOrder '
>' (
GetByAccountNumber) ;
(; <
string< B
numberC I
)I J
{ 	
return 
await 
_context !
.! "
TransferOrders" 0
.0 1
FirstOrDefaultAsync1 D
(D E
orderE J
=>K M
orderN S
.S T
SourceAccountNumberT g
.g h
ToLowerh o
(o p
)p q
.q r
Equalsr x
(x y
numbery 
.	 Ä
ToLower
Ä á
(
á à
)
à â
)
â ä
)
ä ã
;
ã å
} 	
public 
async 
Task 
< 
TransferOrder '
>' (
GetById) 0
<0 1
V1 2
>2 3
(3 4
V4 5
id6 8
)8 9
{ 	
return 
await 
_context !
.! "
TransferOrders" 0
.0 1
FirstOrDefaultAsync1 D
(D E
orderE J
=>K M
orderN S
.S T
TransactionIdT a
.a b
Equalsb h
(h i
idi k
)k l
)l m
;m n
} 	
}   
}!! ê
sC:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Infra\Services\AccountService.cs
	namespace 	
FundTransfer
 
. 
Infra 
. 
Services %
{ 
public		 

class		 
AccountService		 
:		  !
IAccountService		" 1
<		1 2
HttpResponseMessage		2 E
>		E F
{

 
private 
const 
string '
ACCOUNT_API_CONFIG_BASE_URL 8
=9 :
$str; G
;G H
private 
const 
string 5
)ACCOUNT_API_CONFIG_GET_BY_NUMBER_ENDPOINT F
=G H
$strI `
;` a
private 
readonly 
string 
getAccountEndpoint  2
;2 3
private 
readonly 

HttpClient #
_client$ +
;+ ,
public 
AccountService 
( 

HttpClient (
client) /
,/ 0
IConfiguration1 ?
config@ F
)F G
{ 	
client 
. 
BaseAddress 
=  
new! $
Uri% (
(( )
config) /
./ 0
GetValue0 8
<8 9
string9 ?
>? @
(@ A'
ACCOUNT_API_CONFIG_BASE_URLA \
)\ ]
)] ^
;^ _
client 
. !
DefaultRequestHeaders (
.( )
Add) ,
(, -
$str- 5
,5 6
$str7 I
)I J
;J K
client 
. !
DefaultRequestHeaders (
.( )
Add) ,
(, -
$str- 9
,9 :
$str; T
)T U
;U V
getAccountEndpoint 
=  
config! '
.' (
GetValue( 0
<0 1
string1 7
>7 8
(8 95
)ACCOUNT_API_CONFIG_GET_BY_NUMBER_ENDPOINT9 b
)b c
;c d
_client 
= 
client 
; 
} 	
public 
async 
Task 
< 
HttpResponseMessage -
>- .
GetAccounts/ :
(: ;
); <
{ 	
var 
response 
= 
await  
_client! (
.( )
GetAsync) 1
(1 2
getAccountEndpoint2 D
)D E
;E F
response 
. #
EnsureSuccessStatusCode ,
(, -
)- .
;. /
return!! 
response!! 
;!! 
}"" 	
public$$ 
async$$ 
Task$$ 
<$$ 
HttpResponseMessage$$ -
>$$- .
GetByAccountNumber$$/ A
($$A B
string$$B H
accountNumber$$I V
)$$V W
{%% 	
var&& 
response&& 
=&& 
await&&  
_client&&! (
.&&( )
GetAsync&&) 1
(&&1 2
$"&&2 4
{&&4 5
getAccountEndpoint&&6 H
}&&I J
$str&&J K
{&&K L
accountNumber&&M Z
}&&[ \
"&&\ ]
,&&] ^ 
HttpCompletionOption&&_ s
.&&s t 
ResponseContentRead	&&t á
)
&&á à
;
&&à â
response'' 
.'' #
EnsureSuccessStatusCode'' ,
('', -
)''- .
;''. /
return)) 
response)) 
;)) 
}** 	
}++ 
},, ƒ
}C:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Infra\Services\BalanceAdjustmentService.cs
	namespace

 	
FundTransfer


 
.

 
Infra

 
.

 
Services

 %
{ 
public 

class $
BalanceAdjustmentService )
:* +%
IBalanceAdjustmentService, E
{ 
private 
const 
string  
accountApiConfigName 1
=2 3
$str4 @
;@ A
private 
readonly 

HttpClient #
_client$ +
;+ ,
public $
BalanceAdjustmentService '
(' (

HttpClient( 2
client3 9
,9 :
IConfiguration; I
configJ P
)P Q
{ 	
client 
. 
BaseAddress 
=  
new! $
Uri% (
(( )
config) /
./ 0
GetValue0 8
<8 9
string9 ?
>? @
(@ A 
accountApiConfigNameA U
)U V
)V W
;W X
client 
. !
DefaultRequestHeaders (
.( )
Add) ,
(, -
$str- 5
,5 6
$str7 I
)I J
;J K
client 
. !
DefaultRequestHeaders (
.( )
Add) ,
(, -
$str- 9
,9 :
$str; T
)T U
;U V
_client 
= 
client 
; 
} 	
public 
async 
Task 
PostAdjustmentAsync -
(- .
BalanceAdjustment. ?

adjustment@ J
)J K
{ 	
var 
adjustmentJson 
=  
new! $
StringContent% 2
(2 3
JsonSerializer 
. 
	Serialize (
(( )

adjustment 
, 
new !
JsonSerializerOptions -
(- .
). /
{   
AllowTrailingCommas!! +
=!!, -
true!!. 2
,!!2 3'
PropertyNameCaseInsensitive"" 3
=""4 5
true""6 :
,"": ;
WriteIndented## %
=##& '
true##( ,
}$$ 
)%% 
,%% 
Encoding&& 
.&& 
UTF8&& 
,&& 
$str'' "
)''" #
;''# $
using)) 
var)) 
httpResponse)) "
=))# $
await))% *
_client))+ 2
.))2 3
	PostAsync))3 <
())< =
$str))= K
,))K L
adjustmentJson))M [
)))[ \
;))\ ]
httpResponse++ 
.++ #
EnsureSuccessStatusCode++ 0
(++0 1
)++1 2
;++2 3
},, 	
}-- 
}.. Í_
ÅC:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Infra\Services\TransferOrderConsumerService.cs
	namespace 	
FundTransfer
 
. 
Infra 
. 
Services %
{ 
public 

class (
TransferOrderConsumerService -
:. /
BackgroundService0 A
{ 
private 
readonly !
RabbitmqConfiguration .
_rabbitmqConfig/ >
;> ?
private 
readonly  
IServiceScopeFactory - 
_serviceScopeFactory. B
;B C
private 
readonly 
ILogger  
<  !(
TransferOrderConsumerService! =
>= >
_logger? F
;F G
private 
readonly 
ConnectionFactory *
_factory+ 3
;3 4
private 
IConnection 
_connection '
;' (
private!! 
IModel!! 
_channel!! 
;!!  
private## 
static## 
Policy## !
RabbitmqPolicyFactory## 3
(##3 4
ILogger##4 ;
<##; <(
TransferOrderConsumerService##< X
>##X Y
logger##Z `
)##` a
{$$ 	
return%% 
Policy%% 
.%% 
Handle%%  
<%%  !
SocketException%%! 0
>%%0 1
(%%1 2
)%%2 3
.&& 
Or&& 
<&& &
BrokerUnreachableException&& .
>&&. /
(&&/ 0
)&&0 1
.'' 
WaitAndRetry'' 
('' 
$num'' 
,''  
retryAttempt''! -
=>''. 0
TimeSpan''1 9
.''9 :
FromSeconds'': E
(''E F
Math''F J
.''J K
Pow''K N
(''N O
$num''O P
,''P Q
retryAttempt''R ^
)''^ _
)''_ `
,''` a
((( 
ex(( 
,(( 
time(( 
)(( 
=>(( !
logger((" (
.((( )

LogWarning(() 3
(((3 4
ex((4 6
,((6 7
ex((8 :
.((: ;
Message((; B
)((B C
))) 
;)) 
}** 	
public,, (
TransferOrderConsumerService,, +
(,,+ ,
IOptions-- 
<-- !
RabbitmqConfiguration-- *
>--* +
option--, 2
,--2 3
ILogger.. 
<.. (
TransferOrderConsumerService.. 0
>..0 1
logger..2 8
,..8 9 
IServiceScopeFactory//  
serviceScopeFactory//! 4
)//4 5
{00 	
_rabbitmqConfig11 
=11 
option11 $
.11$ %
Value11% *
;11* + 
_serviceScopeFactory22  
=22! "
serviceScopeFactory22# 6
;226 7
_logger33 
=33 
logger33 
;33 
_factory55 
=55 
new55 
ConnectionFactory55 ,
(55, -
)55- .
{66 
HostName77 
=77 
_rabbitmqConfig77 *
.77* +
Hostname77+ 3
,773 4
Port88 
=88 
_rabbitmqConfig88 &
.88& '
Port88' +
,88+ ,
UserName99 
=99 
_rabbitmqConfig99 *
.99* +
Username99+ 3
,993 4
Password:: 
=:: 
_rabbitmqConfig:: *
.::* +
Password::+ 3
,::3 4"
DispatchConsumersAsync;; &
=;;' (
true;;) -
,;;- .
VirtualHost<< 
=<< 
_rabbitmqConfig<< -
.<<- .
Vhost<<. 3
}== 
;== 
var?? 
policy?? 
=?? !
RabbitmqPolicyFactory?? .
(??. /
_logger??/ 6
)??6 7
;??7 8
policyAA 
.AA 
ExecuteAA 
(AA 
(AA 
)AA 
=>AA  
{BB 
_connectionCC 
=CC 
_factoryCC &
.CC& '
CreateConnectionCC' 7
(CC7 8
)CC8 9
;CC9 :
_channelDD 
=DD 
_connectionDD &
.DD& '
CreateModelDD' 2
(DD2 3
)DD3 4
;DD4 5
}EE 
)EE 
;EE 
_channelGG 
.GG 
QueueDeclareGG !
(GG! "
_rabbitmqConfigGG" 1
.GG1 2
	QueueNameGG2 ;
,GG; <
falseGG= B
,GGB C
falseGGD I
,GGI J
falseGGK P
,GGP Q
nullGGR V
)GGV W
;GGW X
}HH 	
	protectedJJ 
overrideJJ 
asyncJJ  
TaskJJ! %
ExecuteAsyncJJ& 2
(JJ2 3
CancellationTokenJJ3 D
stoppingTokenJJE R
)JJR S
{KK 	
stoppingTokenLL 
.LL (
ThrowIfCancellationRequestedLL 6
(LL6 7
)LL7 8
;LL8 9
varNN 
consumerNN 
=NN 
newNN &
AsyncEventingBasicConsumerNN 9
(NN9 :
_channelNN: B
)NNB C
;NNC D
consumerPP 
.PP 
ReceivedPP 
+=PP  
asyncPP! &
(PP' (
senderPP( .
,PP. /
	eventArgsPP0 9
)PP9 :
=>PP; =
{QQ 
varRR 
contentArrayRR  
=RR! "
	eventArgsRR# ,
.RR, -
BodyRR- 1
.RR1 2
ToArrayRR2 9
(RR9 :
)RR: ;
;RR; <
varSS 
contentStringSS !
=SS" #
EncodingSS$ ,
.SS, -
UTF8SS- 1
.SS1 2
	GetStringSS2 ;
(SS; <
contentArraySS< H
)SSH I
;SSI J
varTT 
receivedOrderTT !
=TT" #
JsonSerializerTT$ 2
.TT2 3
DeserializeTT3 >
<TT> ?
TransferOrderTT? L
>TTL M
(TTM N
contentStringTTN [
)TT[ \
;TT\ ]
varVV 
_orderCommanderVV #
=VV$ % 
_serviceScopeFactoryVV& :
.VV: ;
CreateScopeVV; F
(VVF G
)VVG H
.VVH I
ServiceProviderVVI X
.VVX Y
GetRequiredServiceVVY k
<VVk l,
ITransferOrderCommandRepository	VVl ã
>
VVã å
(
VVå ç
)
VVç é
;
VVé è
varWW 
_balanceCommanderWW %
=WW& ' 
_serviceScopeFactoryWW( <
.WW< =
CreateScopeWW= H
(WWH I
)WWI J
.WWJ K
ServiceProviderWWK Z
.WWZ [
GetRequiredServiceWW[ m
<WWm n0
#IBalanceAdjustmentCommandRepository	WWn ë
>
WWë í
(
WWí ì
)
WWì î
;
WWî ï
tryYY 
{ZZ 
await[[ 
StartsProcessing[[ *
([[* +
receivedOrder[[+ 8
)[[8 9
;[[9 :
await\\ 
TransferValue\\ '
(\\' (
receivedOrder\\( 5
)\\5 6
;\\6 7
FinishTransaction]] %
(]]% &
receivedOrder]]& 3
)]]3 4
;]]4 5
}^^ 
catch__ 
(__ 
	Exception__  
ex__! #
)__# $
{`` 
awaitaa &
HandleTransactionExceptionaa 4
(aa4 5
receivedOrderaa5 B
,aaB C
exaaD F
)aaF G
;aaG H
}bb 
asyncdd 
Taskdd 
StartsProcessingdd +
(dd+ ,
TransferOrderdd, 9
orderdd: ?
)dd? @
{ee 
orderff 
.ff 
SetProcessingStatusff -
(ff- .
)ff. /
;ff/ 0
awaitgg 
_orderCommandergg )
.gg) *
Updategg* 0
(gg0 1
ordergg1 6
.gg6 7
TransactionIdgg7 D
,ggD E
orderggF K
)ggK L
;ggL M
}hh 
asyncjj 
Taskjj 
TransferValuejj (
(jj( )
TransferOrderjj) 6
orderjj7 <
)jj< =
{kk 
orderll 
.ll 
ConfirmStatusll '
(ll' (
)ll( )
;ll) *
awaitnn 
_balanceCommandernn +
.nn+ ,
PostDebitAdjustmentnn, ?
(nn? @
ordernn@ E
.nnE F
SourceAccountNumbernnF Y
,nnY Z
ordernn[ `
.nn` a
Valuenna f
)nnf g
;nng h
awaitoo 
_balanceCommanderoo +
.oo+ , 
PostCreditAdjustmentoo, @
(oo@ A
orderooA F
.ooF G$
DestinationAccountNumberooG _
,oo_ `
orderooa f
.oof g
Valueoog l
)ool m
;oom n
awaitqq 
_orderCommanderqq )
.qq) *
Updateqq* 0
(qq0 1
orderqq1 6
.qq6 7
TransactionIdqq7 D
,qqD E
orderqqF K
)qqK L
;qqL M
}rr 
voidtt 
FinishTransactiontt &
(tt& '
TransferOrdertt' 4
ordertt5 :
)tt: ;
{uu 
_loggervv 
.vv 
LogInformationvv *
(vv* +
$strww s
,wws t
orderxx 
.xx 
TransactionIdxx +
,xx+ ,
orderyy 
.yy 
SourceAccountNumberyy 1
,yy1 2
orderzz 
.zz $
DestinationAccountNumberzz 6
)zz6 7
;zz7 8
_channel|| 
.|| 
BasicAck|| %
(||% &
	eventArgs||& /
.||/ 0
DeliveryTag||0 ;
,||; <
false||= B
)||B C
;||C D
}}} 
async 
Task &
HandleTransactionException 5
(5 6
TransferOrder6 C
orderD I
,I J
	ExceptionK T
exU W
)W X
{
ÄÄ 
receivedOrder
ÅÅ !
.
ÅÅ! "
SetErrorStatus
ÅÅ" 0
(
ÅÅ0 1
ex
ÅÅ1 3
.
ÅÅ3 4
Message
ÅÅ4 ;
)
ÅÅ; <
;
ÅÅ< =
await
ÇÇ 
_orderCommander
ÇÇ )
.
ÇÇ) *
Update
ÇÇ* 0
(
ÇÇ0 1
order
ÇÇ1 6
,
ÇÇ6 7
order
ÇÇ8 =
)
ÇÇ= >
;
ÇÇ> ?
_logger
ÑÑ 
.
ÑÑ 
LogError
ÑÑ $
(
ÑÑ$ %
ex
ÖÖ 
,
ÖÖ 
$str
ÜÜ l
,
ÜÜl m
order
áá 
.
áá 
TransactionId
áá +
,
áá+ ,
ex
àà 
.
àà 
Message
àà "
)
ââ 
;
ââ 
_channel
ãã 
.
ãã 
	BasicNack
ãã &
(
ãã& '
	eventArgs
ãã' 0
.
ãã0 1
DeliveryTag
ãã1 <
,
ãã< =
false
ãã> C
,
ããC D
true
ããE I
)
ããI J
;
ããJ K
}
åå 
}
çç 
;
çç 
_channel
èè 
.
èè 
BasicConsume
èè !
(
èè! "
_rabbitmqConfig
èè" 1
.
èè1 2
	QueueName
èè2 ;
,
èè; <
false
èè= B
,
èèB C
consumer
èèD L
)
èèL M
;
èèM N
await
êê 
Task
êê 
.
êê 
CompletedTask
êê $
;
êê$ %
}
ëë 	
public
ìì 
override
ìì 
void
ìì 
Dispose
ìì $
(
ìì$ %
)
ìì% &
{
îî 	
_channel
ïï 
.
ïï 
Close
ïï 
(
ïï 
)
ïï 
;
ïï 
_connection
ññ 
.
ññ 
Close
ññ 
(
ññ 
)
ññ 
;
ññ  
base
óó 
.
óó 
Dispose
óó 
(
óó 
)
óó 
;
óó 
GC
òò 
.
òò 
SuppressFinalize
òò 
(
òò  
this
òò  $
)
òò$ %
;
òò% &
}
ôô 	
}
öö 
}õõ „
{C:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Infra\Services\TransferOrderPublisher.cs
	namespace		 	
FundTransfer		
 
.		 
Infra		 
.		 
Services		 %
{

 
public 

class "
TransferOrderPublisher '
{ 
private 
readonly !
RabbitmqConfiguration .
_rabbitmqConfig/ >
;> ?
private 
readonly 
ConnectionFactory *
_factory+ 3
;3 4
public "
TransferOrderPublisher %
(% &
IOptions& .
<. /!
RabbitmqConfiguration/ D
>D E
optionsF M
)M N
{ 	
_rabbitmqConfig 
= 
options %
.% &
Value& +
;+ ,
_factory 
= 
new 
ConnectionFactory ,
(, -
)- .
{ 
HostName 
= 
_rabbitmqConfig *
.* +
Hostname+ 3
,3 4
Port 
= 
_rabbitmqConfig &
.& '
Port' +
,+ ,
UserName 
= 
_rabbitmqConfig *
.* +
Username+ 3
,3 4
Password 
= 
_rabbitmqConfig *
.* +
Password+ 3
,3 4#
NetworkRecoveryInterval '
=( )
TimeSpan* 2
.2 3
FromSeconds3 >
(> ?
_rabbitmqConfig? N
.N O,
 NetworkRecoveryIntervalInSecondsO o
)o p
} 
; 
} 	
public 
void 
PostMessage 
(  
TransferOrder  -
order. 3
)3 4
{   	
using!! 
var!! 
cnn!! 
=!! 
_factory!! $
.!!$ %
CreateConnection!!% 5
(!!5 6
)!!6 7
;!!7 8
using"" 
var"" 
channel"" 
="" 
cnn""  #
.""# $
CreateModel""$ /
(""/ 0
)""0 1
;""1 2
channel$$ 
.$$ 
QueueDeclare$$  
($$  !
queue%% 
:%% 
_rabbitmqConfig%% &
.%%& '
	QueueName%%' 0
,%%0 1
durable&& 
:&& 
false&& 
,&& 
	exclusive'' 
:'' 
false''  
,''  !

autoDelete(( 
:(( 
false(( !
,((! "
	arguments)) 
:)) 
null)) 
)** 
;** 
var,, 
content,, 
=,, 
JsonSerializer,, (
.,,( )
	Serialize,,) 2
<,,2 3
TransferOrder,,3 @
>,,@ A
(,,A B
order,,B G
),,G H
;,,H I
var-- 
byteMessage-- 
=-- 
Encoding-- &
.--& '
UTF8--' +
.--+ ,
GetBytes--, 4
(--4 5
content--5 <
)--< =
;--= >
channel// 
.// 
BasicPublish//  
(//  !
$str//! #
,//# $
_rabbitmqConfig//% 4
.//4 5
	QueueName//5 >
,//> ?
null//@ D
,//D E
byteMessage//F Q
)//Q R
;//R S
}00 	
}11 
}22 