unit uFrmObrasFuros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmPadrao, ExtCtrls, SUIButton, SUIDBCtrls, Grids, DBGrids,
  SUIImagePanel, SUIForm, StdCtrls;

type
  TFrmObrasFuros = class(TFrmPadrao)
    Label1: TLabel;
    txtObra: TStaticText;
    Label2: TLabel;
    txtCliente: TStaticText;
    txtID: TLabel;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure chamarTelaEdicao(strOpcao: string);
  end;

var
  FrmObrasFuros: TFrmObrasFuros;

implementation

{$R *.dfm}
uses uDatamodule,uFuncoes, uFrmObrasFurosEdicao;

procedure TFrmObrasFuros.btnIncluirClick(Sender: TObject);
begin
   inherited;
   chamarTelaEdicao('I');
end;

procedure TFrmObrasFuros.btnAlterarClick(Sender: TObject);
begin
  inherited;
  chamarTelaEdicao('A')
end;

procedure TFrmObrasFuros.btnExcluirClick(Sender: TObject);
begin
  inherited;
  chamarTelaEdicao('E')
end;

procedure TFrmObrasFuros.chamarTelaEdicao(strOpcao: string);
begin
 //chamar a tela de edi��o como a op��o (I)ncluir, (A)lterar ou (E)xcluir
 if strOpcao<>'I' then begin
  if datamodule1.QryLocal_ObrasFuros.RecordCount = 0 then
   begin
      myMSG( 'Tabela Vazia! ','Op��o n�o dispon�vel',2);
      exit;
   end;
 end;

 timer1.Enabled:=false;

 if not assigned(FrmObrasFurosEdicao) then  FrmObrasFurosEdicao:=TFrmObrasFurosEdicao.Create(Application);
                 uFrmObrasFurosEdicao.FrmObrasFurosEdicao.carregarCampos(strOpcao);
                 FrmObrasFurosEdicao.ShowModal;
                  FreeAndNil(FrmObrasFurosEdicao);


 timer1.Enabled:=true;

end;

end.
