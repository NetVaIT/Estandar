(******************************************************************************
 Proyecto Delphi Standard

 Copyright (C) 2008-2015 - Jesus Huante Caballero

 ******************************************************************************)
unit _ProviderDMod;

interface

uses
  SysUtils, Classes, Forms, DB, ADODB, Controls, Dialogs, _GridForm,
  Datasnap.DBClient, Datasnap.Provider;

type
  T_dmProvider = class(TDataModule)
    adodsMaster: TADODataSet;
    dspMaster: TDataSetProvider;
    cdsMaster: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure cdsMasterAfterPost(DataSet: TDataSet);
    procedure cdsMasterAfterCancel(DataSet: TDataSet);
    procedure cdsMasterAfterDelete(DataSet: TDataSet);
  private
    FDataSource: TDataSource;
    FMasterFields: string;
    procedure SetDataSource(const Value: TDataSource);
    procedure SetMasterFields(const Value: string);
    { Private declarations }
  protected
    gGridForm: T_frmGrid;
    gFormDeatil1: T_frmGrid;
    gFormDeatil2: T_frmGrid;
    gFormDeatil3: T_frmGrid;
    procedure ApplyUpdates; virtual;
    procedure CancelUpdates; virtual;
  public
    { Public declarations }
    procedure ShowModule(pConteiner: TWinControl; pCation: TCaption);
    property DataSource: TDataSource read FDataSource write SetDataSource;
    property MasterFields: string read FMasterFields write SetMasterFields;

  end;

implementation

uses _ConectionDmod;

{$R *.dfm}

procedure T_dmProvider.ApplyUpdates;
begin
  cdsMaster.ApplyUpdates(0);
end;

procedure T_dmProvider.CancelUpdates;
begin
  cdsMaster.CancelUpdates;
end;

procedure T_dmProvider.cdsMasterAfterCancel(DataSet: TDataSet);
begin
  if not Assigned(DataSource) then
    CancelUpdates;
end;

procedure T_dmProvider.cdsMasterAfterDelete(DataSet: TDataSet);
begin
  ApplyUpdates;
end;

procedure T_dmProvider.cdsMasterAfterPost(DataSet: TDataSet);
begin
  if not Assigned(DataSource) then
    ApplyUpdates;
end;

procedure T_dmProvider.DataModuleCreate(Sender: TObject);
begin
  if adodsMaster.CommandText <> EmptyStr then
  begin
   adodsMaster.Open;
   cdsMaster.Open;
  end;
end;

procedure T_dmProvider.DataModuleDestroy(Sender: TObject);
begin
  if adodsMaster.CommandText <> EmptyStr then
  begin
    adodsMaster.Close;
    cdsMaster.Close;
  end;
end;

procedure T_dmProvider.SetDataSource(const Value: TDataSource);
begin
  FDataSource := Value;
  cdsMaster.MasterSource:= Value;
end;

procedure T_dmProvider.SetMasterFields(const Value: string);
begin
  FMasterFields := Value;
  cdsMaster.MasterFields:= Value;
//  cdsMaster.IndexFieldNames:= Value;
end;

procedure T_dmProvider.ShowModule(pConteiner: TWinControl; pCation: TCaption);
begin
  if Assigned(gGridForm) then
  begin
    gGridForm.Parent:= pConteiner;
    gGridForm.Align:= alClient;
//    gGridForm.Caption:= pCation;
    gGridForm.Show;
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
end;

end.
