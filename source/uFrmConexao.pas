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
    lblVersao: TLabel;
    Label2: TLabel;
    procedure BtnConectarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure GetFileVersion;
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
   Datamodule1.connMYSQL.Connected:=true;
   hide;
   
   if not assigned(FrmAbertura) then
                 FrmAbertura:=TFrmAbertura.Create(Application);
                 FrmAbertura.ShowModal;
                 FreeAndNil(FrmAbertura);

  end
  except on E:  Exception  do
   begin
      ShowMessage('Não foi possível conectar-se ao servidor, tente mais tarde');
   end
   else
       ShowMessage('Unknown error');
 end;
end;

procedure TFrmConexao.btnSairClick(Sender: TObject);
begin
 if Datamodule1.connMYSQL.Connected=true then Datamodule1.connMYSQL.Connected:=false;
 application.Terminate;
end;



procedure TFrmConexao.FormCreate(Sender: TObject);
begin
 GetFileVersion();
end;

procedure TFrmConexao.GetFileVersion();
// by AcidBytes - acidbytes@ig.com.br
//     icq 63912484
// English
// get Major, Minor, Release, Build for an EXE or DLL file.
// returns true=success.
// returns false=failure-probably info not found in the file.

// Portugues
//  Pega os números de versão maior, Menor, release e build para o arquivo
//       exe ou dll passado como argumento em FileName, coloca esses números
//       nas variáveis major, minor, release e build passadas como referencia.
// Retorna True = Sucesso, conseguiu obter a versão
// Retorna False = Falha, provavelmente arquivo não localizado ou informação
//                 de versão não consta no arquivo.

var
  Zero: DWORD; // set to 0 by GetFileVersionInfoSize
  VersionInfoSize: DWORD;
  PVersionData: pointer;
  PFixedFileInfo: PVSFixedFileInfo;
  FixedFileInfoLength: UINT;


  Filename:string;

  Major,  Minor, Release, Build: Integer ;
begin
  Filename:=paramStr(0);
  Major := 0;
  Minor := 0;
  Release := 0;
  Build := 0;
  lblVersao.caption := IntToStr(Major) + IntToStr(Minor) + IntToStr(Release) + IntToStr(Build);

  VersionInfoSize := GetFileVersionInfoSize(pChar(FileName), Zero);
  if VersionInfoSize = 0 then
     exit;
  PVersionData := AllocMem(VersionInfoSize);
  try
    if GetFileVersionInfo(pChar(FileName), 0, VersionInfoSize, PVersionData) = False then
       exit;
//      raise Exception.Create('Não pude recuperar informação sobre versão');
    if VerQueryValue(PVersionData, '', pointer(PFixedFileInfo), FixedFileInfoLength) = False then
       exit;
    Major := PFixedFileInfo^.dwFileVersionMS shr 16;
    Minor := PFixedFileInfo^.dwFileVersionMS and $FFFF;
    Release := PFixedFileInfo^.dwFileVersionLS shr 16;
    Build := PFixedFileInfo^.dwFileVersionLS and $FFFF;

   if (Major or Minor or Release or Build) <> 0 then begin
     //simplificar
     lblVersao.caption := IntToStr(Major) +'.'+ IntToStr(Minor) +'.' + IntToStr(Build);
    end;

  finally
    FreeMem(PVersionData);
  end;

end;

end.
