unit uFrmPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, SUIForm, SUIImagePanel, SUIDBCtrls, Grids, DBGrids,
  SUIButton;

type
  TFrmPadrao = class(TForm)
    FrmPadrao: TsuiForm;
    suiPanel1: TsuiPanel;
    suiDBGrid1: TsuiDBGrid;
    suiDBNavigator1: TsuiDBNavigator;
    suiPanel2: TsuiPanel;
    btnIncluir: TsuiButton;
    btnAlterar: TsuiButton;
    btnExcluir: TsuiButton;
    procedure suiDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPadrao: TFrmPadrao;

implementation

uses uDataModule,uFuncoes;
{$R *.dfm}

procedure TFrmPadrao.suiDBGrid1DblClick(Sender: TObject);
begin
 btnAlterar.click;
end;

end.
