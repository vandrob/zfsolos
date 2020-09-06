unit uFrmMetodos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmPadrao, ExtCtrls, SUIButton, SUIDBCtrls, Grids, DBGrids,
  SUIImagePanel, SUIForm;

type
  TFrmMetodos = class(TFrmPadrao)
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
  FrmMetodos: TFrmMetodos;

implementation

{$R *.dfm}
uses uDatamodule,ufuncoes, uFrmMetodosEdicao;

procedure TFrmMetodos.FormCreate(Sender: TObject);
begin
  inherited;
  Datamodule1.qryLocal_Metodos.open;
end;

procedure TFrmMetodos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Datamodule1.qryLocal_Metodos.Close;
end;

procedure TFrmMetodos.btnIncluirClick(Sender: TObject);
begin
  inherited;
  chamarTelaEdicao('I');
end;

procedure TFrmMetodos.btnAlterarClick(Sender: TObject);
begin
  inherited;
  chamarTelaEdicao('A');
end;

procedure TFrmMetodos.btnExcluirClick(Sender: TObject);
begin
  inherited;
 chamarTelaEdicao('E');
end;

procedure TFrmMetodos.chamarTelaEdicao(strOpcao: string);
begin
 //chamar a tela de edi��o como a op��o (I)ncluir, (A)lterar ou (E)xcluir
if strOpcao<>'I' then begin
 if datamodule1.qryLocal_Metodos.RecordCount = 0 then
  begin
      myMSG( 'Tabela Vazia! ','Op��o n�o dispon�vel',2);
      exit;
  end
end;

timer1.Enabled:=false;
if not assigned( FrmMetodosEdicao ) then
                 FrmMetodosEdicao:=TFrmMetodosEdicao.Create(Application);
                 uFrmMetodosEdicao.FrmMetodosEdicao.carregarCampos(strOpcao);
                 FrmMetodosEdicao.ShowModal;
                 FreeAndNil(FrmMetodosEdicao);
timer1.Enabled:=true;
end;

end.
