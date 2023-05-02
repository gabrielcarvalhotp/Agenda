unit Agenda.Controller.Dto.Agenda;

interface

uses
  Agenda.Controller.Dto.Interfaces,
  Agenda.Model.Services.Interfaces,
  Agenda.Model.Entidades.Agenda, Vcl.Forms;

type
  TControllerDtoAgenda = class(TInterfacedObject, iControllerDtoAgenda)
  private
    { private }
    FEntidade: TTB_Agenda;
    FService: iService<TTB_Agenda>;
  public
    { public }
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerDtoAgenda;
    function Cod_Agenda(aValue: string): iControllerDtoAgenda; overload;
    function Empresa(aValue: string): iControllerDtoAgenda; overload;
    function Setor(aValue: string): iControllerDtoAgenda; overload;
    function Nome(aValue: string): iControllerDtoAgenda; overload;
    function Funcao(aValue: string): iControllerDtoAgenda; overload;
    function Ramal(aValue: string): iControllerDtoAgenda; overload;
    function Celular_Empresa(aValue: string): iControllerDtoAgenda; overload;
    function Celular_Pessoal(aValue: string): iControllerDtoAgenda; overload;
    function Email1(aValue: string): iControllerDtoAgenda; overload;
    function Email2(aValue: string): iControllerDtoAgenda; overload;
    function Cod_Agenda: integer; overload;
    function Empresa: string; overload;
    function Setor: string; overload;
    function Nome: string; overload;
    function Funcao: string; overload;
    function Ramal: string; overload;
    function Celular_Empresa: string; overload;
    function Celular_Pessoal: string; overload;
    function Email1: string; overload;
    function Email2: string; overload;
    function Build: iService<TTB_Agenda>;
    function PreencherEntidade(Sender : TForm): iControllerDtoAgenda;
    function PesquisaPersonalizada(aEmpresa, aSetor, aNome: string) : iControllerDtoAgenda;
  end;
  

implementation

uses
  Agenda.Model.Services, System.SysUtils, Agenda.Controller.Rtti.Utilitarios;

{ TControllerDtoAgenda }

function TControllerDtoAgenda.Build: iService<TTB_Agenda>;
begin
  result := FService;
end;

function TControllerDtoAgenda.Celular_Empresa(aValue: string)
  : iControllerDtoAgenda;
begin
  result := self;
  FEntidade.Celular_Empresa := aValue;
end;

function TControllerDtoAgenda.Celular_Empresa: string;
begin
  result := FEntidade.Celular_Empresa;
end;

function TControllerDtoAgenda.Celular_Pessoal: string;
begin
  result := FEntidade.Celular_Pessoal;
end;

function TControllerDtoAgenda.Celular_Pessoal(aValue: string): iControllerDtoAgenda;
begin
  result := self;
  FEntidade.Celular_Pessoal := aValue;
end;

function TControllerDtoAgenda.Cod_Agenda(aValue: string): iControllerDtoAgenda;
begin
  result := self;
  FEntidade.Cod_Agenda := StrToInt(aValue);
end;

function TControllerDtoAgenda.Cod_Agenda: integer;
begin
  result := FEntidade.Cod_Agenda;
end;

constructor TControllerDtoAgenda.Create;
begin
  FEntidade := TTB_Agenda.Create;
  FService := TModelServicesSimpleORM<TTB_Agenda>.New(FEntidade);
end;

destructor TControllerDtoAgenda.Destroy;
begin
  inherited;
  FEntidade.DisposeOf;
end;

function TControllerDtoAgenda.Email1(aValue: string): iControllerDtoAgenda;
begin
  result := self;
  FEntidade.Email1 := aValue;
end;

function TControllerDtoAgenda.Email1: string;
begin
  result := FEntidade.Email1;
end;

function TControllerDtoAgenda.Email2(aValue: string): iControllerDtoAgenda;
begin
  result := self;
  FEntidade.Email2 := aValue;
end;

function TControllerDtoAgenda.Email2: string;
begin
  result := FEntidade.Email2;
end;

function TControllerDtoAgenda.Empresa(aValue: string): iControllerDtoAgenda;
begin
  result := self;
  FEntidade.Empresa := aValue;
end;

function TControllerDtoAgenda.Empresa: string;
begin
  result := FEntidade.Empresa;
end;

function TControllerDtoAgenda.Funcao(aValue: string): iControllerDtoAgenda;
begin
  result := self;
  FEntidade.Funcao := aValue;
end;

function TControllerDtoAgenda.Funcao: string;
begin
  result := FEntidade.Funcao;
end;

class function TControllerDtoAgenda.New: iControllerDtoAgenda;
begin
  result := self.Create;
end;

function TControllerDtoAgenda.Nome(aValue: string): iControllerDtoAgenda;
begin
  result := self;
  FEntidade.Nome := aValue;
end;

function TControllerDtoAgenda.Nome: string;
begin
  result := FEntidade.Nome;
end;

function TControllerDtoAgenda.PesquisaPersonalizada(aEmpresa, aSetor, aNome: string): iControllerDtoAgenda;
begin
  FService.DataSet.Open('SELECT * FROM TB_AGENDA ' + 
                        ' WHERE TB_AGENDA.EMPRESA LIKE ''%'+ aEmpresa +'%'' '+
                        ' AND TB_AGENDA.SETOR LIKE ''%'+ aSetor +'%'' AND UPPER(TB_AGENDA.NOME) LIKE UPPER(''%'+aNome+'%'')'); 
end;

function TControllerDtoAgenda.PreencherEntidade(Sender : TForm): iControllerDtoAgenda;
begin
  result := self;
  TRttiUtilsEntity<TControllerDtoAgenda>.FormToEntity(Sender, TControllerDtoAgenda(self));
end;

function TControllerDtoAgenda.Ramal: string;
begin
  result := FEntidade.Ramal;
end;

function TControllerDtoAgenda.Ramal(aValue: string): iControllerDtoAgenda;
begin
  result := self;
  FEntidade.Ramal := aValue;
end;

function TControllerDtoAgenda.Setor: string;
begin
  result := FEntidade.Setor;
end;

function TControllerDtoAgenda.Setor(aValue: string): iControllerDtoAgenda;
begin
  result := self;
  FEntidade.Setor := aValue;
end;

end.
