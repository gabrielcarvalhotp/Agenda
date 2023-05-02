unit Agenda.Model.Conexao.Connection;

interface

uses
  Data.DB,
  Firedac.Comp.Client,
  Firedac.Phys.FB,
  Firedac.Comp.UI,
  Firedac.Stan.Intf,
  Firedac.Stan.Option,
  Firedac.Stan.Error,
  Firedac.UI.Intf,
  Firedac.Phys.Intf,
  Firedac.Stan.Def,
  Firedac.Stan.Pool,
  Firedac.Stan.Async,
  Firedac.Phys,
  Firedac.Phys.FBDef,
  Firedac.VCLUI.Wait,
  Firedac.Phys.IBBase,
  Firedac.DApt,
  System.Classes, Agenda.Model.Interfaces.Conexao;

type
  TModelConexaoConnection = class(TInterfacedObject, iModelConexaoConnection)
  private
    { private }
    [weak]
    FParametros: iModelConexaoParametros;
    FConnection: TFDConnection;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
  public
    { public }
    constructor Create(aParametros : iModelConexaoParametros);
    destructor Destroy; override;
    class function New(aParametros : iModelConexaoParametros) : iModelConexaoConnection;
    function Connection: TFDCustomConnection;
    function Conectar: iModelConexaoConnection;
  end;

implementation

uses
  System.SysUtils;

{ TModelConexaoConnection }

function TModelConexaoConnection.Conectar: iModelConexaoConnection;
begin
  result := self;
  try
    FConnection.Params.DriverID := FParametros.DriverId;
    FConnection.Params.Database := FParametros.Database;
    FConnection.Params.UserName := FParametros.UserName;
    FConnection.Params.Password := FParametros.Password;
    FConnection.Params.Add('Server=' + FParametros.Server);
    FConnection.Params.Add('Port=' + FParametros.Porta);
    
    if not FParametros.Schema.IsEmpty then
    begin  
      FConnection.Params.Add('MetaCurSchema=' + FParametros.Schema);
      FConnection.Params.Add('MetaDefSchema=' + FParametros.Schema);
    end;
    
    if not FParametros.Locking.IsEmpty then
      FConnection.Params.Add('LockingMode=' +  FParametros.Locking);
       
    FConnection.LoginPrompt := false;
    FConnection.Connected := True;
  except
    on E:Exception do
      raise Exception.Create('Não foi possivel concluir a conexao com ' + #13 + 
                             FParametros.Database + #13 + 
                             E.Message);  
  end;
end;

function TModelConexaoConnection.connection: TFDCustomConnection;
begin
  result := FConnection;
end;

constructor TModelConexaoConnection.Create(aParametros : iModelConexaoParametros);
begin
  FParametros := aParametros;
  FConnection := TFDConnection.Create(nil);
  FDPhysFBDriverLink := TFDPhysFBDriverLink.Create(nil);
  FDGUIxWaitCursor := TFDGUIxWaitCursor.Create(nil);
end;

destructor TModelConexaoConnection.Destroy;
begin
  inherited;
  FConnection.DisposeOf;
  FDPhysFBDriverLink.DisposeOf;
  FDGUIxWaitCursor.DisposeOf;
end;

class function TModelConexaoConnection.New (aParametros : iModelConexaoParametros) : iModelConexaoConnection;
begin
  result := self.Create(aParametros);
end;

end.
