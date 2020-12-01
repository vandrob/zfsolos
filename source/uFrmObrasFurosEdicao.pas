unit uFrmObrasFurosEdicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,DB,
  Dialogs, uFrmPadraoEdicao, SUIButton, SUIImagePanel, ExtCtrls, SUIForm,
  StdCtrls, SUIEdit, DBCtrls, SUIDBCtrls, Grids, DBGrids, SUISideChannel,
  ComCtrls, SUITabControl;

type
  TFrmObrasFurosEdicao = class(TFrmPadraoEdicao)
    GroupBox1: TGroupBox;
    lbl1: TLabel;
    Label1: TLabel;
    cmbDiametro: TsuiDBLookupComboBox;
    txtCotaSondagem: TsuiNumberEdit;
    txtCotaArrasamento: TsuiNumberEdit;
    txtNomeFuro: TsuiEdit;
    Label2: TLabel;
    Label3: TLabel;
    txtObraNome: TDBText;
    txtClienteNome: TDBText;
    txtObraEndereco: TDBText;
    txtOPERACAO: TLabel;
    txtID: TsuiEdit;
    txtTIPOESTACA: TDBText;
    pnCamadas: TPanel;
    tbc1: TTabControl;
    sideNSPT: TsuiSideChannel;
    navNSPT: TsuiDBNavigator;
    gridNSPT: TsuiDBGrid;
    TabControl1: TTabControl;
    suiSideChannel1: TsuiSideChannel;
    suiDBNavigator1: TsuiDBNavigator;
    gridCamadas: TsuiDBGrid;
    suiPanel3: TsuiPanel;
    suiTabControl1: TsuiTabControl;
    suiDBGrid1: TsuiDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure txtNomeFuroKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure txtCotaSondagemEnter(Sender: TObject);
    procedure txtNomeFuroEnter(Sender: TObject);
    procedure txtCotaArrasamentoKeyPress(Sender: TObject; var Key: Char);
    procedure txtIDChange(Sender: TObject);
    procedure GradeCamadasKeyPress(Sender: TObject; var Key: Char);
    procedure GradeCamadasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridNSPTKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridCamadasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure carregarCampos(strOperacao:string='I');
  end;

var
  FrmObrasFurosEdicao: TFrmObrasFurosEdicao;

implementation

{$R *.dfm}
uses uDatamodule,uFuncoes;

procedure TFrmObrasFurosEdicao.FormCreate(Sender: TObject);
begin
  inherited;
  uDatamodule.DataModule1.qryDiametros.Open;
end;

procedure TFrmObrasFurosEdicao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  uDatamodule.DataModule1.qryDiametros.close;
end;

procedure TFrmObrasFurosEdicao.carregarCampos(strOperacao: string);
var
   idDiametro:string;
begin

 if (strOperacao='I') then txtOPERACAO.caption:='INCLUIR REGISTRO';
 if (strOperacao='A') then txtOPERACAO.caption:='ALTERAR REGISTRO';
 if (strOperacao='E') then txtOPERACAO.caption:='EXCLUIR REGISTRO';


 txtID.Text   :='0';
 txtNomeFuro.Text :='';
 txtCotaSondagem.Text:='0';
 txtCotaArrasamento.Text:='0';

 if (strOperacao<>'I') then
  begin
   txtID.Text             :=trimright(trimleft( datamodule1.QryLocal_ObrasFurosid.AsString ));
   txtNomeFuro.Text       :=DataModule1.QryLocal_ObrasFurosdescricaofuro.AsString;
   txtCotaSondagem.Text   :=DataModule1.QryLocal_ObrasFuroscota_sondagem.AsString;
   txtCotaArrasamento.Text:=DataModule1.QryLocal_ObrasFuroscota_arrasamento.AsString;
   idDiametro             :=DataModule1.QryLocal_ObrasFurosiddiametro.AsString;
   cmbDiametro.KeyValue   :=idDiametro;
  end;

   txtNomeFuro.Enabled:=strOperacao<>'E';
   txtCotaSondagem.Enabled:=strOperacao<>'E';
   txtCotaArrasamento.Enabled:=strOperacao<>'E';
   cmbDiametro.Enabled:=strOperacao<>'E';

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

procedure TFrmObrasFurosEdicao.txtNomeFuroKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key=#13 then selectnext(Sender as Twincontrol,true,true)
end;

procedure TFrmObrasFurosEdicao.FormActivate(Sender: TObject);
begin
  inherited;
  if btnSalvar.Visible then
   cmbDiametro.SetFocus
 else
   btnExcluir.SetFocus
 ;

end;

procedure TFrmObrasFurosEdicao.btnExcluirClick(Sender: TObject);
var
 strSQL:string;
begin
  inherited;
  strSQL:='DELETE FROM zf_furos WHERE id='+trimright(trimleft(txtID.Text));
  executarSQL( strSQL );
  uDatamodule.DataModule1.QryLocal_ObrasFuros.Refresh;
  close;


end;

procedure TFrmObrasFurosEdicao.btnSalvarClick(Sender: TObject);
var
 strSQL,strOperacao,strNewID:string;
begin

  inherited;

  if not campoPreenchido(txtNomeFuro.Text   , 'O Campo [ NOME ] � de preenchimento obrigat�rio')   then begin txtNomeFuro.SetFocus; exit; end;


  strOperacao:= copy(txtOPERACAO.caption,0,1);

  if (strOperacao='I') then
   begin
    strSQL:='INSERT INTO zf_furos ('+
            ' idobra ,    '+
            ' iddiametro,    '+
            ' descricaofuro,    '+
            ' cota_sondagem, '+
            ' cota_arrasamento '+
            ' ) VALUES ( '+
            aspas( VirgulaParaPonto(uDatamodule.DataModule1.qryLocal_Obrasid.AsString ))+','+
            aspas( VirgulaParaPonto(cmbDiametro.KeyValue )) +','+
            aspas( txtNomeFuro.Text )+','+
            aspas( VirgulaParaPonto(txtCotaSondagem.Text) ) +','+
            aspas( VirgulaParaPonto(txtCotaArrasamento.Text) )+')';

   end
  else if (strOperacao='A') then
   begin
     strSQL:='UPDATE zf_furos SET '+
             '  iddiametro  = '+ aspas( VirgulaParaPonto(cmbDiametro.KeyValue) )+','+
             '  descricaofuro    = '+ aspas( txtNomeFuro.Text)+','+
             '  cota_sondagem    = '+ aspas( VirgulaParaPonto(txtCotaSondagem.Text))+','+
             '  cota_arrasamento        = '+ aspas( VirgulaParaPonto(txtCotaArrasamento.Text))+
             ' WHERE '+
             '  id='+aspas( VirgulaParaPonto(txtID.Text) );
   end
  ;

  executarSQL( strSQL );
  uDatamodule.DataModule1.QryLocal_ObrasFuros.Refresh;

   if (strOperacao='I') then begin
      strOperacao:='A';
      strSQL:='SELECT COALESCE(MAX(id),0)+1 AS ID FROM zf_furos WHERE idobra='+uDatamodule.DataModule1.qryLocal_Obrasid.AsString;
      strNewID:=retornarValor(strSQL);
      with uDatamodule.DataModule1.QryLocal_ObrasFuros do begin
       First;
       Locate( 'id', strSQL,[]);
      end;
      carregarCampos( strOperacao );
      pnCamadas.Visible:=true;
   end else begin
    close;
   end;



end;

procedure TFrmObrasFurosEdicao.txtCotaSondagemEnter(Sender: TObject);
begin
  inherited;
  txtCotaSondagem.SelectAll;
end;

procedure TFrmObrasFurosEdicao.txtNomeFuroEnter(Sender: TObject);
begin
  inherited;
 txtNomeFuro.SelectAll;
end;

procedure TFrmObrasFurosEdicao.txtCotaArrasamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key=#13 then begin
    if btnSalvar.Visible then btnSalvar.SetFocus else btnExcluir.SetFocus;
  end;
end;

procedure TFrmObrasFurosEdicao.txtIDChange(Sender: TObject);
var
   wid:string;
begin
  inherited;
  wid:=TrimRight(TrimLeft(DataModule1.QryLocal_ObrasFurosid.AsString));
  if wid<>'' then begin
    with uDatamodule.DataModule1.qryFuros_NSPT do begin
      Close;
      ParamByName('parIDFURO').Value:=wid;
      Open;
    end;
    with uDatamodule.DataModule1.qryCamadas do begin
      Close;
      ParamByName('parIDFURO').Value:=wid;
      Open;
    end;
    with uDatamodule.DataModule1.qryCalculosDecourt do begin
      Close;
      ParamByName('parIDFURO').Value:=wid;
      Open;
    end;

  end;


end;

procedure TFrmObrasFurosEdicao.GradeCamadasKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key=#13 then begin
  
  end;
end;

procedure TFrmObrasFurosEdicao.GradeCamadasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  Column: Integer;
begin
  inherited;
  if Key = VK_RETURN then
  begin
    Column := (Sender as TDBGrid).SelectedIndex;
    if Column < 0 then
      Column := 0;
    if ssShift in Shift then
      Dec(Column)
    else
      Inc(Column);
    if Column < 0 then
    begin

      Column := (Sender as TDBGrid).Columns.Count - 1;
      if ((Sender as TDBGrid).DataSource.State = dsBrowse) and
        not (Sender as TDBGrid).DataSource.DataSet.BOF then
        (Sender as TDBGrid).DataSource.DataSet.Prior;
    end
    else
    if Column >= (Sender as TDBGrid).Columns.Count then
    begin
      Column := 0;
      if ((Sender as TDBGrid).DataSource.State = dsBrowse) and
        not (Sender as TDBGrid).DataSource.DataSet.EOF then
        (Sender as TDBGrid).DataSource.DataSet.Next
      else
        (Sender as TDBGrid).DataSource.DataSet.Append;
    end;
    (Sender as TDBGrid).SelectedIndex := Column;
    Key := 0;
  end;
end;

procedure TFrmObrasFurosEdicao.gridNSPTKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  Column: Integer;
begin
  if Key = VK_RETURN then
  begin
    Column := (Sender as TDBGrid).SelectedIndex;
    if Column <= 0 then
      Column := 3;
    if ssShift in Shift then
      Dec(Column)
    else
      Inc(Column);
    if Column <= 0 then
    begin
      //Column := (Sender as TDBGrid).Columns.Count - 1;
      if ((Sender as TDBGrid).DataSource.State = dsBrowse) and
        not (Sender as TDBGrid).DataSource.DataSet.BOF then
        (Sender as TDBGrid).DataSource.DataSet.Prior;
    end
    else
    if Column >= (Sender as TDBGrid).Columns.Count then
    begin
      Column := 3;
      if ((Sender as TDBGrid).DataSource.State = dsBrowse) and
        not (Sender as TDBGrid).DataSource.DataSet.EOF then
        (Sender as TDBGrid).DataSource.DataSet.Next
      else
        (Sender as TDBGrid).DataSource.DataSet.Append;
    end;
    (Sender as TDBGrid).SelectedIndex := 3;
    Key := 0;
  end;
end;


procedure TFrmObrasFurosEdicao.gridCamadasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  Column: Integer;
begin
  if Key = VK_RETURN then
  begin
    Column := (Sender as TDBGrid).SelectedIndex;
    if Column <= 0 then
      Column := 5;
    if ssShift in Shift then
      Dec(Column)
    else
      Inc(Column);
    if Column <= 0 then
    begin
      //Column := (Sender as TDBGrid).Columns.Count - 1;
      if ((Sender as TDBGrid).DataSource.State = dsBrowse) and
        not (Sender as TDBGrid).DataSource.DataSet.BOF then
        (Sender as TDBGrid).DataSource.DataSet.Prior;
    end
    else
    if Column >= (Sender as TDBGrid).Columns.Count then
    begin
      Column := 5;
      if ((Sender as TDBGrid).DataSource.State = dsBrowse) and
        not (Sender as TDBGrid).DataSource.DataSet.EOF then
        (Sender as TDBGrid).DataSource.DataSet.Next
      else
        (Sender as TDBGrid).DataSource.DataSet.Append;
    end;
    (Sender as TDBGrid).SelectedIndex := 5;
    Key := 0;
  end;

end;

procedure TFrmObrasFurosEdicao.FormShow(Sender: TObject);
begin
  inherited;
  pnCamadas.Visible:= copy(txtOPERACAO.caption,0,1)<>'I';

end;

end.
