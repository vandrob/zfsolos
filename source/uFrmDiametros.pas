unit uFrmDiametros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmPadrao, ExtCtrls, SUIButton, SUIDBCtrls, Grids, DBGrids,
  SUIImagePanel, SUIForm, StdCtrls;

type
  TFrmDiametros = class(TFrmPadrao)
    txtTitulo: TLabel;
    idtipo: TEdit;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    procedure chamarTelaEdicao(strOpcao: string);
  public
    { Public declarations }
  end;

var
  FrmDiametros: TFrmDiametros;

implementation

{$R *.dfm}
uses uDatamodule, uFuncoes, uFrmDiametrosEdicao;

procedure TFrmDiametros.btnIncluirClick(Sender: TObject);
begin
  inherited;
  chamarTelaEdicao('I')
end;

procedure TFrmDiametros.btnAlterarClick(Sender: TObject);
begin
  inherited;
  chamarTelaEdicao('A')
end;

procedure TFrmDiametros.btnExcluirClick(Sender: TObject);
begin
  inherited;
  chamarTelaEdicao('E')
end;

procedure TFrmDiametros.chamarTelaEdicao(strOpcao: string);
begin
 //chamar a tela de edição como a opção (I)ncluir, (A)lterar ou (E)xcluir
if strOpcao<>'I' then begin
 if datamodule1.qryLocal_Diametros.RecordCount = 0 then
  begin
      myMSG( 'Tabela Vazia! ','Opção não disponível',2);
      exit;
  end
end;

timer1.Enabled:=false;

if not assigned(FrmDiametrosEdicao) then
                FrmDiametrosEdicao:=TFrmDiametrosEdicao.Create(Application);
                 uFrmDiametrosEdicao.FrmDiametrosEdicao.carregarCampos(strOpcao);
                 FrmDiametrosEdicao.idtipo.Text:=idtipo.Text;
                 FrmDiametrosEdicao.ShowModal;
                 FreeAndNil(FrmDiametrosEdicao);
timer1.Enabled:=true;

end;

end.
