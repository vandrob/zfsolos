unit uFrmUsuariosEdicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmPadraoEdicao, SUIButton, SUIImagePanel, ExtCtrls, SUIForm,
  StdCtrls, SUIEdit;

type
  TFrmUsuariosEdicao = class(TFrmPadraoEdicao)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    txtNome: TsuiEdit;
    txtSenha: TsuiEdit;
    txtEmail: TsuiEdit;
    chkAtivo: TsuiCheckBox;
    chkAdministrador: TsuiCheckBox;
    txtID: TsuiEdit;
    Label4: TLabel;
    procedure txtNomeKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure carregarCampos(strOperacao:string='I');
  end;

var
  FrmUsuariosEdicao: TFrmUsuariosEdicao;

implementation

uses uDatamodule,uFuncoes, uFrmTeste;
{$R *.dfm}

procedure TFrmUsuariosEdicao.carregarCampos(strOperacao: string);
begin

                                      {
 if (strOperacao='I') then caption:='INCLUIR REGISTRO';
 if (strOperacao='A') then caption:='ALTERAR REGISTRO';
 if (strOperacao='E') then caption:='EXCLUIR REGISTRO';


 txtID.Text   :='0';
 txtNome.Text :='';
 txtEmail.Text:='';
 txtSenha.Text:='';
 chkAtivo.Checked:=true;
 chkAdministrador.Checked:=true;

 if (strOperacao<>'I') then
  begin
   txtID.Text   :=trimright(trimleft( datamodule1.qrylocal_usuariosid.AsString ));
   txtNome.Text :=trimright(trimleft( datamodule1.qrylocal_usuariosnome.AsString));
   txtEmail.Text:=trimright(trimleft( datamodule1.qrylocal_usuariosemail.AsString ));
   txtSenha.Text:=trimright(trimleft( datamodule1.qrylocal_usuariossenha.AsString));
   chkAtivo.Checked:= trimright(trimleft( datamodule1.qrylocal_usuariosativo_sn.AsString))='S';
   chkAdministrador.Checked:=trimright(trimleft( datamodule1.qrylocal_usuariosadministrador_sn.AsString))='S';
  end;

   txtNome.Enabled:=strOperacao<>'E';
   txtEmail.Enabled:=strOperacao<>'E';
   txtSenha.Enabled:=strOperacao<>'E';
   chkAtivo.Enabled:=strOperacao<>'E';
   chkAdministrador.Enabled:=strOperacao<>'E';

   if (strOperacao<>'E') then
    begin
     txtNome.SetFocus;
     btnSalvar.Visible:=true;
     btnCancelar.Visible:=true;
     btnExcluir.Visible:=false;
    end
   else
    begin
     btnSalvar.Visible:=false;
     btnCancelar.Visible:=true;
     btnExcluir.Visible:=true;
    end
   ;
                                       }

end;

procedure TFrmUsuariosEdicao.txtNomeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key=#13 then selectnext(Sender as Twincontrol,true,true);
end;

end.
