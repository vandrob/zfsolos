unit uFrmClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmPadrao, SUIButton, SUIDBCtrls, Grids, DBGrids,
  SUIImagePanel, ExtCtrls, SUIForm;

type
  TFrmClientes = class(TFrmPadrao)
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    procedure chamarTelaEdicao(strOpcao: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmClientes: TFrmClientes;

implementation

uses uDatamodule,uFuncoes, uFrmClientesEdicao;

{$R *.dfm}

procedure TFrmClientes.FormCreate(Sender: TObject);
begin
  inherited;
  Datamodule1.qrylocal_clientes.Open;
end;

procedure TFrmClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    Datamodule1.qrylocal_clientes.Close;
end;

procedure TFrmClientes.btnIncluirClick(Sender: TObject);
begin
  inherited;
  chamarTelaEdicao('I')
end;

procedure TFrmClientes.btnAlterarClick(Sender: TObject);
begin
  inherited;
  chamarTelaEdicao('A')
end;

procedure TFrmClientes.btnExcluirClick(Sender: TObject);
begin
  inherited;
  chamarTelaEdicao('E')
end;

procedure TFrmClientes.chamarTelaEdicao(strOpcao: string);
begin
 //chamar a tela de edi��o como a op��o (I)ncluir, (A)lterar ou (E)xcluir
if not assigned(FrmClientesEdicao) then
                 FrmClientesEdicao:=TFrmClientesEdicao.Create(Application);
                 uFrmClientesEdicao.FrmClientesEdicao.carregarCampos(strOpcao);
                 FrmClientesEdicao.ShowModal;
                 FreeAndNil(FrmClientesEdicao);
end;

end.
