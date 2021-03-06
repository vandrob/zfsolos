unit uFrmEstacas_Tipos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmPadrao, ExtCtrls, SUIButton, SUIDBCtrls, Grids, DBGrids,
  SUIImagePanel, SUIForm;

type
  TFrmEstacas_Tipos = class(TFrmPadrao)
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    Procedure chamarTelaEdicao(strOpcao: string);
  public
    { Public declarations }
  end;

var
  FrmEstacas_Tipos: TFrmEstacas_Tipos;

implementation

uses uDatamodule,uFuncoes, uFrmEstacas_TiposEdicao;

{$R *.dfm}

procedure TFrmEstacas_Tipos.FormCreate(Sender: TObject);
begin
  inherited;
 uDatamodule.datamodule1.qryLocal_Estacas_Tipos.Open;
end;

procedure TFrmEstacas_Tipos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  timer1.Enabled:=false;
  uDatamodule.datamodule1.qryLocal_Estacas_Tipos.close;
end;

procedure TFrmEstacas_Tipos.btnIncluirClick(Sender: TObject);
begin
  inherited;
  chamarTelaEdicao('I')
end;

procedure TFrmEstacas_Tipos.btnAlterarClick(Sender: TObject);
begin
  inherited;
  chamarTelaEdicao('A')
end;

procedure TFrmEstacas_Tipos.btnExcluirClick(Sender: TObject);
begin
  inherited;
  chamarTelaEdicao('E')
end;

procedure TFrmEstacas_Tipos.chamarTelaEdicao(strOpcao: string);
begin
 //chamar a tela de edi��o como a op��o (I)ncluir, (A)lterar ou (E)xcluir
if strOpcao<>'I' then begin
 if datamodule1.qryLocal_Estacas_Tipos.RecordCount = 0 then
  begin
      myMSG( 'Tabela Vazia! ','Op��o n�o dispon�vel',2);
      exit;
  end
end;


timer1.Enabled:=false;
if not assigned(FrmEstacas_TiposEdicao) then
                 FrmEstacas_TiposEdicao:=TFrmEstacas_TiposEdicao.Create(Application);
                 FrmEstacas_TiposEdicao.carregarCampos(strOpcao);
                 FrmEstacas_TiposEdicao.ShowModal;
                 FreeAndNil(FrmEstacas_TiposEdicao);
timer1.Enabled:=true;

end;

procedure TFrmEstacas_Tipos.Timer1Timer(Sender: TObject);
begin
  inherited;
  //refresh na tabela
  with Datamodule1.qryLocal_Estacas_Tipos do begin
   disablecontrols;
   Refresh;
   enablecontrols;
  end;
end;

procedure TFrmEstacas_Tipos.FormActivate(Sender: TObject);
begin
  inherited;
  timer1.Enabled:=true;
end;

end.
