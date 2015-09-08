(******************************************************************************
 Proyecto Delphi Standard

 Copyright (C) 2008-2015 - Jesus Huante Caballero

 ******************************************************************************)
unit _StandarForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ActnList, ImgList, ExtCtrls, ComCtrls, DB, System.Actions;

type
  T_StandarFrm = class(TForm)
    pcMain: TPageControl;
    tsGrid: TTabSheet;
    ilPageControl: TImageList;
    ActionList: TActionList;
    ilAction: TImageList;
    pnlDetail: TPanel;
    Splitter: TSplitter;
    dsMaster: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
