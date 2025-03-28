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
 {$IFDEF WINDOWS}
  SysUtils,
 {$ENDIF}
 DOS,Strings;

Const
 EZERO=0;
 EINVFNC=1;
 ENOFILE=2;
 ENOPATH=3;
 ECONTR=7;
 EINVMEM=9;
 EINVENV=10;
 EINVFMT=11;
 EINVACC=12;
 EINVDAT=13;
 EINVDRV=15;
 ECURDIR=16;
 ENOTSAM=17;
 ENMFILE=18;
 ENOENT=2;
 EMFILE=4;
 EACCES=5;
 EBADF=6;
 ENOMEM=8;
 ENODEV=15;
 EINVAL=19;
 E2BIG=20;
 ENOEXEC=21;
 EXDEV=22;
 EDOM=33;
 ERANGE=34;
 EEXIST=35;
  {Constante umask}
 S_IRUSR=256;
 S_IWUSR=128;
 S_IXUSR=64;
 S_IRGRP=32;
 S_IWGRP=16;
 S_IXGRP=8;
 S_IROTH=4;
 S_IWOTH=2;
 S_IXOTH=1;
  {Constante Exit,_Exit}
 EXIT_SUCCESS=0;
 EXIT_FAILURE=1;

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
 TMS=Record
  tms_utime:LongInt;
  tms_stime:LongInt;
  tms_cutime:LongInt;
  tms_cstime:LongInt;
 End;
 Utsname=Record
  SysName:String;
  NodeName:String;
  Release:String;
  Version:String;
  Machine:String;
  DomainName:String;
 End;
 UTimeBuf=Record
  AcTime:LongInt;
  ModTime:Longint;
 End;
 Jmp_Buf=Record
  SegCode:Word;
  OffCode:Word;
 End;
 SearchRec=DOS.SearchRec;
 DIR=SearchRec;
 PSearchRec=^SearchRec;

Var
 ErrNo:Integer;
 TZName:String;

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
Function Calloc(N,size:Integer):Pointer;
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
Function Log(x:Real):Real;
Function Log10(x:Real):Real;
Procedure LongJmp(Var Env:Jmp_Buf;Val:Integer);
Function LSeek(FilDes:Integer;Offset:LongInt;Base:Integer):Integer;
Function Malloc(size:Integer):Pointer;
Function MBLen(S:PChar;Len:Integer):Integer;
Function MBSTOWCS(Dest,Src:PChar;N:Integer):PChar;
Function MBToWC(Dest,Src:PChar;N:Integer):PChar;
Function MemChr(S:PChar;C:Char;N:Integer):Pointer;
Function MemCmp(Buffer,Search:PChar;N:Integer):Pointer;
Function MemCpy(Var Dest,Source;N:Integer):Pointer;
Function MemMove(Var Dest,Source;N:Integer):Pointer;
Function MemSet(Var Source;C,N:Integer):Pointer;
Function MkDir(Path:String;Mode:Integer):Integer;
Function MkFifo(PathName:String;Mode:Integer):Integer;
Function MkTime(Var TimePtr:TM):LongInt;
Function Modf(X:Real;Var IPtr:Real):Real;
Function Nice(Incr:Integer):Integer;
Function OffsetOf(Var TypeRec,Member):Integer;
Function Open(PathName:String;Flags,Mode:Integer):Integer;
Function OpenDir(Name:String):PSearchRec;
Function PathConf(Path:String;Name:Integer):LongInt;
Function Pause:Integer;
Procedure PError(S:String);
Function Pipe(Var FileDes):Integer;
Function POW(a,b:Real):Real;
Function PrintF(Format:String;Var Buffer):Integer;
Function PutC(C:Integer;Var Stream:Text):Integer;
Function PutChar(C:Char):Integer;
Function PutS(S:String):Integer;
Procedure QSort(Tableau:Pointer;N,Size:Integer;Compare:Pointer);
Function Raise(Sig:Integer):Integer;
Function Rand:Integer;
Function Read(FilDes:Integer;Var Buffer;NByte:Integer):Integer;
Function ReadDir(Var S:SearchRec):PSearchRec;
Function ReAlloc(Ptr:Pointer;Size:Integer):Pointer;
Function Remove(PathName:String):Integer;
Function Rename(Old,New:String):Integer;
Procedure Rewind(Var F:File);
Procedure RewindDir(Var S:SearchRec);
Function RmDir(Path:String):Integer;
Function ScanF(Format:String;Var Buffer):Integer;
Function SetGID(GID:Integer):Integer;
Function SetJmp(Var Env):Integer;
Function SetLocale(Category:Integer;Locale:String):String;
Function SetPGID(PID,PGID:Integer):Integer;
Function SetSID:Integer;
Function SetUID(UID:Integer):Integer;
Function SigAction(Sig:Integer;Const Act; Var OAct):Integer;
Procedure SigLongJmp(Var Env;Valeur:Integer);
Function SigPending(Var _Set):Integer;
Function SigProcMask(How:Integer;Const _Set;Var OSet):Integer;
Function SigSetJmp(Var SigJmp_Buf;SaveSigs:Integer):Integer;
Function SigSuspend(Var SigMask):Integer;
Function Sin(X:Real):Real;
Function SinH(X:Real):Real;
Function Sleep(Seconds:Integer):Integer;
Function SPrintF(Var Target:String;Format:String;Var Buffer):Integer;
Function Sqrt(X:Real):Real;
Procedure SRand(Seed:Integer);
Function SScanF(Var Str:String;Format:String;Var Buffer):Integer;
Function Stat(Path:String;Var Buf):Integer;
Function StrCat(Dest,Source:PChar):PChar;
Function StrChr(S:PChar;C:Char):PChar;
Function StrCmp(Str1,Str2:PChar):Integer;
Function StrColl(Str1,Str2:PChar):Integer;
Function StrCpy(Dest,Source:PChar):PChar;
Function StrCSpn(Str1,Str2:PChar):Integer;
Function StrError(NoErr:Integer):PChar;
Function StrFTime(S:PChar;Max:Integer;Format:PChar;Var X:TM):Integer;
Function StrLen(S:PChar):Integer;
Function StrNCat(Str1,Str2:PChar;N:Integer):PChar;
Function StrNCmp(Str1,Str2:PChar;N:Integer):Integer;
Function StrNCpy(Str1,Str2:PChar;N:Integer):PChar;
Function StrPBrk(Source,Accept:PChar):PChar;
Function StrRChr(Str:PChar;C:Char):PChar;
Function StrSpn(Str1,Str:PChar):Integer;
Function StrStr(Str2,Str1:PChar):PChar;
Function StrToD(NPtr:PChar;Var EndPtr:PChar):Double;
Function StrTok(Str1,Str2:PChar):PChar;
Function StrToL(NPtr:PChar;Var EndPtr:PChar):LongInt;
Function StrToUL(NPtr:PChar;Var EndPtr:PChar;Base:Integer):LongInt;
Function StrXFrm(Dest,Src:PChar;N:Integer):Integer;
Function SysConf(Name:Integer):LongInt;
Function System_(Command:PChar):Integer;
Function Tan(X:Real):Real;
Function TanH(X:Real):Real;
Function TCDrain(FD:Integer):Integer;
Function TCFlow(Fd,Action:Integer):Integer;
Function TCFlush(Fd,Queue_Selector:Integer):Integer;
Function TCGetPGrp(Fd:Integer):Integer;
Function TCSendBreak(Fd,Duration:Integer):Integer;
Function TCSetPGrp(Fd,PGrp:Integer):Integer;
Function Time(Var PtrHeure):LongInt;
Function Times(Var Buf:TMS):LongInt;
Function TmpFiles:PFile;
Function TmpNam(Name:PChar):PChar;
Function ToLower(C:Char):Char;
Function ToUpper(C:Char):Char;
Function TTYName(Desc:Integer):PChar;
Procedure TZSet;
Function Umask(Mask:Integer):Integer;
Function UName(Var Buf:Utsname):Integer;
Function UngetC(C:Char;Var PtrFichier:Text):Char;
Function Unlink(PathName:String):Integer;
Function Utime(FileName:PChar;Buf:UTimeBuf):Integer;
Function VFPrintF(Var PtrFichier:File;Format:String;Var Buffer):Integer;
Function VSPrintF(Var S:String;Format:String;Var Buffer):Integer;
Function Wait(Stat_Loc:Integer):Integer;
Function WaitPID(Pid:Integer;Var Status:Integer;Options:Integer):Integer;
Function WCStombs(S,PWCS:PChar;N:Integer):Integer;
Function WCTomb(S,WChar:PChar):Integer;
Function Write(FD:Integer;Var Buffer;Count:Integer):Integer;
Procedure _Exit(Status:Integer);

IMPLEMENTATION

Uses Crt;

Var
 SaveExit:Pointer;

 { Priv‚ }
Function ByteHex2Str(value:Byte):String;
Const
 matrix:Array[0..15]of Char = ('0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F');
Begin
 ByteHex2Str:=matrix[(value shr 4) and $0F]+matrix[value and $F];
End;

 { Public }
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

Function Calloc(N,size:Integer):Pointer;
Var
 P:Pointer;
Begin
 GetMem(P,N*size);
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
 System.Read(F,C);
End;

Function FGetPos(Var F:File;Pos:LongInt):LongInt;Begin
 FGetPos:=FilePos(F);
End;

Function FGetS(Var S:String;Size:Integer;Var F:Text):String;Begin
 ReadLn(F,S);
 FGetS:=S;
End;

Function FileNo(Var F:File):Integer;Begin
 FileNo:=FileRec(F).Handle;
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
 System.Write(F,C);
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
 System.Read(F,C);
 GetC:=C;
End;

Function GetChar:Char;
Var
 C:Char;
Begin
 System.Read(C);
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
 IsATTY:=Desc in [0, 1, 2];  { V‚rifie si Desc est un descripteur standard }
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

Function Log(x:Real):Real;
Var
 negatif:Boolean;
 fois,i:Integer;
 ajout,savx,xp,quotient,dl:Real;
Begin
 negatif := False;
 fois := 1;
 ajout := 0;
 If x <= 0.0 Then Begin
  Log:=0;
  System.Exit;
 End;
 If x < 1.0 Then Begin
  negatif := True;
  x := 1.0 / x;
 End;
 While x >= 10.0 do Begin
  x := x / 10.0;
  ajout := ajout + 2.302585092994046;
 End;
 While x >= 1.1 do Begin
  x := Sqrt(x);
  fois := fois * 2;
 End;
 x := x - 1;
 savx := x;
 i := 2;
 xp := x * x;
 quotient := (xp / i);
 dl := x - quotient;
 While 1.0E-15 < quotient do Begin
  i := i + 1;
  xp := xp * x;
  dl := dl + (xp / i);
  i := i + 1;
  xp := xp * x;
  quotient := (xp / i);
  dl := dl - quotient;
 End;
 dl := dl * fois;
 dl := dl + ajout;
 If(negatif)Then dl := - dl;
 Log:=dl;
End;

Function Log10(x:Real):Real;Begin
 Log10:=Log(x)/2.3025850930;
End;

Procedure LongJmp(Var Env:Jmp_Buf;Val:Integer);Begin
 WriteLn('NON IMPLEMENTEE');
End;

Function LSeek(FilDes:Integer;Offset:LongInt;Base:Integer):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 LSeek:=0;
End;

Function Malloc(size:Integer):Pointer;
Var
 P:Pointer;
Begin
 GetMem(P,size);
 Malloc:=P;
End;

Function MBLen(S:PChar;Len:Integer):Integer;Begin
 MBLen:=StrLen(S);
End;

Function MBSTOWCS(Dest,Src:PChar;N:Integer):PChar;Begin
 WriteLn('NON IMPLEMENTEE');
 MBSTOWCS:=NIL;
End;

Function MBToWC(Dest,Src:PChar;N:Integer):PChar;Begin
 WriteLn('NON IMPLEMENTEE');
 MBToWC:=NIL;
End;

Function MemChr(S:PChar;C:Char;N:Integer):Pointer;
Var
 I:Integer;
Begin
 MemChr:=NIL;
 For I:=0 to N-1 do Begin
  If S[I]=C Then Begin
   MemChr:=@S[I];
   System.Exit;
  End;
 End;
End;

Function MemCmp(Buffer,Search:PChar;N:Integer):Pointer;Begin
 WriteLn('NON IMPLEMENTEE');
 MemCmp:=NIL;
End;

Function MemCpy(Var Dest,Source;N:Integer):Pointer;Begin
 Move(Source,Dest,N);
 MemCpy:=@Dest;
End;

Function MemMove(Var Dest,Source;N:Integer):Pointer;Begin
 Move(Source,Dest,N);
 MemMove:=@Dest;
End;

Function MemSet(Var Source;C,N:Integer):Pointer;Begin
 FillChar(Source,N,C);
 MemSet:=@Source;
End;

Function MkDir(Path:String;Mode:Integer):Integer;Begin
 System.MkDir(Path);
 MkDir:=IoResult;
End;

Function MkFifo(PathName:String;Mode:Integer):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 MkFifo:=0;
End;

Function MkTime(Var TimePtr:TM):LongInt;
Var
 P:LongInt;
 D:DateTime;
Begin
 D.Year:=TimePtr.tm_year;
 D.Month:=TimePtr.tm_mon;
 D.Day:=TimePtr.tm_mday;
 D.Hour:=TimePtr.tm_hour;
 D.Min:=TimePtr.tm_min;
 D.Sec:=TimePtr.tm_sec;
 PackTime(D,P);
 MkTime:=P;
End;

Function Modf(X:Real;Var IPtr:Real):Real;Begin
 Modf:=Frac(X);
 IPtr:=X-Frac(X);
End;

Function Nice(Incr:Integer):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 Nice:=0;
End;

Function OffsetOf(Var TypeRec,Member):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 OffsetOf:=0;
End;

Function Open(PathName:String;Flags,Mode:Integer):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 Open:=0;
End;

Function OpenDir(Name:String):PSearchRec;
Var
 P:PSearchRec;
Begin
 GetMem(P,SizeOf(SearchRec));
 FindFirst(Name,$FFFF,P^);
 OpenDir:=P;
End;

Function PathConf(Path:String;Name:Integer):LongInt;Begin
 WriteLn('NON IMPLEMENTEE');
 PathConf:=0;
End;

Function Pause:Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 Pause:=0;
End;

Procedure PError(S:String);Begin
 WriteLn('NON IMPLEMENTEE');
End;

Function Pipe(Var FileDes):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 Pipe:=0;
End;

Function POW(a,b:Real):Real;
Var
 p:Real;
 I:Integer;
Begin
 p:=1;
 For i:=1 to Trunc(b) do Begin
  p:=p*a;
 End;
 Pow:=p;
End;

Function PrintF(Format:String;Var Buffer):Integer;
Type
 PtrRec=Record
  Ofs,Seg:Word; { Offset et Segment }
 End;
Var
 Ptr:Pointer;
 PtrReal:PtrRec Absolute Ptr;
 PChr:^Char Absolute Ptr;
 PInt:^Integer Absolute Ptr;
 PStr:^String Absolute Ptr;
 I:Byte;
Begin
 I:=1;
 While(I<=Length(Format))do Begin
  If '%'=Format[I]Then Begin
   I:=I+1;
   Case Format[I]of
    'c':Begin
     System.Write(PChr^);
     {$IFDEF FPC}
      Inc(Ptr,SizeOf(Char));
     {$ELSE}
      Inc(PtrReal.Ofs,SizeOf(Char));
     {$ENDIF}
    End;
    'i':Begin
     System.Write(PInt^);
     {$IFDEF FPC}
      Inc(Ptr,SizeOf(Integer));
     {$ELSE}
      Inc(PtrReal.Ofs,SizeOf(Integer));
     {$ENDIF}
    End;
    's':Begin
     System.Write(PStr^);
     {$IFDEF FPC}
      Inc(Ptr,SizeOf(String));
     {$ELSE}
      Inc(PtrReal.Ofs,SizeOf(String));
     {$ENDIF}
    End;
    'x':Begin
     System.Write(ByteHex2Str(Byte(PChr^)));
     {$IFDEF FPC}
      Inc(Ptr,SizeOf(Char));
     {$ELSE}
      Inc(PtrReal.Ofs,SizeOf(Char));
     {$ENDIF}
    End;
   End;
  End;
  I:=I+1;
 End;
End;

Function PutC(C:Integer;Var Stream:Text):Integer;Begin
 System.Write(Stream,C);
 PutC:=IOResult;
End;

Function PutChar(C:Char):Integer;Begin
 System.Write(C);
 PutChar:=IOResult;
End;

Function PutS(S:String):Integer;Begin
 WriteLn(S);
End;

Procedure QSort(Tableau:Pointer;N,Size:Integer;Compare:Pointer);Begin
 WriteLn('NON IMPLEMENTEE');
End;

Function Raise(Sig:Integer):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 Raise:=0;
End;

Function Rand:Integer;Begin
 Rand:=Random(32767);
End;

Function Read(FilDes:Integer;Var Buffer;NByte:Integer):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 Read:=0;
End;

Function ReadDir(Var S:SearchRec):PSearchRec;Begin
 FindNext(S);
 ReadDir:=@S;
End;

Function ReAlloc(Ptr:Pointer;Size:Integer):Pointer;Begin
 WriteLn('NON IMPLEMENTEE');
 ReAlloc:=Ptr;
End;

Function Remove(PathName:String):Integer;
Var
 F:File;
Begin
 {$I-}Assign(F,PathName);
 Erase(F);
 {$I+}
 Remove:=IoResult;
End;

Function Rename(Old,New:String):Integer;
Var
 F:File;
Begin
 {$I-}Assign(F,Old);
 System.Rename(F,New);
 {$I+}
 Rename:=IoResult;
End;

Procedure Rewind(Var F:File);Begin
 Seek(F,0);
End;

Procedure RewindDir(Var S:SearchRec);Begin
 WriteLn('NON IMPLEMENTEE');
End;

Function RmDir(Path:String):Integer;Begin
 System.RmDir(Path);
 RmDir:=IoResult;
End;

Function ScanF(Format:String;Var Buffer):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 ScanF:=0;
End;

Function SetGID(GID:Integer):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 SetGID:=0;
End;

Function SetJmp(Var Env):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 SetJmp:=0;
End;

Function SetLocale(Category:Integer;Locale:String):String;Begin
 WriteLn('NON IMPLEMENTEE');
 SetLocale:='';
End;

Function SetPGID(PID,PGID:Integer):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 SetPGID:=0;
End;

Function SetSID:Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 SetSID:=0;
End;

Function SetUID(UID:Integer):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 SetUID:=0;
End;

Function SigAction(Sig:Integer;Const Act; Var OAct):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 SigAction:=0;
End;

Procedure SigLongJmp(Var Env;Valeur:Integer);Begin
 WriteLn('NON IMPLEMENTEE');
End;

Function SigPending(Var _Set):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 SigPending:=0;
End;

Function SigProcMask(How:Integer;Const _Set;Var OSet):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 SigProcMask:=0;
End;

Function SigSetJmp(Var SigJmp_Buf;SaveSigs:Integer):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 SigSetJmp:=0;
End;

Function SigSuspend(Var SigMask):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 SigSuspend:=0;
End;

Function Sin(X:Real):Real;
Var
 R,S:Real;
 I:Byte;
Begin
 R:=X*X;
 S:=42.0;
 For I:=10 downto 1 do S:=4.0*I-2.0+(-R)/S;
 Sin:=2.0*X*S/(R+S*S);
End;

Function SinH(X:Real):Real;Begin
 SinH:=(Exp(X)-Exp(-X))/2;
End;

Function Sleep(Seconds:Integer):Integer;Begin
 Delay(Seconds);
End;

Function SPrintF(Var Target:String;Format:String;Var Buffer):Integer;
Type
 PtrRec=Record
  Ofs,Seg:Word; { Offset et Segment }
 End;
Var
 Ptr:Pointer;
 PtrReal:PtrRec Absolute Ptr;
 PChr:^Char Absolute Ptr;
 PInt:^Integer Absolute Ptr;
 PStr:^String Absolute Ptr;
 I:Byte;
 SInt:String;
 Err:Word;
Begin
 Target:='';
 I:=1;
 While(I<=Length(Format))do Begin
  If '%'=Format[I]Then Begin
   I:=I+1;
   Case Format[I]of
    'c':Begin
     Target:=Target+PChr^;
     {$IFDEF FPC}
      Inc(Ptr,SizeOf(Char));
     {$ELSE}
      Inc(PtrReal.Ofs,SizeOf(Char));
     {$ENDIF}
    End;
    'i':Begin
     Val(SInt,PInt^,Err);
     Target:=Target+SInt;
     {$IFDEF FPC}
      Inc(Ptr,SizeOf(Integer));
     {$ELSE}
      Inc(PtrReal.Ofs,SizeOf(Integer));
     {$ENDIF}
    End;
    's':Begin
     Target:=Target+PStr^;
     {$IFDEF FPC}
      Inc(Ptr,SizeOf(String));
     {$ELSE}
      Inc(PtrReal.Ofs,SizeOf(String));
     {$ENDIF}
    End;
    'x':Begin
     Target:=Target+ByteHex2Str(Byte(PChr^));
     {$IFDEF FPC}
      Inc(Ptr,SizeOf(Char));
     {$ELSE}
      Inc(PtrReal.Ofs,SizeOf(Char));
     {$ENDIF}
    End;
   End;
  End;
  I:=I+1;
 End;
 SPrintF:=Length(Target);
End;

Function Sqrt(X:Real):Real;
Var
 A,B,M,XN:Real;
Begin
 If X=0.0Then Begin
  Sqrt:=0.0;
 End
  Else
 Begin
  M := 1.0;
  XN := X;
  While XN >= 2.0 do Begin
   XN := 0.25 * XN;
   M := 2.0 * M;
  End;
  While XN < 0.5 do Begin
   XN:=4.0 * XN;
   M:=0.5 * M;
  End;
  A:=XN;
  B:=1.0-XN;
  Repeat
   A:=A*(1.0+0.5*B);
   B:=0.25*(3.0+B)*B*B;
  Until B<1.0E-15;
  Sqrt:=A*M;
 End;
End;

Procedure SRand(Seed:Integer);Begin
 Randomize;
End;

Function SScanF(Var Str:String;Format:String;Var Buffer):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 SScanF:=0;
End;

Function Stat(Path:String;Var Buf):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 Stat:=0;
End;

Function StrCat(Dest,Source:PChar):PChar;Begin
 StrCat:=Strings.StrCat(Dest,Source);
End;

Function StrChr(S:PChar;C:Char):PChar;
Var
 I:Integer;
Begin
 While S[I]<>#0 do Begin
  If S[I]=C Then Begin
   StrChr:=@S[I];
  End;
 End;
End;

Function StrCmp(Str1,Str2:PChar):Integer;Begin
 StrCmp:=StrComp(Str1,Str2);
End;

Function StrColl(Str1,Str2:PChar):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 StrColl:=0;
End;

Function StrCpy(Dest,Source:PChar):PChar;Begin
 StrCpy:=StrCopy(Dest,Source);
End;

Function StrCSpn(Str1,Str2:PChar):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 StrCSpn:=0;
End;

Function StrError(NoErr:Integer):PChar;Begin
 StrError:='';
 Case NoErr of
  EZERO:StrError:='Erreur 0';
  EINVFNC:StrError:='Num‚ro de fonction invalide';
  ENOFILE:StrError:='Fichier introuvable';
  ENOPATH:StrError:='Chemin introuvable';
  ECONTR:StrError:='Bloc de m‚moire d‚truit';
  EINVMEM:StrError:='Adresse de bloc m‚moire invalide';
  EINVENV:StrError:='Environnement invalide';
  EINVFMT:StrError:='Format invalide';
  EINVACC:StrError:='Code d''accŠs invalide';
  EINVDAT:StrError:='Donn‚es invalide';
  EINVDRV:StrError:='Unit‚ invalide sp‚cifi‚';
  ECURDIR:StrError:='Tentative d''enlever le r‚pertoire courant';
  ENOTSAM:StrError:='Ce n''est pas le mˆme p‚riph‚rique';
  ENMFILE:StrError:='Il n''y a plus de fichiers';
  EMFILE:StrError:='Trop de fichier ouvert simultan‚ment';
  EACCES:StrError:='Permission refus‚';
  EBADF:StrError:='Mauvais num‚ro de fichier';
  ENOMEM:StrError:='Il n''y a plus de m‚moire';
  {ENODEV:StrError:='Aucun p‚riph‚rique de ce type';}
  EINVAL:StrError:='ParamŠtre inavlide';
  E2BIG:StrError:='Liste de paramŠtres trop longue';
  ENOEXEC:StrError:='Erreur de format d''ex‚cutable';
  EXDEV:StrError:='Liaison de p‚riph‚rique incorrecte';
  EDOM:StrError:='ParamŠtre en dehors du domaine de la fonction';
  ERANGE:StrError:='R‚sultat trop large';
  EEXIST:StrError:='Le fichier existe d‚j…';
  Else StrError:='Erreur inconnu';
 End;
End;

Function StrFTime(S:PChar;Max:Integer;Format:PChar;Var X:TM):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 StrFTime:=0;
End;

Function StrLen(S:PChar):Integer;Begin
 StrLen:=Strings.StrLen(S);
End;

Function StrNCat(Str1,Str2:PChar;N:Integer):PChar;
Var
 L1:Integer;
Begin
 L1:=StrLen(Str1);
 Move(Str2^,Str1[L1],N);
 Str1[L1+N]:=#0;
End;

Function StrNCmp(Str1,Str2:PChar;N:Integer):Integer;
Var
 I:Integer;
Begin
 StrNCmp:=0;
 For I:=0 to N do Begin
  If Str1[I]<Str2[I]Then Begin
   StrNCmp:=-1;
   System.Exit;
  End
   Else
  If Str1[I]>Str2[I]Then Begin
   StrNCmp:=1;
   System.Exit;
  End;
 End;
End;

Function StrNCpy(Str1,Str2:PChar;N:Integer):PChar;
Var
 L1,L2:Integer;
Begin
 L1:=StrLen(Str1);
 L2:=StrLen(Str2);
 Move(Str1^,Str2^,N);
 If L2<N Then Str2[N]:=#0;
 StrNCpy:=Str2;
End;

Function StrPBrk(Source,Accept:PChar):PChar;Begin
 WriteLn('NON IMPLEMENTEE');
 StrPBrk:=NIL;
End;

Function StrRChr(Str:PChar;C:Char):PChar;Begin
 WriteLn('NON IMPLEMENTEE');
 StrRChr:=NIL;
End;

Function StrSpn(Str1,Str:PChar):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 StrSpn:=0;
End;

Function StrStr(Str2,Str1:PChar):PChar;Begin
 WriteLn('NON IMPLEMENTEE');
 StrStr:=NIL;
End;

Function StrToD(NPtr:PChar;Var EndPtr:PChar):Double;
Var
 R:Double;
 Err:Word;
 I:Integer;
Begin
 Val(StrPas(NPtr),R,Err);
 I:=0;
 While NPtr[I] in['0'..'9','.','E','-','+']do Begin
  Inc(I);
 End;
 EndPtr:=@NPtr[I];
 StrToD:=R;
End;

Function StrTok(Str1,Str2:PChar):PChar;Begin
 WriteLn('NON IMPLEMENTEE');
 StrTok:=NIL;
End;

Function StrToL(NPtr:PChar;Var EndPtr:PChar):LongInt;
Var
 R:LongInt;
 Err:Word;
 I:Integer;
Begin
 Val(StrPas(NPtr),R,Err);
 I:=0;
 While NPtr[I] in['0'..'9']do Begin
  Inc(I);
 End;
 EndPtr:=@NPtr[I];
 StrToL:=R;
End;

Function StrToUL(NPtr:PChar;Var EndPtr:PChar;Base:Integer):LongInt;Begin
 WriteLn('NON IMPLEMENTEE');
 StrToUL:=0;
End;

Function StrXFrm(Dest,Src:PChar;N:Integer):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 StrXFrm:=0;
End;

Function SysConf(Name:Integer):LongInt;Begin
 WriteLn('NON IMPLEMENTEE');
 SysConf:=0;
End;

Function System_(Command:PChar):Integer;Begin
 SwapVectors;
 Exec(GetEnv('COMSPEC'),'/C '+StrPas(Command));
 SwapVectors;
End;

Function Tan(X:Real):Real;Begin
 Tan:=Sin(X)/Cos(X);
End;

Function TanH(X:Real):Real;Begin
 TanH:=(Exp(X)-Exp(-X))/(Exp(X)+Exp(-X));
End;

Function TCDrain(FD:Integer):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 TCDrain:=0;
End;

Function TCFlow(Fd,Action:Integer):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 TCFlow:=0;
End;

Function TCFlush(Fd,Queue_Selector:Integer):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 TCFlush:=0;
End;

Function TCGetPGrp(Fd:Integer):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 TCGetPGrp:=0;
End;

Function TCSendBreak(Fd,Duration:Integer):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 TCSendBreak:=0;
End;

Function TCSetPGrp(Fd,PGrp:Integer):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 TCSetPGrp:=0;
End;

Function Time(Var PtrHeure):LongInt;Begin
 WriteLn('NON IMPLEMENTEE');
 Time:=0;
End;

Function Times(Var Buf:TMS):LongInt;Begin
 WriteLn('NON IMPLEMENTEE');
 Times:=0;
End;

Function TmpFiles:PFile;Begin
 WriteLn('NON IMPLEMENTEE');
 TmpFiles:=NIL;
End;

Function TmpNam(Name:PChar):PChar;Begin
 WriteLn('NON IMPLEMENTEE');
 TmpNam:=NIL;
End;

Function ToLower(C:Char):Char;Begin
 If C in['A'..'Z']Then C:=Chr(Ord(C)+32);
 ToLower:=C;
End;

Function ToUpper(C:Char):Char;Begin
 If C in['a'..'z']Then C:=Chr(Ord(C)-32);
 ToUpper:=C;
End;

Function TTYName(Desc:Integer):PChar;Begin
 WriteLn('NON IMPLEMENTEE');
 TTYName:=NIL;
End;

Procedure TZSet;Begin
 WriteLn('NON IMPLEMENTEE');
End;

Function Umask(Mask:Integer):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 Umask:=0;
End;

Function UName(Var Buf:Utsname):Integer;
Var
 S:String;
Begin
 Buf.SysName:='MS-DOS';
  {$IFDEF LCLcarbon}
   Buf.SysName:='Mac OS X';
  {$ELSE}
   {$IFDEF Linux}
    Buf.SysName:='GNU/Linux';
   {$ELSE}
    {$IFDEF UNIX}
     Buf.SysName:='Unix';
    {$ELSE}
    {$IFDEF WINDOWS}
     Case Win32Platform of
      0:Case Win32MajorVersion of
       3:Buf.SysName:='Windows 3';
       Else Buf.SysName:='Windows';
      End;
      1:Case Win32MajorVersion of
       4:Case Win32MinorVersion of
        0:Buf.SysName:='Windows 95';
        10:Buf.SysName:='Windows 98';
        90:Buf.SysName:='Windows ME';
        Else Buf.SysName:='Windows 90X';
       End;
      End;
      2:Begin
       Case Win32MajorVersion of
        3:Case Win32MinorVersion of
         1:Buf.SysName:='Windows NT 3.1';
         50:Buf.SysName:='Windows NT 3.50';
         51:Buf.SysName:='Windows NT 3.51';
         Else Buf.SysName:='Windows NT 3';
        End;
        4:Buf.SysName:='Windows NT 4';
        5:Case Win32MinorVersion of
         0:Buf.SysName:='Windows 2000';
         1:Buf.SysName:='Windows XP';
         2:Buf.SysName:='Windows XP 64';
         Else Buf.SysName:='Windows 2000 ou XP';
        End;
        6:Case Win32MinorVersion of
         0:Buf.SysName:='Windows Vista ou Windows Server 2003';
         1:Buf.SysName:='Windows 7 ou Windows Server 2008 R2';
         2:Buf.SysName:='Windows 8 ou Windows Server 2012';
         3:Buf.SysName:='Windows 8.1 ou Windows Server 2012 R2';
         Else Buf.SysName:='Windows';
        End;
        Else Buf.SysName:='Windows';
       End;
      End;
     End;
    {$ENDIF}
   {$ENDIF}
  {$ENDIF}
 {$ENDIF}
 Buf.NodeName:='TP';
 Buf.Release:='7.0';
 Str(Lo(DosVersion),S);
 Buf.Version:=S;
 Str(Hi(DosVersion),S);
 Buf.Version:=Buf.Version+'.'+S;
 Buf.Machine:=GetEnv('PROCESSOR_ARCHITECTURE');
 Buf.DomainName:=GetEnv('USERDOMAIN');
End;

Function UngetC(C:Char;Var PtrFichier:Text):Char;
Var
 R:Char;
Begin
 System.Read(PtrFichier,R);
 System.Write(PtrFichier,C);
 UngetC:=R;
End;

Function Unlink(PathName:String):Integer;
Var
 F:File;
Begin
  {$I-}Assign(F,PathName);
  Erase(F);
  {$I+}
  Unlink:=IoResult;
End;

Function Utime(FileName:PChar;Buf:UTimeBuf):Integer;
Var
 F:File;
Begin
 {$I-}Assign(F,StrPas(FileName));
 Reset(F);
 {$I+}
 Utime:=IoResult;
 GetFTime(F,Buf.ModTime);
 Buf.AcTime:=Buf.ModTime; { On copie l'heure de modification dans l'accŠs
                            car il n'est pas possible de connaitre cette
                            information }
 System.Close(F);
End;

Function VFPrintF(Var PtrFichier:File;Format:String;Var Buffer):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 VFPrintF:=0;
End;

Function VSPrintF(Var S:String;Format:String;Var Buffer):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 VSPrintF:=0;
End;

Function Wait(Stat_Loc:Integer):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 Wait:=0;
End;

Function WaitPID(Pid:Integer;Var Status:Integer;Options:Integer):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 WaitPID:=0;
End;

Function WCStombs(S,PWCS:PChar;N:Integer):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 WCStombs:=0;
End;

Function WCTomb(S,WChar:PChar):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 WCTomb:=0;
End;

Function Write(FD:Integer;Var Buffer;Count:Integer):Integer;Begin
 WriteLn('NON IMPLEMENTEE');
 Write:=0;
End;

Procedure _Exit(Status:Integer);Begin
 Halt(Status);
End;

BEGIN
 TZName:='';
END.
