unit ChessPiece;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type
  TChessPiece = class(TImage)
  private
    GetPieceType: shortstring;
    GetPieceOwner: shortstring;
    GetPieceHasMoved: boolean;
    procedure SetPieceType(AValue: shortstring);
    procedure SetPieceOwner(AValue: shortstring);
    procedure SetPieceHasMoved(AValue: boolean);
  public

  published
    property PieceType: shortstring read GetPieceType write SetPieceType;
    property PieceOwner: shortstring read GetPieceOwner write SetPieceOwner;
    property PieceHasMoved: boolean read GetPieceHasMoved write SetPieceHasMoved;
  end;

procedure Register;

implementation

procedure TChessPiece.SetPieceType(AValue: shortstring);
begin
  if GetPieceType=AValue then Exit;
  GetPieceType:=AValue;
end;

procedure TChessPiece.SetPieceOwner(AValue: shortstring);
begin
  if GetPieceOwner=AValue then Exit;
  GetPieceOwner:=AValue;
end;

procedure TChessPiece.SetPieceHasMoved(AValue: boolean);
begin
  if GetPieceHasMoved=AValue then Exit;
  GetPieceHasMoved:=AValue;
end;

procedure Register;
begin
  {$I chesspiece_icon.lrs}
  RegisterComponents('Chess',[TChessPiece]);
end;


end.
