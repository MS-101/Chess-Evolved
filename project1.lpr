program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, MainMenu, Game, Collection, Copyright, Game_Positions, Game_Pieces,
  Game_Movement, Collection_Players, Collection_Pieces, Collection_Essences,
  Collection_GameChanges, CustomObjects, Help, HelpCollection
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TMainMenuF, MainMenuF);
  Application.CreateForm(TGameF, GameF);
  Application.CreateForm(TCollectionF, CollectionF);
  Application.CreateForm(TCopyrightF, CopyrightF);
  Application.CreateForm(THelpF, HelpF);
  Application.Run;
end.

