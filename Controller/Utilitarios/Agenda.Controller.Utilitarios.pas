unit Agenda.Controller.Utilitarios;

interface

uses
  Agenda.Controller.Utilitarios.Interfaces, Vcl.Forms, Vcl.StdCtrls, FireDAC.Comp.Client, 
  Agenda.Model.Interfaces.Conexao ;

type
  TControllerUtilitarios = class(TInterfacedObject,
    iControllerUtilitariosFormularios)
  private
    { private }
    [weak]
    FSender : TForm; 
    FDQuery: TFDQuery;
    FConnection : iModelConexaoConnection;
  public
    { public }
    constructor Create(Sender : TForm);
    class function New(Sender : TForm): iControllerUtilitariosFormularios;
    destructor Destroy; override;
    function PesquisaEmpresa(aValue: TComboBox) : iControllerUtilitariosFormularios;
    function PesquisaSetor(aValue: TComboBox) : iControllerUtilitariosFormularios;
  end;

implementation

uses
  Agenda.Model.Conexao.Connection,
  Agenda.Model.Conexao.Parametros;

constructor TControllerUtilitarios.Create(Sender : TForm);
begin
  FDQuery := TFDQuery.Create(nil);
  FConnection := TModelConexaoConnection.New(TModelConexaoParametros.New).Conectar;
  FDQuery.Connection := FConnection.Connection;
  FSender := Sender;
end;

destructor TControllerUtilitarios.Destroy;
begin
  FDQuery.DisposeOf;
  inherited;
end;

class function TControllerUtilitarios.New(Sender : TForm): iControllerUtilitariosFormularios;
begin
  result := self.Create(Sender);
end;

function TControllerUtilitarios.PesquisaEmpresa(aValue: TComboBox) : iControllerUtilitariosFormularios;
begin
  result := self;
  FDQuery.Close;
  FDQuery.SQL.Text := ' SELECT DISTINCT TB_AGENDA.EMPRESA FROM TB_AGENDA ';
  FDQuery.Open;
  FDQuery.First;
  aValue.Items.Clear;
  aValue.Items.Add('');
  while not FDQuery.eof do
  begin
    aValue.AddItem(FDQuery.FieldByName('EMPRESA').AsString, FSender);
    FDQuery.Next;
  end;
  FDQuery.Close;
end;

function TControllerUtilitarios.PesquisaSetor(aValue: TComboBox) : iControllerUtilitariosFormularios;
begin
  result := self;
  FDQuery.Close;
  FDQuery.SQL.Text := ' SELECT DISTINCT TB_AGENDA.SETOR FROM TB_AGENDA ';
  FDQuery.Open;
  FDQuery.First;
  aValue.Items.Clear;
  aValue.Items.Add('');
  while not FDQuery.eof do
  begin
    aValue.AddItem(FDQuery.FieldByName('SETOR').AsString, FSender);
    FDQuery.Next;
  end;
  FDQuery.Close;
end;

end.
