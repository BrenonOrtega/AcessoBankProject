§
rC:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Domain\Enum\AccountEntryType.cs
	namespace 	
FundTransfer
 
. 
Domain 
. 
Enum "
{ 
public 

enum '
BalanceAdjustmentOperations +
{ 
Credit 
, 
Debit 
}		 
}

 Ì
uC:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Domain\Enum\TransferOrderStatus.cs
	namespace 	
FundTransfer
 
. 
Domain 
. 
Enum "
{ 
public 

enum 
TransferOrderStatus #
{ 
InQueue 
, 

Processing 
, 
	Confirmed 
, 
Error		 
}

 
} ⁄
kC:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Domain\Models\Account.cs
	namespace 	
FundTransfer
 
. 
Domain 
. 
Models $
{ 
public 

class 
Account 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public

 
decimal

 
Balance

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
public 
string 
AccountNumber #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
bool 
IsValid 
( 
) 
{ 	
if 
( 
Id 
. 
Equals 
( 
$num 
) 
&& 
Balance  '
.' (
Equals( .
(. /
decimal/ 6
.6 7
Zero7 ;
); <
&&= ?
String@ F
.F G
IsNullOrEmptyG T
(T U
AccountNumberU b
)b c
)c d
{ 
return 
false 
; 
} 
return 
true 
; 
} 	
public 
override 
string 
ToString '
(' (
)( )
=>* ,
$". 0
$str0 4
{4 5
Id6 8
}9 :
$str: F
{F G
BalanceH O
}P Q
$strQ d
{d e
AccountNumberf s
}t u
"u v
;v w
} 
} “
uC:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Domain\Models\BalanceAdjustment.cs
	namespace 	
FundTransfer
 
. 
Domain 
. 
Models $
{ 
public 

class 
BalanceAdjustment "
{		 
[ 	
Required	 
] 
public 
string 
AccountNumber #
{$ %
get& )
;) *
set+ .
;. /
}0 1
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
;" #
set$ '
;' (
}) *
[ 	
EnumDataType	 
( 
typeof 
( '
BalanceAdjustmentOperations 8
)8 9
)9 :
]: ;
[ 	
JsonConverter	 
( 
typeof 
( #
JsonStringEnumConverter 5
)5 6
)6 7
]7 8
public '
BalanceAdjustmentOperations *
Type+ /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
override 
string 
ToString '
(' (
)( )
=>* ,
$". 0
$str0 @
{@ A
AccountNumberB O
}P Q
$strQ d
{d e
Typef j
}k l
$strl v
{v w
Valuex }
}~ 
$str	 Ç
"
Ç É
;
É Ñ
} 
} ∆4
qC:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Domain\Models\TransferOrder.cs
	namespace 	
FundTransfer
 
. 
Domain 
. 
Models $
{ 
public 

class 
TransferOrder 
{ 
[		 	
Key			 
]		 
[

 	
Required

	 
]

 
public 
Guid 
TransactionId !
{" #
get$ '
;' (
init) -
;- .
}/ 0
=1 2
Guid3 7
.7 8
NewGuid8 ?
(? @
)@ A
;A B
public 
DateTime 
	CreatedAt !
{" #
get$ '
;' (
init) -
;- .
}/ 0
=1 2
DateTime3 ;
.; <
Now< ?
;? @
public 
DateTime 
	UpdatedAt !
{" #
get$ '
;' (
private) 0
set1 4
;4 5
}6 7
=8 9
DateTime: B
.B C
NowC F
;F G
[ 	
Required	 
, 
	MinLength 
( 
$num 
) 
]  
public 
string 
SourceAccountNumber )
{* +
get, /
;/ 0
init1 5
;5 6
}7 8
[ 	
Required	 
, 
	MinLength 
( 
$num 
) 
]  
public 
string $
DestinationAccountNumber .
{/ 0
get1 4
;4 5
init6 :
;: ;
}< =
[ 	
Required	 
] 
public 
decimal 
Value 
{ 
get "
;" #
init$ (
;( )
}* +
private 
TransferOrderStatus #
_status$ +
;+ ,
[ 	
EnumDataType	 
( 
typeof 
( 
TransferOrderStatus 0
)0 1
)1 2
]2 3
public 
TransferOrderStatus "
Status# )
{ 	
get 
=> 
_status 
; 
private   
set   
{!! 
_status"" 
="" 
value"" 
;""  !
NotifyPropertyChanged## %
(##% &
)##& '
;##' (
}$$ 
}%% 	
public'' 
string'' 
ErrorMessage'' "
{''# $
get''% (
;''( )
set''* -
;''- .
}''/ 0
public)) 
bool)) 
IsValid)) 
()) 
))) 
{** 	
return++ 
ValidTransactionId++ %
(++% &
)++& '
&&++( *
ValidAccountNumbers+++ >
(++> ?
)++? @
&&++A C!
ValidTransactionValue++D Y
(++Y Z
)++Z [
;++[ \
},, 	
private.. 
bool.. 
ValidTransactionId.. '
(..' (
)..( )
{// 	
if00 
(00 
TransactionId00 
.00 
Equals00 $
(00$ %
Guid00% )
.00) *
Empty00* /
)00/ 0
)000 1
{11 
SetErrorStatus22 
(22 
$str22 @
)22@ A
;22A B
return33 
false33 
;33 
}44 
return66 
true66 
;66 
}77 	
private99 
bool99 
ValidAccountNumbers99 (
(99( )
)99) *
{:: 	
if;; 
(;; 
String;; 
.;; 
IsNullOrEmpty;; $
(;;$ %
SourceAccountNumber;;% 8
);;8 9
);;9 :
{<< 
SetErrorStatus== 
(== 
$str== >
)==> ?
;==? @
return>> 
false>> 
;>> 
}?? 
ifAA 
(AA 
StringAA 
.AA 
IsNullOrEmptyAA $
(AA$ %$
DestinationAccountNumberAA% =
)AA= >
)AA> ?
{BB 
SetErrorStatusCC 
(CC 
$strCC C
)CCC D
;CCD E
returnDD 
falseDD 
;DD 
}EE 
returnGG 
trueGG 
;GG 
}HH 	
privateJJ 
boolJJ !
ValidTransactionValueJJ *
(JJ* +
)JJ+ ,
{KK 	
ifLL 
(LL 
ValueLL 
<=LL 
DecimalLL  
.LL  !
ZeroLL! %
)LL% &
{MM 
SetErrorStatusNN 
(NN 
$strNN :
)NN: ;
;NN; <
returnOO 
falseOO 
;OO 
}PP 
returnQQ 
trueQQ 
;QQ 
}RR 	
publicTT 
voidTT 
SetErrorStatusTT "
(TT" #
stringTT# )
errorMessageTT* 6
)TT6 7
{UU 	
StatusVV 
=VV 
TransferOrderStatusVV (
.VV( )
ErrorVV) .
;VV. /
ErrorMessageWW 
=WW 
errorMessageWW '
;WW' (
}XX 	
publicZZ 
voidZZ 
SetProcessingStatusZZ '
(ZZ' (
)ZZ( )
=>ZZ* ,
StatusZZ- 3
=ZZ4 5
TransferOrderStatusZZ6 I
.ZZI J

ProcessingZZJ T
;ZZT U
public\\ 
void\\ 
ConfirmStatus\\ !
(\\! "
)\\" #
=>\\$ &
Status\\' -
=\\. /
TransferOrderStatus\\0 C
.\\C D
	Confirmed\\D M
;\\M N
private^^ 
void^^ !
NotifyPropertyChanged^^ *
(^^* +
)^^+ ,
=>^^- /
	UpdatedAt^^0 9
=^^: ;
DateTime^^< D
.^^D E
Now^^E H
;^^H I
public`` 
override`` 
string`` 
ToString`` '
(``' (
)``( )
=>``* ,
$"aa 
$straa 
{aa 
TransactionIdaa !
}aa" #
$straa# ,
{aa, -
SourceAccountNumberaa. A
}aaB C
$straaC J
{aaJ K$
DestinationAccountNumberaaL d
}aae f
$straaf p
{aap q
Valueaar w
}aax y
"aay z
;aaz {
}bb 
}cc Ï
ñC:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Domain\Repositories\Commands\IBalanceAdjustmentCommandRepository.cs
	namespace 	
FundTransfer
 
. 
Domain 
. 
Repositories *
.* +
Commands+ 3
{ 
public 

	interface /
#IBalanceAdjustmentCommandRepository 8
{ 
Task 
PostAdjustment 
( 
BalanceAdjustment -

adjustment. 8
)8 9
;9 :
Task

 
PostDebitAdjustment

  
(

  !
string

! '
accountNumber

( 5
,

5 6
decimal

7 >
value

? D
)

D E
;

E F
Task  
PostCreditAdjustment !
(! "
string" (
accountNumber) 6
,6 7
decimal8 ?
value@ E
)E F
;F G
} 
} ≠
íC:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Domain\Repositories\Commands\ITransferOrderCommandRepository.cs
	namespace 	
FundTransfer
 
. 
Domain 
. 
Repositories *
.* +
Commands+ 3
{ 
public 

	interface +
ITransferOrderCommandRepository 4
:5 6
ICommandRepository7 I
<I J
TransferOrderJ W
>W X
{ 
}		 
}

 ±
âC:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Domain\Repositories\Queries\IAccountQueryRepository.cs
	namespace 	
FundTransfer
 
. 
Domain 
. 
Repositories *
.* +
Queries+ 2
{ 
public 

	interface #
IAccountQueryRepository ,
{ 
Task		 
<		 
IEnumerable		 
<		 
Account		  
>		  !
>		! "
GetAll		# )
(		) *
)		* +
;		+ ,
Task 
< 
Account 
> 
GetByAccountNumber (
(( )
string) /
accountNumber0 =
)= >
;> ?
} 
} Â
èC:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Domain\Repositories\Queries\ITransferOrderQueryRepository.cs
	namespace 	
FundTransfer
 
. 
Domain 
. 
Repositories *
.* +
Queries+ 2
{ 
public 

	interface )
ITransferOrderQueryRepository 2
:3 4
IQueryRepository5 E
<E F
TransferOrderF S
>S T
{ 
Task		 
<		 
TransferOrder		 
>		 
GetByAccountNumber		 .
(		. /
string		/ 5
number		6 <
)		< =
;		= >
}

 
} √
ÉC:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Domain\Repositories\Shared\ICommandRepository.cs
	namespace 	
FundTransfer
 
. 
Domain 
. 
Repositories *
.* +
Shared+ 1
{ 
public 

	interface 
ICommandRepository '
<' (
T( )
>) *
where+ 0
T1 2
:3 4
class5 :
{ 
Task 
< 
bool 
> 
Create 
( 
T 
model !
)! "
;" #
Task

 
<

 
bool

 
>

 
Update

 
<

 
VKey

 
>

 
(

  
VKey

  $
id

% '
,

' (
T

) *
model

+ 0
)

0 1
;

1 2
} 
} ò
ÅC:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Domain\Repositories\Shared\IQueryRepository.cs
	namespace 	
FundTransfer
 
. 
Domain 
. 
Repositories *
.* +
Shared+ 1
{ 
public 

	interface 
IQueryRepository %
<% &
T& '
>' (
where) .
T/ 0
:1 2
class3 8
{ 
Task 
< 
IEnumerable 
< 
T 
> 
> 
GetAll #
(# $
)$ %
;% &
Task

 
<

 
T

 
>

 
GetById

 
<

 
V

 
>

 
(

 
V

 
id

 
)

  
;

  !
} 
} €
uC:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Domain\Services\IAccountService.cs
	namespace 	
FundTransfer
 
. 
Domain 
. 
Services &
{ 
public 

	interface 
IAccountService $
<$ %
T% &
>& '
{ 
Task		 
<		 
T		 
>		 
GetAccounts		 
(		 
)		 
;		 
Task 
< 
T 
> 
GetByAccountNumber "
(" #
string# )
accountNumber* 7
)7 8
;8 9
} 
} ô
C:\Users\Bryan\Documents\Coding\Projects\CSharp\AcessoTestProject\src\FundTransfer.Domain\Services\IBalanceAdjustmentService.cs
	namespace 	
FundTransfer
 
. 
Domain 
. 
Services &
{ 
public 

	interface %
IBalanceAdjustmentService .
{ 
Task 
PostAdjustmentAsync  
(  !
BalanceAdjustment! 2

adjustment3 =
)= >
;> ?
}		 
}

 