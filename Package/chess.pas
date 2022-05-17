{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit Chess;

{$warn 5023 off : no warning about unused units}
interface

uses
  ChessPiece, ChessPosition, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('ChessPiece', @ChessPiece.Register);
  RegisterUnit('ChessPosition', @ChessPosition.Register);
end;

initialization
  RegisterPackage('Chess', @Register);
end.
