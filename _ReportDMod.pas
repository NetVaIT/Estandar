unit _ReportDMod;

interface

uses
  System.SysUtils, System.Classes, ppParameter, ppProd, ppClass, ppReport,
  ppComm, ppRelatv, ppDB, ppDBPipe, Data.DB, Data.Win.ADODB, ppCache, ppBands,
  ppDesignLayer, ppVar, ppCtrls, ppPrnabl, System.UITypes, _ReportForm, dxmdaset;

type
  T_dmReport = class(TDataModule)
    adodsReport: TADODataSet;
    dsReport: TDataSource;
    dbpReport: TppDBPipeline;
    ppReport: TppReport;
    ppTitleBand1: TppTitleBand;
    pplblTitle: TppLabel;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLineFooter: TppLine;
    pplblPrintDate: TppSystemVariable;
    pplblPageNo: TppSystemVariable;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    mdParams: TdxMemData;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    FTitle: string;
    procedure SetTitle(const Value: string);
  protected
    gReportForm: T_frmReport;
  public
    { Public declarations }
    procedure AssignParam; virtual; abstract;
    procedure Execute; virtual;
    property Title: string read FTitle write SetTitle;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses _ConectionDmod;

{$R *.dfm}

{ T_dmReport }

procedure T_dmReport.DataModuleCreate(Sender: TObject);
begin
  mdParams.Open;
  mdParams.Insert;
end;

procedure T_dmReport.Execute;
var
  ShowReport: Boolean;
begin
  if Assigned(gReportForm) then
  begin
    gReportForm.DataSetParams:= mdParams;
    ShowReport:= (gReportForm.ShowModal = mrOk);
  end
  else
    ShowReport:= True;
  if ShowReport then
  begin
    adodsReport.Close;
    AssignParam;
    adodsReport.Open;
    try
      ppReport.Print;
    finally
      adodsReport.Close;
    end;
  end;
end;

procedure T_dmReport.SetTitle(const Value: string);
begin
  FTitle := Value;
  ppReport.PrinterSetup.DocumentName:= Value;
  pplblTitle.Caption:= Value;
end;

end.
