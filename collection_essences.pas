unit Collection_Essences;

{$mode objfpc}{$H+}

interface

uses
  Collection, Classes, SysUtils, ExtCtrls, Graphics;

//generic
procedure EssenceClick(Sender: TImage);
procedure EssenceMouseEnter(Sender: TImage);
procedure EssenceMouseLeave(Sender: TImage);
//specific
procedure SpecificEssence(Essence: shortstring; EssencePieces: EssencePiecesArray);
//clearance
procedure EssencePanelsClear();

implementation

uses
 MainMenu, Collection_Pieces, Collection_GameChanges;

//GENERIC

procedure EssenceClick(Sender: TImage);
var
  i: byte;
begin
  if Sender.Hint<>'Selected' then begin
    EssencePanelsClear();
    for i:=1 to 48 do Board[i].Picture:=nil;
    case Sender.Name of
      'Classic': SpecificEssence('Classic', ClassicPieces);
      'Red': SpecificEssence('Red', RedPieces);
      'Blue': SpecificEssence('Blue', BluePieces);
      'Yellow': SpecificEssence('Yellow', YellowPieces);
    end;
    CollectionF.Piece.Picture:=SelectedPiece.Picture;
  end;
end;

procedure EssenceMouseEnter(Sender: TImage);
begin
  if Sender.Parent.Color=clSilver then Sender.Parent.Color:=clMedGray;
end;

procedure EssenceMouseLeave(Sender: TImage);
begin
  if Sender.Parent.Color=clMedGray then Sender.Parent.Color:=clSilver;
end;

//SPECIFIC

procedure SpecificEssence(Essence: shortstring; EssencePieces: EssencePiecesArray);
begin
  case SelectedPiece.Name of
    'Pawn': begin
      If SelectedPlayer='White' then begin
        PawnWhiteType:=Essence;
        CollectionF.Pawn.Picture:=EssencePieces[PawnWhite].Picture;
      end
      else begin
        PawnBlackType:=Essence;
        CollectionF.Pawn.Picture:=EssencePieces[PawnBlack].Picture;
      end;
      Collection_Pieces.Pawn(CollectionF.Pawn);
      Collection_GameChanges.PawnGameChange();
    end;
    'Rook': begin
      If SelectedPlayer='White' then begin
        RookWhiteType:=Essence;
        CollectionF.Rook.Picture:=EssencePieces[RookWhite].Picture;
      end
      else begin
        RookBlackType:=Essence;
        CollectionF.Rook.Picture:=EssencePieces[RookBlack].Picture;
      end;
      Collection_Pieces.Rook(CollectionF.Rook);
      Collection_GameChanges.RookGameChange();
    end;
    'Knight': begin
      If SelectedPlayer='White' then begin
        KnightWhiteType:=Essence;
        CollectionF.Knight.Picture:=EssencePieces[KnightWhite].Picture;
      end
      else begin
        KnightBlackType:=Essence;
        CollectionF.Knight.Picture:=EssencePieces[KnightBlack].Picture;
      end;
      Collection_Pieces.Knight(CollectionF.Knight);
      Collection_GameChanges.KnightGameChange();
    end;
    'Bishop': begin
      If SelectedPlayer='White' then begin
        BishopWhiteType:=Essence;
        CollectionF.Bishop.Picture:=EssencePieces[BishopWhite].Picture;
      end
      else begin
        BishopBlackType:=Essence;
        CollectionF.Bishop.Picture:=EssencePieces[BishopBlack].Picture;
      end;
      Collection_Pieces.Bishop(CollectionF.Bishop);
      Collection_GameChanges.BishopGameChange();
    end;
    'Queen': begin
      If SelectedPlayer='White' then begin
        QueenWhiteType:=Essence;
        CollectionF.Queen.Picture:=EssencePieces[QueenWhite].Picture;
      end
      else begin
        QueenBlackType:=Essence;
        CollectionF.Queen.Picture:=EssencePieces[QueenBlack].Picture;
      end;
      Collection_Pieces.Queen(CollectionF.Queen);
      Collection_GameChanges.QueenGameChange();
    end;
    'King': begin
      If SelectedPlayer='White' then begin
        KingWhiteType:=Essence;
        CollectionF.King.Picture:=EssencePieces[KingWhite].Picture;
      end
      else begin
        KingBlackType:=Essence;
        CollectionF.King.Picture:=EssencePieces[KingBlack].Picture;
      end;
      Collection_Pieces.King(CollectionF.King);
      Collection_GameChanges.KingGameChange();
    end;
  end;
end;

//CLEARANCE

procedure EssencePanelsClear();
begin
  CollectionF.ClassicPanel.Color:=clSilver;
  CollectionF.RedPanel.Color:=clSilver;
  CollectionF.BluePanel.Color:=clSilver;
  CollectionF.YellowPanel.Color:=clSilver;
  CollectionF.Classic.Hint:='';
  CollectionF.Red.Hint:='';
  CollectionF.Blue.Hint:='';
  CollectionF.Yellow.Hint:='';
end;

end.

