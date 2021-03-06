unit Collection_GameChanges;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

procedure PawnGameChange();
procedure RookGameChange();
procedure KnightGameChange();
procedure BishopGameChange();
procedure QueenGameChange();
procedure KingGameChange();

implementation

uses
  Game, Collection;

procedure PawnGameChange();
begin
  case SelectedPlayer of
    'White': begin
      GameF.PawnWhiteCounter.Picture:=CollectionF.Pawn.Picture;
      GameF.PawnWhite1.Picture:=CollectionF.Pawn.Picture;
      GameF.PawnWhite2.Picture:=CollectionF.Pawn.Picture;
      GameF.PawnWhite3.Picture:=CollectionF.Pawn.Picture;
      GameF.PawnWhite4.Picture:=CollectionF.Pawn.Picture;
      GameF.PawnWhite5.Picture:=CollectionF.Pawn.Picture;
      GameF.PawnWhite6.Picture:=CollectionF.Pawn.Picture;
      GameF.PawnWhite7.Picture:=CollectionF.Pawn.Picture;
      GameF.PawnWhite8.Picture:=CollectionF.Pawn.Picture;
    end;
    'Black': begin
      GameF.PawnBlackCounter.Picture:=CollectionF.Pawn.Picture;
      GameF.PawnBlack1.Picture:=CollectionF.Pawn.Picture;
      GameF.PawnBlack2.Picture:=CollectionF.Pawn.Picture;
      GameF.PawnBlack3.Picture:=CollectionF.Pawn.Picture;
      GameF.PawnBlack4.Picture:=CollectionF.Pawn.Picture;
      GameF.PawnBlack5.Picture:=CollectionF.Pawn.Picture;
      GameF.PawnBlack6.Picture:=CollectionF.Pawn.Picture;
      GameF.PawnBlack7.Picture:=CollectionF.Pawn.Picture;
      GameF.PawnBlack8.Picture:=CollectionF.Pawn.Picture;
    end;
  end;
end;

procedure RookGameChange();
begin
  case SelectedPlayer of
    'White': begin
      GameF.RookWhiteCounter.Picture:=CollectionF.Rook.Picture;
      GameF.RookWhite1.Picture:=CollectionF.Rook.Picture;
      GameF.RookWhite2.Picture:=CollectionF.Rook.Picture;
    end;
    'Black': begin
      GameF.RookBlackCounter.Picture:=CollectionF.Rook.Picture;
      GameF.RookBlack1.Picture:=CollectionF.Rook.Picture;
      GameF.RookBlack2.Picture:=CollectionF.Rook.Picture;
    end;
  end;
end;

procedure KnightGameChange();
begin
  case SelectedPlayer of
    'White': begin
      GameF.KnightWhiteCounter.Picture:=CollectionF.Knight.Picture;
      GameF.KnightWhite1.Picture:=CollectionF.Knight.Picture;
      GameF.KnightWhite2.Picture:=CollectionF.Knight.Picture;
    end;
    'Black': begin
      GameF.KnightBlackCounter.Picture:=CollectionF.Knight.Picture;
      GameF.KnightBlack1.Picture:=CollectionF.Knight.Picture;
      GameF.KnightBlack2.Picture:=CollectionF.Knight.Picture;
    end;
  end;
end;

procedure BishopGameChange();
begin
  case SelectedPlayer of
    'White': begin
      GameF.BishopWhiteCounter.Picture:=CollectionF.Bishop.Picture;
      GameF.BishopWhite1.Picture:=CollectionF.Bishop.Picture;
      GameF.BishopWhite2.Picture:=CollectionF.Bishop.Picture;
    end;
    'Black': begin
      GameF.BishopBlackCounter.Picture:=CollectionF.Bishop.Picture;
      GameF.BishopBlack1.Picture:=CollectionF.Bishop.Picture;
      GameF.BishopBlack2.Picture:=CollectionF.Bishop.Picture;
    end;
  end;
end;

procedure QueenGameChange();
begin
  case SelectedPlayer of
    'White': begin
      GameF.QueenWhiteCounter.Picture:=CollectionF.Queen.Picture;
      GameF.QueenWhite.Picture:=CollectionF.Queen.Picture;
    end;
    'Black': begin
      GameF.QueenBlackCounter.Picture:=CollectionF.Queen.Picture;
      GameF.QueenBlack.Picture:=CollectionF.Queen.Picture;
    end;
  end;
end;

procedure KingGameChange();
begin
  case SelectedPlayer of
    'White': begin
      GameF.KingWhite.Picture:=CollectionF.King.Picture;
      GameF.Player1Portrait.Picture:=CollectionF.King.Picture;
    end;
    'Black': begin
      GameF.KingBlack.Picture:=CollectionF.King.Picture;
      GameF.Player2Portrait.Picture:=CollectionF.King.Picture;
    end;
  end;
end;

end.

