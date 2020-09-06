unit uFrmAbertura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, SUIForm, SUIButton, jpeg, SUIImagePanel, Menus,
  ActnList, SUIMainMenu, StdCtrls, ImgList, SUIDlg;

type
  TFrmAbertura = class(TForm)
    suiForm1: TsuiForm;
    Image1: TImage;
    suiMainMenu1: TsuiMainMenu;
    Arquivos1: TMenuItem;
    Clientes1: TMenuItem;
    Usurios1: TMenuItem;
    MuraldeRecados1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    Ferramentas1: TMenuItem;
    Usurios2: TMenuItem;
    AtualizaesdoSoftware1: TMenuItem;
    Backup1: TMenuItem;
    ActionList2: TActionList;
    ActClientes: TAction;
    ActCalculos: TAction;
    ActMetodos: TAction;
    ActUsuarios: TAction;
    ActMural: TAction;
    ActAtualizacoes: TAction;
    ActSair: TAction;
    ActBackup: TAction;
    Metodos1: TMenuItem;
    ImageList1: TImageList;
    ActEstacasTipos: TAction;
    iposdeEstacas1: TMenuItem;
    ActSolos: TAction;
    iposdeSolos1: TMenuItem;
    procedure btnSairClick(Sender: TObject);
    procedure ActClientesExecute(Sender: TObject);
    procedure ActBackupExecute(Sender: TObject);
    procedure ActMetodosExecute(Sender: TObject);
    procedure ActUsuariosExecute(Sender: TObject);
    procedure ActMuralExecute(Sender: TObject);
    procedure ActAtualizacoesExecute(Sender: TObject);
    procedure ActSairExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ActCalculosExecute(Sender: TObject);
    procedure ActEstacasTiposExecute(Sender: TObject);
    procedure ActSolosExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAbertura: TFrmAbertura;

implementation

uses uFuncoes, uFrmUsuarios, uFrmTeste, uFrmClientes, uFrmEstacas_Tipos,
  uFrmSolos, uFrmMetodos;


{$R *.dfm}

procedure TFrmAbertura.btnSairClick(Sender: TObject);
begin
 application.terminate;
end;

procedure TFrmAbertura.ActClientesExecute(Sender: TObject);
begin

   if not assigned(FrmClientes) then
                 FrmClientes:=TFrmClientes.Create(Application);
                 FrmClientes.ShowModal;
                 FreeAndNil(FrmClientes);

end;

procedure TFrmAbertura.ActBackupExecute(Sender: TObject);
begin
 myMSG('Em Desenvolvimento...');
end;

procedure TFrmAbertura.ActMetodosExecute(Sender: TObject);
begin
 if not assigned(FrmMetodos) then FrmMetodos:=TFrmMetodos.create(Application);
  FrmMetodos.showmodal;
  FreeAndNil( FrmMetodos );
end;

procedure TFrmAbertura.ActUsuariosExecute(Sender: TObject);
begin

   if not assigned(FrmUsuarios) then
                 FrmUsuarios:=TFrmUsuarios.Create(Application);
                 FrmUsuarios.ShowModal;
                 FreeAndNil(FrmUsuarios);




end;

procedure TFrmAbertura.ActMuralExecute(Sender: TObject);
begin
 myMSG('Em Desenvolvimento...');
end;

procedure TFrmAbertura.ActAtualizacoesExecute(Sender: TObject);
begin
 myMSG('Em Desenvolvimento...');
end;

procedure TFrmAbertura.ActSairExecute(Sender: TObject);
begin
 close;
end;

procedure TFrmAbertura.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if myConfirm('Sair da aplicação?') then
   begin
    Action:=caFree;
    application.terminate;
   end
  else
   Action:=caNone
  ;
end;

procedure TFrmAbertura.FormActivate(Sender: TObject);

begin


  if not usuario_logado then usuario_logado:=login;
  if usuario_logado=false then application.terminate;
end;


procedure TFrmAbertura.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#27 then close;
end;

procedure TFrmAbertura.ActCalculosExecute(Sender: TObject);
begin
   myMSG('Em Desenvolvimento...');
end;

procedure TFrmAbertura.ActEstacasTiposExecute(Sender: TObject);
begin

   if not assigned(FrmEstacas_Tipos) then
                 FrmEstacas_Tipos:=TFrmEstacas_Tipos.Create(Application);
                 FrmEstacas_Tipos.ShowModal;
                 FreeAndNil(FrmEstacas_Tipos);
end;

procedure TFrmAbertura.ActSolosExecute(Sender: TObject);
begin
 if not assigned(FrmSolos) then
                 FrmSolos:=TFrmSolos.Create(Application);
                 FrmSolos.ShowModal;
                 FreeAndNil(FrmSolos);
end;

end.
