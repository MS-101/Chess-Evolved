unit Collection_Pieces;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ExtCtrls, Graphics, Forms;

//generic
procedure PieceClick(Sender: TImage; SentByEssenceOrPlayerChange: boolean);
procedure PieceMouseEnter(Sender: TImage);
procedure PieceMouseLeave(Sender: TImage);
//pieces
procedure Pawn(Sender: TObject);
procedure Rook(Sender: TObject);
procedure Knight(Sender: TObject);
procedure Bishop(Sender: TObject);
procedure Queen(Sender: TObject);
procedure King(Sender: TObject);
//essence selection
procedure SelectClassic();
procedure SelectRed();
procedure SelectBlue();
procedure SelectYellow();
//clearance
procedure PiecePanelsClear();

implementation

uses
  Collection, Collection_Essences, HelpCollection;

//GENERIC

procedure PieceClick(Sender: TImage; SentByEssenceOrPlayerChange: boolean);
var
  i: byte;
begin
  //it only does something when it's not selected or was sent by essence or playerchange
  if (Sender.Hint<>'Selected') or (SentByEssenceOrPlayerChange=true) then begin
    //generic changes
    PiecePanelsClear();
    Collection_Essences.EssencePanelsClear();
    SelectedPiece:=Sender;
    Sender.Hint:='Selected';
    CollectionF.Piece.Picture:=Sender.Picture;
    for i:=1 to 48 do Board[i].Picture:=nil;
    //specific changes
    case Sender.Name of
      'Pawn': Pawn(Sender);
      'Rook': Rook(Sender);
      'Knight': Knight(Sender);
      'Bishop': Bishop(Sender);
      'Queen': Queen(Sender);
      'King': King(Sender);
    end;
  end;
end;

procedure PieceMouseEnter(Sender: TImage);
begin
  if Sender.Parent.Color=$0071B8FF then Sender.Parent.Color:=$00006FDD;
end;

procedure PieceMouseLeave(Sender: TImage);
begin
  if Sender.Parent.Color=$00006FDD then Sender.Parent.Color:=$0071B8FF;
end;

//PIECES

procedure Pawn(Sender: TObject);
begin
  if Sender=CollectionF.Pawn then begin
    CollectionF.Title.Caption:='Pawn [1 point]';
    CollectionF.PawnPanel.Color:=$00004080;
  end;
  //classic pawn
  if ((SelectedPlayer='White') and (PawnWhiteType='Classic')) or ((SelectedPlayer='Black') and (PawnBlackType='Classic')) then begin
    CollectionF.Description.Caption:='Can move 1 square forward.'+#13+'Can attack pieces one square diagonally forward.';
    CollectionF.SpecialDescription.Caption:='On the 1st move it can move 2 squares forward.'+#13+'(can be captured by enemy pawns as if it moved by 1 or 2 squares)'+#13+'Once it reaches the end of the board it can be promoted to any other piece'+#13+'except the king.';
    CollectionF.Source.Caption:='Source: Modern Chess';
    case SelectedPlayer of
      'White': HelpCollection.PawnWhiteClassic(CollectionF);
      'Black': HelpCollection.PawnBlackClassic(CollectionF);
    end;
    SelectClassic();
  end
  //red pawn
  else if ((SelectedPlayer='White') and (PawnWhiteType='Red')) or ((SelectedPlayer='Black') and (PawnBlackType='Red')) then begin
    CollectionF.Description.Caption:='Can move 1 or 2 squares forward.'+#13+'Can move or attack pieces one square diagonally forward.';
    CollectionF.SpecialDescription.Caption:='Once it reaches the end of the board it can be promoted to any other piece'+#13+'except the king.';
    CollectionF.Source.Caption:='Source: Author of this game';
    case SelectedPlayer of
      'White': HelpCollection.PawnWhiteRed(CollectionF);
      'Black': HelpCollection.PawnBlackRed(CollectionF);
    end;
    SelectRed();
  end
  //blue pawn
  else if ((SelectedPlayer='White') and (PawnWhiteType='Blue')) or ((SelectedPlayer='Black') and (PawnBlackType='Blue')) then begin
    CollectionF.Description.Caption:='Can move 1 square forward or backwards.'+#13+'Can attack pieces one square diagonally forward or backwards.';
    CollectionF.SpecialDescription.Caption:='On the 1st move it can move 2 squares forward.'+#13+'(can be captured by enemy pawns as if it moved by 1 or 2 squares)'+#13+'Once it reaches the end of the board it can be promoted to any other piece'+#13+'except the king.';
    CollectionF.Source.Caption:='Source: Author of this game';
    case SelectedPlayer of
      'White': HelpCollection.PawnWhiteBlue(CollectionF);
      'Black': HelpCollection.PawnBlackBlue(CollectionF);
    end;
    SelectBlue();
  end
  //yellow pawn
  else begin
    CollectionF.Description.Caption:='Can move 1 square in any direction except diagonally forward.'+#13+'Can attack pieces one square diagonally forward.';
    CollectionF.SpecialDescription.Caption:='On the 1st move it can move 2 squares forward.'+#13+'(can be captured by enemy pawns as if it moved by 1 or 2 squares)'+#13+'Once it reaches the end of the board it can be promoted to any other piece'+#13+'except the king.';
    CollectionF.Source.Caption:='Source: Author of this game';
    case SelectedPlayer of
      'White': HelpCollection.PawnWhiteYellow(CollectionF);
      'Black': HelpCollection.PawnBlackYellow(CollectionF);
    end;
    SelectYellow();
  end;
end;

procedure Rook(Sender:TObject);
begin
  if Sender=CollectionF.Rook then begin
    CollectionF.Title.Caption:='Rook [5 points]';
    CollectionF.RookPanel.Color:=$00004080;
  end;
  //classic rook
  if ((SelectedPlayer='White') and (RookWhiteType='Classic')) or ((SelectedPlayer='Black') and (RookBlackType='Classic')) then begin
    CollectionF.Description.Caption:='Can move or attack pieces orthogonally.';
    CollectionF.SpecialDescription.Caption:='Unlimited movement.';
    CollectionF.Source.Caption:='Source: Modern Chess';
    HelpCollection.RookClassic(CollectionF);
    SelectClassic();
  end
  //red rook
  else if ((SelectedPlayer='White') and (RookWhiteType='Red')) or ((SelectedPlayer='Black') and (RookBlackType='Red')) then begin
    CollectionF.Description.Caption:='Can move or attack pieces orthogonally.';
    CollectionF.SpecialDescription.Caption:='Unlimited movement.'+#13+'Can jump over friendly pieces.';
    CollectionF.Source.Caption:='Source: Cannon from Terachess';
    HelpCollection.RookRed(CollectionF);
    SelectRed();
  end
  //blue rook
  else if ((SelectedPlayer='White') and (RookWhiteType='Blue')) or ((SelectedPlayer='Black') and (RookBlackType='Blue')) then begin
    CollectionF.Description.Caption:='Can move or attack pieces orthogonally.*'+#13+'Can move or attack pieces one square diagonally.';
    CollectionF.SpecialDescription.Caption:='Unlimited movement.*';
    CollectionF.Source.Caption:='Source: Author of this game';
    HelpCollection.RookBlue(CollectionF);
    SelectBlue();
  end
  //yellow rook
  else begin
    CollectionF.Description.Caption:='Can move or attack pieces orthogonally.*'+#13+'Can move or attack pieces using the L shape.**';
    CollectionF.SpecialDescription.Caption:='Unlimited movement.*'+#13+'Can jump over all pieces.**';
    CollectionF.Source.Caption:='Source: Marshall from Terachess';
    HelpCollection.RookYellow(CollectionF);
    SelectYellow();
  end;
end;

procedure Knight(Sender: TObject);
begin
  if Sender=CollectionF.Knight then begin
    CollectionF.Title.Caption:='Knight [3 points]';
    CollectionF.KnightPanel.Color:=$00004080;
  end;
  //classic knight
  if ((SelectedPlayer='White') and (KnightWhiteType='Classic')) or ((SelectedPlayer='Black') and (KnightBlackType='Classic')) then begin
    CollectionF.Description.Caption:='Can move or attack pieces using the L shape.';
    CollectionF.SpecialDescription.Caption:='Can jump over all pieces.';
    CollectionF.Source.Caption:='Source: Modern Chess';
    HelpCollection.KnightClassic(CollectionF);
    SelectClassic();
  end
  //red knight
  else if ((SelectedPlayer='White') and (KnightWhiteType='Red')) or ((SelectedPlayer='Black') and (KnightBlackType='Red')) then begin
    CollectionF.Description.Caption:='Can move or attack pieces 2nd or 3rd squares orthogonally and diagonally.';
    CollectionF.SpecialDescription.Caption:='Can jump over all pieces.';
    CollectionF.Source.Caption:='Source: Antelope from Terachess';
    HelpCollection.KnightRed(CollectionF);
    SelectRed();
  end
  //blue knight
  else if ((SelectedPlayer='White') and (KnightWhiteType='Blue')) or ((SelectedPlayer='Black') and (KnightBlackType='Blue')) then begin
    CollectionF.Description.Caption:='Can move or attack pieces 1st or 2nd squares orthogonally and diagonally.';
    CollectionF.SpecialDescription.Caption:='Can jump over all pieces.';
    CollectionF.Source.Caption:='Source: Machine + Elephant from Terachess';
    HelpCollection.KnightBlue(CollectionF);
    SelectBlue();
  end
  //yellow knight
  else  begin
    CollectionF.Description.Caption:='Can move or attack pieces using the L shape or 3rd squares orthgogonally.'+#13+'Can move one square in any direction.';
    CollectionF.SpecialDescription.Caption:='Can jump over all pieces.';
    CollectionF.Source.Caption:='Source: Author of this game';
    HelpCollection.KnightYellow(CollectionF);
    SelectYellow();
  end;
end;

procedure Bishop(Sender: TObject);
begin
  if Sender=CollectionF.Bishop then begin
    CollectionF.Title.Caption:='Bishop [3 points]';
    CollectionF.BishopPanel.Color:=$00004080;
  end;
  //classic bishop
  if ((SelectedPlayer='White') and (BishopWhiteType='Classic')) or ((SelectedPlayer='Black') and (BishopBlackType='Classic')) then begin
    CollectionF.Description.Caption:='Can move or attack pieces diagonally.';
    CollectionF.SpecialDescription.Caption:='Unlimited movement.';
    CollectionF.Source.Caption:='Source: Modern Chess';
    HelpCollection.BishopClassic(CollectionF);
    SelectClassic();
  end
  //red bishop
  else if ((SelectedPlayer='White') and (BishopWhiteType='Red')) or ((SelectedPlayer='Black') and (BishopBlackType='Red')) then begin
    CollectionF.Description.Caption:='Can move or attack pieces diagonally.';
    CollectionF.SpecialDescription.Caption:='Unlimited movement.'+#13+'Can jump over friendly pieces.';
    CollectionF.Source.Caption:='Source: Bow from Terachess';
    HelpCollection.BishopRed(CollectionF);
    SelectRed();
  end
  //blue bishop
  else if ((SelectedPlayer='White') and (BishopWhiteType='Blue')) or ((SelectedPlayer='Black') and (BishopBlackType='Blue')) then begin
    CollectionF.Description.Caption:='Can move or attack pieces diagonally.*'+#13+'Can move or attack pieces one square orthogonally.';
    CollectionF.SpecialDescription.Caption:='Unlimited movement.*';
    CollectionF.Source.Caption:='Source: Author of this game';
    HelpCollection.BishopBlue(CollectionF);
    SelectBlue();
  end
  //yellow bishop
  else begin
    CollectionF.Description.Caption:='Can move or attack pieces diagonally.*'+#13+'Can move or attack pieces using the L shape.**';
    CollectionF.SpecialDescription.Caption:='Unlimited movement.*'+#13+'Can jump over all pieces.**';
    CollectionF.Source.Caption:='Source: Cardinal from Terachess';
    HelpCollection.BishopYellow(CollectionF);
    SelectYellow();
  end;
end;

procedure Queen(Sender: TObject);
begin
  if Sender=CollectionF.Queen then begin
    CollectionF.Title.Caption:='Queen [9 points]';
    CollectionF.QueenPanel.Color:=$00004080;
  end;
  //classic queen
  if ((SelectedPlayer='White') and (QueenWhiteType='Classic')) or ((SelectedPlayer='Black') and (QueenBlackType='Classic')) then begin
    CollectionF.Description.Caption:='Can move or attack pieces orthogonally and diagonally.';
    CollectionF.SpecialDescription.Caption:='Unlimited movement.';
    CollectionF.Source.Caption:='Source: Modern Chess';
    HelpCollection.QueenClassic(CollectionF);
    SelectClassic();
  end
  //red queen
  else if ((SelectedPlayer='White') and (QueenWhiteType='Red')) or ((SelectedPlayer='Black') and (QueenBlackType='Red')) then begin
    CollectionF.Description.Caption:='Can move or attack pieces orthogonally and diagonally.';
    CollectionF.SpecialDescription.Caption:='Unlimited movement.'+#13+'Can jump over friendly pieces.';
    CollectionF.Source.Caption:='Source: Star from Terachess';
    HelpCollection.QueenRed(CollectionF);
    SelectRed();
  end
  //blue queen
  else if ((SelectedPlayer='White') and (QueenWhiteType='Blue')) or ((SelectedPlayer='Black') and (QueenBlackType='Blue')) then begin
    CollectionF.Description.Caption:='Can move or attack pieces orthogonally and diagonally.';
    CollectionF.SpecialDescription.Caption:='Unlimited movement.'+#13+'When your king dies, your queen is promoted to king.';
    CollectionF.Source.Caption:='Source: Author of this game';
    HelpCollection.QueenBlue(CollectionF);
    SelectBlue();
  end
  //yellow queen}
  else begin
    CollectionF.Description.Caption:='Can move or attack pieces orthogonally and diagonally.*'+#13+'Can move or attack pieces using the L shape.**';
    CollectionF.SpecialDescription.Caption:='Unlimited movement.*'+#13+'Can jump over all pieces.**';
    CollectionF.Source.Caption:='Source: Amazon from Terachess';
    HelpCollection.QueenYellow(CollectionF);
    SelectYellow();
  end;
end;

procedure King(Sender: TObject);
begin
  if Sender=CollectionF.King then begin
    CollectionF.Title.Caption:='King';
    CollectionF.KingPanel.Color:=$00004080;
  end;
  //classic king
  if ((SelectedPlayer='White') and (KingWhiteType='Classic')) or ((SelectedPlayer='Black') and (KingBlackType='Classic')) then begin
    CollectionF.Description.Caption:='Can move or attack pieces one square in any direction.';
    CollectionF.SpecialDescription.Caption:='If you lose your king you lose the game.';
    CollectionF.Source.Caption:='Source: Modern Chess';
    HelpCollection.KingClassic(CollectionF);
    SelectClassic();
  end
  //red king
  else if ((SelectedPlayer='White') and (KingWhiteType='Red')) or ((SelectedPlayer='Black') and (KingBlackType='Red')) then begin
    CollectionF.Description.Caption:='Can move or attack pieces one square in any direction. (placeholder)';
    CollectionF.SpecialDescription.Caption:='If you lose your king you lose the game.';
    CollectionF.Source.Caption:='Source: Modern Chess';
    HelpCollection.KingRed(CollectionF);
    SelectRed();
  end
  //blue king
  else if ((SelectedPlayer='White') and (KingWhiteType='Blue')) or ((SelectedPlayer='Black') and (KingBlackType='Blue')) then begin
    CollectionF.Description.Caption:='Can move or attack pieces one square in any direction. (placeholder)';
    CollectionF.SpecialDescription.Caption:='If you lose your king you lose the game.';
    CollectionF.Source.Caption:='Source: Modern Chess';
    HelpCollection.KingBlue(CollectionF);
    SelectBlue();
  end
  //yellow king
  else begin
    CollectionF.Description.Caption:='Can move or attack pieces one square in any direction. (placeholder)';
    CollectionF.SpecialDescription.Caption:='If you lose your king you lose the game.';
    CollectionF.Source.Caption:='Source: Modern Chess';
    HelpCollection.KingYellow(CollectionF);
    SelectYellow();
  end;
end;

//ESSENCE SELECTION

procedure SelectClassic();
begin
  CollectionF.ClassicPanel.Color:=clGray;
  Collectionf.Classic.Hint:='Selected';
end;

procedure SelectRed();
begin
  CollectionF.RedPanel.Color:=clGray;
  Collectionf.Red.Hint:='Selected';
end;

procedure SelectBlue();
begin
  CollectionF.BluePanel.Color:=clGray;
  Collectionf.Blue.Hint:='Selected';
end;

procedure SelectYellow();
begin
  CollectionF.YellowPanel.Color:=clGray;
  Collectionf.Yellow.Hint:='Selected';
end;

//CLEARANCE

procedure PiecePanelsClear();
begin
  CollectionF.PawnPanel.Color:=$0071B8FF;
  CollectionF.RookPanel.Color:=$0071B8FF;
  CollectionF.KnightPanel.Color:=$0071B8FF;
  CollectionF.BishopPanel.Color:=$0071B8FF;
  CollectionF.QueenPanel.Color:=$0071B8FF;
  CollectionF.KingPanel.Color:=$0071B8FF;
  CollectionF.Pawn.Hint:='';
  CollectionF.Rook.Hint:='';
  CollectionF.Knight.Hint:='';
  CollectionF.Bishop.Hint:='';
  CollectionF.Queen.Hint:='';
  CollectionF.King.Hint:='';
end;

end.

