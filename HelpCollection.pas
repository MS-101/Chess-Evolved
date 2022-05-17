unit HelpCollection;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, ExtCtrls, Graphics;

procedure CreateChessBoard(varChessBoard: TImage);
//PAWN
procedure PawnWhiteClassic(UsedForm: TForm);
procedure PawnWhiteRed(UsedForm: TForm);
procedure PawnWhiteBlue(UsedForm: TForm);
procedure PawnWhiteYellow(UsedForm: TForm);
procedure PawnBlackClassic(UsedForm: TForm);
procedure PawnBlackRed(UsedForm: TForm);
procedure PawnBlackBlue(UsedForm: TForm);
procedure PawnBlackYellow(UsedForm: TForm);
//ROOK
procedure RookClassic(UsedForm: TForm);
procedure RookRed(UsedForm: TForm);
procedure RookBlue(UsedForm: TForm);
procedure RookYellow(UsedForm: TForm);
//KNIGHT
procedure KnightClassic(UsedForm: TForm);
procedure KnightRed(UsedForm: TForm);
procedure KnightBlue(UsedForm: TForm);
procedure KnightYellow(UsedForm: TForm);
//BISHOP
procedure BishopClassic(UsedForm: TForm);
procedure BishopRed(UsedForm: TForm);
procedure BishopBlue(UsedForm: TForm);
procedure BishopYellow(UsedForm: TForm);
//QUEEN
procedure QueenClassic(UsedForm: TForm);
procedure QueenRed(UsedForm: TForm);
procedure QueenBlue(UsedForm: TForm);
procedure QueenYellow(UsedForm: TForm);
//KING
procedure KingClassic(UsedForm: TForm);
procedure KingRed(UsedForm: TForm);
procedure KingBlue(UsedForm: TForm);
procedure KingYellow(UsedForm: TForm);

implementation

uses
  Collection, Help;

procedure CreateChessBoard(varChessBoard: TImage);
var
  i, y: byte;
begin
  varChessBoard.canvas.brush.color:=clwhite;
  for y:=1 to 7 do begin
    for i:=1 to 7 do begin
      if y mod 2=0 then begin
        varChessBoard.canvas.brush.color:=clwhite;
        if not i mod 2=0 then varChessBoard.canvas.brush.color:=clblack;
      end
      else if i mod 2=0 then varChessBoard.canvas.brush.color:=clblack
      else varChessBoard.canvas.brush.color:=clwhite;
      varChessBoard.canvas.rectangle(0+(i-1)*60,0+(y-1)*60,60+(i-1)*60,60+(y-1)*60);
    end;
  end;
end;

//PAWN

procedure PawnWhiteClassic(UsedForm: TForm);
begin
  if UsedForm=CollectionF then begin
    CollectionF.C5.Picture:=CollectionF.Attack.Picture;
    CollectionF.D5.Picture:=CollectionF.Move.Picture;
    CollectionF.D6.Picture:=CollectionF.SpecialMove.Picture;
    CollectionF.E5.Picture:=CollectionF.Attack.Picture;
  end
  else begin
    HelpF.C5.Picture:=CollectionF.Attack.Picture;
    HelpF.D5.Picture:=CollectionF.Move.Picture;
    HelpF.D6.Picture:=CollectionF.SpecialMove.Picture;
    HelpF.E5.Picture:=CollectionF.Attack.Picture;
  end;
end;

procedure PawnWhiteRed(UsedForm: TForm);
begin
  if UsedForm=CollectionF then begin
    CollectionF.C5.Picture:=CollectionF.AttackOrMove.Picture;
    CollectionF.D5.Picture:=CollectionF.Move.Picture;
    CollectionF.D6.Picture:=CollectionF.Move.Picture;
    CollectionF.E5.Picture:=CollectionF.AttackOrMove.Picture;
  end
  else begin
    HelpF.C5.Picture:=CollectionF.AttackOrMove.Picture;
    HelpF.D5.Picture:=CollectionF.Move.Picture;
    HelpF.D6.Picture:=CollectionF.Move.Picture;
    HelpF.E5.Picture:=CollectionF.AttackOrMove.Picture;
  end;
end;

procedure PawnWhiteBlue(UsedForm: TForm);
begin
  PawnWhiteClassic(UsedForm);
  if UsedForm=CollectionF then begin
    CollectionF.C3.Picture:=CollectionF.Attack.Picture;
    CollectionF.D3.Picture:=CollectionF.Move.Picture;
    CollectionF.E3.Picture:=CollectionF.Attack.Picture;
  end
  else begin
    HelpF.C3.Picture:=CollectionF.Attack.Picture;
    HelpF.D3.Picture:=CollectionF.Move.Picture;
    HelpF.E3.Picture:=CollectionF.Attack.Picture;
  end;
end;

procedure PawnWhiteYellow(UsedForm: TForm);
begin
  PawnWhiteClassic(UsedForm);
  if UsedForm=CollectionF then begin
    CollectionF.C3.Picture:=CollectionF.Move.Picture;
    CollectionF.C4.Picture:=CollectionF.Move.Picture;
    CollectionF.D3.Picture:=CollectionF.Move.Picture;
    CollectionF.E3.Picture:=CollectionF.Move.Picture;
    CollectionF.E4.Picture:=CollectionF.Move.Picture;
  end
  else begin
    HelpF.C3.Picture:=CollectionF.Move.Picture;
    HelpF.C4.Picture:=CollectionF.Move.Picture;
    HelpF.D3.Picture:=CollectionF.Move.Picture;
    HelpF.E3.Picture:=CollectionF.Move.Picture;
    HelpF.E4.Picture:=CollectionF.Move.Picture;
  end;
end;

procedure PawnBlackClassic(UsedForm: TForm);
begin
  if UsedForm=CollectionF then begin
    CollectionF.C3.Picture:=CollectionF.Attack.Picture;
    CollectionF.D2.Picture:=CollectionF.SpecialMove.Picture;
    CollectionF.D3.Picture:=CollectionF.Move.Picture;
    CollectionF.E3.Picture:=CollectionF.Attack.Picture;
  end
  else begin
    HelpF.C3.Picture:=CollectionF.Attack.Picture;
    HelpF.D2.Picture:=CollectionF.SpecialMove.Picture;
    HelpF.D3.Picture:=CollectionF.Move.Picture;
    HelpF.E3.Picture:=CollectionF.Attack.Picture;
  end;
end;

procedure PawnBlackRed(UsedForm: TForm);
begin
  if UsedForm=CollectionF then begin
    CollectionF.C3.Picture:=CollectionF.AttackOrMove.Picture;
    CollectionF.D2.Picture:=CollectionF.Move.Picture;
    CollectionF.D3.Picture:=CollectionF.Move.Picture;
    CollectionF.E3.Picture:=CollectionF.AttackOrMove.Picture;
  end
  else begin
    HelpF.C3.Picture:=CollectionF.AttackOrMove.Picture;
    HelpF.D2.Picture:=CollectionF.Move.Picture;
    HelpF.D3.Picture:=CollectionF.Move.Picture;
    HelpF.E3.Picture:=CollectionF.AttackOrMove.Picture;
  end;
end;

procedure PawnBlackBlue(UsedForm: TForm);
begin
  PawnBlackClassic(UsedForm);
  if UsedForm=CollectionF then begin
    CollectionF.C5.Picture:=CollectionF.Attack.Picture;
    CollectionF.D5.Picture:=CollectionF.Move.Picture;
    CollectionF.E5.Picture:=CollectionF.Attack.Picture;
  end
  else begin
    HelpF.C5.Picture:=CollectionF.Attack.Picture;
    HelpF.D5.Picture:=CollectionF.Move.Picture;
    HelpF.E5.Picture:=CollectionF.Attack.Picture;
  end;
end;

procedure PawnBlackYellow(UsedForm: TForm);
begin
  PawnBlackClassic(UsedForm);
  if UsedForm=CollectionF then begin
    CollectionF.C4.Picture:=CollectionF.Move.Picture;
    CollectionF.C5.Picture:=CollectionF.Move.Picture;
    CollectionF.D5.Picture:=CollectionF.Move.Picture;
    CollectionF.E4.Picture:=CollectionF.Move.Picture;
    CollectionF.E5.Picture:=CollectionF.Move.Picture;
  end
  else begin
    HelpF.C4.Picture:=CollectionF.Move.Picture;
    HelpF.C5.Picture:=CollectionF.Move.Picture;
    HelpF.D5.Picture:=CollectionF.Move.Picture;
    HelpF.E4.Picture:=CollectionF.Move.Picture;
    HelpF.E5.Picture:=CollectionF.Move.Picture;
  end;
end;

//ROOK

procedure RookClassic(UsedForm: TForm);
begin
  if UsedForm=CollectionF then begin
    CollectionF.A4.Picture:=CollectionF.AttackOrMoveUnlimited.Picture;
    CollectionF.B4.Picture:=CollectionF.AttackOrMove.Picture;
    CollectionF.C4.Picture:=CollectionF.AttackOrMove.Picture;
    CollectionF.D1.Picture:=CollectionF.AttackOrMoveUnlimited.Picture;
    CollectionF.D2.Picture:=CollectionF.AttackOrMove.Picture;
    CollectionF.D3.Picture:=CollectionF.AttackOrMove.Picture;
    CollectionF.D5.Picture:=CollectionF.AttackOrMove.Picture;
    CollectionF.D6.Picture:=CollectionF.AttackOrMove.Picture;
    CollectionF.D7.Picture:=CollectionF.AttackOrMoveUnlimited.Picture;
    CollectionF.E4.Picture:=CollectionF.AttackOrMove.Picture;
    CollectionF.F4.Picture:=CollectionF.AttackOrMove.Picture;
    CollectionF.G4.Picture:=CollectionF.AttackOrMoveUnlimited.Picture;
  end
  else begin
    HelpF.A4.Picture:=CollectionF.AttackOrMoveUnlimited.Picture;
    HelpF.B4.Picture:=CollectionF.AttackOrMove.Picture;
    HelpF.C4.Picture:=CollectionF.AttackOrMove.Picture;
    HelpF.D1.Picture:=CollectionF.AttackOrMoveUnlimited.Picture;
    HelpF.D2.Picture:=CollectionF.AttackOrMove.Picture;
    HelpF.D3.Picture:=CollectionF.AttackOrMove.Picture;
    HelpF.D5.Picture:=CollectionF.AttackOrMove.Picture;
    HelpF.D6.Picture:=CollectionF.AttackOrMove.Picture;
    HelpF.D7.Picture:=CollectionF.AttackOrMoveUnlimited.Picture;
    HelpF.E4.Picture:=CollectionF.AttackOrMove.Picture;
    HelpF.F4.Picture:=CollectionF.AttackOrMove.Picture;
    HelpF.G4.Picture:=CollectionF.AttackOrMoveUnlimited.Picture;
  end;
end;

procedure RookRed(UsedForm: TForm);
begin
  RookClassic(UsedForm);
end;

procedure RookBlue(UsedForm: TForm);
begin
  RookClassic(UsedForm);
  if UsedForm=CollectionF then begin
    CollectionF.C3.Picture:=CollectionF.AttackOrMove.Picture;
    CollectionF.C5.Picture:=CollectionF.AttackOrMove.Picture;
    CollectionF.E3.Picture:=CollectionF.AttackOrMove.Picture;
    CollectionF.E5.Picture:=CollectionF.AttackOrMove.Picture;
  end
  else begin
    HelpF.C3.Picture:=CollectionF.AttackOrMove.Picture;
    HelpF.C5.Picture:=CollectionF.AttackOrMove.Picture;
    HelpF.E3.Picture:=CollectionF.AttackOrMove.Picture;
    HelpF.E5.Picture:=CollectionF.AttackOrMove.Picture;
  end;
end;

procedure RookYellow(UsedForm: TForm);
begin
  RookClassic(UsedForm);
  KnightClassic(UsedForm);
end;

//KNIGHT

procedure KnightClassic(UsedForm: TForm);
begin
  if UsedForm=CollectionF then begin
    CollectionF.B3.Picture:=CollectionF.JumpAttackOrMove.Picture;
    CollectionF.B5.Picture:=CollectionF.JumpAttackOrMove.Picture;
    CollectionF.C2.Picture:=CollectionF.JumpAttackOrMove.Picture;
    CollectionF.C6.Picture:=CollectionF.JumpAttackOrMove.Picture;
    CollectionF.E2.Picture:=CollectionF.JumpAttackOrMove.Picture;
    CollectionF.E6.Picture:=CollectionF.JumpAttackOrMove.Picture;
    CollectionF.F3.Picture:=CollectionF.JumpAttackOrMove.Picture;
    CollectionF.F5.Picture:=CollectionF.JumpAttackOrMove.Picture;
  end
  else begin
    HelpF.B3.Picture:=CollectionF.JumpAttackOrMove.Picture;
    HelpF.B5.Picture:=CollectionF.JumpAttackOrMove.Picture;
    HelpF.C2.Picture:=CollectionF.JumpAttackOrMove.Picture;
    HelpF.C6.Picture:=CollectionF.JumpAttackOrMove.Picture;
    HelpF.E2.Picture:=CollectionF.JumpAttackOrMove.Picture;
    HelpF.E6.Picture:=CollectionF.JumpAttackOrMove.Picture;
    HelpF.F3.Picture:=CollectionF.JumpAttackOrMove.Picture;
    HelpF.F5.Picture:=CollectionF.JumpAttackOrMove.Picture;
  end;
end;

procedure KnightRed(UsedForm: TForm);
begin
  if UsedForm=CollectionF then begin
    CollectionF.A1.Picture:=CollectionF.JumpAttackOrMove.Picture;
    CollectionF.A4.Picture:=CollectionF.JumpAttackOrMove.Picture;
    CollectionF.A7.Picture:=CollectionF.JumpAttackOrMove.Picture;
    CollectionF.B2.Picture:=CollectionF.JumpAttackOrMove.Picture;
    CollectionF.B4.Picture:=CollectionF.JumpAttackOrMove.Picture;
    CollectionF.B6.Picture:=CollectionF.JumpAttackOrMove.Picture;
    CollectionF.D1.Picture:=CollectionF.JumpAttackOrMove.Picture;
    CollectionF.D2.Picture:=CollectionF.JumpAttackOrMove.Picture;
    CollectionF.D6.Picture:=CollectionF.JumpAttackOrMove.Picture;
    CollectionF.D7.Picture:=CollectionF.JumpAttackOrMove.Picture;
    CollectionF.F2.Picture:=CollectionF.JumpAttackOrMove.Picture;
    CollectionF.F4.Picture:=CollectionF.JumpAttackOrMove.Picture;
    CollectionF.F6.Picture:=CollectionF.JumpAttackOrMove.Picture;
    CollectionF.G1.Picture:=CollectionF.JumpAttackOrMove.Picture;
    CollectionF.G4.Picture:=CollectionF.JumpAttackOrMove.Picture;
    CollectionF.G7.Picture:=CollectionF.JumpAttackOrMove.Picture;
  end
  else begin
    HelpF.A1.Picture:=CollectionF.JumpAttackOrMove.Picture;
    HelpF.A4.Picture:=CollectionF.JumpAttackOrMove.Picture;
    HelpF.A7.Picture:=CollectionF.JumpAttackOrMove.Picture;
    HelpF.B2.Picture:=CollectionF.JumpAttackOrMove.Picture;
    HelpF.B4.Picture:=CollectionF.JumpAttackOrMove.Picture;
    HelpF.B6.Picture:=CollectionF.JumpAttackOrMove.Picture;
    HelpF.D1.Picture:=CollectionF.JumpAttackOrMove.Picture;
    HelpF.D2.Picture:=CollectionF.JumpAttackOrMove.Picture;
    HelpF.D6.Picture:=CollectionF.JumpAttackOrMove.Picture;
    HelpF.D7.Picture:=CollectionF.JumpAttackOrMove.Picture;
    HelpF.F2.Picture:=CollectionF.JumpAttackOrMove.Picture;
    HelpF.F4.Picture:=CollectionF.JumpAttackOrMove.Picture;
    HelpF.F6.Picture:=CollectionF.JumpAttackOrMove.Picture;
    HelpF.G1.Picture:=CollectionF.JumpAttackOrMove.Picture;
    HelpF.G4.Picture:=CollectionF.JumpAttackOrMove.Picture;
    HelpF.G7.Picture:=CollectionF.JumpAttackOrMove.Picture;
  end;
end;

procedure KnightBlue(UsedForm: TForm);
begin
  KingClassic(UsedForm);
  if UsedForm=CollectionF then begin
    CollectionF.B2.Picture:=CollectionF.JumpAttackOrMove.Picture;
    CollectionF.B4.Picture:=CollectionF.JumpAttackOrMove.Picture;
    CollectionF.B6.Picture:=CollectionF.JumpAttackOrMove.Picture;
    CollectionF.D2.Picture:=CollectionF.JumpAttackOrMove.Picture;
    CollectionF.D6.Picture:=CollectionF.JumpAttackOrMove.Picture;
    CollectionF.F2.Picture:=CollectionF.JumpAttackOrMove.Picture;
    CollectionF.F4.Picture:=CollectionF.JumpAttackOrMove.Picture;
    CollectionF.F6.Picture:=CollectionF.JumpAttackOrMove.Picture;
  end
  else begin
    HelpF.B2.Picture:=CollectionF.JumpAttackOrMove.Picture;
    HelpF.B4.Picture:=CollectionF.JumpAttackOrMove.Picture;
    HelpF.B6.Picture:=CollectionF.JumpAttackOrMove.Picture;
    HelpF.D2.Picture:=CollectionF.JumpAttackOrMove.Picture;
    HelpF.D6.Picture:=CollectionF.JumpAttackOrMove.Picture;
    HelpF.F2.Picture:=CollectionF.JumpAttackOrMove.Picture;
    HelpF.F4.Picture:=CollectionF.JumpAttackOrMove.Picture;
    HelpF.F6.Picture:=CollectionF.JumpAttackOrMove.Picture;
  end;
end;

procedure KnightYellow(UsedForm: TForm);
begin
  KnightClassic(UsedForm);
  if UsedForm=CollectionF then begin
    CollectionF.C3.Picture:=CollectionF.Move.Picture;
    CollectionF.C4.Picture:=CollectionF.Move.Picture;
    CollectionF.C5.Picture:=CollectionF.Move.Picture;
    CollectionF.D3.Picture:=CollectionF.Move.Picture;
    CollectionF.D5.Picture:=CollectionF.Move.Picture;
    CollectionF.E3.Picture:=CollectionF.Move.Picture;
    CollectionF.E4.Picture:=CollectionF.Move.Picture;
    CollectionF.E5.Picture:=CollectionF.Move.Picture;
    CollectionF.A4.Picture:=CollectionF.JumpAttackOrMove.Picture;
    CollectionF.D1.Picture:=CollectionF.JumpAttackOrMove.Picture;
    CollectionF.D7.Picture:=CollectionF.JumpAttackOrMove.Picture;
    CollectionF.G4.Picture:=CollectionF.JumpAttackOrMove.Picture;
  end
  else begin
    HelpF.C3.Picture:=CollectionF.Move.Picture;
    HelpF.C4.Picture:=CollectionF.Move.Picture;
    HelpF.C5.Picture:=CollectionF.Move.Picture;
    HelpF.D3.Picture:=CollectionF.Move.Picture;
    HelpF.D5.Picture:=CollectionF.Move.Picture;
    HelpF.E3.Picture:=CollectionF.Move.Picture;
    HelpF.E4.Picture:=CollectionF.Move.Picture;
    HelpF.E5.Picture:=CollectionF.Move.Picture;
    HelpF.A4.Picture:=CollectionF.JumpAttackOrMove.Picture;
    HelpF.D1.Picture:=CollectionF.JumpAttackOrMove.Picture;
    HelpF.D7.Picture:=CollectionF.JumpAttackOrMove.Picture;
    HelpF.G4.Picture:=CollectionF.JumpAttackOrMove.Picture;
  end;
end;

//BISHOP

procedure BishopClassic(UsedForm: TForm);
begin
  if UsedForm=CollectionF then begin
    CollectionF.A1.Picture:=CollectionF.AttackOrMoveUnlimited.Picture;
    CollectionF.A7.Picture:=CollectionF.AttackOrMoveUnlimited.Picture;
    CollectionF.B2.Picture:=CollectionF.AttackOrMove.Picture;
    CollectionF.B6.Picture:=CollectionF.AttackOrMove.Picture;
    CollectionF.C3.Picture:=CollectionF.AttackOrMove.Picture;
    CollectionF.C5.Picture:=CollectionF.AttackOrMove.Picture;
    CollectionF.E3.Picture:=CollectionF.AttackOrMove.Picture;
    CollectionF.E5.Picture:=CollectionF.AttackOrMove.Picture;
    CollectionF.F2.Picture:=CollectionF.AttackOrMove.Picture;
    CollectionF.F6.Picture:=CollectionF.AttackOrMove.Picture;
    CollectionF.G1.Picture:=CollectionF.AttackOrMoveUnlimited.Picture;
    CollectionF.G7.Picture:=CollectionF.AttackOrMoveUnlimited.Picture;
  end
  else begin
    HelpF.A1.Picture:=CollectionF.AttackOrMoveUnlimited.Picture;
    HelpF.A7.Picture:=CollectionF.AttackOrMoveUnlimited.Picture;
    HelpF.B2.Picture:=CollectionF.AttackOrMove.Picture;
    HelpF.B6.Picture:=CollectionF.AttackOrMove.Picture;
    HelpF.C3.Picture:=CollectionF.AttackOrMove.Picture;
    HelpF.C5.Picture:=CollectionF.AttackOrMove.Picture;
    HelpF.E3.Picture:=CollectionF.AttackOrMove.Picture;
    HelpF.E5.Picture:=CollectionF.AttackOrMove.Picture;
    HelpF.F2.Picture:=CollectionF.AttackOrMove.Picture;
    HelpF.F6.Picture:=CollectionF.AttackOrMove.Picture;
    HelpF.G1.Picture:=CollectionF.AttackOrMoveUnlimited.Picture;
    HelpF.G7.Picture:=CollectionF.AttackOrMoveUnlimited.Picture;
  end;
end;

procedure BishopRed(UsedForm: TForm);
begin
  BishopClassic(UsedForm);
end;

procedure BishopBlue(UsedForm: TForm);
begin
  BishopClassic(UsedForm);
  if UsedForm=CollectionF then begin
    CollectionF.C4.Picture:=CollectionF.AttackOrMove.Picture;
    CollectionF.D3.Picture:=CollectionF.AttackOrMove.Picture;
    CollectionF.D5.Picture:=CollectionF.AttackOrMove.Picture;
    CollectionF.E4.Picture:=CollectionF.AttackOrMove.Picture;
  end
  else begin
    HelpF.C4.Picture:=CollectionF.AttackOrMove.Picture;
    HelpF.D3.Picture:=CollectionF.AttackOrMove.Picture;
    HelpF.D5.Picture:=CollectionF.AttackOrMove.Picture;
    HelpF.E4.Picture:=CollectionF.AttackOrMove.Picture;
  end;
end;

procedure BishopYellow(UsedForm: TForm);
begin
  BishopClassic(UsedForm);
  KnightClassic(UsedForm);
end;

//QUEEN

procedure QueenClassic(UsedForm: TForm);
begin
  RookClassic(UsedForm);
  BishopClassic(UsedForm);
end;

procedure QueenRed(UsedForm: TForm);
begin
  QueenClassic(UsedForm);
end;

procedure QueenBlue(UsedForm: TForm);
begin
  QueenClassic(UsedForm);
end;

procedure QueenYellow(UsedForm: TForm);
begin
  QueenClassic(UsedForm);
  KnightClassic(UsedForm);
end;

//KING

procedure KingClassic(UsedForm: TForm);
begin
  if UsedForm=CollectionF then begin
    CollectionF.C3.Picture:=CollectionF.AttackOrMove.Picture;
    CollectionF.C4.Picture:=CollectionF.AttackOrMove.Picture;
    CollectionF.C5.Picture:=CollectionF.AttackOrMove.Picture;
    CollectionF.D3.Picture:=CollectionF.AttackOrMove.Picture;
    CollectionF.D5.Picture:=CollectionF.AttackOrMove.Picture;
    CollectionF.E3.Picture:=CollectionF.AttackOrMove.Picture;
    CollectionF.E4.Picture:=CollectionF.AttackOrMove.Picture;
    CollectionF.E5.Picture:=CollectionF.AttackOrMove.Picture;
  end
  else begin
    HelpF.C3.Picture:=CollectionF.AttackOrMove.Picture;
    HelpF.C4.Picture:=CollectionF.AttackOrMove.Picture;
    HelpF.C5.Picture:=CollectionF.AttackOrMove.Picture;
    HelpF.D3.Picture:=CollectionF.AttackOrMove.Picture;
    HelpF.D5.Picture:=CollectionF.AttackOrMove.Picture;
    HelpF.E3.Picture:=CollectionF.AttackOrMove.Picture;
    HelpF.E4.Picture:=CollectionF.AttackOrMove.Picture;
    HelpF.E5.Picture:=CollectionF.AttackOrMove.Picture;
  end;
end;

procedure KingRed(UsedForm: TForm);
begin
  KingClassic(UsedForm);
end;

procedure KingBlue(UsedForm: TForm);
begin
  KingClassic(UsedForm);
end;

procedure KingYellow(UsedForm: TForm);
begin
  KingClassic(UsedForm);
end;

end.

