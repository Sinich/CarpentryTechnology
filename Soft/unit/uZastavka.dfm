object frmZastavka: TfrmZastavka
  Left = 256
  Top = 221
  BorderStyle = bsNone
  Caption = 'Zastavka'
  ClientHeight = 381
  ClientWidth = 668
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object imgMyCredo: TImage
    Left = 8
    Top = 72
    Width = 649
    Height = 233
  end
  object lblPhraseOfLife: TLabel
    Left = 120
    Top = 24
    Width = 8
    Height = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -29
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblAuthor: TLabel
    Left = 568
    Top = 344
    Width = 3
    Height = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Timer1: TTimer
    Interval = 3000
    OnTimer = Timer1Timer
    Left = 8
    Top = 8
  end
end
