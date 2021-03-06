unit Game_Positions;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ExtCtrls, StdCtrls, Controls, Graphics, ChessPosition, ChessPiece, Game;

//generic
procedure PositionClick(Sender: TChessPosition);
//specific
procedure PreviousMovementDisplay(Sender: TChessPosition);
procedure CapturePiece(Sender: TChessPosition);
procedure PointCounters(AttackedPiece: TChessPiece; var PlayerScoreInteger: integer; PlayerScorePanel: TPanel; PieceCountersL: PieceCountersLArray);
procedure CreateEnPassant(Sender: TChessPosition);
procedure PieceMovement(Sender: TChessPosition);
procedure PawnPromotion();
procedure EndTurn();

implementation

uses
  Collection, Game_Movement;

//GENERIC

procedure PositionClick(Sender: TChessPosition);
begin
  PreviousMovementDisplay(Sender);
  CapturePiece(Sender);
  CreateEnPassant(Sender);
  PieceMovement(Sender);
  GameF.ChessboardClear(Sender);
  if Turn<>'' then PawnPromotion();
  EndTurn();
end;

//SPECIFIC

procedure PreviousMovementDisplay(Sender: TChessPosition);
var
  i: byte;
begin
  for i:=0 to 4 do PreviousMovement[i].Visible:=True;
  //MovedPiece
  GameF.MovedPiece.Picture:=gSelectedPiece.Picture;
  //MovedFrom
  Game_Movement.FindPosition(gSelectedPiece.Left, gSelectedPiece.Top);
  case FoundPosition.Name of
    'A2', 'A4', 'A6', 'A8', 'B1', 'B3', 'B5', 'B7', 'C2', 'C4', 'C6', 'C8', 'D1', 'D3', 'D5', 'D7',
    'E2', 'E4', 'E6', 'E8', 'F1', 'F3', 'F5', 'F7', 'G2', 'G4', 'G6', 'G8', 'H1', 'H3', 'H5', 'H7': begin
      GameF.MovedFrom.Canvas.Pen.Color:=clWhite;
      GameF.MovedFrom.Canvas.Brush.Color:=clBlack;
      GameF.MovedFrom.Canvas.Font.Color:=clWhite;
    end
    else begin
      GameF.MovedFrom.Canvas.Pen.Color:=clBlack;
      GameF.MovedFrom.Canvas.Brush.Color:=clWhite;
      GameF.MovedFrom.Canvas.Font.Color:=clBlack;
    end;
  end;
  GameF.MovedFrom.Canvas.Rectangle(0, 0, GameF.MovedFrom.Width, GameF.MovedFrom.Height);
  GameF.MovedFrom.Canvas.TextOut(GameF.MovedFrom.Width div 4, GameF.MovedFrom.Height div 4, FoundPosition.Name);
  //MovementType
  GameF.MovementType.Picture:=Sender.Picture;
  //MovedTo
  case Sender.Name of
    'A2', 'A4', 'A6', 'A8', 'B1', 'B3', 'B5', 'B7', 'C2', 'C4', 'C6', 'C8', 'D1', 'D3', 'D5', 'D7',
    'E2', 'E4', 'E6', 'E8', 'F1', 'F3', 'F5', 'F7', 'G2', 'G4', 'G6', 'G8', 'H1', 'H3', 'H5', 'H7': begin
      GameF.MovedTo.Canvas.Pen.Color:=clWhite;
      GameF.MovedTo.Canvas.Brush.Color:=clBlack;
      GameF.MovedTo.Canvas.Font.Color:=clWhite;
    end
    else begin
      GameF.MovedTo.Canvas.Pen.Color:=clBlack;
      GameF.MovedTo.Canvas.Brush.Color:=clWhite;
      GameF.MovedTo.Canvas.Font.Color:=clBlack;
    end;
  end;
  GameF.MovedTo.Canvas.Rectangle(0, 0, GameF.MovedTo.Width, GameF.MovedTo.Height);
  GameF.MovedTo.Canvas.TextOut(GameF.MovedTo.Width div 4, GameF.MovedTo.Height div 4, Sender.Name);
  //CapturedPiece
  if Sender.PositionMovement='Attack' then begin
    case Turn of
      'White': Game_Movement.FindPieceFromArray(BlackPieces, Sender.Left, Sender.Top);
      'Black': Game_Movement.FindPieceFromArray(WhitePieces, Sender.Left, Sender.Top);
    end;
    GameF.CapturedPiece.Picture:=FoundPiece.Picture;
  end
  else GameF.CapturedPiece.Picture:=nil;
end;

procedure CapturePiece(Sender: TChessPosition);
var
  i: byte;
begin
  //if piece was attacked continue
  if Sender.PositionMovement='Attack' then begin
    //search for piece you attacked
    for i:=0 to 31 do if (AllPieces[i].Left=Sender.Left) AND (AllPieces[i].Top=Sender.Top) then begin
      {REGULAR ATTACK}
      //remove attacked piece from game
      AllPieces[i].AnchorSide[akTop].Control:=GameF;
      AllPieces[i].AnchorSide[akLeft].Control:=GameF;
      //point counters
      case gSelectedPiece.PieceOwner of
        'White': PointCounters(AllPieces[i], Player1ScoreInteger, GameF.Player1ScorePanel, BlackPieceCountersL);
        'Black': PointCounters(AllPieces[i], Player2ScoreInteger, GameF.Player2ScorePanel, WhitePieceCountersL);
      end;
      exit;
    end;
    {EnPassant Capture}
    //white attacks EnPassant
    case gSelectedPiece.PieceOwner of
      'White': begin
        //point counter
        inc(Player1ScoreInteger);
        GameF.PawnBlackCounterL.Caption:=inttostr(strtoint(GameF.PawnBlackCounterL.caption)-1);
        if Player1ScoreInteger=1 then GameF.Player1ScorePanel.Caption:=inttostr(Player1ScoreInteger)+' Point'
                                 else GameF.Player1ScorePanel.Caption:=inttostr(Player1ScoreInteger)+' Points';
        //search for attacked EnPassant's pawn
        for i:=0 to 7 do if (BlackPawns[i].Left=GameF.Enpassant.Left-75) AND (BlackPawns[i].Top=GameF.Enpassant.Top) then begin
          //remove attacked black pawn from game
          BlackPawns[i].AnchorSide[akTop].Control:=GameF;
          BlackPawns[i].AnchorSide[akLeft].Control:=GameF;
        end;
      end;
      //black attacks EnPassant
      'Black': begin
        //point counter
        inc(Player2ScoreInteger);
        GameF.PawnWhiteCounterL.Caption:=inttostr(strtoint(GameF.PawnWhiteCounterL.caption)-1);
        if Player2ScoreInteger=1 then GameF.Player2ScorePanel.Caption:=inttostr(Player2ScoreInteger)+' Point'
                                 else GameF.Player2ScorePanel.Caption:=inttostr(Player2ScoreInteger)+' Points';
        //search for attacked EnPassant's pawn
        for i:=0 to 7 do if (WhitePawns[i].Left=GameF.Enpassant.Left+75) AND (WhitePawns[i].Top=GameF.Enpassant.Top) then begin
          //remove attacked white pawn from game
          WhitePawns[i].AnchorSide[akTop].Control:=GameF;
          WhitePawns[i].AnchorSide[akLeft].Control:=GameF;
        end;
      end;
    end;
  end;
end;

procedure PointCounters(AttackedPiece: TChessPiece; var PlayerScoreInteger: integer; PlayerScorePanel: TPanel; PieceCountersL: PieceCountersLArray);
var
  i: byte;
begin
  case AttackedPiece.PieceType of
    'Pawn': begin
      inc(PlayerScoreInteger);
      PieceCountersL[Pawn].Caption:=inttostr(strtoint(PieceCountersL[Pawn].Caption)-1);
    end;
    'Rook': begin
      inc(PlayerScoreInteger, 5);
      PieceCountersL[Rook].Caption:=inttostr(strtoint(PieceCountersL[Rook].Caption)-1);
    end;
    'Knight': begin
      inc(PlayerScoreInteger, 3);
      PieceCountersL[Knight].Caption:=inttostr(strtoint(PieceCountersL[Knight].Caption)-1);
    end;
    'Bishop': begin
      inc(PlayerScoreInteger, 3);
      PieceCountersL[Bishop].Caption:=inttostr(strtoint(PieceCountersL[Bishop].Caption)-1);
    end;
    'Queen': begin
      inc(PlayerScoreInteger, 9);
      PieceCountersL[Queen].Caption:=inttostr(strtoint(PieceCountersL[Queen].Caption)-1);
    end;
    'King': case Turn of
      'White': if not ((QueenBlackType='Blue') and (GameF.QueenBlackCounterL.Caption='1')) then begin
        GameF.SurrenderWhite.Visible:=False;
        GameF.MessageA.Font.Color:=clWhite;
        GameF.MessageA.Caption:=GameF.Player1gName.Caption;
        GameF.Victory();
        for i:=0 to 4 do PreviousMovement[i].Visible:=False;
      end
      else begin
        GameF.QueenBlack.PieceType:='King';
        GameF.QueenBlack.Picture:=GameF.Player2Portrait.Picture;
        GameF.QueenBlackCounterL.Caption:='0';
        inc(PlayerScoreInteger, 9);
      end;
      'Black': if not ((QueenWhiteType='Blue') and (GameF.QueenWhiteCounterL.Caption='1')) then begin
        GameF.SurrenderBlack.Visible:=False;
        GameF.MessageA.Font.Color:=clSilver;
        GameF.MessageA.Caption:=GameF.Player2gName.Caption;
        GameF.Victory();
        for i:=0 to 4 do PreviousMovement[i].Visible:=False;
      end
      else begin
        GameF.QueenWhite.PieceType:='King';
        GameF.QueenWhite.Picture:=GameF.Player1Portrait.Picture;
        GameF.QueenWhiteCounterL.Caption:='0';
        inc(PlayerScoreInteger, 9);
      end;
    end;
  end;
  if PlayerScoreInteger=1 then PlayerScorePanel.Caption:=inttostr(PlayerScoreInteger)+' Point'
                          else PlayerScorePanel.Caption:=inttostr(PlayerScoreInteger)+' Points';
end;

procedure CreateEnPassant(Sender: TChessPosition);
begin
  //check for what piece is selected
  if gSelectedPiece.PieceType='Pawn' then begin
    case gSelectedPiece.PieceOwner of
      'White': begin
        //if white pawn used special move then create EnPassant
        if (gSelectedPiece.Left=Sender.Left-150) AND (PawnWhiteType<>'Red') then begin
          GameF.EnPassant.Left:=Sender.Left-75;
          GameF.EnPassant.Top:=Sender.Top;
          exit;
        end;
      end;
      'Black': begin
        //if black pawn used special move then create EnPassant
        if (gSelectedPiece.Left=Sender.Left+150) AND (PawnBlackType<>'Red') then begin
          GameF.EnPassant.Left:=Sender.Left+75;
          GameF.EnPassant.Top:=Sender.Top;
          exit;
        end;
      end;
    end;
  end;
  //remove EnPassant
  GameF.EnPassant.Left:=0;
  GameF.EnPassant.Top:=0;
end;

procedure PieceMovement(Sender: TChessPosition);
begin
  gSelectedPiece.AnchorSide[akTop].Control:=Sender;
  gSelectedPiece.AnchorSide[akLeft].Control:=Sender;
  gSelectedPiece.PieceHasMoved:=True;
end;

procedure PawnPromotion();
var
  i: byte;
begin
  //check if pawn has reached the end of the board
  for i:=0 to 8 do begin
    //white pawn promotion
    if (WhitePawns[i].Left=GameF.Chessboard.Left+525) AND (WhitePawns[i].PieceType='Pawn') then begin
      GameF.PromotionsShow();
      exit;
    end;
    if (BlackPawns[i].Left=GameF.Chessboard.Left) AND (BlackPawns[i].PieceType='Pawn') then begin
      //black pawn promotion
      GameF.PromotionsShow();
      exit;
    end;
  end;
end;

procedure EndTurn();
begin
  case Turn of
    'White': GameF.BlackTurn();
    'Black': GameF.WhiteTurn();
  end;
end;

end.

