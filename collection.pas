unit Collection;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, ComCtrls, CustomDrawnControls, StrUtils, lclintf;

type
  Pieces = (PawnWhite, PawnBlack, RookWhite, RookBlack, KnightWhite, KnightBlack, BishopWhite, BishopBlack, QueenWhite, QueenBlack, KingWhite, KingBlack);
  EssencePiecesArray = array[Pieces] of TImage;

  { TCollectionF }

  TCollectionF = class(TForm)
    Background: TImage;
    InvisibleObjects: TPanel;
    PawnWhite_Classic, PawnWhite_Red, PawnWhite_Blue, PawnWhite_Yellow: TImage;
    PawnBlack_Classic, PawnBlack_Red, PawnBlack_Blue, PawnBlack_Yellow: TImage;
    RookBlack_Classic, RookWhite_Red, RookWhite_Blue, RookWhite_Yellow: TImage;
    RookWhite_Classic, RookBlack_Red, RookBlack_Blue, RookBlack_Yellow: TImage;
    KnightWhite_Classic, KnightWhite_Red, KnightWhite_Blue, KnightWhite_Yellow: TImage;
    KnightBlack_Classic, KnightBlack_Red, KnightBlack_Blue, KnightBlack_Yellow: TImage;
    BishopWhite_Classic, BishopWhite_Red, BishopWhite_Blue, BishopWhite_Yellow: TImage;
    BishopBlack_Classic, BishopBlack_Red, BishopBlack_Blue, BishopBlack_Yellow: TImage;
    QueenWhite_Classic, QueenWhite_Red, QueenWhite_Blue, QueenWhite_Yellow: TImage;
    QueenBlack_Classic, QueenBlack_Red, QueenBlack_Blue, QueenBlack_Yellow: TImage;
    KingBlack_Classic, KingBlack_Red, KingBlack_Blue, KingBlack_Yellow: TImage;
    KingWhite_Classic, KingWhite_Red, KingWhite_Blue, KingWhite_Yellow: TImage;
    SpecialMove, AttackOrMoveUnlimited: TImage;
    PawnPanel, RookPanel, KnightPanel, BishopPanel, QueenPanel, KingPanel: TPanel;
    Pawn, Rook, Knight, Bishop, Queen, King: TImage;
    ChangePlayer: TUpDown;
    PlayerName: TEdit;
    Title, Description, SpecialDescription, Source: TLabel;
    ClassicPanel, RedPanel, BluePanel, YellowPanel: TPanel;
    Classic, Red, Blue, Yellow: TImage;
    ChessBoard: TImage;
    A1, A2, A3, A4, A5, A6, A7: TImage;
    B1, B2, B3, B4, B5, B6, B7: TImage;
    C1, C2, C3, C4, C5, C6, C7: TImage;
    D1, D2, D3, Piece, D5, D6, D7: TImage;
    E1, E2, E3, E4, E5, E6, E7: TImage;
    F1, F2, F3, F4, F5, F6, F7: TImage;
    G1, G2, G3, G4, G5, G6, G7: TImage;
    Move, JumpMove, Attack, AttackOrMove, JumpAttackOrMove, Unlimited: TImage;
    Special: TShape;
    MoveL, JumpMoveL, AttackL, AttackOrMoveL, JumpAttackOrMoveL, UnlimitedL, SpecialL: TLabel;
    GameB, MainMenuB: TCDButton;
    //collection initialization
    procedure FormCreate();
    procedure SetCollectionSettings();
    //button clicks
    procedure GameBClick();
    procedure MainMenuBClick();
    procedure PlayerNameKeyPress(Sender: TObject; var Key: char);
    //hyperlinks
    procedure SourceClick(Sender: TObject);
    //repetitive procedures
    procedure SetPlayerNames();
    //unit links
    procedure ChangePlayerClick(Sender: TObject);
    procedure PiecesClick(Sender: TImage);
    procedure PiecesMouseEnter(Sender: TImage);
    procedure PiecesMouseLeave(Sender: TImage);
    procedure EssencesClick(Sender: TImage);
    procedure EssencesMouseEnter(Sender: TImage);
    procedure EssencesMouseLeave(Sender: TImage);
  private

  public

  end;

var
  CollectionF: TCollectionF;
  SelectedPiece: Timage;
  SelectedPlayer: shortstring='White';
  Player1Name: shortstring='Player1';
  Player2Name: shortstring='Player2';
  PawnWhiteType: shortstring='Classic';
  RookWhiteType: shortstring='Classic';
  KnightWhiteType: shortstring='Classic';
  BishopWhiteType: shortstring='Classic';
  QueenWhiteType: shortstring='Classic';
  KingWhiteType: shortstring='Classic';
  PawnBlackType: shortstring='Classic';
  RookBlackType: shortstring='Classic';
  KnightBlackType: shortstring='Classic';
  BishopBlackType: shortstring='Classic';
  QueenBlackType: shortstring='Classic';
  KingBlackType: shortstring='Classic';
  Board: array[1..48] of TImage;
  ClassicPieces, RedPieces, BluePieces, YellowPieces: EssencePiecesArray;

implementation

uses
  MainMenu, Game, Collection_Players, Collection_Pieces, Collection_Essences, HelpCollection;

{$R *.lfm}

{ TCollectionF }

//COLLECTION INITIALIZATION

procedure TCollectionF.FormCreate();
begin
  SelectedPiece:=Pawn;
  //Board array
  Board[1]:=A1;   Board[2]:=A2;   Board[3]:=A3;   Board[4]:=A4;      Board[5]:=A5;   Board[6]:=A6;   Board[7]:=A7;
  Board[8]:=B1;   Board[9]:=B2;   Board[10]:=B3;  Board[11]:=B4;     Board[12]:=B5;  Board[13]:=B6;  Board[14]:=B7;
  Board[15]:=C1;  Board[16]:=C2;  Board[17]:=C3;  Board[18]:=C4;     Board[19]:=C5;  Board[20]:=C6;  Board[21]:=C7;
  Board[22]:=D1;  Board[23]:=D2;  Board[24]:=D3;                     Board[25]:=D5;  Board[26]:=D6;  Board[27]:=D7;
  Board[28]:=E1;  Board[29]:=E2;  Board[30]:=E3;  Board[31]:=E4;     Board[32]:=E5;  Board[33]:=E6;  Board[34]:=E7;
  Board[35]:=F1;  Board[36]:=F2;  Board[37]:=F3;  Board[38]:=F4;     Board[39]:=F5;  Board[40]:=F6;  Board[41]:=F7;
  Board[42]:=G1;  Board[43]:=G2;  Board[44]:=G3;  Board[45]:=G4;     Board[46]:=G5;  Board[47]:=G6;  Board[48]:=G7;
  //ClassicPieces array
  ClassicPieces[PawnWhite]:=PawnWhite_Classic;      ClassicPieces[PawnBlack]:=PawnBlack_Classic;
  ClassicPieces[RookWhite]:=RookWhite_Classic;      ClassicPieces[RookBlack]:=RookBlack_Classic;
  ClassicPieces[KnightWhite]:=KnightWhite_Classic;  ClassicPieces[KnightBlack]:=KnightBlack_Classic;
  ClassicPieces[BishopWhite]:=BishopWhite_Classic;  ClassicPieces[BishopBlack]:=BishopBlack_Classic;
  ClassicPieces[QueenWhite]:=QueenWhite_Classic;    ClassicPieces[QueenBlack]:=QueenBlack_Classic;
  ClassicPieces[KingWhite]:=KingWhite_Classic;      ClassicPieces[KingBlack]:=KingBlack_Classic;
  //RedPieces array
  RedPieces[PawnWhite]:=PawnWhite_Red;      RedPieces[PawnBlack]:=PawnBlack_Red;
  RedPieces[RookWhite]:=RookWhite_Red;      RedPieces[RookBlack]:=RookBlack_Red;
  RedPieces[KnightWhite]:=KnightWhite_Red;  RedPieces[KnightBlack]:=KnightBlack_Red;
  RedPieces[BishopWhite]:=BishopWhite_Red;  RedPieces[BishopBlack]:=BishopBlack_Red;
  RedPieces[QueenWhite]:=QueenWhite_Red;    RedPieces[QueenBlack]:=QueenBlack_Red;
  RedPieces[KingWhite]:=KingWhite_Red;      RedPieces[KingBlack]:=KingBlack_Red;
  //BluePieces array
  BluePieces[PawnWhite]:=PawnWhite_Blue;      BluePieces[PawnBlack]:=PawnBlack_Blue;
  BluePieces[RookWhite]:=RookWhite_Blue;      BluePieces[RookBlack]:=RookBlack_Blue;
  BluePieces[KnightWhite]:=KnightWhite_Blue;  BluePieces[KnightBlack]:=KnightBlack_Blue;
  BluePieces[BishopWhite]:=BishopWhite_Blue;  BluePieces[BishopBlack]:=BishopBlack_Blue;
  BluePieces[QueenWhite]:=QueenWhite_Blue;    BluePieces[QueenBlack]:=QueenBlack_Blue;
  BluePieces[KingWhite]:=KingWhite_Blue;      BluePieces[KingBlack]:=KingBlack_Blue;
  //YellowPieces array
  YellowPieces[PawnWhite]:=PawnWhite_Yellow;      YellowPieces[PawnBlack]:=PawnBlack_Yellow;
  YellowPieces[RookWhite]:=RookWhite_Yellow;      YellowPieces[RookBlack]:=RookBlack_Yellow;
  YellowPieces[KnightWhite]:=KnightWhite_Yellow;  YellowPieces[KnightBlack]:=KnightBlack_Yellow;
  YellowPieces[BishopWhite]:=BishopWhite_Yellow;  YellowPieces[BishopBlack]:=BishopBlack_Yellow;
  YellowPieces[QueenWhite]:=QueenWhite_Yellow;    YellowPieces[QueenBlack]:=QueenBlack_Yellow;
  YellowPieces[KingWhite]:=KingWhite_Yellow;      YellowPieces[KingBlack]:=KingBlack_Yellow;
  //create chessbard
  HelpCollection.CreateChessBoard(CollectionF.ChessBoard);
  SetCollectionSettings();
end;

procedure TCollectionF.SetCollectionSettings();
begin
  //name
  PlayerName.Text:=Player1Name;
  //pawn
  case PawnWhiteType of
    'Classic': begin
      CollectionF.Pawn.Picture:=ClassicPieces[PawnWhite].Picture;
      EssenceClick(Classic);
    end;
    'Red': begin
      CollectionF.Pawn.Picture:=RedPieces[PawnWhite].Picture;
      EssenceClick(Red);
    end;
    'Blue': begin
      CollectionF.Pawn.Picture:=BluePieces[PawnWhite].Picture;
      EssenceClick(Blue);
    end;
    'Yellow': begin
      CollectionF.Pawn.Picture:=YellowPieces[PawnWhite].Picture;
      EssenceClick(Yellow);
    end;
  end;
  Collection_Pieces.Pawn(CollectionF.Pawn);
  //rook
  case RookWhiteType of
    'Classic': CollectionF.Rook.Picture:=ClassicPieces[RookWhite].Picture;
    'Red': CollectionF.Rook.Picture:=RedPieces[RookWhite].Picture;
    'Blue': CollectionF.Rook.Picture:=BluePieces[RookWhite].Picture;
    'Yellow': CollectionF.Rook.Picture:=YellowPieces[RookWhite].Picture;
  end;
  //knight
  case KnightWhiteType of
    'Classic': CollectionF.Knight.Picture:=ClassicPieces[KnightWhite].Picture;
    'Red': CollectionF.Knight.Picture:=RedPieces[KnightWhite].Picture;
    'Blue': CollectionF.Knight.Picture:=BluePieces[KnightWhite].Picture;
    'Yellow': CollectionF.Knight.Picture:=YellowPieces[KnightWhite].Picture;
  end;
  //bishop
  case BishopWhiteType of
    'Classic': CollectionF.Bishop.Picture:=ClassicPieces[BishopWhite].Picture;
    'Red': CollectionF.Bishop.Picture:=RedPieces[BishopWhite].Picture;
    'Blue': CollectionF.Bishop.Picture:=BluePieces[BishopWhite].Picture;
    'Yellow': CollectionF.Bishop.Picture:=YellowPieces[BishopWhite].Picture;
  end;
  //queen
  case QueenWhiteType of
    'Classic': CollectionF.Queen.Picture:=ClassicPieces[QueenWhite].Picture;
    'Red': CollectionF.Queen.Picture:=RedPieces[QueenWhite].Picture;
    'Blue': CollectionF.Queen.Picture:=BluePieces[QueenWhite].Picture;
    'Yellow': CollectionF.Queen.Picture:=YellowPieces[QueenWhite].Picture;
  end;
  //king
  case KingWhiteType of
    'Classic': CollectionF.King.Picture:=ClassicPieces[KingWhite].Picture;
    'Red': CollectionF.King.Picture:=RedPieces[KingWhite].Picture;
    'Blue': CollectionF.King.Picture:=BluePieces[KingWhite].Picture;
    'Yellow': CollectionF.King.Picture:=YellowPieces[KingWhite].Picture;
  end;
end;

//BUTTON CLICKS

procedure TCollectionF.GameBClick();
begin
  SetPlayerNames();
  GameF.Show;
end;

procedure TCollectionF.MainMenuBClick();
begin
  SetPlayerNames();
  MainMenuF.Show;
end;

procedure TCollectionF.PlayerNameKeyPress(Sender: TObject; var Key: char);
begin
  if Key=' ' then Key:=#0;
end;

//HYPERLINKS

procedure TCollectionF.SourceClick(Sender: TObject);
begin
  if AnsiContainsStr(Source.Caption, 'Modern Chess')=true then OpenURL('http://history.chess.free.fr/european.htm')
  else if AnsiContainsStr(Source.Caption, 'Terachess')=true then OpenURL('http://history.chess.free.fr/terachess.htm')
  else if AnsiContainsStr(Source.Caption, 'Author')=true then OpenURL('https://www.facebook.com/martin.svab.54');
end;

//REPETITIVE PROCEDURES

procedure TCollectionF.SetPlayerNames();
begin
  if SelectedPlayer='White' then begin
    if PlayerName.Text='' then PlayerName.Text:='Player1';
    Player1Name:=PlayerName.Text;
  end
  else begin
    if PlayerName.Text='' then PlayerName.Text:='Player2';
    Player2Name:=PlayerName.Text;
  end;
  GameF.Player1gName.Caption:=Player1Name;
  GameF.Player2gName.Caption:=Player2Name;
end;

//UNIT LINKS

procedure TCollectionF.ChangePlayerClick(Sender: TObject);
begin
  Collection_Players.ChangePlayer();
end;

procedure TCollectionF.PiecesClick(Sender: TImage);
begin
  Collection_Pieces.PieceClick(Sender, false);
end;

procedure TCollectionF.PiecesMouseEnter(Sender: TImage);
begin
  Collection_Pieces.PieceMouseEnter(Sender);
end;

procedure TCollectionF.PiecesMouseLeave(Sender: TImage);
begin
  Collection_Pieces.PieceMouseLeave(Sender);
end;

procedure TCollectionF.EssencesClick(Sender: TImage);
begin
  Collection_Essences.EssenceClick(Sender);
end;

procedure TCollectionF.EssencesMouseEnter(Sender: TImage);
begin
  Collection_Essences.EssenceMouseEnter(Sender);
end;

procedure TCollectionF.EssencesMouseLeave(Sender: TImage);
begin
  Collection_Essences.EssenceMouseLeave(Sender);
end;

end.
