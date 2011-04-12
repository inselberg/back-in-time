{

 last change: 2011-04-11
 fix: time +1



}

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, JvMenus, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdTime, dates, dateutils, ComCtrls, JvExComCtrls, JvStatusBar, JvComponentBase, JvAppStorage,
  JvAppIniStorage;

type
  TForm1 = class(TForm)
    JvMainMenu1: TJvMainMenu;
    miBack: TMenuItem;
    IdTime1: TIdTime;
    miNow: TMenuItem;
    JvStatusBar1: TJvStatusBar;
    JvAppIniFileStorage1: TJvAppIniFileStorage;
    procedure miBackClick(Sender: TObject);
    procedure miNowClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    b: boolean;
    y, m, d: integer;
  public
    { Public declarations }
    dtStart: tdatetime;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function SetSysTime(dt: tdatetime; msg: string = ''): boolean;
var
  TimeStruct: TSystemTime;
begin
  Form1.JvStatusBar1.simpletext := msg + DateTimeToStr(dt);

  TimeStruct.wYear := YearOf(dt);
  TimeStruct.wMonth := MonthOf(dt);
  TimeStruct.wDay := DayOf(dt);

  TimeStruct.wHour := HourOf(dt);
  TimeStruct.wMinute := MinuteOf(dt);
  TimeStruct.wSecond := SecondOf(dt);
  TimeStruct.wMilliSeconds := MilliSecondOf(dt);

  if not SetLocalTime(TimeStruct) then
    RaiselastOSError;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Form1.Caption := Application.Title;
  dtStart := now;

  with JvAppIniFileStorage1 do
  begin
    b := ReadBoolean('Change Date on Start', false);
    y := ReadInteger('Year', 2010);
    m := ReadInteger('Month', 12);
    d := ReadInteger('Day', 1);
    AutoFlush := true;
  end;

  miBack.Caption := 'back';
  miBack.Hint:=inttostr(d)  +'/'+inttostr(m)+'/'+inttostr(y);

  // with JvAppRegistryStorage1 do
  begin
    // WriteString('ScanDir', JvDirectoryEdit1.Directory);
    // WriteInteger('FilterIndex', FilterComboBox1.ItemIndex );
  end;

  // JvAppIniFileStorage1.Flush;

end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  if b then miBackClick(Sender);
end;


procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  with JvAppIniFileStorage1 do
  begin
    WriteBoolean('Change Date on Start', b);
    WriteInteger('Year', y);
    WriteInteger('Month', m);
    WriteInteger('Day', d);
  end;
end;



procedure TForm1.miBackClick(Sender: TObject);
var
  dt: tdatetime;
begin
  dt := now;
  dt := EncodeDateTime(y, m, d, HourOf(dt), MinuteOf(dt), SecondOf(dt), MilliSecondOf(dt));
  SetSysTime(dt);
end;

procedure TForm1.miNowClick(Sender: TObject);
var
  dt: tdatetime;
begin
  Try
    Try
      IdTime1.Host := 'ptbtime1.ptb.de';
      dt := IdTime1.DateTime;
      SetSysTime(dt);
    Except
      SetSysTime(dtStart, 'exception...');
    End;
  Finally
    IdTime1.Disconnect;
  End;
end;

end.
