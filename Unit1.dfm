object Form1: TForm1
  Left = 0
  Top = 0
  ClientHeight = 147
  ClientWidth = 323
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = JvMainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  ShowHint = True
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object JvStatusBar1: TJvStatusBar
    Left = 0
    Top = 128
    Width = 323
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object JvMainMenu1: TJvMainMenu
    ImageMargin.Left = 0
    ImageMargin.Top = 0
    ImageMargin.Right = 0
    ImageMargin.Bottom = 0
    ImageSize.Height = 0
    ImageSize.Width = 0
    Left = 16
    Top = 8
    object miBack: TMenuItem
      Caption = '01.12.2010'
      OnClick = miBackClick
    end
    object miNow: TMenuItem
      Caption = 'now'
      OnClick = miNowClick
    end
  end
  object IdTime1: TIdTime
    BaseDate = 2.000000000000000000
    Left = 48
    Top = 8
  end
  object JvAppIniFileStorage1: TJvAppIniFileStorage
    StorageOptions.BooleanStringTrueValues = 'TRUE, YES, Y'
    StorageOptions.BooleanStringFalseValues = 'FALSE, NO, N'
    AutoFlush = True
    AutoReload = True
    FileName = 'settings.ini'
    DefaultSection = 'Settings'
    SubStorages = <>
    Left = 96
    Top = 8
  end
end
