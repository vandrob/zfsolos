unit uFrmUsuariosEdicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmPadraoEdicao, SUIButton, SUIImagePanel, ExtCtrls, SUIForm,
  StdCtrls, SUIEdit;

type
  TFrmUsuariosEdicao = class(TFrmPadraoEdicao)
    chkAdministrador: TsuiCheckBox;
    chkBloqueado: TsuiCheckBox;
    txtSenha: TsuiEdit;
    Label3: TLabel;
    txtEmail: TsuiEdit;
    txtNome: TsuiEdit;
    txtID: TsuiEdit;
    Label1: TLabel;
    Label2: TLabel;
    txtOPERACAO: TLabel;
    procedure txtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure txtEmailKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure carregarCampos(strOperacao:string='I');
  end;

var
  FrmUsuariosEdicao: TFrmUsuariosEdicao;

implementation

uses uDatamodule,uFuncoes;
{$R *.dfm}

{ TFrmTeste }

procedure TFrmUsuariosEdicao.carregarCampos(strOperacao: string);
begin

                                      
 if (strOperacao='I') then txtOPERACAO.caption:='INCLUIR REGISTRO';
 if (strOperacao='A') then txtOPERACAO.caption:='ALTERAR REGISTRO';
 if (strOperacao='E') then txtOPERACAO.caption:='EXCLUIR REGISTRO';


 txtID.Text   :='0';
 txtNome.Text :='';
 txtEmail.Text:='';
 txtSenha.Text:='';
 chkBloqueado.Checked:=false;
 chkAdministrador.Checked:=false;

 if (strOperacao<>'I') then
  begin
   txtID.Text   :=trimright(trimleft( datamodule1.qrylocal_usuariosid.AsString ));
   txtNome.Text :=trimright(trimleft( datamodule1.qrylocal_usuariosnome.AsString));
   txtEmail.Text:=trimright(trimleft( datamodule1.qrylocal_usuariosemail.AsString ));
   txtSenha.Text:=trimright(trimleft( datamodule1.qrylocal_usuariossenha.AsString));
   chkBloqueado.Checked:= (trimright(trimleft( datamodule1.qrylocal_usuariosativo_sn.AsString))<>'S');
   chkAdministrador.Checked:=trimright(trimleft( datamodule1.qrylocal_usuariosadministrador_sn.AsString))='S';
  end;

   txtNome.Enabled:=strOperacao<>'E';
   txtEmail.Enabled:=strOperacao<>'E';
   txtSenha.Enabled:=strOperacao<>'E';
   chkBloqueado.Enabled:=strOperacao<>'E';
   chkAdministrador.Enabled:=strOperacao<>'E';

   if (strOperacao<>'E') then
    begin
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




end;

procedure TFrmUsuariosEdicao.txtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
 if key=#13 then selectnext(Sender as Twincontrol,true,true);
end;

procedure TFrmUsuariosEdicao.FormActivate(Sender: TObject);
begin
  inherited;

  if btnSalvar.Visible then
   begin
    //para usu�rios n�o administradores ...
    if (usuario_admin<>'S') then
     begin
      chkBloqueado.Visible:=false;
      chkAdministrador.Visible:=false;
      txtNome.Enabled:=false;
      txtEmail.Enabled:=true;
      txtSenha.Enabled:=true;
      myMSG('Campos liberados a altera��es:'+#13+#10+' SENHA e EMAIL '+#13+#10+#13+#10+'Outras altera��es solicite a um usu�rio administrador');
      txtSenha.SetFocus;
     end
    else
     begin
      txtNome.SetFocus;
     end;
   end
  else
   btnExcluir.SetFocus
  ;

end;

procedure TFrmUsuariosEdicao.btnExcluirClick(Sender: TObject);
var
 strSQL:string;
begin
  inherited;
  strSQL:='DELETE FROM zf_usuarios WHERE id='+trimright(trimleft(txtID.Text));
  executarSQL( strSQL );
  uDatamodule.DataModule1.qrylocal_usuarios.Refresh;
  close;
end;

procedure TFrmUsuariosEdicao.btnSalvarClick(Sender: TObject);
var
 strSQL,strAtivo,strAdmin,strOperacao:string;
begin

  inherited;

  if not campoPreenchido(txtNome.Text   , 'O Campo [ NOME ] � de preenchimento obrigat�rio')   then begin txtNome.SetFocus; exit; end;
  if not campoPreenchido(txtSenha.Text  , 'O Campo [ SENHA ] � de preenchimento obrigat�rio')  then begin txtSenha.SetFocus; exit; end;
  if not campoPreenchido(txtEmail.Text  , 'O Campo [ E-MAIL ] � de preenchimento obrigat�rio') then begin txtEmail.SetFocus; exit; end;

  if (chkBloqueado.Checked) then strAtivo:='N' else strAtivo:='S';
  if (chkAdministrador.Checked) then strAdmin:='S' else strAdmin:='N';


  strOperacao:= copy(txtOPERACAO.caption,0,1);

  if (strOperacao='I') then
   begin
    strSQL:='INSERT INTO zf_usuarios ('+
            ' nome ,    '+
            ' senha,    '+
            ' email,    '+
            ' ativo_sn, '+
            ' administrador_sn '+
            ' ) VALUES ( '+
            aspas( txtNome.Text )+','+
            aspas( txtSenha.Text ) +','+
            aspas( txtEmail.Text ) +','+
            aspas( strAtivo )+','+
            aspas( strAdmin )+')';
            
   end
  else if (strOperacao='A') then
   begin
     strSQL:='UPDATE zf_usuarios SET '+
             '  nome = '+ aspas( txtNome.text )+','+
             '  senha= '+ aspas( txtSenha.Text)+','+
             '  email= '+ aspas( txtEmail.Text)+','+
             '  ativo_sn='+aspas( strAtivo )+','+
             '  administrador_sn='+aspas( strAdmin )+
             ' WHERE '+
             '  id='+aspas( txtID.Text );
   end
  ;



  executarSQL( strSQL );
  uDatamodule.DataModule1.qrylocal_usuarios.Refresh;
  close;

end;

procedure TFrmUsuariosEdicao.txtEmailKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key=#13 then btnsalvar.setfocus;
end;

end.
