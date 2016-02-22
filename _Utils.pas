(******************************************************************************
 Proyecto Delphi Standard

 Copyright (C) 2008-2015 - Jesus Huante Caballero

 ******************************************************************************)
unit _Utils;

interface

uses Windows, SysUtils, Classes, Controls, Forms, StdCtrls, Registry,
  IdWinSock2, ShellAPI, DB, ADODB,
  IdHashMessageDigest, idHash;

type
  TLangAndCP = record
    wLanguage : word;
    wCodePage : word;
    end;
  PLangAndCP = ^TLangAndCP;

//  TPBtnType  = (btStart, btPause, btStop, btFinish, btClean, btPartial);
//  TButtonSet = set of TPBtnType;
//  TPModes    = (pNone, pReady, pStarted, pInProcess, pPaused, pStopped, pFinished);

const
  strConectionFileName = 'FILE NAME=';
  strConectionADOFile  = 'ADOc.udl';
  strCompanyName     = 'NetVaIT';
  strProductName     = 'MAS';
  strFileDescription = 'Sistema de inventario';
  strSeparador       = ' - ';
  strRegistryKey     = 'Software\MAS';
  InfoNum = 10;
  InfoStr : array [1..InfoNum] of String = ('CompanyName', 'FileDescription',
  'FileVersion', 'InternalName', 'LegalCopyright', 'LegalTradeMarks',
  'OriginalFilename', 'ProductName', 'ProductVersion', 'Comments');

resourcestring
//_ConectionDmod
  strNotConnectToDB = 'No fue posible conectarse con el servidor de datos, la aplicación se terminara.';
  strIncorrectUser  = 'El usuario no existe, intente nuevamente';
  strIncorrectPass  = 'La contraseña es incorrecta, intente nuevamente';
//_StandarForm
  strExistChanges   = 'Existen modificacion(es), ¿Desea aplicar los cambios?';
  strAllowDelete    = '¿Desea eliminar este registro?';
  strOpenFile       = '¿Desea abrir el archivo?';
  strDeleteReferenceError = 'No es posible borrar el registro ya que tiene información asociada';
  strUniqueKeyError       = '';
  strUser           = 'Usuario: ';
////ProduccionDmod
//  strAllowImportDO   = '¿Desea importar la información de Desicion ONE?';
//  strAllowExportDO   = '¿Desea exportar la información a Desicion ONE?';
//  strAllowProgram    = '¿Desea generar la programación de los pedidos?';
//  strAllowChangeDate = 'Se ha efectuado una modificación en la fecha ¿Desea actualizarla?';
//  strProgramCorrect  = 'El proceso de programación ha finalizado.' + Chr(13) + '- Se programarón %d pedido(s).' + Chr(13) + '- Se generarón %d de %d partida(s)';
////DesicionOneDmod
//  strImportDOCorrect   = 'El proceso de importación ha finalizado. Se importaron %d de %d registro(s).';
//  strNotImportOrders   = 'Ordenes no importadas %s';
//  strExportDOCorrect   = 'El proceso de exportación ha finalizado. Se exportaron %d registro(s).';
////ProductionsDmod
//  strStationNotFound    = 'La estación no se encuentra definida en la base de datos.';
//  strStationNotRegistry = 'No fue posible encontrar el registro de la estación.';
//  strAllowFinish   = 'Existen %d pendientes por producir, se completara y terminara la partida ¿Desea continuar?';
//  strAllowClean    = 'Se terminara la partida, hay %d pendientes por producir pasaran a cantidad rechazada ¿Desea continuar?';
//  strNotClean      = 'No es posible Limpiar, debido a que no ha pendientes de producir.';
//  strPartialNoQuantity = 'Es necesario capturar alguna cantidad(Producida, Reparada o Rechazada).';

//function LocalIP: string;
function GetRegistryStringValue(const vKey, vName: string): string;
procedure SetRegistryStringValue(const vKey, vName, vValue: string);
procedure SetKeyboardToForm(pForm: TForm);
procedure VersionInformation(pApplicationName: String; ListInfo: TStringList);
procedure RefreshADODS(pADODataSet: TCustomADODataSet; ID: TField);
procedure ShowProgress(pPosition, pTotal: Double); overload;
procedure ShowProgress(pPosition, pTotal: Double; pText: string); overload;
function GetFileSize(FileName: TFileName): Integer;
function GetTotalRecords(FileName: TFileName; RecorSize: Double): Integer;
procedure ExecuteUntilFinish(ExecuteFile : string);
function EjecutarYEsperar( sPrograma: String; Visibilidad: Integer ): Integer;
function xIntToLletras(Numero:LongInt):String;
function MD5File(const FileName: string): string;
procedure BorraSoloArchivos(Const dirName:String);  //aban

implementation

uses _ProgressForm;

//function LocalIP: string;
//type
//   TaPInAddr = array [0..10] of PInAddr;
//   PaPInAddr = ^TaPInAddr;
//var
//    phe: PHostEnt;
//    pptr: PaPInAddr;
//    Buffer: array [0..63] of char;
//    i: Integer;
//    GInitData: TWSADATA;
//begin
//    WSAStartup($101, GInitData);
//    Result := '';
//    GetHostName(Buffer, SizeOf(Buffer));
//    phe :=GetHostByName(buffer);
//    if phe = nil then Exit;
//    pptr := PaPInAddr(Phe^.h_address_list);
//    i := 0;
//    while pptr^[i] <> nil do
//    begin
//      result := StrPas(inet_ntoa(pptr^[i]^));
//      Inc(i);
//    end;
//    WSACleanup;
//end;

function GetRegistryStringValue(const vKey, vName: string): string;
var
  Registry : TRegistry;
begin
  Registry := TRegistry.Create;
  try
    Registry.RootKey := HKEY_LOCAL_MACHINE;
    if Registry.OpenKey(vKey, False) then
      Result := Registry.ReadString(vName);
  finally
    Registry.Free;
  end;
end;

procedure SetRegistryStringValue(const vKey, vName, vValue: string);
var
  Registry : TRegistry;
begin
  Registry := TRegistry.Create;
  try
    Registry.RootKey := HKEY_LOCAL_MACHINE;
    if Registry.OpenKey(vKey, True) then
      Registry.WriteString(vName, vValue);
  finally
    Registry.Free;
  end;
end;

procedure SetKeyboardToForm(pForm: TForm);
var
  aComponent : TComponent;
  I: Integer;

procedure EditEnter(Sender: TObject);
begin
  ShellExecute(TEdit(Sender).Handle, 'open', 'osk.exe', nil, nil, 0);
end;

begin
  for I := 0 to pForm.ComponentCount - 1 do
  begin
    aComponent := pForm.Components[I];
    if aComponent is TEdit then
    begin
//      TEdit(aComponent).OnEnter:= EditEnter;
    end;
  end;
end;

procedure VersionInformation(pApplicationName: String; ListInfo: TStringList);
var
  N         : integer;
  ZValue    : cardinal;
  Buf       : PChar;
  Lang      : PLangAndCP;
  LangLen   : cardinal;
  SubBlock  : string;
  Value     : PChar;
  Len       : cardinal;
  j         : Integer;
begin
  ListInfo.Clear;
  N:=GetFileVersionInfoSize(PChar(pApplicationName),ZValue);
  if N>0 then begin
    Buf:=AllocMem(N);
    GetFileVersionInfo(PChar(pApplicationName),0,N,Buf);
    VerQueryValue(Buf,PChar('\\VarFileInfo\\Translation'),Pointer(Lang),LangLen);

    for j:=1 To InfoNum do
    begin
      SubBlock:=Format('\\StringFileInfo\\%.4x%.4x\\'+InfoStr[j],[Lang^.wLanguage,Lang^.wCodePage]);
      if VerQueryValue(Buf,PChar(SubBlock),Pointer(Value),Len) then
        ListInfo.Add (Value)
      else
        ListInfo.Add ('<informacion no disponible>');
    end;
    FreeMem(Buf,N);
  end
  else begin
    for j:=1 To InfoNum do
      ListInfo.Add ('<informacion no disponible>');
  end;
end;

procedure RefreshADODS(pADODataSet: TCustomADODataSet; ID: TField);
var
  pID: Variant;
begin
  pID:= ID.Value;
  pADODataSet.Requery();
  pADODataSet.Locate(ID.FieldName, pID, []);
end;

procedure ShowProgress(pPosition, pTotal: Double);
begin
  try
    _frmProgress.Total:= pTotal;
    _frmProgress.Position := pPosition;
    _frmProgress.Text:= EmptyStr;
    if pPosition <> pTotal
    then _frmProgress.Show
    else _frmProgress.Close;
    Application.ProcessMessages;
  except
    _frmProgress.Close;
    Raise;
  end;
end;

procedure ShowProgress(pPosition, pTotal: Double; pText: string);
begin
  try
    _frmProgress.Total:= pTotal;
    _frmProgress.Position := pPosition;
    _frmProgress.Text:= pText;
    if pPosition <> pTotal
    then _frmProgress.Show
    else _frmProgress.Close;
    Application.ProcessMessages;
  except
    _frmProgress.Close;
    Raise;
  end;
end;

function GetFileSize(FileName: TFileName): Integer;
var
   f: file of Byte;
begin
  Result:= -1;
  if FileExists(FileName) then
  begin
    AssignFile(f, FileName);
    Reset(f);
    try
      Result := FileSize(f);
    finally
      CloseFile(f);
    end;
  end;
end;

function GetTotalRecords(FileName: TFileName;
  RecorSize: Double): Integer;
var
  FileSize: Integer;
begin
  FileSize:= GetFileSize(FileName);
  Result:= Round(FileSize / RecorSize);
end;

// Execute the Windows Calculator and pop up
// a message when the Calc is terminated.
// uses ShellApi;
procedure ExecuteUntilFinish(ExecuteFile : string);
var
  SEInfo: TShellExecuteInfo;
  ExitCode: DWORD;
//  ParamString, StartInString: string;
begin
//	ExecuteFile:='c:\Windows\Calc.exe';
  FillChar(SEInfo, SizeOf(SEInfo), 0) ;
  SEInfo.cbSize := SizeOf(TShellExecuteInfo) ;
  with SEInfo do
  begin
    fMask := SEE_MASK_NOCLOSEPROCESS;
    Wnd := Application.Handle;
    lpFile := PChar(ExecuteFile) ;
{ ParamString can contain the application parameters. }
 // lpParameters := PChar(ParamString) ;
{StartInString specifies the name of the working directory. If ommited, the current directory is used. }
// lpDirectory := PChar(StartInString) ;
      nShow := SW_SHOWNORMAL;
  end;
  if ShellExecuteEx(@SEInfo) then
  begin
    repeat
      Application.ProcessMessages;
      GetExitCodeProcess(SEInfo.hProcess, ExitCode) ;
    until (ExitCode <> STILL_ACTIVE) or Application.Terminated;
//    ShowMessage('Calculator terminated') ;
  end
  else
//    ShowMessage('Error starting Calc!') ;
end;

function EjecutarYEsperar( sPrograma: String; Visibilidad: Integer ): Integer;
var
  sAplicacion: array[0..512] of char;
  DirectorioActual: array[0..255] of char;
  DirectorioTrabajo: String;
  InformacionInicial: TStartupInfo;
  InformacionProceso: TProcessInformation;
  iResultado, iCodigoSalida: DWord;
begin
  StrPCopy( sAplicacion, sPrograma );
  GetDir( 0, DirectorioTrabajo );
  StrPCopy( DirectorioActual, DirectorioTrabajo );
  FillChar( InformacionInicial, Sizeof( InformacionInicial ), #0 );
  InformacionInicial.cb := Sizeof( InformacionInicial );

  InformacionInicial.dwFlags := STARTF_USESHOWWINDOW;
  InformacionInicial.wShowWindow := Visibilidad;
  CreateProcess( nil, sAplicacion, nil, nil, False,
                 CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS,
                 nil, nil, InformacionInicial, InformacionProceso );

  // Espera hasta que termina la ejecución
  repeat
    iCodigoSalida := WaitForSingleObject( InformacionProceso.hProcess, 1000 );
    Application.ProcessMessages;
  until ( iCodigoSalida <> WAIT_TIMEOUT );

  GetExitCodeProcess( InformacionProceso.hProcess, iResultado );
  MessageBeep( 0 );
  CloseHandle( InformacionProceso.hProcess );
  Result := iResultado;
end;

function xIntToLletras(Numero:LongInt):String;

   function xxIntToLletras(Valor:LongInt):String;
   const
    aUnidad : array[1..15] of String =
      ('UN','DOS','TRES','CUATRO','CINCO','SEIS',
       'SIETE','OCHO','NUEVE','DIEZ','ONCE','DOCE',
       'TRECE','CATORCE','QUINCE');
    aCentena: array[1..9]  of String =
      ('CIENTO','DOSCIENTOS','TRESCIENTOS',
       'CUATROCIENTOS','QUINIENTOS','SEISCIENTOS',
       'SETECIENTOS','OCHOCIENTOS','NOVECIENTOS');
    aDecena : array[1..9]  of String =
     ('DIECI','VEINTI','TREINTA','CUARENTA','CINCUENTA',
      'SESENTA','SETENTA','OCHENTA','NOVENTA');
   var
    Centena, Decena, Unidad, Doble: LongInt;
    Linea: String;
   begin
    if valor=100 then Linea:=' CIEN '
    else begin
      Linea:='';
      Centena := Valor div 100;
      Doble   := Valor - (Centena*100);
      Decena  := (Valor div 10) - (Centena*10);
      Unidad  := Valor - (Decena*10) - (Centena*100);

      if Centena>0 then Linea := Linea + Acentena[centena]+' ';

      if Doble>0 then begin
        if Doble=20 then Linea := Linea +' VEINTE '
          else begin
           if doble<16 then Linea := Linea + aUnidad[Doble]
             else begin
                  Linea := Linea +' '+ Adecena[Decena];
                  if (Decena>2) and (Unidad<>0) then Linea := Linea+' Y ';
                  if Unidad>0 then Linea := Linea + aUnidad[Unidad];
             end;
          end;
      end;
    end;
    Result := Linea;
   end;

var
    Millones,Miles,Unidades: Longint;
    Linea : String;
begin
   {Inicializamos el string que contendrá las letras según el valor
   numérico}
   if numero=0 then Linea := 'CERO'
   else if numero<0 then Linea := 'MENOS '
        else if numero=1 then
             begin
               Linea := 'UN';
               xIntToLletras := Linea;
               exit
             end
             else if numero>1 then Linea := '';

   {Determinamos el Nº de millones, miles y unidades de numero en
   positivo}
   Numero   := Abs(Numero);
   Millones := numero div 1000000;
   Miles     := (numero - (Millones*1000000)) div 1000;
   Unidades  := numero - ((Millones*1000000)+(Miles*1000));

   {Vamos poniendo en el string las cadenas de los números(llamando
   a subfuncion)}
   if Millones=1 then Linea:= Linea + ' UN MILLON '
   else if Millones>1 then Linea := Linea + xxIntToLletras(Millones)
                                    + ' MILLONES ';

   if Miles =1 then Linea:= Linea + ' MIL '
   else if Miles>1 then Linea := Linea + xxIntToLletras(Miles)+
                                 ' MIL ';

   if Unidades >0 then Linea := Linea + xxIntToLletras(Unidades);

   xIntToLletras := Linea;
end;

function MD5File(const FileName: string): string;
var
  IdMD5: TIdHashMessageDigest5;
  FS: TFileStream;
begin
  IdMD5 := TIdHashMessageDigest5.Create;
  FS := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    Result := IdMD5.HashStreamAsHex(FS)
  finally
    FS.Free;
    IdMD5.Free;
  end;
end;

procedure BorraSoloArchivos(Const dirName:String);     //aban Feb 22/16
var
  Path: string;
  F: TSearchRec;
begin
  try
    Path:= DirName + '\*.*';
    if FindFirst(Path, faAnyFile, F) = 0 then begin
      try
        repeat
          DeleteFile(DirName + '\' + F.Name);
        until FindNext(F) <> 0;
      finally
        FindClose(F);
      end;
    end;

  except
    on e:exception do begin
    end;
  end;
end;

end.
