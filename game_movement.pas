unit Game_Movement;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ExtCtrls, ChessPosition, ChessPiece;

//basic movement
procedure Move(tiles, horizontal, vertical, horizontalDirection, verticalDirection: shortint; jumpType: shortstring);
procedure Attack(tiles, horizontal, vertical, horizontalDirection, verticalDirection: shortint; jumpType: shortstring);
procedure AttackMove(tiles, horizontal, vertical, horizontalDirection, verticalDirection: shortint; jumpType: shortstring);
//advanced movement
procedure PawnMove(horizontalDirection: shortint);
//movement subprocedures and subfunctions
function FindPieceFromArray(SearchedArray: array of TChessPiece; horizontal, vertical: longint): boolean;
function FindPiece(SearchedPiece: TChessPiece; horizontal, vertical: longint): boolean;
function FindPosition(horizontal, vertical: longint): boolean;
procedure CreateMovement(usedPosition: TChessPosition; usedPicture: TImage; usedMovement: shortstring);
//movement sets
procedure PawnWhiteClassic();
procedure PawnBlackClassic();
procedure RookClassic(jumpType: shortstring);
procedure KnightClassic();
procedure BishopClassic(jumpType: shortstring);
procedure QueenClassic(jumpType: shortstring);
procedure KingClassic();

var
  FoundPosition: TChessPosition;
  FoundPiece: TChessPiece;

implementation

uses
  Game, Collection;

//BASIC MOVEMENT

procedure Move(tiles, horizontal, vertical, horizontalDirection, verticalDirection: shortint; jumpType: shortstring);
var
  i: shortint;
begin
  //repetition
  for i:=1 to tiles do begin
    //move
    if FindPieceFromArray(AllPieces, gSelectedPiece.Left+75*(horizontal+(i-1)*horizontalDirection), gSelectedPiece.Top+75*(vertical+(i-1)*verticalDirection))=false then
      if FindPosition(gSelectedPiece.Left+75*(horizontal+(i-1)*horizontalDirection), gSelectedPiece.Top+75*(vertical+(i-1)*verticalDirection))=true then
        CreateMovement(FoundPosition, CollectionF.Move, '')
      else break
    else if not ((jumpType='all') or ((jumpType='enemy') and (FoundPiece.PieceOwner<>gSelectedPiece.PieceOwner))
    or ((jumpType='ally') and (FoundPiece.PieceOwner=gSelectedPiece.PieceOwner))) then break;
  end;
end;

procedure Attack(tiles, horizontal, vertical, horizontalDirection, verticalDirection: shortint; jumpType: shortstring);
var
  AttackedPieces, DefendedPieces: array[0..16] of TChessPiece;
  i: byte;
begin
  //player check
  case Turn of
    'White': begin
      AttackedPieces:=BlackPieces;
      DefendedPieces:=WhitePieces;
    end;
    'Black': begin
      AttackedPieces:=WhitePieces;
      DefendedPieces:=BlackPieces;
    end;
  end;
  //repetition
  for i:=1 to tiles do begin
    //attack
    if FindPieceFromArray(AttackedPieces, gSelectedPiece.Left+75*(horizontal+(i-1)*horizontalDirection), gSelectedPiece.Top+75*(vertical+(i-1)*verticalDirection))=true then begin
      FindPosition(gSelectedPiece.Left+75*(horizontal+(i-1)*horizontalDirection), gSelectedPiece.Top+75*(vertical+(i-1)*verticalDirection));
      CreateMovement(FoundPosition, CollectionF.Attack, 'Attack');
      if not ((jumpType='enemy') or (jumpType='all')) then break;
    end
    //check for blockers
    else if not ((jumpType='ally') or (jumpType='all')) then
      if FindPieceFromArray(DefendedPieces, gSelectedPiece.Left+75*(horizontal+(i-1)*horizontalDirection), gSelectedPiece.Top+75*(vertical+(i-1)*verticalDirection))=true then break;
  end;
end;

procedure AttackMove(tiles, horizontal, vertical, horizontalDirection, verticalDirection: shortint; jumpType: shortstring);
var
  AttackedPieces, DefendedPieces: array[0..16] of TChessPiece;
  i: byte;
begin
  //player check
  case Turn of
    'White': begin
      AttackedPieces:=BlackPieces;
      DefendedPieces:=WhitePieces;
    end;
    'Black': begin
      AttackedPieces:=WhitePieces;
      DefendedPieces:=BlackPieces;
    end;
  end;
  //repetition
  for i:=1 to tiles do begin
    //attack
    if FindPieceFromArray(AttackedPieces, gSelectedPiece.Left+75*(horizontal+(i-1)*horizontalDirection), gSelectedPiece.Top+75*(vertical+(i-1)*verticalDirection))=true then begin
      FindPosition(gSelectedPiece.Left+75*(horizontal+(i-1)*horizontalDirection), gSelectedPiece.Top+75*(vertical+(i-1)*verticalDirection));
      CreateMovement(FoundPosition, CollectionF.Attack, 'Attack');
      if not ((jumpType='enemy') or (jumpType='all')) then break;
    end
    //move
    else begin
      if FindPieceFromArray(DefendedPieces, gSelectedPiece.Left+75*(horizontal+(i-1)*horizontalDirection), gSelectedPiece.Top+75*(vertical+(i-1)*verticalDirection))=false then
        if FindPosition(gSelectedPiece.Left+75*(horizontal+(i-1)*horizontalDirection), gSelectedPiece.Top+75*(vertical+(i-1)*verticalDirection))=true then
          CreateMovement(FoundPosition, CollectionF.Move, '')
        else break
      else if not ((jumpType='ally') or (jumpType='all')) then break;
    end;
  end;
end;

//ADVANCED MOVEMENT

procedure PawnMove(horizontalDirection: shortint);
var
  i: byte;
begin
  for i:=1 to 2 do begin
    //1st move check
    if (i=1) or (gSelectedPiece.PieceHasMoved=False)  then begin
      //move or special move
      if FindPieceFromArray(AllPieces, gSelectedPiece.Left+i*horizontalDirection*75, gSelectedPiece.Top)=false then
        if FindPosition(gSelectedPiece.Left+i*horizontalDirection*75, gSelectedPiece.Top)=true then begin
          case i of
            1: CreateMovement(FoundPosition, CollectionF.Move, '');
            2: CreateMovement(FoundPosition, CollectionF.SpecialMove, '');
          end;
        end
        else break
      else break;
    end;
  end;
end;

//MOVEMENT SUBPROCEDURES and SUBFUNCTIONS

function FindPieceFromArray(SearchedArray: array of TChessPiece; horizontal, vertical: longint): boolean;
var
  ArrayLength, i: byte;
begin
  ArrayLength:=length(SearchedArray);
  if ArrayLength=17 then if not (gSelectedPiece.PieceType='Pawn') then ArrayLength:=16;
  for i:=0 to ArrayLength-1 do begin
    if (SearchedArray[i].Left=horizontal) and (SearchedArray[i].Top=vertical) then begin
      FoundPiece:=SearchedArray[i];
      FindPieceFromArray:=true;
      exit;
    end;
  end;
  FindPieceFromArray:=false;
end;

function FindPiece(SearchedPiece: TChessPiece; horizontal, vertical: integer): boolean;
begin
  if (SearchedPiece.Left=horizontal) and (SearchedPiece.Top=vertical) then FindPiece:=true
                                                                      else FindPiece:=false;
end;

function FindPosition(horizontal, vertical: longint): boolean;
var
  i: byte;
begin
  for i:=0 to 63 do if (horizontal=gBoard[i].Left) and (vertical=gBoard[i].Top) then begin
    FoundPosition:=gBoard[i];
    FindPosition:=true;
    exit;
  end
  else FindPosition:=false;
end;

procedure CreateMovement(usedPosition: TChessPosition; usedPicture: TImage; usedMovement: shortstring);
begin
  usedPosition.Picture:=usedPicture.Picture;
  usedPosition.Enabled:=true;
  usedPosition.PositionMovement:=usedMovement;
end;

//MOVEMENT SETS

procedure PawnWhiteClassic();
begin
  Game_Movement.PawnMove(1);
  Game_Movement.Attack(1, 1, -1, 0, 0, 'none');
  Game_Movement.Attack(1, 1, 1, 0, 0, 'none');
end;

procedure PawnBlackClassic();
begin
  Game_Movement.PawnMove(-1);
  Game_Movement.Attack(1, -1, -1, 0, 0, 'none');
  Game_Movement.Attack(1, -1, 1, 0, 0, 'none');
end;

procedure RookClassic(jumpType: shortstring);
begin
  Game_Movement.AttackMove(7, -1, 0, -1, 0, jumpType);
  Game_Movement.AttackMove(7, 0, -1, 0, -1, jumpType);
  Game_Movement.AttackMove(7, 0, 1, 0, 1, jumpType);
  Game_Movement.AttackMove(7, 1, 0, 1, 0, jumpType);
end;

procedure KnightClassic();
begin
  Game_Movement.AttackMove(1, -2, -1, 0, 0, 'none');
  Game_Movement.AttackMove(1, -2, 1, 0, 0, 'none');
  Game_Movement.AttackMove(1, -1, -2, 0, 0, 'none');
  Game_Movement.AttackMove(1, -1, 2, 0, 0, 'none');
  Game_Movement.AttackMove(1, 1, -2, 0, 0, 'none');
  Game_Movement.AttackMove(1, 1, 2, 0, 0, 'none');
  Game_Movement.AttackMove(1, 2, -1, 0, 0, 'none');
  Game_Movement.AttackMove(1, 2, 1, 0, 0, 'none');
end;

procedure BishopClassic(jumpType: shortstring);
begin
  Game_Movement.AttackMove(7, -1, -1, -1, -1, jumpType);
  Game_Movement.AttackMove(7, -1, 1, -1, 1, jumpType);
  Game_Movement.AttackMove(7, 1, -1, 1, -1, jumpType);
  Game_Movement.AttackMove(7, 1, 1, 1, 1, jumpType);
end;

procedure KingClassic();
begin
  Game_Movement.AttackMove(1, -1, -1, -1, -1, 'none');
  Game_Movement.AttackMove(1, -1, 0, -1, 0, 'none');
  Game_Movement.AttackMove(1, -1, 1, -1, 1, 'none');
  Game_Movement.AttackMove(1, 0, -1, 0, -1, 'none');
  Game_Movement.AttackMove(1, 0, 1, 0, 1, 'none');
  Game_Movement.AttackMove(1, 1, -1, 1, -1, 'none');
  Game_Movement.AttackMove(1, 1, 0, 1, 0, 'none');
  Game_Movement.AttackMove(1, 1, 1, 1, 1, 'none');
end;

procedure QueenClassic(jumpType: shortstring);
begin
  RookClassic(jumpType);
  BishopClassic(jumpType);
end;

end.

