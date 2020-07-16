unit uFrmConexao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, acPNG, SUIButton, StdCtrls, Buttons;

type
  TFrmConexao = class(TForm)
    Image1: TImage;
    BtnConectar: TBitBtn;
    btnSair: TBitBtn;
    procedure BtnConectarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConexao: TFrmConexao;

implementation

uses uDatamodule,uFuncoes, uFrmAbertura;
{$R *.dfm}

procedure TFrmConexao.BtnConectarClick(Sender: TObject);
begin
 try
  begin
   Datamodule1.connLocal.Connected:=true;
   hide;
   
   if not assigned(FrmAbertura) then
                 FrmAbertura:=TFrmAbertura.Create(Application);
                 FrmAbertura.ShowModal;
                 FreeAndNil(FrmAbertura);

  end
 Except
   on E: Exception do
     ShowMessage('Erro: ' + E.Message );
   end;
end;

procedure TFrmConexao.btnSairClick(Sender: TObject);
begin
 if Datamodule1.connLocal.Connected=true then Datamodule1.connLocal.Connected:=false;
 application.Terminate;
end;

end.
