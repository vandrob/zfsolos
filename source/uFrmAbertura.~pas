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
    mensagem: TsuiMessageDialog;
    procedure btnSairClick(Sender: TObject);
    procedure ActClientesExecute(Sender: TObject);
    procedure ActCalculosExecute(Sender: TObject);
    procedure ActBackupExecute(Sender: TObject);
    procedure ActMetodosExecute(Sender: TObject);
    procedure ActUsuariosExecute(Sender: TObject);
    procedure ActMuralExecute(Sender: TObject);
    procedure ActAtualizacoesExecute(Sender: TObject);
    procedure ActSairExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAbertura: TFrmAbertura;

implementation

uses uFuncoes, uFrmUsuarios, uFrmTeste;


{$R *.dfm}

procedure TFrmAbertura.btnSairClick(Sender: TObject);
begin
 application.terminate;
end;

procedure TFrmAbertura.ActClientesExecute(Sender: TObject);
begin

 if myConfirm('apagar o registro?','atenção exclusão',0) then showmessage('apagando...');
{
   if not assigned(FrmUsuarios) then
                 FrmMenu:=TFrmMenu.Create(Application);
                 FrmMenu.ShowModal;
                 FreeAndNil(FrmMenu);
                  close;}
end;

procedure TFrmAbertura.ActCalculosExecute(Sender: TObject);
begin
 showmessage('b');
end;

procedure TFrmAbertura.ActBackupExecute(Sender: TObject);
begin
 showmessage('f');
end;

procedure TFrmAbertura.ActMetodosExecute(Sender: TObject);
begin
 showmessage('c');
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
 showmessage('e');
end;

procedure TFrmAbertura.ActAtualizacoesExecute(Sender: TObject);
begin
 showmessage('g');
end;

procedure TFrmAbertura.ActSairExecute(Sender: TObject);
begin
 close;
end;

procedure TFrmAbertura.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if myConfirm('Sair da aplicação?') then
   Action:=caFree
  else
   Action:=caNone
  ;
end;

end.
