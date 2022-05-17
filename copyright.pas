unit Copyright;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Arrow, StdCtrls;

type

  { TCopyrightF }

  TCopyrightF = class(TForm)
    TopPanel, ImagePage: TPanel;
    Images, Soundtrack: TToggleBox;
    ArrowLeft, ArrowRight: TArrow;
    CopyrightDisclaimerA, CopyrightDisclaimerB: TLabel;
    Copyright1A, Copyright2A, Copyright3A, Copyright4A, Copyright5A, Copyright6A: TLabel;
    Copyright1B, Copyright2B, Copyright3B, Copyright4B, Copyright5B, Copyright6B: TLabel;
    //disable movement
    procedure DisableMovement(Sender: TObject);
    //button clicks
    procedure SoundtrackClick();
    procedure ImagesClick();
    //arrow clicks
    procedure ArrowLeftClick();
    procedure ArrowRightClick();
    //pages
    procedure Page1();
    procedure Page2();
    procedure Page3();
    procedure Page4();
  private

  public

  end;

var
  CopyrightF: TCopyrightF;
  ImagePg: byte=1;

implementation

uses
  MainMenu;

{$R *.lfm}

{ TCopyrightF }

//DISABLE MOVEMENT

procedure TCopyrightF.DisableMovement(Sender: TObject);
begin
  //this event is called each time this form is activated and moved
  CopyrightF.Left:=MainMenuF.GameB.Left;
  CopyrightF.Top:=MainMenuF.GameB.Top;
end;

//BUTTON CLICKS

procedure TCopyrightF.SoundtrackClick();
begin
  ArrowLeft.Visible:=False;
  ArrowRight.Visible:=False;
  ImagePage.Visible:=False;
  if SoundTrack.Checked=True then begin
    Images.State:=cbUnchecked;
    Copyright1A.Caption:='Misconception by Myuuji';
    Copyright2A.Caption:='Prey Reprise by Myuuji';
    Copyright3A.Caption:='Round That Corner by Myuuji';
    Copyright4A.Caption:='Scent of Night by Myuuji';
    Copyright5A.Caption:='The Forsaken by Myuuji';
    Copyright6A.Caption:='';
    Copyright1B.Caption:='';
    Copyright2B.Caption:='';
    Copyright3B.Caption:='=> thedarkpiano.com';
    Copyright4B.Caption:='';
    Copyright5B.Caption:='';
    Copyright6B.Caption:='';
  end
  else SoundTrack.State:=cbChecked;
end;

procedure TCopyrightF.ImagesClick();
begin
  ArrowLeft.Visible:=True;
  ArrowRight.Visible:=True;
  ImagePage.Visible:=True;
  if Images.Checked=True then begin
    SoundTrack.State:=cbUnchecked;
    case ImagePg of
      1: Page1();
      2: Page2();
      3: Page3();
    end;
  end
  else Images.State:=cbChecked;
end;

//ARROW CLICKS

procedure TCopyrightF.ArrowLeftClick();
begin
  case ImagePg of
    1: Page4();
    2: Page1();
    3: Page2();
    4: Page3();
  end;
end;

procedure TCopyrightF.ArrowRightClick();
begin
  case ImagePg of
    1: Page2();
    2: Page3();
    3: Page4();
    4: Page1();
  end;
end;

//PAGES

procedure TCopyrightF.Page1();
begin
  ImagePg:=1;
  ImagePage.Caption:='Pieces';
  Copyright1A.Caption:='Pawn';
  Copyright2A.Caption:='Rook';
  Copyright3A.Caption:='Knight';
  Copyright4A.Caption:='Bishop';
  Copyright5A.Caption:='Queen';
  Copyright6A.Caption:='King';
  Copyright1B.Caption:='=> iconexperience.com/.../chess_piece_pawn.png';
  Copyright2B.Caption:='=> iconexperience.com/.../chess_piece_rook.png';
  Copyright3B.Caption:='=> iconexperience.com/.../chess_piece_knight.png';
  Copyright4B.Caption:='=> iconexperience.com/.../chess_piece_bishop.png';
  Copyright5B.Caption:='=> iconexperience.com/.../chess_piece_queen.png';
  Copyright6B.Caption:='=> iconexperience.com/.../chess_piece_king.png';
end;

procedure TCopyrightF.Page2();
begin
  ImagePg:=2;
  ImagePage.Caption:='Movement';
  Copyright1A.Caption:='Footsteps';
  Copyright2A.Caption:='Horseshoe';
  Copyright3A.Caption:='Shield';
  Copyright4A.Caption:='Sword';
  Copyright5A.Caption:='Infinite';
  Copyright6A.Caption:='';
  Copyright1B.Caption:='=> iconexperience.com/.../step.png';
  Copyright2B.Caption:='=> cdn1.iconfinder.com/.../Horseshoes-512.png';
  Copyright3B.Caption:='=> png.icons8.com/.../shield.png';
  Copyright4B.Caption:='=> cdn2.iconfinder.com/.../sword-blade-knight-classic-512.png';
  Copyright5B.Caption:='=> cdn3.iconfinder.com/.../unlimited-256.png';
  Copyright6B.Caption:='';
end;

procedure TCopyrightF.Page3();
begin
  ImagePg:=3;
  ImagePage.Caption:='Essences';
  Copyright1A.Caption:='Empty Orb';
  Copyright2A.Caption:='Red Orb';
  Copyright3A.Caption:='Blue Orb';
  Copyright4A.Caption:='Yellow Orb';
  Copyright5A.Caption:='';
  Copyright6A.Caption:='';
  Copyright1B.Caption:='=> aerialroboticscompetition.org/.../orb_transparent.png';
  Copyright2B.Caption:='=> it is an edited version of the blue orb';
  Copyright3B.Caption:='=> orig00.deviantart.net/.../blue_orb_by_littlecupofcocoa-d8884qp.png';
  Copyright4B.Caption:='=> it is an edited version of the blue orb';
  Copyright5B.Caption:='';
  Copyright6B.Caption:='';
end;

procedure TCopyrightF.Page4();
begin
  ImagePg:=4;
  ImagePage.Caption:='Extras';
  Copyright1A.Caption:='Background';
  Copyright2A.Caption:='Logo';
  Copyright3A.Caption:='Help';
  Copyright4A.Caption:='';
  Copyright5A.Caption:='';
  Copyright6A.Caption:='';
  Copyright1B.Caption:='=> wallpapercanyon.com/.../Wood-Wallpaper-20.jpg';
  Copyright2B.Caption:='=> oaksnow.com/.../prava.png';
  Copyright3B.Caption:='=> cdn4.iconfinder.com/.../Help-2-512.png';
  Copyright4B.Caption:='';
  Copyright5B.Caption:='';
  Copyright6B.Caption:='';
end;

end.
