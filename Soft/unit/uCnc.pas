unit uCnc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs, ExtCtrls, IniFiles, StdCtrls;

type
  TCnc = class(TObject)
  private
    Move: Boolean;
    X0, Y0: Integer;
    imgComputer: TImage;
    procedure InitComputer;

    procedure Click(Sender: TObject);
    procedure MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  public
    constructor Create;
    destructor Destroy;  override;
  end;

resourcestring
  FileSettings = 'SettingsCarTech.ini';
  CompBlue = 'CompWork.bmp';
  Dir = 'Dir';
  Pictures = 'Pictures';
  Computer = 'Computer';
  ComputerLeft = 'Left';
  ComputerTop = 'Top';

var
  Cnc: TCnc;

implementation

uses
  Main;

procedure TCnc.InitComputer;
begin
  imgComputer:= TImage.Create(MainForm);
  with TIniFile.Create(ExtractFilePath(Paramstr(0)) + FileSettings) do
    try
      with imgComputer.Picture.Bitmap do
      LoadFromFile(ReadString(Dir, Pictures, '') + CompBlue);
    finally
      Free;
    end;
   with imgComputer do
   begin
     Transparent:= True;
     OnClick:= Click;
     OnMouseDown:= MouseDown;
     OnMouseMove:= MouseMove;
     OnMouseUp:= MouseUp;
     Parent:= MainForm;
  end;
end;

constructor TCnc.Create;
begin
  InitComputer;
end;

destructor TCnc.Destroy;
begin
  FreeAndNil(imgComputer);
  inherited Destroy;
end;

procedure TCnc.Click(Sender: TObject);
begin
  
end;

procedure TCnc.MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button <> mbRight then
    Move:= False
  else
  begin
    Move:= True;
    X0:= x;
    Y0:= y;
  end;
  if Button=mbMiddle then
    ShowMessage('Нажата средняя кнопка мыши');
  if Button=mbLeft then
    ShowMessage('Нажата левая кнопка мыши');
    if Button=mbRight then
    ShowMessage('Нажата правая кнопка мыши');
end;

procedure TCnc.MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if Move then
  begin
    with imgComputer do
    begin
      Left:= imgComputer.Left + x - X0;
      Top:= imgComputer.Top + y - Y0;
    end;
  end;
end;

procedure TCnc.MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Move:= False;
  with TIniFile.Create(ExtractFilePath(Paramstr(0)) + FileSettings) do
  try
    WriteInteger(Computer, ComputerLeft, imgComputer.Left);
    WriteInteger(Computer, ComputerTop, imgComputer.Top);
  finally
    Free;
  end;
end;

end.
