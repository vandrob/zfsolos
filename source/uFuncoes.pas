unit uFuncoes;

interface

uses
   SysUtils,  Forms,  SUIDlg, Controls, Dialogs;



 procedure myMsg(strMensagem:string);
 function myConfirm(strMensagem:string; strTitulo:string='Aviso' ;intIcone:integer=0; strBtn1:string='Sim';strBtn2:string='N�o'):boolean;
 procedure executarSQL(strSQL:string);
 function aspas(str:string):string;

implementation

uses uFrmAbertura,udatamodule;

function aspas(str:string):string;
begin
   result:=#39+ trimright(trimleft( str )) +#39;
end;

procedure myMsg(strMensagem:string);
var
 myDLG:TsuiMessageDialog;
begin
 myDLG:= TsuiMessageDialog.create(Application);
 myDLG.Caption:='Aviso';
 myDLG.Text:=strMensagem;
 myDLG.IconType:=suiInformation;
 myDLG.UIStyle:=FrmAbertura.suiForm1.UIStyle;
 myDLG.ShowModal;
 FreeAndNil( myDLG );
end;

function myConfirm(strMensagem:string; strTitulo:string='Aviso' ;intIcone:integer=0; strBtn1:string='Sim';strBtn2:string='N�o'):boolean;
var
 myDLG:TsuiMessageDialog;
 myResult:Boolean;
begin
 myDLG:= TsuiMessageDialog.create(Application);
 myDLG.Caption:=strTitulo;
 myDLG.Text:=strMensagem;
 myDLG.IconType:=suiHelp;
 myDLG.ButtonCount:=2;
 myDLG.Button1Caption:=strBtn1;
 myDLG.Button2Caption:=strBtn2;

 myDLG.UIStyle:=FrmAbertura.suiForm1.UIStyle;

 case intIcone of
    0 : myDLG.IconType := suiHelp;
    1 : myDLG.IconType := suiInformation;
    2 : myDLG.IconType := suiStop;
    3 : myDLG.IconType := suiWarning;
    4 : myDLG.IconType := suiNone;
 end;
 myResult:= (myDLG.ShowModal=mrOk );
 FreeAndNil( myDLG );

 result :=myResult;
end;

procedure executarSQL(strSQL:string);
begin
 //procedimento para execu��o de comandos de inser��o/exclus�o/atualiza��o de registros nas tabelas
 Try
   udatamodule.DataModule1.cmdLocal.Script.Clear;
   udatamodule.DataModule1.cmdLocal.Script.Add(strSQL);
   udatamodule.DataModule1.cmdLocal.Execute;
  Except
    on E: Exception do
    ShowMessage('Erro ao executar o comando sql: '+#13+#10 + E.Message );
  end;

end;
end.
