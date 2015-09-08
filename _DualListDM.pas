(******************************************************************************
 Proyecto Delphi Standard

 Copyright (C) 2008-2015 - Jesus Huante Caballero

 ******************************************************************************)
unit _DualListDM;

interface

uses
  System.SysUtils, System.Classes, Data.Win.ADODB, Data.DB, Vcl.Controls,
  System.Actions, Vcl.ActnList, _DualListForm;

type
  T_dmDualList = class(TDataModule)
    adoqAvailable: TADOQuery;
    adoqAssigned: TADOQuery;
    adocAdd: TADOCommand;
    adocDelete: TADOCommand;
    ActionList: TActionList;
    actAdd: TAction;
    actDelete: TAction;
    actViewAviable: TAction;
    actViewAssigned: TAction;
    procedure actAddUpdate(Sender: TObject);
    procedure actDeleteUpdate(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
  private
    { Private declarations }
    FIdFieldName2: string;
    FIdFieldName1: string;
    FMasterSource: TDataSource;
    procedure SetMasterSource(const Value: TDataSource);
  protected
    gGridForm: T_frmDualList;
  public
    { Public declarations }
    procedure ShowModule(pConteiner: TWinControl);
    procedure ViewAssigned(Id: Integer);
    property IdFieldName1: string read FIdFieldName1 write FIdFieldName1;
    property IdFieldName2: string read FIdFieldName2 write FIdFieldName2;
    property MasterSource: TDataSource read FMasterSource write SetMasterSource;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses _ConectionDmod;

{$R *.dfm}

procedure T_dmDualList.actAddExecute(Sender: TObject);
begin
  adocAdd.Parameters.ParamByName(IdFieldName1).Value:= adoqAvailable.Parameters.ParamByName(IdFieldName1).Value;
  adocAdd.Parameters.ParamByName(IdFieldName2).Value:= adoqAvailable.FieldByName(IdFieldName2).AsInteger;
  adocAdd.Execute;
  adoqAvailable.Requery;
  adoqAssigned.Requery;
end;

procedure T_dmDualList.actAddUpdate(Sender: TObject);
begin
  if adoqAvailable.Active then
    actAdd.Enabled := adoqAvailable.RecordCount <> 0;
end;

procedure T_dmDualList.actDeleteExecute(Sender: TObject);
begin
  adocDelete.Parameters.ParamByName(IdFieldName1).Value:= adoqAssigned.Parameters.ParamByName(IdFieldName1).Value;
  adocDelete.Parameters.ParamByName(IdFieldName2).Value:= adoqAssigned.FieldByName(IdFieldName2).AsInteger;
  adocDelete.Execute;
  adoqAvailable.Requery;
  adoqAssigned.Requery;
end;

procedure T_dmDualList.actDeleteUpdate(Sender: TObject);
begin
  if adoqAssigned.Active then
    actDelete.Enabled:= adoqAssigned.RecordCount <> 0;
end;

procedure T_dmDualList.DataModuleCreate(Sender: TObject);
begin
  gGridForm.DataSetAviable:= adoqAvailable;
  gGridForm.DataSetAssigned:= adoqAssigned;
  gGridForm.AddItem:= actAdd;
  gGridForm.DeleteItem:= actDelete;
  gGridForm.ViewAviable:= actViewAviable;
  gGridForm.ViewAssigned:= actViewAssigned;
end;

procedure T_dmDualList.DataModuleDestroy(Sender: TObject);
begin
  if adoqAvailable.SQL.Text <> EmptyStr then adoqAvailable.Close;
  if adoqAssigned.SQL.Text <> EmptyStr then adoqAssigned.Close;
end;

procedure T_dmDualList.SetMasterSource(const Value: TDataSource);
begin
  FMasterSource := Value;
  if adoqAvailable.SQL.Text <> EmptyStr then
  begin
    adoqAvailable.Close;
    adoqAvailable.DataSource:= Value;
    adoqAvailable.Open;
  end;
  if adoqAssigned.SQL.Text <> EmptyStr then
  begin
    adoqAssigned.Close;
    adoqAssigned.DataSource:= Value;
    adoqAssigned.Open;
  end;
end;

procedure T_dmDualList.ShowModule(pConteiner: TWinControl);
begin
  if Assigned(gGridForm) then
  begin
    gGridForm.Parent:= pConteiner;
    gGridForm.Align:= alClient;
    gGridForm.ParentWith:= pConteiner.Width;
    gGridForm.View:= False;
    gGridForm.Show;
  end;
end;

procedure T_dmDualList.ViewAssigned(Id: Integer);
begin
  if Assigned(gGridForm) then
  begin
    if adoqAssigned.SQL.Text <> EmptyStr then
    begin
      adoqAssigned.Close;
      adoqAssigned.Parameters[0].Value:= Id;
      adoqAssigned.Open;
    end;
    gGridForm.View:= True;
    gGridForm.ShowModal;
  end;
end;

end.
