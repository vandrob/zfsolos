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
    procedure btnRetornarClick(Sender: TObject);
  private
    { Private declarations }
    procedure chamarTelaEdicao(strOpcao:string='I');
  public
    { Public declarations }
  end;

var
  FrmUsuarios: TFrmUsuarios;

implementation

uses uFuncoes, uDataModule, uFrmUsuariosEdicao;
{$R *.dfm}

procedure TFrmUsuarios.FormCreate(Sender: TObject);
begin
  inherited;
  Datamodule1.qrylocal_usuarios.Open;
  Datamodule1.qrylocal_usuariosativo_sn.Visible:= usuario_admin='S';
end;

procedure TFrmUsuarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Datamodule1.qrylocal_usuarios.close;
end;

procedure TFrmUsuarios.chamarTelaEdicao(strOpcao: string);
begin
 //chamar a tela de edição como a opção (I)ncluir, (A)lterar ou (E)xcluir

 //somente administardores pode incluir
 if usuario_admin<>'S' then begin
  if (strOpcao='I') or (strOpcao='E') then begin
     myMSG( 'Somente usuarios (ADMINISTRADORES) '+#13+#10+'podem incluir ou excluir outros usuários!','Opção não disponível',2);
     exit;
   end;
   //Não administradores somente podem alterar o próprio registro para troca somente da senha
   if (strOpcao='A') then begin
    if (trimright(trimleft(usuario_id))<>trimright(trimleft(datamodule1.qrylocal_usuariosid.AsString))) then begin
     myMSG( 'Somente esta liberada a alteração de seus dados,'+#13+#10+'portando clique na linha '+#13+#10+'de seu nome para editar os dados','Opção não disponível',2);
     exit;
    end;
   end;
 end;



if strOpcao<>'I' then begin
 if datamodule1.qrylocal_usuarios.RecordCount = 0 then
  begin
       myMSG( 'Tabela Vazia! ','Opção não disponível',2);
       exit;
  end
end;

if not assigned(FrmUsuariosEdicao) then
                 FrmUsuariosEdicao:=TFrmUsuariosEdicao.Create(Application);
                 uFrmUsuariosEdicao.FrmUsuariosEdicao.carregarCampos(strOpcao);



                 FrmUsuariosEdicao.ShowModal;
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

procedure TFrmUsuarios.btnRetornarClick(Sender: TObject);
begin
  inherited;
  close;
end;

end.
