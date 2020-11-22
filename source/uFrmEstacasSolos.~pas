unit uFrmEstacasSolos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmPadrao, ExtCtrls, SUIButton, SUIDBCtrls, Grids, DBGrids,
  SUIImagePanel, SUIForm;

type
  TFrmEstacasSolos = class(TFrmPadrao)
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure chamarTelaEdicao(strOpcao: string);
  end;

var
  FrmEstacasSolos: TFrmEstacasSolos;

implementation

{$R *.dfm}
uses uDatamodule,uFuncoes, uFrmSolosEdicao, uFrmEstacasSolosEdicao;

procedure TFrmEstacasSolos.FormCreate(Sender: TObject);
begin
  inherited;
  Datamodule1.qryLocal_EstacasSolos.Open;
  Datamodule1.qryLocal_Estacas_Tipos.Open;
  Datamodule1.qryLocal_Solos.Open;
end;

procedure TFrmEstacasSolos.btnIncluirClick(Sender: TObject);
begin
  inherited;
chamarTelaEdicao('I');
end;

procedure TFrmEstacasSolos.btnAlterarClick(Sender: TObject);
begin
  inherited;
chamarTelaEdicao('A');
end;

procedure TFrmEstacasSolos.btnExcluirClick(Sender: TObject);
begin
  inherited;
chamarTelaEdicao('E');
end;

procedure TFrmEstacasSolos.chamarTelaEdicao(strOpcao: string);
begin
 //chamar a tela de edição como a opção (I)ncluir, (A)lterar ou (E)xcluir
if strOpcao<>'I' then begin
 if datamodule1.qryLocal_EstacasSolos.RecordCount = 0 then
  begin
      myMSG( 'Tabela Vazia! ','Opção não disponível',2);
      exit;
  end
end;
timer1.Enabled:=false;
if not assigned(FrmEstacasSolosEdicao) then
                 FrmEstacasSolosEdicao:=TFrmEstacasSolosEdicao.Create(Application);
                 uFrmEstacasSolosEdicao.FrmEstacasSolosEdicao.carregarCampos(strOpcao);
                 FrmEstacasSolosEdicao.ShowModal;
                 FreeAndNil(FrmSolosEdicao);
timer1.Enabled:=true;
end;

procedure TFrmEstacasSolos.Timer1Timer(Sender: TObject);
begin
  inherited;
 //refresh na tabela
  with Datamodule1.qryLocal_EstacasSolos do begin
   disablecontrols;
   Refresh;
   enablecontrols;
  end;
end;

procedure TFrmEstacasSolos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   timer1.Enabled:=false;
   Datamodule1.qryLocal_EstacasSolos.Close;
   Datamodule1.qryLocal_Estacas_Tipos.Close;
   Datamodule1.qryLocal_Solos.Close;

end;

procedure TFrmEstacasSolos.FormActivate(Sender: TObject);
begin
  inherited;
 timer1.Enabled:=true;
end;

end.
