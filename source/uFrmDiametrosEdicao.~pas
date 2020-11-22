unit uFrmDiametrosEdicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmPadraoEdicao, SUIButton, SUIImagePanel, ExtCtrls, SUIForm,
  SUIEdit, StdCtrls;

type
  TFrmDiametrosEdicao = class(TFrmPadraoEdicao)
    txtID: TsuiEdit;
    txtOPERACAO: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    idtipo: TEdit;
    txtDiametro: TsuiSpinEdit;
    Label7: TLabel;
    txtArea: TsuiSpinEdit;
    Label8: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    txtPerimetro: TsuiSpinEdit;
    Label10: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    txtSecao_1: TsuiSpinEdit;
    Label4: TLabel;
    txtSecao_2: TsuiSpinEdit;
    Label6: TLabel;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    txtMetalica_Bitola_Letra: TsuiEdit;
    Label18: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    txtMetalica_Bitola_Secao_1: TsuiNumberEdit;
    txtMetalica_Bitola_Secao_2: TsuiNumberEdit;
    txtMetalica_Area_Bruta: TsuiNumberEdit;
    txtMetalica_Perimetro: TsuiNumberEdit;
    txtMetalica_Area_Plena: TsuiNumberEdit;
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure carregarCampos(strOperacao: string);
  end;

var
  FrmDiametrosEdicao: TFrmDiametrosEdicao;

implementation

uses uDatamodule, uFuncoes;

{$R *.dfm}

{ TFrmDiametrosEdicao }

procedure TFrmDiametrosEdicao.carregarCampos(strOperacao: string);

begin
 if (strOperacao='I') then txtOPERACAO.caption:='INCLUIR REGISTRO';
 if (strOperacao='A') then txtOPERACAO.caption:='ALTERAR REGISTRO';
 if (strOperacao='E') then txtOPERACAO.caption:='EXCLUIR REGISTRO';


 txtID.Text   :='0';

 if (strOperacao<>'I') then
  begin
   txtID.Text       :=trimright(trimleft( datamodule1.qryLocal_Diametrosid.AsString));
   txtDiametro.Text :=trimright(trimleft( datamodule1.qryLocal_Diametrosdiametro.AsString));
   txtSecao_1.Text  :=trimright(trimleft( datamodule1.qryLocal_Diametrossecao_1.AsString));
   txtSecao_2.Text  :=trimright(trimleft( datamodule1.qryLocal_Diametrossecao_2.AsString));
   txtArea.Text:=trimright(trimleft( datamodule1.qryLocal_Diametrosarea.AsString));
   txtPerimetro.Text:=trimright(trimleft( datamodule1.qryLocal_Diametrosperimetro.AsString));

   txtMetalica_Bitola_Letra.Text  :=trimright(trimleft( datamodule1.qryLocal_Diametrosmetalica_bitola_letra.AsString));
   txtMetalica_Bitola_Secao_1.Text:=trimright(trimleft( datamodule1.qryLocal_Diametrosmetalica_bitola_secao_1.AsString));
   txtMetalica_Bitola_Secao_2.Text:=trimright(trimleft( datamodule1.qryLocal_Diametrosmetalica_bitola_secao_2.AsString));
   txtMetalica_Area_Bruta.Text    :=trimright(trimleft( datamodule1.qryLocal_Diametrosmetalica_area_bruta.AsString));
   txtMetalica_Perimetro.Text     :=trimright(trimleft( datamodule1.qryLocal_Diametrosmetalica_perimetro.AsString));
   txtMetalica_Area_Plena.Text    :=trimright(trimleft( datamodule1.qryLocal_Diametrosmetalica_area_plena.AsString));

  end
 else
  begin
    txtDiametro.text:='0';
    txtSecao_1.text:='0';
    txtSecao_2.text:='0';
    txtArea.text:='0';
    txtPerimetro.text:='0';

    txtMetalica_Bitola_Letra.Text  :='';
    txtMetalica_Bitola_Secao_1.Text:='0';
    txtMetalica_Bitola_Secao_2.Text:='0';
    txtMetalica_Area_Bruta.Text    :='0';
    txtMetalica_Perimetro.Text     :='0';
    txtMetalica_Area_Plena.Text    :='0';

   end
  ;


   txtDiametro.Enabled:=strOperacao<>'E';

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

procedure TFrmDiametrosEdicao.btnExcluirClick(Sender: TObject);
var
 strSQL:string;
begin
  inherited;
  strSQL:='DELETE FROM zf_diametros WHERE id='+trimright(trimleft(txtID.Text));
  executarSQL( strSQL );
  uDatamodule.DataModule1.qryLocal_Diametros.Refresh;
  close;


end;

procedure TFrmDiametrosEdicao.btnSalvarClick(Sender: TObject);
var
 strSQL,strOperacao:string;
begin

  inherited;

  //if not campoPreenchido( txtDiametro.Value   , 'O Campo [ Diâmetro ] é de preenchimento obrigatório')   then begin txtDiametro.SetFocus; exit; end;


  strOperacao:= copy(txtOPERACAO.caption,0,1);

  if (strOperacao='I') then
   begin
    strSQL:='INSERT INTO zf_diametros ('+
            ' id_estacas_tipos, diametro , secao_1,secao_2,area,perimetro,    '+
            ' metalica_bitola_letra, metalica_bitola_secao_1, metalica_bitola_secao_2,'+
            ' metalica_area_bruta, metalica_perimetro, metalica_area_plena '+
            ' ) VALUES ( '+
            aspas( idTipo.text )                             +' ,'+
            aspas( VirgulaParaPonto( txtDiametro.Text ) )    +' ,'+
            aspas( VirgulaParaPonto( txtSecao_1.Text ) )     +' ,'+
            aspas( VirgulaParaPonto( txtSecao_2.Text ) )     +' ,'+
            aspas( VirgulaParaPonto( txtArea.Text ) )        +' ,'+
            aspas( VirgulaParaPonto( txtPerimetro.Text ) )   +' ,'+

            aspas( VirgulaParaPonto( txtMetalica_Bitola_Letra.Text ) )     +' ,'+
            aspas( VirgulaParaPonto( txtMetalica_Bitola_Secao_1.Text ) )   +' ,'+
            aspas( VirgulaParaPonto( txtMetalica_Bitola_Secao_2.Text ) )   +' ,'+
            aspas( VirgulaParaPonto( txtMetalica_Area_Bruta.Text ) )       +' ,'+
            aspas( VirgulaParaPonto( txtMetalica_Perimetro.Text ) )        +' ,'+
            aspas( VirgulaParaPonto( txtMetalica_Area_Plena.Text ) )       +' ) ';




   end
  else if (strOperacao='A') then
   begin
     strSQL:='UPDATE zf_diametros SET '+
             '   diametro     = '+ aspas( VirgulaParaPonto( txtDiametro.text )  )+
             '  ,secao_1      = '+ aspas( VirgulaParaPonto( txtSecao_1.text )   )+
             '  ,secao_2      = '+ aspas( VirgulaParaPonto( txtSecao_2.text )   )+
             '  ,area         = '+ aspas( VirgulaParaPonto( txtArea.text )      )+
             '  ,perimetro    = '+ aspas( VirgulaParaPonto( txtPerimetro.text ) )+
             '  ,metalica_bitola_letra    = '+ aspas( VirgulaParaPonto( txtMetalica_Bitola_Letra.text ) )+
             '  ,metalica_bitola_secao_1  = '+ aspas( VirgulaParaPonto( txtMetalica_Bitola_Secao_1.text ) )+
             '  ,metalica_bitola_secao_2  = '+ aspas( VirgulaParaPonto( txtMetalica_Bitola_Secao_2.text ) )+
             '  ,metalica_area_bruta      = '+ aspas( VirgulaParaPonto( txtMetalica_Area_Bruta.text ) )+
             '  ,metalica_perimetro       = '+ aspas( VirgulaParaPonto( txtMetalica_Perimetro.text ) )+
             '  ,metalica_area_plena      = '+ aspas( VirgulaParaPonto( txtMetalica_Area_Plena.text ) )+
             ' WHERE '+
             '  id='+aspas( txtID.Text );
   end
  ;



  executarSQL( strSQL );
  uDatamodule.DataModule1.qryLocal_Diametros.Refresh;
  close;


end;

procedure TFrmDiametrosEdicao.FormActivate(Sender: TObject);
begin
  inherited;
  if btnSalvar.Visible then
   txtDiametro.SetFocus
  else
   btnExcluir.SetFocus
  ;
end;

end.
