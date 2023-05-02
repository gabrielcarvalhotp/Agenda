unit Agenda.Model.Interfaces.Conexao;


interface
uses
  Data.DB, 
  FireDAC.Comp.Client;
  
  type
  iModelConexaoConnection = interface
    ['{9229AB60-BBA2-4EAD-B246-686E261B04BC}']
    function Connection: TFDCustomConnection;
    function Conectar: iModelConexaoConnection;
  end;
  
  iModelConexaoParametros = interface
    ['{43CC3944-6085-49B4-9342-50E82E27A427}']
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
    function Schema(aValue : string) : iModelConexaoParametros; overload;
    function Schema: string; overload;
    function Locking(aValue : string): iModelConexaoParametros; overload;
    function Locking: string;overload;
    function Save : iModelConexaoParametros;
  end;

  iModelConexaoFactory = interface
    ['{797EF090-9F0C-455E-A54B-4F99B6DC89CA}']
    function Connection : iModelConexaoConnection;
    function Parametros : iModelConexaoParametros;
  end;

implementation

end.
