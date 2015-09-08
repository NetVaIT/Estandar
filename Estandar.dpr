program Estandar;

uses
  Vcl.Forms,
  _AboutForm in '_AboutForm.pas' {_frmAbout},
  _ConectionDmod in '_ConectionDmod.pas' {_dmConection: TDataModule},
  _DualListDM in '_DualListDM.pas' {_dmDualList: TDataModule},
  _DualListForm in '_DualListForm.pas' {_frmDualList},
  _EditForm in '_EditForm.pas' {_frmEdit},
  _GridForm in '_GridForm.pas' {_frmGrid},
  _LoginForm in '_LoginForm.pas' {_frmLogin},
  _MainForm in '_MainForm.pas' {_frmMain},
  _MainRibbonForm in '_MainRibbonForm.pas' {_frmMainRibbon},
  _ProgressForm in '_ProgressForm.pas' {_frmProgress},
  _ProviderDMod in '_ProviderDMod.pas' {_dmProvider: TDataModule},
  _ReportDMod in '_ReportDMod.pas' {_dmReport: TDataModule},
  _ReportForm in '_ReportForm.pas' {_frmReport},
  _SplashForm in '_SplashForm.pas' {_frmSplash},
  _StandarDMod in '_StandarDMod.pas' {_dmStandar: TDataModule},
  _StandarForm in '_StandarForm.pas' {_StandarFrm},
  _StandarGridForm in '_StandarGridForm.pas' {_frmStandarGrid},
  _Utils in '_Utils.pas',
  MainForm in 'MainForm.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(T_dmConection, _dmConection);
  Application.CreateForm(T_frmMain, _frmMain);
  Application.CreateForm(T_frmMainRibbon, _frmMainRibbon);
  Application.CreateForm(T_frmProgress, _frmProgress);
  Application.Run;
end.
