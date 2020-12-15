unit uCnc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs, ExtCtrls, IniFiles, StdCtrls, uRadminScript;

type
  TFieldCnc = record
    IP: string;
    Port: string;
    Login: string;
    Password: string;
  end;

  TCnc = class(TObject)
  private
    Move: Boolean;
    X0, Y0: Integer;
    imgComputer: TImage;
    lblNumberComputer: TLabel;
    
    FieldCnc: TFieldCnc;
    Radmin: TRadmin;

    procedure InitComputer;
    procedure InitNumberComputer(Number: Integer);
    procedure SaveCoordinataComputer;
    procedure LoadCoordinataComputer;
    procedure ResizeNumberComputer;
    procedure InitRadmin(IP, Port, Login, Password: string);

    procedure MouseClickRight;
    procedure MouseClickLeft(x, y: Integer);
    procedure MouseClickMidle;

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
  CompWork = 'CompWork.bmp';
  Dir = 'Dir';
  Pictures = 'Pictures';
  Computer = 'Computer';
  ComputerLeft = 'Left';
  ComputerTop = 'Top';
  ShriftNumberComputer = 'Arial';
  
var
  Cnc: TCnc;

implementation

uses
  Main;

procedure TCnc.InitRadmin(IP, Port, Login, Password: string);
begin
  //Radmin:= TRadmin.Create();

end;

procedure TCnc.ResizeNumberComputer;
begin
  with lblNumberComputer do
  begin
    Left:= imgComputer.Left - 30;
    Width:= imgComputer.Width;
    Top:= imgComputer.Top + imgComputer.Height - 55;
  end;
end;

procedure TCnc.InitNumberComputer(Number: Integer);
begin
  lblNumberComputer:= TLabel.Create(MainForm);
  with lblNumberComputer do
  begin
    with Font do
    begin
      Name:= ShriftNumberComputer;
      Style:= [fsBold];
      Color:= clBlack;
      Pitch:= fpDefault;
      Height:= 12;
      Size:= 12;
    end;
    AutoSize:= False;
    Caption:= IntToStr(Number);
    Alignment:= taCenter;
    Transparent:= True;
    Parent:= MainForm;
  end;
  ResizeNumberComputer;
end;

procedure TCnc.LoadCoordinataComputer;
begin
  with TIniFile.Create(ExtractFilePath(Paramstr(0)) + FileSettings) do
  try
    with imgComputer do
    begin
      Left:= ReadInteger(Computer, ComputerLeft, 10);
      Top:= ReadInteger(Computer, ComputerTop, 10);
    end;
  finally
    Free;
  end;
end;

procedure TCnc.SaveCoordinataComputer;
begin
  with TIniFile.Create(ExtractFilePath(Paramstr(0)) + FileSettings) do
  try
    WriteInteger(Computer, ComputerLeft, imgComputer.Left);
    WriteInteger(Computer, ComputerTop, imgComputer.Top);
  finally
    Free;
  end;
end;

procedure TCnc.InitComputer;
begin
  imgComputer:= TImage.Create(MainForm);
  with TIniFile.Create(ExtractFilePath(Paramstr(0)) + FileSettings) do
    try
      with imgComputer.Picture.Bitmap do
      LoadFromFile(ReadString(Dir, Pictures, '') + CompWork);
    finally
      Free;
    end;
   with imgComputer do
   begin
     Transparent:= True;
     OnMouseDown:= MouseDown;
     OnMouseMove:= MouseMove;
     OnMouseUp:= MouseUp;
     Parent:= MainForm;
  end;
  LoadCoordinataComputer;
end;

constructor TCnc.Create;
begin
  InitComputer;
  InitNumberComputer(1);
end;

destructor TCnc.Destroy;
begin
  FreeAndNil(imgComputer);
  inherited Destroy;
end;

procedure TCnc.MouseClickRight;
begin
  Move:= False;
  ShowMessage('Правая мышь');
end;

procedure TCnc.MouseClickLeft(x, y: Integer);
begin
  Move:= True;
  X0:= x;
  Y0:= y;
end;

procedure TCnc.MouseClickMidle;
begin
  Move:= False;
  ShowMessage('Центральная мышь');
end;


procedure TCnc.MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case Button of
    mbRight:   MouseClickRight;
    mbLeft:    MouseClickLeft(x, y);
    mbMiddle:  MouseClickMidle;
  end;
end;

procedure TCnc.MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if Move then
  begin
    with imgComputer do
    begin
      Left:= Left + x - X0;
      Top:= Top + y - Y0;
    end;
    ResizeNumberComputer;
  end;
end;

procedure TCnc.MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Move:= False;
  SaveCoordinataComputer;
  ResizeNumberComputer;
end;

end.
