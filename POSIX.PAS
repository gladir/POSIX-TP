{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2023
  @website(https://www.gladir.com/posix-tp)
  @abstract(Target: Turbo Pascal 7, Free Pascal)
  @Description: Clone de POSIX en Turbo Pascal
}

Unit POSIX;

{$N+}

INTERFACE

Uses
 DOS;

Type
 PFile=^File;
 FileOfChar=File Of Char;
 LConv=Record
  decimal_point:String[3];
  Thousands_Sep:String[3];
  Grouping:String[3];
  Int_Curr_Symbol:String[3];
  Currency_Symbol:String[3];
  Mon_Decimal_Point:String[3];
  Mon_Thousands_Sep:String[3];
  Mon_Grouping:String[3];
  Positive_Sign:String[3];
  Negative_Sign:String[3];
  Int_Frac_Digits:String[3];
  Frac_Digits:String[3];
  P_CS_Precedes:String[3];
  P_Sep_By_Space:String[3];
  N_CS_Precedes:String[3];
  P_Sign_Posn:Byte;
  N_Sign_Posn:Byte;
 End;
 PLConv=^LConv;
 TM=Record
  tm_year:Integer;
  tm_mon:Integer;
  tm_mday:Integer;
  tm_hour:Integer;
  tm_min:Integer;
  tm_sec:Integer;
 End;
 PTM=^TM;

Var
 ErrNo:Integer;

Procedure Abort;
Function Abs(a:Integer):Integer;
Procedure Access(Path:String;Mode:Word);
Procedure Alarm(X:Integer);
Function AscTime(Seconde,Minute,Heure,JourDuMois,Mois,Annee,
                 JourDeSemaine,JourAnnee:Integer;IsDst:Boolean):String;
Function ASin(a:Real):Real;
Procedure Assert(expression:Integer);
Function Atan(X:Real):Real;
Function ATan2(y,x:Real):Real;
Procedure AtExit(Fonction:Pointer);
Function AtoF(nptr:String):Real;
Function AtoI(nptr:String):Integer;
Function AtoL(nptr:String):LongInt;
Function BSearch(Clef,Base:Pointer;NMemb,Size:Integer;Compare:Pointer):Pointer;
Function Calloc(N,size_t:Integer):Pointer;
Function Ceil(d:Real):Integer;
Procedure ChDir(S:String);
Function ChMod(PathName:String;Mode:Word):Integer;
Function ChOwn(Path:String;Owner,Group:Integer):Integer;
Procedure ClearErr(Var F:File);
Function Clock:LongInt;
Function Close(FilDes:Integer):Integer;
Function CloseDir(DirHandle:SearchRec):Integer;
Function Cos(X:Real):Real;
Function Cosh(x:Real):Real;
Function Creat(Path:String;Mode:Integer):Integer;
Function CTermId(S:String):String;
Function CTime(TimeP:Pointer):String;
Function CUserID(S:String):String;
Function DiffTime(Time1,Time0:Comp):Comp;
Function Div_(Numer,Denom:Integer):Integer;
Function Dup(FilDes:Integer):Integer;
Function Dup2(FilDes,FilDes2:Integer):Integer;
Function ExecL(Path,Arg:String):Integer;
Function ExecLE(Path,Arg,Env:String):Integer;
Function ExecLP(Var F:File;Arg:String):Integer;
Function ExecV(Var F:File;Arg:String):Integer;
Function ExecVE(Var F:File;Arg,Env:String):Integer;
Function ExecVP(Var F:File;Arg:String):Integer;
Procedure Exit(Status:Integer);
Function Exp(x:Real):Real;
Function FAbs(a:Real):Real;
Function FClose(Var F:File):Integer;
Function FCntl(Var F:File;Cmd:Integer):Integer;
Function FDOpen(FilDes:Integer;Mode:String):PFile;
Function FEOF(Var F:File):Integer;
Function FError(Var F:File):Integer;
Function FFlush(Var F:Text):Integer;
Function FGetC(Var F:FileOfChar):Char;
Function FGetPos(Var F:File;Pos:LongInt):LongInt;
Function FGetS(Var S:String;Size:Integer;Var F:Text):String;
Function FileNo(Var F:File):Integer;
Function Floor(d:Real):Real;
Function FMod(X,Y:Real):Real;
Function FOpen(FileName,Mode:String):PFile;
Function Fork:Integer;
Function FPathConf(FileDes,Name:Integer):LongInt;
Function FPrintf(Var F:File;Format:String):Integer;
Function FPutC(Var F:Text;C:Char):Integer;
Function FPutS(Var F:Text;S:String):Integer;
Function FRead(Var Buffer;Size,N:Integer;Var F:File):Integer;
Procedure Free(P:Pointer);
Function FreOpen(FileName,Mode:String;Var F:File):PFile;
Function FrExp(X:Real;Var Exponent:Integer):Real;
Function FScanF(Var F:File;Format:String):Integer;
Function FSeek(Var F:File;Offset:LongInt;Base:Integer):Integer;
Function FSetPos(Var F:File;Offset:LongInt):Integer;
Function FStat(Var F:File;Buf:Pointer):Integer;
Function FSync(FilDes:Integer):Integer;
Function FTell(Var F:File):LongInt;
Function FWrite(Var Buffer;Size,N:Integer;Var F:File):Integer;
Function GetC(Var F:Text):Char;
Function GetChar:Char;
Function GetCWD(Var S:String;Size:Byte):String;
Function GetEGID:Integer;
Function GetEnv(S:String):String;
Function GetEUID:Integer;
Function GetGID:Integer;
Function GetGRGID(GID:Integer):Pointer;
Function GetGrNam(Name:String):Pointer;
Function GetGroups(GIDSetSize:Integer;GroupList:Pointer):Integer;
Function GetLogin:String;
Function GetPGrp:Integer;
Function GetPID:Integer;
Function GetPPID:Integer;
Function GetPWNam(Name:String):Pointer;
Function GetPWUID(UID:Integer):Pointer;
Function GetS(S:String):String;
Function GetUID:Integer;
Function GMTime(TimeP:LongInt):PTM;
Function IsAlNum(C:Char):Boolean;
Function IsAlpha(C:Char):Boolean;
Function IsATTY(Desc:Integer):Boolean;
Function IsCntrl(C:Char):Boolean;
Function IsDigit(C:Char):Boolean;
Function IsGraph(C:Char):Boolean;
Function IsLower(C:Char):Boolean;
Function IsPrint(C:Char):Boolean;
Function IsPunct(C:Char):Boolean;
Function IsSpace(C:Char):Boolean;
Function IsUpper(C:Char):Boolean;
Function IsXDigit(C:Char):Boolean;
Function Kill(PID,Sig:Integer):Integer;
Function LAbs(a:LongInt):LongInt;
Function LDExp(x:Real;p:Integer):Real;
Function LDiv(Numer,Denom:LongInt):LongInt;
Function Link(Path1,Path2:String):Integer;
Function LocaleConv:PLConv;
Function LocalTime(TimeP:LongInt):PTM;

IMPLEMENTATION

Var
 SaveExit:Pointer;

Procedure Abort;Begin
 Halt(255);
End;

Function Abs(a:Integer):Integer;Begin
 If a<0.0 Then a:=-a;
 Abs:=a;
End;

Procedure Access(Path:String;Mode:Word);Begin
 WriteLn('NON IMPLEMENTEE');
End;

Function ACos(a:Real):Real;Begin
 If FAbs(a)=1.0 Then ACos := (1-a)*PI/2.0
                Else ACos := Atan(-a/Sqrt(1-a*a))+2*Atan(1);
End;

Procedure Alarm(X:Integer);Begin
 WriteLn('NON IMPLEMENTEE');
End;

Function AscTime(Seconde,Minute,Heure,JourDuMois,Mois,Annee,
                 JourDeSemaine,JourAnnee:Integer;IsDst:Boolean):String;Begin
 WriteLn('NON IMPLEMENTEE');
End;

Function ASin(a:Real):Real;Begin
 If FAbs(a)=1.0Then ASin:=PI/2.0
               Else ASin:=ATan(a/Sqrt(1.0-a*a));
End;

Procedure Assert(expression:Integer);Begin
 WriteLn('NON IMPLEMENTEE');
End;

Function Atan(X:Real):Real;
Var
 A,B:Real;
 N:Integer;
Begin
 A := 1.0 / Sqrt(1.0 + (X * X));
 B := 1.0;
 For N:=1 to 11 do Begin
  A := (A + B) / 2.0;
  B := Sqrt(A * B);
 End;
 Atan:=X/(Sqrt(1.0+(X*X))*A);
End;

Function ATan2(y,x:Real):Real;
Var
 R:Real;
Begin
 If(x=0)Then Begin
  If y=0 Then R:=0.0 Else
  If y>0 Then R:=pi/2 Else
  If y<0 Then R:=-pi/2;
 End
  Else
 R:=ArcTan(y/x);
 If x<0.0 Then R:=R+PI;
 If R>PI Then R:=R-2*PI;
 ATan2:=R;
End;

Procedure AtExit(Fonction:Pointer);Begin
 SaveExit:=ExitProc;
 ExitProc:=Fonction;
End;

Function AtoF(nptr:String):Real;
Var
 R:Real;
 Err:Word;
Begin
 Val(nptr,R,Err);
 AtoF:=R;
End;

Function AtoI(nptr:String):Integer;
Var
 I:Integer;
 Err:Word;
Begin
 Val(nptr,I,Err);
 AtoI:=I;
End;

Function AtoL(nptr:String):LongInt;
Var
 L:LongInt;
 Err:Word;
Begin
 Val(nptr,L,Err);
 AtoL:=L;
End;

Function BSearch(Clef,Base:Pointer;NMemb,Size:Integer;Compare:Pointer):Pointer;Begin
 WriteLn('NON IMPLEMENTEE');
End;

Function Calloc(N,size_t:Integer):Pointer;
Var
 P:Pointer;
Begin
 GetMem(P,N*size_t);
 Calloc:=P;
End;

Function Ceil(d:Real):Integer;
Var
 R:Integer;
Begin
 R:=Trunc(d);
 If Frac(d)>0 Then R:=R+1;
 Ceil:=R;
End;

Procedure ChDir(S:String);Begin
 System.ChDir(S);
End;

Function ChMod(PathName:String;Mode:Word):Integer;
Var
 FName:File;
Begin
 Assign(FName,PathName);
 SetFAttr(FName,Mode);
 If DosError=0 Then ChMod:=0
               Else ChMod:=1;
End;

Function ChOwn(Path:String;Owner,Group:Integer):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 ChOwn:=1;
End;

Procedure ClearErr(Var F:File);Begin
 WriteLn('NON IMPLEMENTEE');
End;

Function Clock:LongInt;Begin
 WriteLn('NON IMPLEMENTEE');
 Clock:=0;
End;

Function Close(FilDes:Integer):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 Close:=0;
End;

Function CloseDir(DirHandle:SearchRec):Integer;Begin
 {$IFDEF FPC}
  FindClose(DirHandle);
 {$ENDIF}
End;

Function Cos(X:Real):Real;
Var
 R,S:Real;
 I:Byte;
Begin
 R:=X*X;
 S:=42.0;
 For I:=10 downto 1 do S:=4.0*I-2.0+(-R)/S;
 S:=S*S;
 Cos:=(S-R)/(S+R);
End;

Function Cosh(x:Real):Real;Begin
 x:=FAbs(x);
 If x > 88.029691931 Then
  Cosh:=0 { Infini }
 Else
  Cosh:=(Exp(x)+Exp(-x))/ 2.0;
End;

Function Creat(Path:String;Mode:Integer):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 Creat:=0;
End;

Function CTermId(S:String):String;Begin
 WriteLn('NON IMPLEMENTEE');
 CTermId:='';
End;

Function CTime(TimeP:Pointer):String;Begin
 WriteLn('NON IMPLEMENTEE');
 CTime:='';
End;

Function CUserID(S:String):String;Begin
 If S=''Then CUserID:=''
        Else CUserID:=GetEnv('USERNAME');
End;

Function DiffTime(Time1,Time0:Comp):Comp;Begin
 DiffTime:=Time0-Time1;
End;

Function Div_(Numer,Denom:Integer):Integer;Begin
 Div_:=Numer div Denom;
End;

Function Dup(FilDes:Integer):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 Dup:=0;
End;

Function Dup2(FilDes,FilDes2:Integer):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 Dup2:=0;
End;

Function ExecL(Path,Arg:String):Integer;Begin
 Exec(Path,Arg);
 ExecL:=DOSError;
End;

Function ExecLE(Path,Arg,Env:String):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 ExecLE:=0;
End;

Function ExecLP(Var F:File;Arg:String):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 ExecLP:=0;
End;

Function ExecV(Var F:File;Arg:String):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 ExecV:=0;
End;

Function ExecVE(Var F:File;Arg,Env:String):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 ExecVE:=0;
End;

Function ExecVP(Var F:File;Arg:String):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 ExecVP:=0;
End;

Procedure Exit(Status:Integer);Begin
 Halt(Status);
End;

Function Exp(x:Real):Real;
Var
 Inverse:Boolean;
 n,i:Integer;
 dl,q:Real;
Begin
 Inverse := False;
 n := 0;
 dl := 1;
 i := 1;
 If x < 0 Then Begin
  Inverse := True;
  x := -x;
 End;
 While x >= 2 do Begin
  x := x / 2;
  n := n + 1;
 End;
 x := x / 16;
 n := n + 4;
 q := x;
 While q > 1.0E-15 do Begin
  dl := dl + q;
  i := i + 1;
  q := q * x / i;
 End;
 For i := 1 to n do dl := dl * dl;
 If Inverse Then dl := 1 / dl;
 Exp := dl;
End;

Function FAbs(a:Real):Real;Begin
 If a<0.0 Then a:=-a;
 FAbs:=a;
End;

Function FClose(Var F:File):Integer;Begin
 System.Close(F);
End;

Function FCntl(Var F:File;Cmd:Integer):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 FCntl:=0;
End;

Function FDOpen(FilDes:Integer;Mode:String):PFile;Begin
 WriteLn('NON IMPLEMENTEE');
 FDOpen:=NIL;
End;

Function FEOF(Var F:File):Integer;Begin
 If EOF(F)Then FEOF:=0
          Else FEOF:=-1;
End;

Function FError(Var F:File):Integer;Begin
 FError:=IOResult;
End;

Function FFlush(Var F:Text):Integer;Begin
 Flush(F);
 FFlush:=IOResult;
End;

Function FGetC(Var F:FileOfChar):Char;
Var
 C:Char;
Begin
 Read(F,C);
End;

Function FGetPos(Var F:File;Pos:LongInt):LongInt;Begin
 FGetPos:=FilePos(F);
End;

Function FGetS(Var S:String;Size:Integer;Var F:Text):String;Begin
 ReadLn(F,S);
 FGetS:=S;
End;

Function FileNo(Var F:File):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 FileNo:=0;
End;

Function Floor(d:Real):Real;
Var
 R:Real;
Begin
 R:=Trunc(d);
 If Frac(d)<0 then R:=R-1;
 Floor:=R;
End;

Function FMod(X,Y:Real):Real;Begin
 FMod:=Trunc(X) mod Trunc(Y);
End;

Function FOpen(FileName,Mode:String):PFile;
Var
 P:File;
 T:Text;
Begin
 If Pos('t',Mode)>0Then Begin
  Assign(T,FileName);
  If Pos('a',Mode)>0Then Begin
   Reset(T);
  End
   Else
  If Pos('w+',Mode)>0 Then Begin
   Rewrite(T);
  End;
  FOpen:=@T;
 End
  Else
 Begin
  Assign(P,FileName);
  If Pos('a',Mode)>0Then Begin
   Reset(P,1);
  End
   Else
  If Pos('w+',Mode)>0 Then Begin
   Rewrite(P,1);
  End;
  FOpen:=@P;
 End;
End;

Function Fork:Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 Fork:=0;
End;

Function FPathConf(FileDes,Name:Integer):LongInt;Begin
 WriteLn('NON IMPLEMENTEE');
 FPathConf:=0;
End;

Function FPrintf(Var F:File;Format:String):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 FPrintf:=0;
End;

Function FPutC(Var F:Text;C:Char):Integer;Begin
 Write(F,C);
 FPutC:=IoResult;
End;

Function FPutS(Var F:Text;S:String):Integer;Begin
 WriteLn(F,S);
 FPutS:=IoResult;
End;

Function FRead(Var Buffer;Size,N:Integer;Var F:File):Integer;
Var
 L:Word;
Begin
 BlockRead(F,Buffer,Size*N,L);
 FRead:=L;
End;

Procedure Free(P:Pointer);Begin
 WriteLn('NON IMPLEMENTEE');
 {FreeMem(P,Size);}
End;

Function FreOpen(FileName,Mode:String;Var F:File):PFile;
Var
 P:File;
 T:Text;
Begin
 If Pos('t',Mode)>0Then Begin
  Assign(T,FileName);
  If Pos('a',Mode)>0Then Begin
   Reset(T);
  End
   Else
  If Pos('w+',Mode)>0 Then Begin
   Rewrite(T);
  End;
  FreOpen:=@T;
  {F:=T;}
 End
  Else
 Begin
  Assign(P,FileName);
  If Pos('a',Mode)>0Then Begin
   Reset(P,1);
  End
   Else
  If Pos('w+',Mode)>0 Then Begin
   Rewrite(P,1);
  End;
  FreOpen:=@P;
  Move(F,P,SizeOf(F));
 End;
End;

Function FrExp(X:Real;Var Exponent:Integer):Real;
Var
 Mantissa:Real;
Begin
 Exponent:=0;
 If (X<>0)Then
  If (FAbs(X)<0.5)Then Repeat
   X:=X*2;
   Dec(Exponent);
  Until (FAbs(X)>=0.5)
   Else
  While (FAbs(X)>=1) do Begin
   X:=X/2;
   Inc(Exponent);
  End;
 Mantissa:=X;
End;

Function FScanF(Var F:File;Format:String):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 FScanF:=0;
End;

Function FSeek(Var F:File;Offset:LongInt;Base:Integer):Integer;Begin
 Seek(F,Offset);
 FSeek:=IoResult;
End;

Function FSetPos(Var F:File;Offset:LongInt):Integer;Begin
 Seek(F,Offset);
 FSetPos:=IoResult;
End;

Function FStat(Var F:File;Buf:Pointer):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 FStat:=0;
End;

Function FSync(FilDes:Integer):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 FSync:=0;
End;

Function FTell(Var F:File):LongInt;Begin
 FTell:=FilePos(F);
End;

Function FWrite(Var Buffer;Size,N:Integer;Var F:File):Integer;
Var
 L:Word;
Begin
 BlockWrite(F,Buffer,Size*N,L);
 FWrite:=L;
End;

Function GetC(Var F:Text):Char;
Var
 C:Char;
Begin
 Read(F,C);
 GetC:=C;
End;

Function GetChar:Char;
Var
 C:Char;
Begin
 Read(C);
 GetChar:=C;
End;

Function GetCWD(Var S:String;Size:Byte):String;Begin
 GetDir(0,S);
 GetCWD:=S;
End;

Function GetEGID:Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 GetEGID:=0;
End;

Function GetEnv(S:String):String;Begin
 GetEnv:=DOS.GetEnv(S);
End;

Function GetEUID:Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 GetEUID:=0;
End;

Function GetGID:Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 GetGID:=0;
End;

Function GetGRGID(GID:Integer):Pointer;Begin
 WriteLn('NON IMPLEMENTEE');
 GetGRGID:=NIL;
End;

Function GetGrNam(Name:String):Pointer;Begin
 WriteLn('NON IMPLEMENTEE');
 GetGrNam:=NIL;
End;

Function GetGroups(GIDSetSize:Integer;GroupList:Pointer):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 GetGroups:=0;
End;

Function GetLogin:String;Begin
 GetLogin:=GetEnv('USERNAME');
End;

Function GetPGrp:Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 GetPGrp:=0;
End;

Function GetPID:Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 GetPID:=0;
End;

Function GetPPID:Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 GetPPID:=0;
End;

Function GetPWNam(Name:String):Pointer;Begin
 WriteLn('NON IMPLEMENTEE');
 GetPWNam:=NIL;
End;

Function GetPWUID(UID:Integer):Pointer;Begin
 WriteLn('NON IMPLEMENTEE');
 GetPWUID:=NIL;
End;

Function GetS(S:String):String;Begin
 ReadLn(S);
End;

Function GetUID:Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 GetUID:=0;
End;

Function GMTime(TimeP:LongInt):PTM;
Var
 D:DateTime;
 P:PTM;
Begin
 UnpackTime(TimeP,D);
 GetMem(P,SizeOf(TM));
 P^.tm_year:=D.Year;
 P^.tm_mon:=D.Month;
 P^.tm_mday:=0;
 P^.tm_hour:=D.Hour;
 P^.tm_min:=D.Min;
 P^.tm_sec:=D.Sec;
 GMTime:=P;
End;

Function IsAlNum(C:Char):Boolean;Begin
 IsAlNum:=C in ['A'..'Z','a'..'z','0'..'9'];
End;

Function IsAlpha(C:Char):Boolean;Begin
 IsAlpha:=C in ['A'..'Z','a'..'z'];
End;

Function IsATTY(Desc:Integer):Boolean;Begin
 WriteLn('NON IMPLEMENTEE');
 IsATTY:=False;
End;

Function IsCntrl(C:Char):Boolean;Begin
 IsCntrl:=C in [#1..#31,#127];
End;

Function IsDigit(C:Char):Boolean;Begin
 IsDigit:=C in ['0'..'9'];
End;

Function IsGraph(C:Char):Boolean;Begin
 IsGraph:=C in [#33..#255];
End;

Function IsLower(C:Char):Boolean;Begin
 IsLower:=C in ['a'..'z'];
End;

Function IsPrint(C:Char):Boolean;Begin
 IsPrint:=C in [#32..#255];
End;

Function IsPunct(C:Char):Boolean;Begin
 IsPunct:=C in ['!','"','#','$','%','&','''','(',')','*','+',',','-','.','/','{','}','~'];
End;

Function IsSpace(C:Char):Boolean;Begin
 IsSpace:=C in [#0,#8,' '];
End;

Function IsUpper(C:Char):Boolean;Begin
 IsUpper:=C in ['A'..'Z'];
End;

Function IsXDigit(C:Char):Boolean;Begin
 IsXDigit:=C in ['0'..'9','A'..'F','a'..'f'];
End;

Function Kill(PID,Sig:Integer):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 Kill:=0;
End;

Function LAbs(a:LongInt):LongInt;Begin
 If a<0.0 Then a:=-a;
 LAbs:=a;
End;

Function LDExp(x:Real;p:Integer):Real;

 Function IntPower(base:Real;Exponent:Integer):Real;
 Var
  i:LongInt;
  R:Real;
 Begin
  If(Base = 0.0)and(Exponent = 0)Then R:=1
   Else
  Begin
   i:=LAbs(Exponent);
   R:=1.0;
   While i>0 do Begin
    While (i and 1)=0 do Begin
     i:=i shr 1;
     Base:=Sqr(base);
    End;
    i:=i-1;
    R:=R*Base;
   End;
   If Exponent<0 Then R:=1.0/R;
  End;
  IntPower:=R;
 End;

Begin
 LDExp:=x*IntPower(2.0,p);
End;

Function LDiv(Numer,Denom:LongInt):LongInt;Begin
 LDiv:=Numer div Denom;
End;

Function Link(Path1,Path2:String):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 Link:=0;
End;

Function LocaleConv:PLConv;Begin
 WriteLn('NON IMPLEMENTEE');
 LocaleConv:=NIL;
End;

Function LocalTime(TimeP:LongInt):PTM;
Var
 Year,Month,Day,DOM,Hour,Min,Sec,Sec100:Word;
 P:PTM;
Begin
 GetDate(Year,Month,Day,DOM);
 GetTime(Hour,Min,Sec,Sec100);
 GetMem(P,SizeOf(TM));
 P^.tm_year:=Year;
 P^.tm_mon:=Month;
 P^.tm_mday:=DOM;
 P^.tm_hour:=Hour;
 P^.tm_min:=Min;
 P^.tm_sec:=Sec;
 LocalTime:=P;
End;

END.