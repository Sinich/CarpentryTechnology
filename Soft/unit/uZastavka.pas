unit uZastavka;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, IniFiles, StdCtrls, MMSystem;

type
  TfrmZastavka = class(TForm)
  published
    lblPhraseOfLife: TLabel;
    lblAuthor: TLabel;
    Timer1: TTimer;
    imgMyCredo: TImage;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure InitFormSettings;
    procedure InitMyCredoSettings;
    procedure InitPhrases;
    procedure PlaySound1;
    procedure PlaySound2;
  end;

const
  fWidth: Integer = 684;
  fHeight: Integer = 419;
  fClientWidth: Integer = 668;
  fClientHeight: Integer = 381;

resourcestring
  FileSettings = 'SettingsCarTech.ini';
  MyCredoPicture = 'MyIdealMoneyLife.bmp';
  Dir = 'Dir';
  Pictures = 'Pictures';
  Sounds = 'Sounds';
  PhraseOfLife = 'Я работаю - чтобы не работать';
  Author = 'Катунов Юрий';
  sndRaskladka1 = 'Raskladka1.wav';
  sndRaskladka2 = 'Raskladka2.wav';

var
  frmZastavka: TfrmZastavka;

implementation

{$R *.dfm}

procedure TfrmZastavka.PlaySound2;
var
  s: string;
begin
  with TIniFile.Create(ExtractFilePath(Paramstr(0)) + FileSettings) do
  begin
    s:= ReadString(Dir, Sounds, '') + sndRaskladka2;
    sndPlaySound(PAnsiChar(s), SND_NODEFAULT or SND_ASYNC);
  end;
end;

procedure TfrmZastavka.PlaySound1;
var
  s: string;
begin
  with TIniFile.Create(ExtractFilePath(Paramstr(0)) + FileSettings) do
  begin
    s:= ReadString(Dir, Sounds, '') + sndRaskladka1;
    sndPlaySound(PAnsiChar(s), SND_NODEFAULT or SND_ASYNC);
  end;
end;

procedure TfrmZastavka.InitPhrases;
begin
  lblPhraseOfLife.Caption:= PhraseOfLife;
  lblAuthor.Caption:= Author;
end;

procedure TfrmZastavka.InitMyCredoSettings;
begin
  with TIniFile.Create(ExtractFilePath(Paramstr(0)) + FileSettings) do
    try
      with imgMyCredo.Picture.Bitmap do
      LoadFromFile(ReadString(Dir, Pictures, '') + MyCredoPicture);
    finally
      Free;
    end;
end;

procedure TfrmZastavka.InitFormSettings;
begin
  with Self do
  begin
    Width:= fWidth;
    Height:= fHeight;
    ClientWidth:= fClientWidth;
    ClientHeight:= fClientHeight; 
    Position:= poDesktopCenter; //форма по центру
    BorderStyle:= bsNone; // у формы нет рамки
  end; 
end;

procedure TfrmZastavka.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:= false;
  PlaySound2;
end;

procedure TfrmZastavka.FormCreate(Sender: TObject);
begin
  InitFormSettings;
  InitMyCredoSettings;
  InitPhrases;
  PlaySound1;
end;

end.
