unit uFrmSolos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmPadrao, ExtCtrls, SUIButton, SUIDBCtrls, Grids, DBGrids,
  SUIImagePanel, SUIForm;

type
  TFrmSolos = class(TFrmPadrao)
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    procedure chamarTelaEdicao(strOpcao: string);
  public
    { Public declarations }
  end;

var
  FrmSolos: TFrmSolos;



  
implementation


uses uDatamodule,uFuncoes, uFrmSolosEdicao;
{$R *.dfm}

procedure TFrmSolos.btnIncluirClick(Sender: TObject);
begin
  inherited;
  chamarTelaEdicao('I');
end;

procedure TFrmSolos.btnAlterarClick(Sender: TObject);
begin
  inherited;
  chamarTelaEdicao('A');
end;

procedure TFrmSolos.btnExcluirClick(Sender: TObject);
begin
  inherited;
    chamarTelaEdicao('E')  ;
end;

procedure TFrmSolos.chamarTelaEdicao(strOpcao: string);
begin
 //chamar a tela de edi��o como a op��o (I)ncluir, (A)lterar ou (E)xcluir
if strOpcao<>'I' then begin
 if datamodule1.qryLocal_Solos.RecordCount = 0 then
  begin
      myMSG( 'Tabela Vazia! ','Op��o n�o dispon�vel',2);
      exit;
  end
end;
timer1.Enabled:=false;
if not assigned(FrmSolosEdicao) then
                 FrmSolosEdicao:=TFrmSolosEdicao.Create(Application);
                 uFrmSolosEdicao.FrmSolosEdicao.carregarCampos(strOpcao);
                 FrmSolosEdicao.ShowModal;
                 FreeAndNil(FrmSolosEdicao);
timer1.Enabled:=true;
end;

procedure TFrmSolos.Timer1Timer(Sender: TObject);
begin
  inherited;
  //refresh na tabela
  with Datamodule1.qryLocal_Solos do begin
   disablecontrols;
   Refresh;
   enablecontrols;
  end;
end;

procedure TFrmSolos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
    timer1.Enabled:=false;
    Datamodule1.qryLocal_Solos.Close;
end;

procedure TFrmSolos.FormCreate(Sender: TObject);
begin
  inherited;
  Datamodule1.qryLocal_Solos.Open;
end;

procedure TFrmSolos.FormActivate(Sender: TObject);
begin
  inherited;
   timer1.Enabled:=true;
end;

end.
