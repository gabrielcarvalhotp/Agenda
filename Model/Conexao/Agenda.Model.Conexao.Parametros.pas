unit Agenda.Model.Conexao.Parametros;

interface

uses
  LocalCache4D, 
  Agenda.Model.Interfaces.Conexao;

type
  TModelConexaoParametros = class(TInterfacedObject, iModelConexaoParametros)
  private
    { private }
  public
    { public }
    constructor Create;
    destructor Destroy; override;
    class function New: iModelConexaoParametros;
    function DataBase(aValue: string): iModelConexaoParametros; overload;
    function DataBase: string; overload;
    function UserName(aValue: string): iModelConexaoParametros; overload;
    function UserName: string; overload;
    function Password(aValue: string): iModelConexaoParametros; overload;
    function Password: string; overload;
    function DriverId(aValue: string): iModelConexaoParametros; overload;
    function DriverId: string; overload;
    function Server(aValue: string): iModelConexaoParametros; overload;
    function Server: string; overload;
    function Porta(aValue: string): iModelConexaoParametros; overload;
    function Porta: string; overload;
    function Schema(aValue: string): iModelConexaoParametros; overload;
    function Schema: string; overload;
    function Locking(aValue: string): iModelConexaoParametros; overload;
    function Locking: string; overload;
    function Save: iModelConexaoParametros;
  end;

implementation

{ TModelConexaoParametros }
uses
  System.SysUtils;

constructor TModelConexaoParametros.Create;
begin
  if not FileExists('Agenda.lc4') then
  begin
    LocalCache
      .SaveToStorage('Agenda.lc4');
      
    LocalCache
      .Instance('Parametros')
      .SetItem('Database','C:\bancos\bancotestes.fdb')
      .SetItem('Username','SYSDBA')
      .SetItem('Password','masterkey')
      .SetItem('Driverid','FB')
      .SetItem('Server','local')
      .SetItem('Porta','3050')
      .SetItem('Schema','')
      .SetItem('Locking','')
      .SaveToStorage('Agenda.lc4')
  end;
  LocalCache.LoadDatabase('Agenda.lc4');
end;

function TModelConexaoParametros.DataBase(aValue: string): iModelConexaoParametros;
begin
  result := self;
  LocalCache.Instance('Parametros').SetItem('Database', aValue);
end;

function TModelConexaoParametros.DataBase: string;
begin
  result := LocalCache.Instance('Parametros').GetItem('Database');
end;

destructor TModelConexaoParametros.Destroy;
begin
  inherited;
end;

function TModelConexaoParametros.DriverId(aValue: string)
  : iModelConexaoParametros;
begin
  result := self;
  LocalCache.Instance('Parametros').SetItem('Driverid', aValue)
end;

function TModelConexaoParametros.DriverId: string;
begin
  result := LocalCache.Instance('Parametros').GetItem('Driverid')
end;

function TModelConexaoParametros.Locking: string;
begin
  result := LocalCache.Instance('Parametros').GetItem('Locking');
end;

function TModelConexaoParametros.Locking(aValue: string)
  : iModelConexaoParametros;
begin
  result := self;
  LocalCache.Instance('Parametros').SetItem('Locking', aValue)
end;

class function TModelConexaoParametros.New: iModelConexaoParametros;
begin
  result := self.Create;
end;

function TModelConexaoParametros.Password(aValue: string)
  : iModelConexaoParametros;
begin
  result := self;
  LocalCache.Instance('Parametros').SetItem('Password', aValue)
end;

function TModelConexaoParametros.Password: string;
begin
  result := LocalCache.Instance('Parametros').GetItem('Password')
end;

function TModelConexaoParametros.Porta(aValue: string): iModelConexaoParametros;
begin
  result := self;
  LocalCache.Instance('Parametros').SetItem('Porta', aValue)
end;

function TModelConexaoParametros.Porta: string;
begin
  result := LocalCache.Instance('Parametros').GetItem('Porta')
end;

function TModelConexaoParametros.Save: iModelConexaoParametros;
begin
  result := self;
  LocalCache.SaveToStorage('Agenda.lc4');
end;

function TModelConexaoParametros.Schema: string;
begin
  result := LocalCache.Instance('Parametros').GetItem('Schema')
end;

function TModelConexaoParametros.Schema(aValue: string)
  : iModelConexaoParametros;
begin
  result := self;
  LocalCache.Instance('Parametros').SetItem('Schema', aValue)
end;

function TModelConexaoParametros.Server(aValue: string)
  : iModelConexaoParametros;
begin
  result := self;
  LocalCache.Instance('Parametros').SetItem('Server', aValue)
end;

function TModelConexaoParametros.Server: string;
begin
  result := LocalCache.Instance('Parametros').GetItem('Server')
end;

function TModelConexaoParametros.UserName: string;
begin
  result := LocalCache.Instance('Parametros').GetItem('Username')
end;

function TModelConexaoParametros.UserName(aValue: string)
  : iModelConexaoParametros;
begin
  result := self;
  LocalCache.Instance('Parametros').SetItem('Username', aValue)
end;

end.
