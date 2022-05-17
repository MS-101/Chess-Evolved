unit Help;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { THelpF }

  THelpF = class(TForm)
    Move, JumpMove, Attack, AttackOrMove, JumpAttackOrMove: TImage;
    Attributes, Attribute1, Attribute2: TLabel;
    MoveL, JumpAttackOrMoveL, JumpMoveL, AttackL, AttackOrMoveL: TLabel;
    Title: TLabel;
    ChessBoard: TImage;
    A1, A2, A3, A4, A5, A6, A7: TImage;
    B1, B2, B3, B4, B5, B6, B7: TImage;
    C1, C2, C3, C4, C5, C6, C7: TImage;
    D1, D2, D3, Piece, D5, D6, D7: TImage;
    E1, E2, E3, E4, E5, E6, E7: TImage;
    F1, F2, F3, F4, F5, F6, F7: TImage;
    G1, G2, G3, G4, G5, G6, G7: TImage;
    Unlimited: TImage;
    Special: TShape;
    UnlimitedL, SpecialL: TLabel;
    //disable movement
    procedure DisableMovement(Sender: TObject);
    //help initialization
    procedure FormCreate(Sender: TObject);
    //generic
    procedure HelpClick(Sender: TImage);
    //pieces
    procedure Pawn(Sender: TImage);
    procedure Rook(Sender: TImage);
    procedure Knight(Sender: TImage);
    procedure Bishop(Sender: TImage);
    procedure Queen(Sender: TImage);
    procedure King(Sender: TImage);
  private

  public

  end;

var
  HelpF: THelpF;
  hBoard: array[1..48] of TImage;

implementation

uses
  Game, Collection, HelpCollection;

{$R *.lfm}

{ THelpF }

//DISABLE MOVEMENT

procedure THelpF.DisableMovement(Sender: TObject);
begin
  //this event is called each time this form is activated and moved
  HelpF.Left:=GameF.Chessboard.Left;
  HelpF.Top:=GameF.ChessBOard.Top-25;
end;

//HELP INITIALIZATION

procedure THelpF.FormCreate(Sender: TObject);
begin
  //Board array
  hBoard[1]:=A1;   hBoard[2]:=A2;   hBoard[3]:=A3;   hBoard[4]:=A4;      hBoard[5]:=A5;   hBoard[6]:=A6;   hBoard[7]:=A7;
  hBoard[8]:=B1;   hBoard[9]:=B2;   hBoard[10]:=B3;  hBoard[11]:=B4;     hBoard[12]:=B5;  hBoard[13]:=B6;  hBoard[14]:=B7;
  hBoard[15]:=C1;  hBoard[16]:=C2;  hBoard[17]:=C3;  hBoard[18]:=C4;     hBoard[19]:=C5;  hBoard[20]:=C6;  hBoard[21]:=C7;
  hBoard[22]:=D1;  hBoard[23]:=D2;  hBoard[24]:=D3;                      hBoard[25]:=D5;  hBoard[26]:=D6;  hBoard[27]:=D7;
  hBoard[28]:=E1;  hBoard[29]:=E2;  hBoard[30]:=E3;  hBoard[31]:=E4;     hBoard[32]:=E5;  hBoard[33]:=E6;  hBoard[34]:=E7;
  hBoard[35]:=F1;  hBoard[36]:=F2;  hBoard[37]:=F3;  hBoard[38]:=F4;     hBoard[39]:=F5;  hBoard[40]:=F6;  hBoard[41]:=F7;
  hBoard[42]:=G1;  hBoard[43]:=G2;  hBoard[44]:=G3;  hBoard[45]:=G4;     hBoard[46]:=G5;  hBoard[47]:=G6;  hBoard[48]:=G7;
  //create chessboard
  HelpCollection.CreateChessBoard(HelpF.ChessBoard);
end;

//GENERIC

procedure THelpF.HelpClick(Sender: TImage);
var
  i: byte;
begin
  HelpF.Show;
  Attribute1.Visible:=false;
  Attribute2.Visible:=false;
  for i:=1 to 48 do hBoard[i].Picture:=nil;
  case Sender.Hint of
    'Pawn': Pawn(Sender);
    'Rook': Rook(Sender);
    'Knight': Knight(Sender);
    'Bishop': Bishop(Sender);
    'Queen': Queen(Sender);
    'King': King(Sender);
  end;
end;

//PIECES

procedure THelpF.Pawn(Sender: TImage);
begin
  Attribute1.Visible:=true;
  Attribute1.Caption:='Promotable';
  Attribute1.Hint:='Upon reaching the end of the board it can be promoted to any other piece except king.';
  Attribute2.Visible:=true;
  Attribute2.Caption:='EnPassant';
  Attribute2.Hint:='When using the first double move it can be also captured as if it moved 1 square by enemy pawns.';
  if Sender=GameF.PawnWhiteHelp then Piece.Picture:=GameF.PawnWhiteCounter.Picture
  else if Sender=GameF.PawnBlackHelp then Piece.Picture:=GameF.PawnBlackCounter.Picture;
  //classic pawn
  if (Sender=GameF.PawnWhiteHelp) and (PawnWhiteType='Classic') then begin
    Title.Caption:='Classic Pawn (White)';
    HelpCollection.PawnWhiteClassic(HelpF);
  end
  else if (Sender=GameF.PawnBlackHelp) and (PawnBlackType='Classic') then begin
    Title.Caption:='Classic Pawn (Black)';
    HelpCollection.PawnBlackClassic(HelpF);
  end
  //red pawn
  else if (Sender=GameF.PawnWhiteHelp) and (PawnWhiteType='Red') then begin
    Title.Caption:='Red Pawn (White)';
    HelpCollection.PawnWhiteRed(HelpF);
    Attribute2.Visible:=false;
  end
  else if (Sender=GameF.PawnBlackHelp) and (PawnBlackType='Red') then begin
    Title.Caption:='Red Pawn (Black)';
    HelpCollection.PawnBlackRed(HelpF);
    Attribute2.Visible:=false;
  end
  //blue pawn
  else if (Sender=GameF.PawnWhiteHelp) and (PawnWhiteType='Blue') then begin
    Title.Caption:='Blue Pawn (White)';
    HelpCollection.PawnWhiteBlue(HelpF);
  end
  else if (Sender=GameF.PawnBlackHelp) and (PawnBlackType='Blue') then begin
    Title.Caption:='Blue Pawn (Black)';
    HelpCollection.PawnBlackBlue(HelpF);
  end
  //yellow pawn
  else if Sender=GameF.PawnWhiteHelp then begin
    Title.Caption:='Yelllow Pawn (White)';
    HelpCollection.PawnWhiteYellow(HelpF);
  end
  else begin
    Title.Caption:='Yelllow Pawn (Black)';
    HelpCollection.PawnBlackYellow(HelpF);
  end
end;

procedure THelpF.Rook(Sender: TImage);
begin
  if Sender=GameF.RookWhiteHelp then Piece.Picture:=GameF.RookWhiteCounter.Picture
  else if Sender=GameF.RookBlackHelp then Piece.Picture:=GameF.RookBlackCounter.Picture;
  //classic rook
  if ((Sender=GameF.RookWhiteHelp) and (RookWhiteType='Classic')) or ((Sender=GameF.RookBlackHelp) and (RookBlackType='Classic')) then begin
    Title.Caption:='Classic Rook';
    HelpCollection.RookClassic(HelpF);
  end
  //red rook
  else if ((Sender=GameF.RookWhiteHelp) and (RookWhiteType='Red')) or ((Sender=GameF.RookBlackHelp) and (RookBlackType='Red')) then begin
    Title.Caption:='Red Rook';
    HelpCollection.RookRed(HelpF);
    Attribute1.Visible:=true;
    Attribute1.Caption:='Agile';
    Attribute1.Hint:='Can jump over allied pieces';
  end
  //blue rook
  else if ((Sender=GameF.RookWhiteHelp) and (RookWhiteType='Blue')) or ((Sender=GameF.RookBlackHelp) and (RookBlackType='Blue')) then begin
    Title.Caption:='Blue Rook';
    HelpCollection.RookBlue(HelpF);
  end
  //yellow rook
  else begin
    Title.Caption:='Yellow Rook';
    HelpCollection.RookYellow(HelpF);
  end;
end;

procedure THelpF.Knight(Sender: TImage);
begin
  if Sender=GameF.KnightWhiteHelp then Piece.Picture:=GameF.KnightWhiteCounter.Picture
  else if Sender=GameF.KnightBlackHelp then Piece.Picture:=GameF.KnightBlackCounter.Picture;
  //classic knight
  if ((Sender=GameF.KnightWhiteHelp) and (KnightWhiteType='Classic')) or ((Sender=GameF.KnightBlackHelp) and (KnightBlackType='Classic')) then begin
    Title.Caption:='Classic Knight';
    HelpCollection.KnightClassic(HelpF);
  end
  //red knight
  else if ((Sender=GameF.KnightWhiteHelp) and (KnightWhiteType='Red')) or ((Sender=GameF.KnightBlackHelp) and (KnightBlackType='Red')) then begin
    Title.Caption:='Red Knight';
    HelpCollection.KnightRed(HelpF);
  end
  //blue knight
  else if ((Sender=GameF.KnightWhiteHelp) and (KnightWhiteType='Blue')) or ((Sender=GameF.KnightBlackHelp) and (KnightBlackType='Blue')) then begin
    Title.Caption:='Blue Knight';
    HelpCollection.KnightBlue(HelpF);
  end
  //yellow knight
  else begin
    Title.Caption:='Yellow Knight';
    HelpCollection.KnightYellow(HelpF);
  end;
end;

procedure THelpF.Bishop(Sender: TImage);
begin
  if Sender=GameF.BishopWhiteHelp then Piece.Picture:=GameF.BishopWhiteCounter.Picture
  else if Sender=GameF.BishopBlackHelp then Piece.Picture:=GameF.BishopBlackCounter.Picture;
  //classic bishop
  if ((Sender=GameF.BishopWhiteHelp) and (BishopWhiteType='Classic')) or ((Sender=GameF.BishopBlackHelp) and (BishopBlackType='Classic')) then begin
    Title.Caption:='Classic Bishop';
    HelpCollection.BishopClassic(HelpF);
  end
  //red bishop
  else if ((Sender=GameF.BishopWhiteHelp) and (BishopWhiteType='Red')) or ((Sender=GameF.BishopBlackHelp) and (BishopBlackType='Red')) then begin
    Title.Caption:='Red Bishop';
    HelpCollection.BishopRed(HelpF);
    Attribute1.Visible:=true;
    Attribute1.Caption:='Agile';
    Attribute1.Hint:='Can jump over allied pieces';
  end
  //blue bishop
  else if ((Sender=GameF.BishopWhiteHelp) and (BishopWhiteType='Blue')) or ((Sender=GameF.BishopBlackHelp) and (BishopBlackType='Blue')) then begin
    Title.Caption:='Blue Bishop';
    HelpCollection.BishopBlue(HelpF);
  end
  //yellow bishop
  else begin
    Title.Caption:='Yellow Bishop';
    HelpCollection.BishopYellow(HelpF);
  end;
end;

procedure THelpF.Queen(Sender: TImage);
begin
  if Sender=GameF.QueenWhiteHelp then Piece.Picture:=GameF.QueenWhiteCounter.Picture
  else if Sender=GameF.QueenBlackHelp then Piece.Picture:=GameF.QueenBlackCounter.Picture;
  //classic queen
  if ((Sender=GameF.QueenWhiteHelp) and (QueenWhiteType='Classic')) or ((Sender=GameF.QueenBlackHelp) and (QueenBlackType='Classic')) then begin
    Title.Caption:='Clasic Queen';
    HelpCollection.QueenClassic(HelpF);
  end
  //red queen
  else if ((Sender=GameF.QueenWhiteHelp) and (QueenWhiteType='Red')) or ((Sender=GameF.QueenBlackHelp) and (QueenBlackType='Red')) then begin
    Title.Caption:='Red Queen';
    HelpCollection.QueenRed(HelpF);
    Attribute1.Visible:=true;
    Attribute1.Caption:='Agile';
    Attribute1.Hint:='Can jump over allied pieces';
  end
  //blue queen
  else if ((Sender=GameF.QueenWhiteHelp) and (QueenWhiteType='Blue')) or ((Sender=GameF.QueenBlackHelp) and (QueenBlackType='Blue')) then begin
    Title.Caption:='Blue Queen';
    HelpCollection.QueenBlue(HelpF);
    Attribute1.Visible:=true;
    Attribute1.Caption:='Heir';
    Attribute1.Hint:='Can replace king upon his death.';
  end
  //yellow queen
  else begin
    Title.Caption:='Yellow Queen';
    HelpCollection.QueenYellow(HelpF);
  end;
end;

procedure THelpF.King(Sender: TImage);
begin
  if Sender=GameF.KingWhiteHelp then Piece.Picture:=GameF.Player1Portrait.Picture
  else if Sender=GameF.KingBlackHelp then Piece.Picture:=GameF.Player2Portrait.Picture;
  //classic king
  if ((Sender=GameF.KingWhiteHelp) and (KingWhiteType='Classic')) or ((Sender=GameF.KingBlackHelp) and (KingBlackType='Classic')) then begin
    Title.Caption:='Clasic King';
    HelpCollection.KingClassic(HelpF);
    Attribute1.Visible:=true;
    Attribute1.Caption:='Leader';
    Attribute1.Hint:='If you lose the king you lose the game.';
  end
  //red king
  else if ((Sender=GameF.KingWhiteHelp) and (KingWhiteType='Red')) or ((Sender=GameF.KingBlackHelp) and (KingBlackType='Red')) then begin
    Title.Caption:='Red King';
    HelpCollection.KingRed(HelpF);
    Attribute1.Visible:=true;
    Attribute1.Caption:='Leader';
    Attribute1.Hint:='If you lose the king you lose the game.';
  end
  //blue king
  else if ((Sender=GameF.KingWhiteHelp) and (KingWhiteType='Blue')) or ((Sender=GameF.KingBlackHelp) and (KingBlackType='Blue')) then begin
    Title.Caption:='Blue King';
    HelpCollection.KingBlue(HelpF);
    Attribute1.Visible:=true;
    Attribute1.Caption:='Leader';
    Attribute1.Hint:='If you lose the king you lose the game.';
  end
  //yellow king
  else begin
    Title.Caption:='Yellow King';
    HelpCollection.KingYellow(HelpF);
    Attribute1.Visible:=true;
    Attribute1.Caption:='Leader';
    Attribute1.Hint:='If you lose the king you lose the game.';
  end;
end;

end.

