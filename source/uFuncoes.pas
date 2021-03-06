unit uFuncoes;

interface

uses
   SysUtils,  Forms,  SUIDlg, Controls, Dialogs, variants;



 procedure myMsg(strMensagem:string;strTitulo:string='Aviso' ;intIcone:integer=0);
 function myConfirm(strMensagem:string; strTitulo:string='Aviso' ;intIcone:integer=0; strBtn1:string='Sim';strBtn2:string='N�o'):boolean;
 procedure executarSQL(strSQL:string);
 function aspas(str:string):string;
 function campoPreenchido(vlrConteudo:Variant; strMensagem:string='Este campo � de preenchimento obrigat�rio'):boolean;
 function login:boolean;
 function retornarCampo(strTabela,strCampo,strWhere,strOrderByFields:string):string;

var
  usuario_nome   :string;
  usuario_id     :string;
  usuario_logado :boolean;
  usuario_admin  :string;
  usuario_ativo  :string;
implementation

uses uFrmAbertura,udatamodule;


function retornarCampo(strTabela,strCampo,strWhere,strOrderByFields:string):string;
var
 strSQL:String;
begin
 strSQL:='SELECT '+strCampo+' FROM '+strTabela+' '+strWHERE+' ORDER BY '+strOrderByFields;
 with datamodule1.qryLocal_Retorno do begin
   close;
   sql.clear;
   sql.add(strSQL);
   open;
   result:=trimright(trimleft( Fields[0].AsString ));
   close;
 end;
end;


function campoPreenchido(vlrConteudo:Variant; strMensagem:string='Este campo � de preenchimento obrigat�rio'):boolean;
var
 status:boolean;
 basicType  : Integer;

begin
  status:=true;
basicType := VarType(vlrConteudo) and VarTypeMask;

  // Set a string to match the type
  case basicType of
    varInteger   :
     begin
        status:=vlrConteudo>0;
     end;

    varDouble    :
      begin
        status:=vlrConteudo>0;
      end;

    varString    :
      begin
        status:=trimright(trimleft(vlrConteudo))<>'';
      end;

  end;

  if status=false then
   begin
    myMsg( strMensagem,'Aten��o Erro', 3);
   end;

  result:=status;
end;


function aspas(str:string):string;
begin
   result:=#39+ trimright(trimleft( str )) +#39;
end;

procedure myMsg(strMensagem:string;strTitulo:string='Aviso' ;intIcone:integer=0);
var
 myDLG:TsuiMessageDialog;
begin
 myDLG:= TsuiMessageDialog.create(Application);
 myDLG.Caption:=strTitulo;
 myDLG.Text:=strMensagem;

 case intIcone of
    0 : myDLG.IconType := suiHelp;
    1 : myDLG.IconType := suiInformation;
    2 : myDLG.IconType := suiStop;
    3 : myDLG.IconType := suiWarning;
    4 : myDLG.IconType := suiNone;
 end;


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


function login:boolean;
var
 myDLGPassword:TsuiPasswordDialog;
 status:boolean;
 nome_digitado,senha_digitada,id_gravado,strWhere:string;
 tentativas:integer;
begin
 myDLGPassword:= TsuiPasswordDialog.create(Application);
 myDLGPassword.Item1Caption:='Nome:';
 myDLGPassword.Item2Caption:='Senha:';
 myDLGPassword.UIStyle:=FrmAbertura.suiForm1.UIStyle;

 tentativas:=0;

 usuario_nome:='';
 usuario_id  :='';
 usuario_logado:=false;
 usuario_admin:='';
 usuario_ativo:='';
 status:=false;



 while tentativas<3  do
  begin
   tentativas:=tentativas+1;
    myDLGPassword.Caption:='ZFCALC [ Login ]';

   if myDLGPassword.ShowModal=mrOk then
    begin
     nome_digitado :=trimright(trimleft(uppercase(myDLGPassword.Item1Text)));
     senha_digitada:=trimright(trimleft(uppercase(myDLGPassword.Item2Text)));
     strWhere:=' WHERE nome='+aspas( nome_digitado )+' AND senha='+aspas( senha_digitada ) ;
     id_gravado:= retornarCampo( 'zf_usuarios', 'id', strWhere, 'nome');
     if (id_gravado<>'') then
      begin
       usuario_nome  :=nome_digitado;
       usuario_id    :=id_gravado;
       //o usu�rio est� ativo?
       usuario_ativo:=retornarCampo( 'zf_usuarios', 'ativo_sn', strWhere, 'nome');
       if (usuario_ativo<>'S') then
        begin
           myMsg( 'Acesso NEGADO!'+#13+#10+#13+#10+#13+#10+nome_digitado+' est� DESABILITADO(A) no sistema!'+#13+#10+#13+#10+#13+#10+#13+#10+'Solicite acesso ao administrador...','Aviso',2);
           break;
        end
       else
        begin
          usuario_admin:=retornarCampo( 'zf_usuarios', 'administrador_sn', strWhere, 'nome');
          usuario_logado:=true;
          status:=true;
          break;
        end;
      end
     else
      begin
        if ( nome_digitado='') or (senha_digitada='')  then
          myMsg( 'Informe o nome e a senha!'+#13+#10+'(Tentativa '+inttostr(tentativas)+'/3)','Aviso',2)
         else
          myMsg( 'Usu�rio ou Senha Incorretas '+#13+#10+'(Tentativa '+inttostr(tentativas)+'/3)','Aviso',2)
         ;
      end;
    end
   else
    begin
      break;
    end;
 end;

 FreeAndNil(myDLGPassword);

 result:=status;

end;



initialization
  usuario_nome:='';
  usuario_id  :='';
  usuario_admin:='';
  usuario_ativo:='';
  usuario_logado:=false;

end.
