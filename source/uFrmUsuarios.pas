unit uFrmUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmPadrao, SUIButton, SUIDBCtrls, Grids, DBGrids,
  SUIImagePanel, ExtCtrls, SUIForm;

type
  TFrmUsuarios = class(TFrmPadrao)
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    procedure chamarTelaEdicao(strOpcao:string='I');
  public
    { Public declarations }
  end;

var
  FrmUsuarios: TFrmUsuarios;

implementation

uses uFuncoes, uDataModule, uFrmUsuariosEdicao, uFrmTeste;
{$R *.dfm}

procedure TFrmUsuarios.FormCreate(Sender: TObject);
begin
  inherited;
  Datamodule1.qrylocal_usuarios.Open;
end;

procedure TFrmUsuarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Datamodule1.qrylocal_usuarios.close;
end;

procedure TFrmUsuarios.chamarTelaEdicao(strOpcao: string);
begin
 //chamar a tela de edi��o como a op��o (I)ncluir, (A)lterar ou (E)xcluir
if not assigned(FrmTeste) then
                 FrmTeste:=TFrmTeste.Create(Application);
                 uFrmTeste.FrmTeste.carregarCampos(strOpcao);
                 FrmTeste.ShowModal;
                 FreeAndNil(FrmUsuariosEdicao);
end;

procedure TFrmUsuarios.btnIncluirClick(Sender: TObject);
begin
  inherited;
  chamarTelaEdicao('I');
end;

procedure TFrmUsuarios.btnAlterarClick(Sender: TObject);
begin
  inherited;
  chamarTelaEdicao('A');
end;

procedure TFrmUsuarios.btnExcluirClick(Sender: TObject);
begin
  inherited;
  chamarTelaEdicao('E');
end;

end.