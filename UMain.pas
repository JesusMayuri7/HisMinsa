unit UMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, IPPeerClient,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,  json,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, System.Rtti,
  FMX.Grid.Style, FMX.Grid, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait,
  FireDAC.DApt;

type
  TForm2 = class(TForm)
    ToolBar1: TToolBar;
    Panel1: TPanel;
    RESTResponse1: TRESTResponse;
    RESTRequest1: TRESTRequest;
    RESTClient1: TRESTClient;
    Button1: TButton;
    Grid1: TGrid;
    FDConnection1: TFDConnection;
    fdlote: TFDQuery;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Grid1GetValue(Sender: TObject; const ACol, ARow: Integer;
      var Value: TValue);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }

    procedure llenarLote();
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.Button1Click(Sender: TObject);

var
  LJSONObject: tjsonarray;
  Column: TColumn;
begin
  Column := TColumn.Create(Self);
  Column.Parent := Grid1;
   Column := TColumn.Create(Self);
  Column.Parent := Grid1;
     Column := TColumn.Create(Self);
  Column.Parent := Grid1;
     Column := TColumn.Create(Self);
  Column.Parent := Grid1;
     Column := TColumn.Create(Self);
  Column.Parent := Grid1;
     Column := TColumn.Create(Self);
  Column.Parent := Grid1;
     Column := TColumn.Create(Self);
  Column.Parent := Grid1;

  Restrequest1.Execute;
  LJSONObject := nil;
  try
    { convert String to JSON }
  //  DataArray := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(restresponse1.Content), 0) as TJsonarray;
    { output the JSON to console as String }



    //memo1.Lines.Add(LJSONObject.ToString);
  finally
    LJSONObject.Free;
  end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
LlenarLote();
end;

procedure TForm2.Grid1GetValue(Sender: TObject; const ACol, ARow: Integer;
  var Value: TValue);
  var aux:string;
  var ItemArray:TJsonArray;
 var  JsonValue: TJSONValue;
begin   {
if ACol = 0 then
  begin
    itemArray:= TJsonArray.Create;
    itemArray:= DataArray.Items[Arow] as TjsonArray;
    Value := TValue.From<String>(itemArray.Items[5].ToString);
  end;

if ACol = 1 then
  begin
    itemArray:= TJsonArray.Create;
    itemArray:= DataArray.Items[Arow] as TjsonArray;
    Value := TValue.From<String>(itemArray.Items[6].Value);
  end;

if ACol = 2 then
  begin
    itemArray:= TJsonArray.Create;
    itemArray:= DataArray.Items[Arow] as TjsonArray;
    Value := TValue.From<String>(itemArray.Items[7].Value);
  end;

  if ACol = 3 then
  begin
    itemArray:= TJsonArray.Create;
    itemArray:= DataArray.Items[Arow] as TjsonArray;
    Value := TValue.From<String>(itemArray.Items[8].Value);
  end;

  if ACol = 4 then
  begin
     itemArray:= TJsonArray.Create;
    itemArray:= DataArray.Items[Arow] as TjsonArray;
    Value := TValue.From<String>(itemArray.Items[9].Value);
  end;
{
    for i:=0 to SaldoArray.Size-1  do
          begin
            aux:=TJSONObject.Create;
            aux:=Saldoarray.Items[i] as TJSONObject;
             fdstock.Close;
             fdstock.ParamByName('saldo').AsString:=(aux as TJSONObject).GetValue('Saldo').Value;
             fdstock.ParamByName('idstock').AsString:=(aux as TJSONObject).GetValue('IdStock').Value;
             fdstock.ExecSQL();
          end;
 }

end;

procedure TForm2.llenarLote;
var DataArray:Tjsonarray;
var I:Integer;
begin

  Restrequest1.Execute;
 DataArray:= Tjsonarray.Create;
  try
    { convert String to JSON }
    DataArray := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(restresponse1.Content), 0) as TJsonarray;
    for i:=0 to DataArray.Size-1  do
    begin
        fdlote.Close;
        fdlote.ParamByName('nombres').AsString:=(DataArray.Items[I] as TjsonArray).Items[5].ToString;
        fdlote.ParamByName('servicio').AsString:=(DataArray.Items[I] as TjsonArray).Items[6].ToString;
        fdlote.ExecSQL;


    end;




    //memo1.Lines.Add(LJSONObject.ToString);
  finally
   Dataarray.Free;
  end;

end;

end.
