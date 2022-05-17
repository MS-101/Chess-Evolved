unit ChessPosition;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type
  TChessPosition = class(TImage)
  private
    GetPositionMovement: shortstring;
    GetPositionIsChecked: boolean;
    procedure SetPositionMovement(AValue: shortstring);
    procedure SetPositionIsChecked(AValue: boolean);
  public

  published
    property PositionMovement: shortstring read GetPositionMovement write SetPositionMovement;
    property PositionIsChecked: boolean read GetPositionIsChecked write SetPositionIsChecked;
  end;

procedure Register;

implementation

procedure TChessPosition.SetPositionMovement(AValue: shortstring);
begin
  if GetPositionMovement=AValue then Exit;
  GetPositionMovement:=AValue;
end;

procedure TChessPosition.SetPositionIsChecked(AValue: boolean);
begin
  if GetPositionIsChecked=AValue then Exit;
  GetPositionIsChecked:=AValue;
end;

procedure Register;
begin
  {$I chessposition_icon.lrs}
  RegisterComponents('Chess',[TChessPosition]);
end;

end.
