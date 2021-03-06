unit Game_Pieces;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ExtCtrls, Graphics, ChessPiece;

//generic
procedure PieceClick(Sender: TChessPiece);
//piece movements
procedure PawnWhite();
procedure PawnBlack();
procedure Rook();
procedure Knight();
procedure Bishop();
procedure Queen();
procedure King();

implementation

uses
  Game, Collection, Game_Movement;

//GENERIC

procedure PieceClick(Sender: TChessPiece);
begin
  //can be used only on corresponding players turn
  If Sender.PieceOwner=Turn then begin
    GameF.ChessboardClear(Sender);
    //if piece is not selected continue
    if gSelectedPiece<>Sender then begin
      //piece selection
      gSelectedPiece:=Sender;
      GameF.ChessBoard.canvas.pen.width:=6;
      GameF.ChessBoard.canvas.pen.color:=clRed;
      GameF.ChessBoard.Canvas.Line(gSelectedPiece.Left-GameF.ChessBoard.Left, gSelectedPiece.Top-GameF.ChessBoard.Top, gSelectedPiece.Left-GameF.ChessBoard.Left+75, gSelectedPiece.Top-GameF.ChessBoard.Top);
      GameF.ChessBoard.Canvas.Line(gSelectedPiece.Left-GameF.ChessBoard.Left, gSelectedPiece.Top-GameF.ChessBoard.Top, gSelectedPiece.Left-GameF.ChessBoard.Left, gSelectedPiece.Top-GameF.ChessBoard.Top+75);
      GameF.ChessBoard.Canvas.Line(gSelectedPiece.Left-GameF.ChessBoard.Left+75, gSelectedPiece.Top-GameF.ChessBoard.Top+75, gSelectedPiece.Left-GameF.ChessBoard.Left+75, gSelectedPiece.Top-GameF.ChessBoard.Top);
      GameF.ChessBoard.Canvas.Line(gSelectedPiece.Left-GameF.ChessBoard.Left+75, gSelectedPiece.Top-GameF.ChessBoard.Top+75, gSelectedPiece.Left-GameF.ChessBoard.Left, gSelectedPiece.Top-GameF.ChessBoard.Top+75);
      //check for the type of piece
      case Sender.PieceType of
        'Pawn': if Sender.PieceOwner='White' then PawnWhite()
                                             else PawnBlack();
        'Rook': Rook();
        'Knight': Knight();
        'Bishop': Bishop();
        'King': King();
        'Queen': Queen();
      end;
    end
    //if piece is already selected deselect it
    else gSelectedPiece:=nil;
  end;
end;

//PIECE MOVEMENTS

procedure PawnWhite();
begin
  case PawnWhiteType of
    'Classic': begin
      Game_Movement.PawnWhiteClassic();
    end;
    'Red': begin
      Game_Movement.Move(2, 1, 0, 1, 0, 'none');
      Game_Movement.AttackMove(1, 1, -1, 0, 0, 'none');
      Game_Movement.AttackMove(1, 1, 1, 0, 0, 'none');
    end;
    'Blue': begin
      Game_Movement.PawnWhiteClassic();
      Game_Movement.Move(1, -1, 0, -1, 0, 'none');
      Game_Movement.Attack(1, -1, -1, 0, 0, 'none');
      Game_Movement.Attack(1, -1, 1, 0, 0, 'none');
    end;
    'Yellow': begin
      Game_Movement.PawnWhiteClassic();
      Game_Movement.Move(1, -1, -1, 0, 0, 'none');
      Game_Movement.Move(1, -1, 0, 0, 0, 'none');
      Game_Movement.Move(1, -1, 1, 0, 0, 'none');
      Game_Movement.Move(1, 0, -1, 0, 0, 'none');
      Game_Movement.Move(1, 0, 1, 0, 0, 'none');
    end;
  end;
end;

procedure PawnBlack();
begin
  case PawnBlackType of
    'Classic': begin
      Game_Movement.PawnBlackClassic();
    end;
    'Red': begin
      Game_Movement.Move(2, -1, 0, -1, 0, 'none');
      Game_Movement.AttackMove(1, -1, -1, 0, 0, 'none');
      Game_Movement.AttackMove(1, -1, 1, 0, 0, 'none');
    end;
    'Blue': begin
      Game_Movement.PawnBlackClassic();
      Game_Movement.Move(1, 1, 0, 0, 0, 'none');
      Game_Movement.Attack(1, 1, -1, 0, 0, 'none');
      Game_Movement.Attack(1, 1, 1, 0, 0, 'none');
    end;
    'Yellow': begin
      Game_Movement.PawnBlackClassic();
      Game_Movement.Move(1, 0, -1, 0, 0, 'none');
      Game_Movement.Move(1, 0, 1, 0, 0, 'none');
      Game_Movement.Move(1, 1, -1, 0, 0, 'none');
      Game_Movement.Move(1, 1, 0, 0, 0, 'none');
      Game_Movement.Move(1, 1, 1, 0, 0, 'none');
    end;
  end;
end;

procedure Rook();
begin
  //classic rook
  If ((RookWhiteType='Classic') AND (Turn='White')) OR ((RookBlackType='Classic') AND (Turn='Black')) then begin
    Game_Movement.RookClassic('none');
  end
  //red rook
  else if ((RookWhiteType='Red') AND (Turn='White')) OR ((RookBlackType='Red') AND (Turn='Black')) then begin
    Game_Movement.RookClassic('ally');
  end
  //blue rook
  else if ((RookWhiteType='Blue') AND (Turn='White')) OR ((RookBlackType='Blue') AND (Turn='Black')) then begin
    Game_Movement.RookClassic('none');
    Game_Movement.AttackMove(1, -1, -1, 0, 0, 'none');
    Game_Movement.AttackMove(1, -1, 1, 0, 0, 'none');
    Game_Movement.AttackMove(1, 1, -1, 0, 0, 'none');
    Game_Movement.AttackMove(1, 1, 1, 0, 0, 'none');
  end
  //yellow rook
  else begin
    Game_Movement.RookClassic('none');
    Game_Movement.KnightClassic();
  end;
end;

procedure Knight();
begin
  //classic knight
  If ((KnightWhiteType='Classic') AND (Turn='White')) OR ((KnightBlackType='Classic') AND (Turn='Black')) then begin
    Game_Movement.KnightClassic();
  end
  //red knight
  else if ((KnightWhiteType='Red') AND (Turn='White')) OR ((KnightBlackType='Red') AND (Turn='Black')) then begin
    Game_Movement.AttackMove(2, -2, -2, -1, -1, 'all');
    Game_Movement.AttackMove(2, -2, 0, -1, 0, 'all');
    Game_Movement.AttackMove(2, -2, 2, -1, 1, 'all');
    Game_Movement.AttackMove(2, 0, -2, 0, -1, 'all');
    Game_Movement.AttackMove(2, 0, 2, 0, 1, 'all');
    Game_Movement.AttackMove(2, 2, -2, 1, -1, 'all');
    Game_Movement.AttackMove(2, 2, 0, 1, 0, 'all');
    Game_Movement.AttackMove(2, 2, 2, 1, 1, 'all');
  end
  //blue knight
  else if ((KnightWhiteType='Blue') AND (Turn='White')) OR ((KnightBlackType='Blue') AND (Turn='Black')) then begin
    Game_Movement.AttackMove(2, -1, -1, -1, -1, 'all');
    Game_Movement.AttackMove(2, -1, 0, -1, 0, 'all');
    Game_Movement.AttackMove(2, -1, 1, -1, 1, 'all');
    Game_Movement.AttackMove(2, 0, -1, 0, -1, 'all');
    Game_Movement.AttackMove(2, 0, 1, 0, 1, 'all');
    Game_Movement.AttackMove(2, 1, -1, 1, -1, 'all');
    Game_Movement.AttackMove(2, 1, 0, 1, 0, 'all');
    Game_Movement.AttackMove(2, 1, 1, 1, 1, 'all');
  end
  //yellow knight
  else begin
    Game_Movement.KnightClassic();
    Game_Movement.Move(1, -1, -1, 0, 0, 'none');
    Game_Movement.Move(1, -1, 0, 0, 0, 'none');
    Game_Movement.Move(1, -1, 1, 0, 0, 'none');
    Game_Movement.Move(1, 0, -1, 0, 0, 'none');
    Game_Movement.Move(1, 0, 1, 0, 0, 'none');
    Game_Movement.Move(1, 1, -1, 0, 0, 'none');
    Game_Movement.Move(1, 1, 0, 0, 0, 'none');
    Game_Movement.Move(1, 1, 1, 0, 0, 'none');
    Game_Movement.AttackMove(1, -3, 0, 0, 0, 'none');
    Game_Movement.AttackMove(1, 0, -3, 0, 0, 'none');
    Game_Movement.AttackMove(1, 0, 3, 0, 0, 'none');
    Game_Movement.AttackMove(1, 3, 0, 0, 0, 'none');
  end;
end;

procedure Bishop();
begin
  //classic bishop
  If ((BishopWhiteType='Classic') AND (Turn='White')) OR ((BishopBlackType='Classic') AND (Turn='Black')) then begin
    Game_Movement.BishopClassic('none');
  end
  //red bishop
  else if ((BishopWhiteType='Red') AND (Turn='White')) OR ((BishopBlackType='Red') AND (Turn='Black')) then begin
    Game_Movement.BishopClassic('ally');
  end
  //blue bishop
  else if ((BishopWhiteType='Blue') AND (Turn='White')) OR ((BishopBlackType='Blue') AND (Turn='Black')) then begin
    Game_Movement.BishopClassic('none');
    Game_Movement.AttackMove(1, -1, 0, 0, 0, 'none');
    Game_Movement.AttackMove(1, 0, -1, 0, 0, 'none');
    Game_Movement.AttackMove(1, 0, 1, 0, 0, 'none');
    Game_Movement.AttackMove(1, 1, 0, 0, 0, 'none');
  end
  //yellow bishop
  else begin
    Game_Movement.BishopClassic('none');
    Game_Movement.KnightClassic();
  end;
end;

procedure Queen();
begin
  //classic queen
  If ((QueenWhiteType='Classic') AND (Turn='White')) OR ((QueenBlackType='Classic') AND (Turn='Black')) then begin
    Game_Movement.QueenClassic('none');
  end
  //red queen
  else if ((QueenWhiteType='Red') AND (Turn='White')) OR ((QueenBlackType='Red') AND (Turn='Black')) then begin
    Game_Movement.QueenClassic('ally');
  end
  //blue queen
  else if ((QueenWhiteType='Blue') AND (Turn='White')) OR ((QueenBlackType='Blue') AND (Turn='Black')) then begin
    Game_Movement.QueenClassic('none');
  end
  //yellow queen
  else begin
    Game_Movement.QueenClassic('none');
    Game_Movement.KnightClassic();
  end;
end;

procedure King();
begin
  //classic king
  If ((QueenWhiteType='Classic') AND (Turn='White')) OR ((QueenBlackType='Classic') AND (Turn='Black')) then begin
    KingClassic();
  end
  //red king
  else if ((QueenWhiteType='Red') AND (Turn='White')) OR ((QueenBlackType='Red') AND (Turn='Black')) then begin
    {placeholder}
    KingClassic();
  end
  //blue king
  else if ((QueenWhiteType='Blue') AND (Turn='White')) OR ((QueenBlackType='Blue') AND (Turn='Black')) then begin
    {placeholder}
    KingClassic();
  end
  //yellow king
  else begin
    {placeholder}
    KingClassic();
  end;
end;

end.

