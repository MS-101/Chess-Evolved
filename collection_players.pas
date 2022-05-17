unit Collection_Players;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

//generic
procedure ChangePlayer();
//specific
procedure ChangeSelectedPlayer();
procedure ChangePiecePanels();
procedure ReselectPiece();

implementation

uses
  Collection, Collection_Pieces, Collection_Essences;

//GENERIC

procedure ChangePlayer();
begin
  ChangeSelectedPlayer();
  ChangePiecePanels();
  ReselectPiece();
end;

//SPECIFIC

procedure ChangeSelectedPlayer();
begin
  if SelectedPlayer='White' then begin
    if CollectionF.PlayerName.Text<>'' then Player1Name:=CollectionF.PlayerName.Text
                                       else Player1Name:='Player1';
    CollectionF.PlayerName.Text:=Player2Name;
    SelectedPlayer:='Black'
  end
  else begin
    if CollectionF.PlayerName.Text<>'' then Player2Name:=CollectionF.PlayerName.Text
                                       else Player2Name:='Player2';
    CollectionF.PlayerName.Text:=Player1Name;
    SelectedPlayer:='White';
  end;
end;

procedure ChangePiecePanels();
begin
  if SelectedPlayer='White' then begin
    //white pawn
    case PawnWhiteType of
      'Classic': CollectionF.Pawn.Picture:=CollectionF.PawnWhite_Classic.Picture;
      'Red': CollectionF.Pawn.Picture:=CollectionF.PawnWhite_Red.Picture;
      'Blue': CollectionF.Pawn.Picture:=CollectionF.PawnWhite_Blue.Picture;
      'Yellow': CollectionF.Pawn.Picture:=CollectionF.PawnWhite_Yellow.Picture;
    end;
    //white rook
    case RookWhiteType of
      'Classic': CollectionF.Rook.Picture:=CollectionF.RookWhite_Classic.Picture;
      'Red': CollectionF.Rook.Picture:=CollectionF.RookWhite_Red.Picture;
      'Blue': CollectionF.Rook.Picture:=CollectionF.RookWhite_Blue.Picture;
      'Yellow': CollectionF.Rook.Picture:=CollectionF.RookWhite_Yellow.Picture;
    end;
    //white knight
    case KnightWhiteType of
      'Classic': CollectionF.Knight.Picture:=CollectionF.KnightWhite_Classic.Picture;
      'Red': CollectionF.Knight.Picture:=CollectionF.KnightWhite_Red.Picture;
      'Blue': CollectionF.Knight.Picture:=CollectionF.KnightWhite_Blue.Picture;
      'Yellow': CollectionF.Knight.Picture:=CollectionF.KnightWhite_Yellow.Picture;
    end;
    //white bishop
    case BishopWhiteType of
      'Classic': CollectionF.Bishop.Picture:=CollectionF.BishopWhite_Classic.Picture;
      'Red': CollectionF.Bishop.Picture:=CollectionF.BishopWhite_Red.Picture;
      'Blue': CollectionF.Bishop.Picture:=CollectionF.BishopWhite_Blue.Picture;
      'Yellow': CollectionF.Bishop.Picture:=CollectionF.BishopWhite_Yellow.Picture;
    end;
    //white queen
    case QueenWhiteType of
      'Classic': CollectionF.Queen.Picture:=CollectionF.QueenWhite_Classic.Picture;
      'Red': CollectionF.Queen.Picture:=CollectionF.QueenWhite_Red.Picture;
      'Blue': CollectionF.Queen.Picture:=CollectionF.QueenWhite_Blue.Picture;
      'Yellow': CollectionF.Queen.Picture:=CollectionF.QueenWhite_Yellow.Picture;
    end;
    //white king
    case KingWhiteType of
      'Classic': CollectionF.King.Picture:=CollectionF.KingWhite_Classic.Picture;
      'Red': CollectionF.King.Picture:=CollectionF.KingWhite_Red.Picture;
      'Blue': CollectionF.King.Picture:=CollectionF.KingWhite_Blue.Picture;
      'Yellow': CollectionF.King.Picture:=CollectionF.KingWhite_Yellow.Picture;
    end;
  end
  else begin
    //black pawn
    case PawnBlackType of
      'Classic': CollectionF.Pawn.Picture:=CollectionF.PawnBlack_Classic.Picture;
      'Red': CollectionF.Pawn.Picture:=CollectionF.PawnBlack_Red.Picture;
      'Blue': CollectionF.Pawn.Picture:=CollectionF.PawnBlack_Blue.Picture;
      'Yellow': CollectionF.Pawn.Picture:=CollectionF.PawnBlack_Yellow.Picture;
    end;
    //black rook
    case RookBlackType of
      'Classic': CollectionF.Rook.Picture:=CollectionF.RookBlack_Classic.Picture;
      'Red': CollectionF.Rook.Picture:=CollectionF.RookBlack_Red.Picture;
      'Blue': CollectionF.Rook.Picture:=CollectionF.RookBlack_Blue.Picture;
      'Yellow': CollectionF.Rook.Picture:=CollectionF.RookBlack_Yellow.Picture;
    end;
    //black knight
    case KnightBlackType of
      'Classic': CollectionF.Knight.Picture:=CollectionF.KnightBlack_Classic.Picture;
      'Red': CollectionF.Knight.Picture:=CollectionF.KnightBlack_Red.Picture;
      'Blue': CollectionF.Knight.Picture:=CollectionF.KnightBlack_Blue.Picture;
      'Yellow': CollectionF.Knight.Picture:=CollectionF.KnightBlack_Yellow.Picture;
    end;
    //black bishop
    case BishopBlackType of
      'Classic': CollectionF.Bishop.Picture:=CollectionF.BishopBlack_Classic.Picture;
      'Red': CollectionF.Bishop.Picture:=CollectionF.BishopBlack_Red.Picture;
      'Blue': CollectionF.Bishop.Picture:=CollectionF.BishopBlack_Blue.Picture;
      'Yellow': CollectionF.Bishop.Picture:=CollectionF.BishopBlack_Yellow.Picture;
    end;
    //black queen
    case QueenBlackType of
      'Classic': CollectionF.Queen.Picture:=CollectionF.QueenBlack_Classic.Picture;
      'Red': CollectionF.Queen.Picture:=CollectionF.QueenBlack_Red.Picture;
      'Blue': CollectionF.Queen.Picture:=CollectionF.QueenBlack_Blue.Picture;
      'Yellow': CollectionF.Queen.Picture:=CollectionF.QueenBlack_Yellow.Picture;
    end;
    //black king
    case KingBlackType of
      'Classic': CollectionF.King.Picture:=CollectionF.KingBlack_Classic.Picture;
      'Red': CollectionF.King.Picture:=CollectionF.KingBlack_Red.Picture;
      'Blue': CollectionF.King.Picture:=CollectionF.KingBlack_Blue.Picture;
      'Yellow': CollectionF.King.Picture:=CollectionF.KingBlack_Yellow.Picture;
    end;
  end;
end;

procedure ReselectPiece();
var
  i: byte;
begin
  CollectionF.Piece.Picture:=SelectedPiece.Picture;
  Collection_Essences.EssencePanelsClear();
  for i:=1 to 48 do Board[i].Picture:=nil;
  case SelectedPiece.Name of
    'Pawn': Collection_Pieces.Pawn(CollectionF.ChangePlayer);
    'Rook': Collection_Pieces.Rook(CollectionF.ChangePlayer);
    'Knight': Collection_Pieces.Knight(CollectionF.ChangePlayer);
    'Bishop': Collection_Pieces.Bishop(CollectionF.ChangePlayer);
    'Queen': Collection_Pieces.Queen(CollectionF.ChangePlayer);
    'King': Collection_Pieces.King(CollectionF.ChangePlayer);
  end;
end;

end.

