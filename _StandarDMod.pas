(******************************************************************************
 Proyecto Delphi Standard

 Copyright (C) 2008-2015 - Jesus Huante Caballero

 ******************************************************************************)
unit _StandarDMod;

interface

uses
  SysUtils, Classes, Forms, DB, ADODB, Controls, Dialogs, _GridForm, _EditForm,
  System.Actions, Vcl.ActnList, _StandarGridForm, _StandarGFormEdit, _StandarGFormGrid,
  _StandarMasterDetailForm, _StandarMDFormEdit;

type
  T_dmStandar = class(TDataModule)
    adodsMaster: TADODataSet;
    adodsUpdate: TADODataSet;
    ActionList: TActionList;
    actSearch: TAction;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
  private
    { Private declarations }
    FMasterFields: string;
    FMasterSource: TDataSource;
    procedure SetMasterFields(const Value: string);
    procedure SetMasterSource(const Value: TDataSource);
  protected
    gGridForm: T_frmGrid;
    gFormDeatil1: T_frmGrid;
    gFormDeatil2: T_frmGrid;
    gFormDeatil3: T_frmGrid;
    frmEdit: T_frmEdit;
    gGridEditForm : T_frmStandarGFormEdit;
    gFormDetail1 : T_frmStandarGFormEdit;
    gFormDetail2 : T_frmStandarGFormEdit;
    gFormDetail3 : T_frmStandarGFormEdit;
    gGridFormGrid : T_frmStandarGFormGrid;
    gFormMasterDetail : T_frmStandarMasterDetail;
    gMasterForm : T_frmStandarMDFormEdit;
    SQLSelect: string;
    SQLWhere: string;
    SQLGroupBy: string;
    SQLOrderBy: string;
    procedure SetFilter; virtual;
  public
    { Public declarations }
    procedure OpenDataSet; virtual;
    procedure CloseDataSet; virtual;
    procedure ShowModule(pConteiner: TWinControl; pCation: TCaption);
    function Add: Integer;
    procedure Edit(Id: Integer);
    procedure View(Id: Integer);
    property MasterSource: TDataSource read FMasterSource write SetMasterSource;
    property MasterFields: string read FMasterFields write SetMasterFields;
  end;

implementation

uses _ConectionDmod;

{$R *.dfm}

procedure T_dmStandar.actSearchExecute(Sender: TObject);
begin
  SetFilter;
  OpenDataSet;
end;

function T_dmStandar.Add: Integer;
begin
  adodsUpdate.Open;
  try
    frmEdit.DataSet:= adodsUpdate;
    adodsUpdate.Insert;
    if frmEdit.ShowModal = mrOk then
      Result:= adodsUpdate.Fields[0].Value
    else
      Result:= 0;
  finally
    adodsUpdate.Close;
  end;
end;

procedure T_dmStandar.CloseDataSet;
begin
  if adodsMaster.CommandText <> EmptyStr then adodsMaster.Close;
end;

procedure T_dmStandar.DataModuleCreate(Sender: TObject);
begin
  // Asigancion para cuando se utilice filtrado no se muestra ningun registro
  SQLWhere := 'WHERE 1=0';
end;

procedure T_dmStandar.DataModuleDestroy(Sender: TObject);
begin
  CloseDataSet;
end;

procedure T_dmStandar.Edit(Id: Integer);
begin
  adodsUpdate.Close;
  adodsUpdate.Parameters[0].Value:= Id;
  adodsUpdate.Open;
  try
    frmEdit.DataSet:= adodsUpdate;
    adodsUpdate.Edit;
    frmEdit.ShowModal;
  finally
    adodsUpdate.Close;
  end;
end;

procedure T_dmStandar.OpenDataSet;

  procedure PrepareDataSet;
  begin
    adodsMaster.Close;
    if SQLSelect <> EmptyStr then
      adodsMaster.CommandText:= SQLSelect + ' ' + SQLWhere + ' ' + SQLGroupBy + ' ' + SQLOrderBy;
  end;
begin
  PrepareDataSet;
  if adodsMaster.CommandText <> EmptyStr then adodsMaster.Open;
end;

procedure T_dmStandar.SetFilter;
begin
  SQLWhere:= '1=0';
end;

procedure T_dmStandar.SetMasterFields(const Value: string);
begin
  FMasterFields := Value;
  adodsMaster.MasterFields:= Value;
end;

procedure T_dmStandar.SetMasterSource(const Value: TDataSource);
begin
  FMasterSource := Value;
  adodsMaster.DataSource:= Value;
end;

procedure T_dmStandar.View(Id: Integer);
begin
  adodsUpdate.Close;
  adodsUpdate.Parameters[0].Value:= Id;
  adodsUpdate.Open;
  try
    frmEdit.View:= True;
    frmEdit.DataSet:= adodsUpdate;
    frmEdit.ShowModal;
  finally
    adodsUpdate.Close;
  end;
end;

procedure T_dmStandar.ShowModule(pConteiner: TWinControl; pCation: TCaption);
begin
  if Assigned(gGridForm) then
  begin
    OpenDataSet;
    if Assigned(pConteiner) then
    begin
      gGridForm.Parent:= pConteiner;
      gGridForm.Align:= alClient;
//      gGridForm.Caption:= pCation;
//      gGridForm.View:= False;
      gGridForm.Show;
    end
    else
    begin
      gGridForm.View:= True;
      gGridForm.ShowModal;
    end;
  end;
  if Assigned(gFormDeatil1) then
  begin
    gGridForm.pnlDetail1.Visible:= True;
    gGridForm.splDetail1.Visible:= True;
    gFormDeatil1.Parent:= gGridForm.pnlDetail1;
    gFormDeatil1.Align:= alClient;
    gFormDeatil1.Show;
  end;
  if Assigned(gFormDeatil2) then
  begin
    gGridForm.pnlDetail2.Visible:= True;
    gGridForm.splDetail2.Visible:= True;
    gFormDeatil2.Parent:= gGridForm.pnlDetail2;
    gFormDeatil2.Align:= alClient;
    gFormDeatil2.Show;
  end;
  if Assigned(gFormDeatil3) then
  begin
    gGridForm.pnlDetail3.Visible:= True;
    gGridForm.splDetail3.Visible:= True;
    gFormDeatil3.Parent:= gGridForm.pnlDetail3;
    gFormDeatil3.Align:= alClient;
    gFormDeatil3.Show;
  end;
  if Assigned(gGridEditForm) then
  begin
    OpenDataSet;
    if Assigned(pConteiner) then
    begin
      gGridEditForm.Parent:= pConteiner;
      gGridEditForm.Align:= alClient;
      gGridEditForm.Show;
    end
    else
    begin
      //gGridEditForm.View:= True;
      gGridEditForm.ShowModal;
    end;
  end;
  if Assigned(gFormDetail1) then
  begin
    gGridEditForm.pnlDetail1.Visible := True;
    gGridEditForm.splDetail1.Visible := True;
    gFormDetail1.Parent := gGridEditForm.pnlDetail1;
    gFormDetail1.Align := alClient;
    gFormDetail1.Show;
  end;
  if Assigned(gFormDetail2) then
  begin
    gGridEditForm.pnlDetail2.Visible:= True;
    gGridEditForm.splDetail2.Visible:= True;
    gFormDetail2.Parent:= gGridEditForm.pnlDetail2;
    gFormDetail2.Align:= alClient;
    gFormDetail2.Show;
  end;
  if Assigned(gFormDetail3) then
  begin
    gGridEditForm.pnlDetail3.Visible:= True;
    gGridEditForm.splDetail3.Visible:= True;
    gFormDetail3.Parent:= gGridEditForm.pnlDetail3;
    gFormDetail3.Align:= alClient;
    gFormDetail3.Show;
  end;
  if Assigned(gFormMasterDetail) then
  begin
    OpenDataSet;
    if Assigned(pConteiner) then
    begin
      gFormMasterDetail.Parent:= pConteiner;
      gFormMasterDetail.Align:= alClient;
      gFormMasterDetail.Show;
    end
    else
    begin
      //gGridEditForm.View:= True;
      gFormMasterDetail.ShowModal;
    end;
  end;
  if Assigned(gMasterForm) then
  begin
    OpenDataSet;
    if Assigned(pConteiner) then
    begin
      gMasterForm.Parent:= pConteiner;
      gMasterForm.Align:= alClient;
      gMasterForm.Show;
    end
    else
    begin
      //gGridEditForm.View:= True;
      gMasterForm.ShowModal;
    end;
  end;
end;

end.
