unit uFrmSolosEdicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmPadraoEdicao, SUIButton, SUIImagePanel, ExtCtrls, SUIForm,
  StdCtrls, SUIEdit;

type
  TFrmSolosEdicao = class(TFrmPadraoEdicao)
    txtID: TsuiEdit;
    txtOPERACAO: TLabel;
    txtNome: TsuiEdit;
    Label1: TLabel;
    Label2: TLabel;
    txtKNM2: TsuiNumberEdit;
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   procedure carregarCampos(strOperacao:string='I');
  end;

var
  FrmSolosEdicao: TFrmSolosEdicao;

implementation

uses uDatamodule,uFuncoes;

{$R *.dfm}

procedure TFrmSolosEdicao.btnExcluirClick(Sender: TObject);

var
 strSQL:string;
begin
  inherited;
  strSQL:='DELETE FROM zf_solos WHERE id='+trimright(trimleft(txtID.Text));
  executarSQL( strSQL );
  uDatamodule.DataModule1.qryLocal_Solos.Refresh;
  close;
end;

procedure TFrmSolosEdicao.btnSalvarClick(Sender: TObject);
var
 strSQL,strOperacao,vlr:string;
begin

  inherited;

  if not campoPreenchido(txtNome.Text   , 'O Campo [ NOME ] � de preenchimento obrigat�rio')   then begin txtNome.SetFocus; exit; end;


  strOperacao:= copy(txtOPERACAO.caption,0,1);
  vlr:=  aspas( VirgulaParaPonto( txtKnm2.Text ) )   ;


  if (strOperacao='I') then
   begin
    strSQL:='INSERT INTO zf_solos ('+
            ' nome,knm2     '+
            ' ) VALUES ( '+
            aspas( txtNome.text )+','+
            vlr+')';

   end
  else if (strOperacao='A') then
   begin
     strSQL:='UPDATE zf_solos SET '+
             '  nome      = '+ aspas( txtNome.text )+',' +
             '  knm2      = '+ vlr +
             ' WHERE '+
             '  id='+aspas( txtID.Text );
   end
  ;



  executarSQL( strSQL );
  uDatamodule.DataModule1.qryLocal_Solos.Refresh;
  close;


end;

procedure TFrmSolosEdicao.carregarCampos(strOperacao: string);
begin
 if (strOperacao='I') then txtOPERACAO.caption:='INCLUIR REGISTRO';
 if (strOperacao='A') then txtOPERACAO.caption:='ALTERAR REGISTRO';
 if (strOperacao='E') then txtOPERACAO.caption:='EXCLUIR REGISTRO';


 txtID.Text   :='0';
 txtNome.Text :='';

 if (strOperacao<>'I') then
  begin
   txtID.Text       :=trimright(trimleft( datamodule1.qryLocal_Solosid.AsString ));
   txtNome.Text     :=trimright(trimleft( datamodule1.qryLocal_Solosnome.AsString));
   txtKnM2.Value    :=StrToFloat( datamodule1.qryLocal_Solosknm2.AsString);
  end;

   txtNome.Enabled:=strOperacao<>'E';

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

procedure TFrmSolosEdicao.FormActivate(Sender: TObject);
begin

inherited;
  if btnSalvar.Visible then
   txtNome.SetFocus
  else
   btnExcluir.SetFocus
  ;
  if (txtNome.Text='NAO DEFINIDO') then begin
      myMSG('N�o pode ser editado ou Exclu�do'#13+#10+'pois ele � utilizado pelo sistema'+#13+#10+'em lan�amentos onde o usu�rio n�o'+#13+#10+' efetua preenchimentos corretamente','ATEN��O',2);
      btnsalvar.Visible:=false;
      btnexcluir.Visible:=false;
  end;
end;

end.
