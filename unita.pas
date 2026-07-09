unit unita;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls;

type

  { TFormConversor }

  TFormConversor = class(TForm)
    ButtonArea: TButton;
    ButtonFuerza: TButton;
    ButtonLongitud: TButton;
    ButtonMasa: TButton;
    ButtonTemperatura: TButton;
    ButtonVelocidad: TButton;

    ComboAreaDestino: TComboBox;
    ComboAreaOrigen: TComboBox;
    ComboFuerzaDestino: TComboBox;
    ComboFuerzaOrigen: TComboBox;
    ComboLongitudDestino: TComboBox;
    ComboLongitudOrigen: TComboBox;
    ComboMasaDestino: TComboBox;
    ComboMasaOrigen: TComboBox;
    ComboTemperaturaDestino: TComboBox;
    ComboTemperaturaOrigen: TComboBox;
    ComboVelocidadDestino: TComboBox;
    ComboVelocidadOrigen: TComboBox;

    EditArea: TEdit;
    EditFuerza: TEdit;
    EditLongitud: TEdit;
    EditMasa: TEdit;
    EditTemperatura: TEdit;
    EditVelocidad: TEdit;

    LabelAreaResultado: TLabel;
    LabelFuerzaResultado: TLabel;
    LabelLongitudResultado: TLabel;
    LabelMasaResultado: TLabel;
    LabelTemperaturaResultado: TLabel;
    LabelVelocidadResultado: TLabel;

    LabelAreaTitulo: TLabel;
    LabelFuerzaTitulo: TLabel;
    LabelLongitudTitulo: TLabel;
    LabelMasaTitulo: TLabel;
    LabelTemperaturaTitulo: TLabel;
    LabelVelocidadTitulo: TLabel;

    PageControlNav: TPageControl;
    TabArea: TTabSheet;
    TabFuerza: TTabSheet;
    TabLongitud: TTabSheet;
    TabMasa: TTabSheet;
    TabTemperatura: TTabSheet;
    TabVelocidad: TTabSheet;

    procedure ButtonAreaClick(Sender: TObject);
    procedure ButtonFuerzaClick(Sender: TObject);
    procedure ButtonLongitudClick(Sender: TObject);
    procedure ButtonMasaClick(Sender: TObject);
    procedure ButtonTemperaturaClick(Sender: TObject);
    procedure ButtonVelocidadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    function LeerNumero(Edit: TEdit; out Valor: Double): Boolean;
    function Formatear(Valor: Double): String;

    function ConvertirMasa(Valor: Double; Origen, Destino: Integer): Double;
    function ConvertirFuerza(Valor: Double; Origen, Destino: Integer): Double;
    function ConvertirLongitud(Valor: Double; Origen, Destino: Integer): Double;
    function ConvertirArea(Valor: Double; Origen, Destino: Integer): Double;
    function ConvertirVelocidad(Valor: Double; Origen, Destino: Integer): Double;
    function ConvertirTemperatura(Valor: Double; Origen, Destino: Integer): Double;

  public

  end;

var
  FormConversor: TFormConversor;

implementation

{$R *.lfm}

{ TFormConversor }

procedure TFormConversor.FormCreate(Sender: TObject);
begin
  Caption := 'Conversor de unidades SI';

  ComboMasaOrigen.ItemIndex := 0;
  ComboMasaDestino.ItemIndex := 1;

  ComboFuerzaOrigen.ItemIndex := 0;
  ComboFuerzaDestino.ItemIndex := 1;

  ComboLongitudOrigen.ItemIndex := 0;
  ComboLongitudDestino.ItemIndex := 2;

  ComboAreaOrigen.ItemIndex := 0;
  ComboAreaDestino.ItemIndex := 1;

  ComboTemperaturaOrigen.ItemIndex := 0;
  ComboTemperaturaDestino.ItemIndex := 1;

  ComboVelocidadOrigen.ItemIndex := 0;
  ComboVelocidadDestino.ItemIndex := 1;

  LabelMasaResultado.Caption := 'Resultado:';
  LabelFuerzaResultado.Caption := 'Resultado:';
  LabelLongitudResultado.Caption := 'Resultado:';
  LabelAreaResultado.Caption := 'Resultado:';
  LabelTemperaturaResultado.Caption := 'Resultado:';
  LabelVelocidadResultado.Caption := 'Resultado:';
end;

function TFormConversor.LeerNumero(Edit: TEdit; out Valor: Double): Boolean;
var
  Texto: String;
begin
  Texto := Trim(Edit.Text);

  Texto := StringReplace(Texto, '.', DefaultFormatSettings.DecimalSeparator, [rfReplaceAll]);
  Texto := StringReplace(Texto, ',', DefaultFormatSettings.DecimalSeparator, [rfReplaceAll]);

  Result := TryStrToFloat(Texto, Valor);

  if not Result then
    ShowMessage('Debes ingresar un número válido.');
end;

function TFormConversor.Formatear(Valor: Double): String;
begin
  Result := FormatFloat('0.############', Valor);
end;

function TFormConversor.ConvertirMasa(Valor: Double; Origen, Destino: Integer): Double;
const
  Factores: array[0..3] of Double = (
    1.0,        // kilogramo
    0.001,      // gramo
    0.000001,   // miligramo
    1000.0      // tonelada
  );
begin
  Result := Valor * Factores[Origen] / Factores[Destino];
end;

function TFormConversor.ConvertirFuerza(Valor: Double; Origen, Destino: Integer): Double;
const
  Factores: array[0..3] of Double = (
    1.0,       // newton
    1000.0,    // kilonewton
    0.001,     // milinewton
    9.80665    // kilogramo-fuerza aproximado
  );
begin
  Result := Valor * Factores[Origen] / Factores[Destino];
end;

function TFormConversor.ConvertirLongitud(Valor: Double; Origen, Destino: Integer): Double;
const
  Factores: array[0..4] of Double = (
    1.0,       // metro
    1000.0,    // kilometro
    0.01,      // centimetro
    0.001,     // milimetro
    0.000001   // micrometro
  );
begin
  Result := Valor * Factores[Origen] / Factores[Destino];
end;

function TFormConversor.ConvertirArea(Valor: Double; Origen, Destino: Integer): Double;
const
  Factores: array[0..3] of Double = (
    1.0,        // metro cuadrado
    10000.0,    // hectarea
    0.0001,     // centimetro cuadrado
    0.000001    // milimetro cuadrado
  );
begin
  Result := Valor * Factores[Origen] / Factores[Destino];
end;

function TFormConversor.ConvertirVelocidad(Valor: Double; Origen, Destino: Integer): Double;
const
  Factores: array[0..3] of Double = (
    1.0,             // metro por segundo
    0.2777777778,    // kilometro por hora
    0.01,            // centimetro por segundo
    0.001            // milimetro por segundo
  );
begin
  Result := Valor * Factores[Origen] / Factores[Destino];
end;

function TFormConversor.ConvertirTemperatura(Valor: Double; Origen, Destino: Integer): Double;
var
  Kelvin: Double;
begin
  case Origen of
    0: Kelvin := Valor + 273.15;                 // Celsius a Kelvin
    1: Kelvin := Valor;                          // Kelvin
    2: Kelvin := (Valor - 32) * 5 / 9 + 273.15;  // Fahrenheit a Kelvin
  else
    Kelvin := Valor;
  end;

  case Destino of
    0: Result := Kelvin - 273.15;                // Kelvin a Celsius
    1: Result := Kelvin;                         // Kelvin
    2: Result := (Kelvin - 273.15) * 9 / 5 + 32; // Kelvin a Fahrenheit
  else
    Result := Kelvin;
  end;
end;

procedure TFormConversor.ButtonMasaClick(Sender: TObject);
var
  Valor, Resultado: Double;
begin
  if not LeerNumero(EditMasa, Valor) then Exit;

  Resultado := ConvertirMasa(
    Valor,
    ComboMasaOrigen.ItemIndex,
    ComboMasaDestino.ItemIndex
  );

  LabelMasaResultado.Caption := 'Resultado: ' + Formatear(Resultado);
end;

procedure TFormConversor.ButtonFuerzaClick(Sender: TObject);
var
  Valor, Resultado: Double;
begin
  if not LeerNumero(EditFuerza, Valor) then Exit;

  Resultado := ConvertirFuerza(
    Valor,
    ComboFuerzaOrigen.ItemIndex,
    ComboFuerzaDestino.ItemIndex
  );

  LabelFuerzaResultado.Caption := 'Resultado: ' + Formatear(Resultado);
end;

procedure TFormConversor.ButtonLongitudClick(Sender: TObject);
var
  Valor, Resultado: Double;
begin
  if not LeerNumero(EditLongitud, Valor) then Exit;

  Resultado := ConvertirLongitud(
    Valor,
    ComboLongitudOrigen.ItemIndex,
    ComboLongitudDestino.ItemIndex
  );

  LabelLongitudResultado.Caption := 'Resultado: ' + Formatear(Resultado);
end;

procedure TFormConversor.ButtonAreaClick(Sender: TObject);
var
  Valor, Resultado: Double;
begin
  if not LeerNumero(EditArea, Valor) then Exit;

  Resultado := ConvertirArea(
    Valor,
    ComboAreaOrigen.ItemIndex,
    ComboAreaDestino.ItemIndex
  );

  LabelAreaResultado.Caption := 'Resultado: ' + Formatear(Resultado);
end;

procedure TFormConversor.ButtonTemperaturaClick(Sender: TObject);
var
  Valor, Resultado: Double;
begin
  if not LeerNumero(EditTemperatura, Valor) then Exit;

  Resultado := ConvertirTemperatura(
    Valor,
    ComboTemperaturaOrigen.ItemIndex,
    ComboTemperaturaDestino.ItemIndex
  );

  LabelTemperaturaResultado.Caption := 'Resultado: ' + Formatear(Resultado);
end;

procedure TFormConversor.ButtonVelocidadClick(Sender: TObject);
var
  Valor, Resultado: Double;
begin
  if not LeerNumero(EditVelocidad, Valor) then Exit;

  Resultado := ConvertirVelocidad(
    Valor,
    ComboVelocidadOrigen.ItemIndex,
    ComboVelocidadDestino.ItemIndex
  );

  LabelVelocidadResultado.Caption := 'Resultado: ' + Formatear(Resultado);
end;

end.
