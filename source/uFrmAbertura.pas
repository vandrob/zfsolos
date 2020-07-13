unit uFrmAbertura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, SUIForm, SUIButton, jpeg, SUIImagePanel, Menus,
  ActnList, SUIMainMenu, StdCtrls, ImgList;

type
  TForm1 = class(TForm)
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
    procedure btnSairClick(Sender: TObject);
    procedure ActClientesExecute(Sender: TObject);
    procedure ActCalculosExecute(Sender: TObject);
    procedure ActBackupExecute(Sender: TObject);
    procedure ActMetodosExecute(Sender: TObject);
    procedure ActUsuariosExecute(Sender: TObject);
    procedure ActMuralExecute(Sender: TObject);
    procedure ActAtualizacoesExecute(Sender: TObject);
    procedure ActSairExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnSairClick(Sender: TObject);
begin
 application.terminate;
end;

procedure TForm1.ActClientesExecute(Sender: TObject);
begin
 showmessage('a');
end;

procedure TForm1.ActCalculosExecute(Sender: TObject);
begin
 showmessage('b');
end;

procedure TForm1.ActBackupExecute(Sender: TObject);
begin
 showmessage('f');
end;

procedure TForm1.ActMetodosExecute(Sender: TObject);
begin
 showmessage('c');
end;

procedure TForm1.ActUsuariosExecute(Sender: TObject);
begin
 showmessage('d');
end;

procedure TForm1.ActMuralExecute(Sender: TObject);
begin
 showmessage('e');
end;

procedure TForm1.ActAtualizacoesExecute(Sender: TObject);
begin
 showmessage('g');
end;

procedure TForm1.ActSairExecute(Sender: TObject);
begin
 application.terminate;
end;

end.
