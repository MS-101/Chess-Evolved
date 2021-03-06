unit MainMenu;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Buttons, CustomDrawnControls, CustomDrawn_Common, MMSystem, Crt;

type

  PlayerSettings = record
    playerName: shortstring;
    pawnType, rookType, knightType, bishopType, queenType, kingType: shortstring;
  end;

  { TMainMenuF }

  TMainMenuF = class(TForm)
    CollectionB: TCDButton;
    CopyrightB: TCDButton;
    GameB: TCDButton;
    Background, GameLogo: TImage;
    GameTitle1, GameTitle2: TLabel;
    MusicTimer: TTimer;
    QuitB: TCDButton;
    //main menu initialization
    procedure FormCreate();
    //settings
    procedure CreateSettings();
    procedure LoadSettings();
    //button clicks
    procedure GameBClick();
    procedure CollectionBClick();
    procedure CopyrightBClick();
    procedure QuitBClick();
    //timers
    procedure MusicTimerTimer();
    //repetitive procedures
    procedure PlayMusic();
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  MainMenuF: TMainMenuF;
  PreviousSong, Delay, RandomSong: integer;
  Timer: integer=0;

implementation

uses
  Game, Copyright, Collection;

{$R *.lfm}

{ TMainMenuF }

//MAIN MENU INITIALIZATION

procedure TMainMenuF.FormCreate();
begin
  //CreateSettings();
  LoadSettings();
  randomize;
  RandomSong:=Random(5)+1;
  PlayMusic();
end;

//SETTINGS

procedure TMainMenuF.CreateSettings();
var
  Settings: file of PlayerSettings;
  newPlayerSettings: PlayerSettings;
begin
  assignFile(Settings,'Settings.txt');
  rewrite(Settings);
  newPlayerSettings.pawnType:='Classic';
  newPlayerSettings.rookType:='Classic';
  newPlayerSettings.knightType:='Classic';
  newPlayerSettings.bishopType:='Classic';
  newPlayerSettings.queenType:='Classic';
  newPlayerSettings.kingType:='Classic';
  newPlayerSettings.playerName:='Player1';
  write(Settings, newPlayerSettings);
  newPlayerSettings.playerName:='Player2';
  write(Settings, newPlayerSettings);
  closeFile(Settings);
end;

procedure TMainMenuF.LoadSettings();
var
  Settings: file of PlayerSettings;
  Player1, Player2: PlayerSettings;
begin
  //read settings
  assignFile(Settings,'Settings.txt');
  reset(Settings);
  read(Settings, Player1);
  read(Settings, Player2);
  closeFile(Settings);
  //white player settings
  Player1Name:=Player1.playerName;
  PawnWhiteType:=Player1.pawnType;
  RookWhiteType:=Player1.rookType;
  KnightWhiteType:=Player1.knightType;
  BishopWhiteType:=Player1.bishopType;
  QueenWhiteType:=Player1.queenType;
  KingWhiteType:=Player1.kingType;
  //black player settings
  Player2Name:=Player2.playerName;
  PawnBlackType:=Player2.pawnType;
  RookBlackType:=Player2.rookType;
  KnightBlackType:=Player2.knightType;
  BishopBlackType:=Player2.bishopType;
  QueenBlackType:=Player2.queenType;
  KingBlackType:=Player2.kingType;
end;

//BUTTON CLICKS

procedure TMainMenuF.GameBClick();
begin
  GameF.Show;
end;

procedure TMainMenuF.CollectionBClick();
begin
  CollectionF.Show;
end;

procedure TMainMenuF.CopyrightBClick();
begin
  CopyrightF.Show;
end;

procedure TMainMenuF.QuitBClick();
var
  Settings: file of PlayerSettings;
  Player1, Player2: PlayerSettings;
begin
  //white player settings
  Player1.playerName:=Player1Name;
  Player1.pawnType:=PawnWhiteType;
  Player1.rookType:=RookWhiteType;
  Player1.knightType:=KnightWhiteType;
  Player1.bishopType:=BishopWhiteType;
  Player1.queenType:=QueenWhiteType;
  Player1.kingType:=KingWhiteType;
  //black player settings
  Player2.playerName:=Player2Name;
  Player2.pawnType:=PawnBlackType;
  Player2.rookType:=RookBlackType;
  Player2.knightType:=KnightBlackType;
  Player2.bishopType:=BishopBlackType;
  Player2.queenType:=QueenBlackType;
  Player2.kingType:=KingBlackType;
  //rewrite settings
  assignFile(Settings,'Settings.txt');
  rewrite(Settings);
  write(Settings, Player1);
  write(Settings, Player2);
  closeFile(Settings);
  //close app
  Application.terminate;
end;

//TIMERS

procedure TMainMenuF.MusicTimerTimer();
begin
  Inc(Timer);
  if Delay=Timer then begin
    randomize;
    repeat
      RandomSong:=Random(5)+1;
    until RandomSong<>PreviousSong;
    PlayMusic();
  end;
end;

//REPETITIVE PROCEDURES

procedure TMainMenuF.PlayMusic();
begin
  case RandomSong of
    1: begin
      sndPlaySound('Soundtracks\Misconception.wav', SND_ASYNC);
      Delay:=165;
      PreviousSong:=1;
      Timer:=0;
    end;
    2: begin
      sndPlaySound('Soundtracks\Prey Reprise.wav', SND_ASYNC);
      Delay:=137;
      PreviousSong:=2;
      Timer:=0;
    end;
    3: begin
      sndPlaySound('Soundtracks\Round That Corner.wav', SND_ASYNC);
      Delay:=194;
      PreviousSong:=3;
      Timer:=0;
    end;
    4: begin
      sndPlaySound('Soundtracks\Scent of Night.wav', SND_ASYNC);
      Delay:=204;
      PreviousSong:=4;
      Timer:=0;
    end;
    5: begin
      sndPlaySound('Soundtracks\The Forsaken.wav', SND_ASYNC);
      Delay:=150;
      PreviousSong:=5;
      Timer:=0;
    end;
  end;
end;

end.
