unit CustomObjects;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ExtCtrls;

type TImage = class(TCustomImage)
published
  property Align;
  property Anchors;
  property AutoSize;
  property BorderSpacing;
  property Center;
  property Constraints;
  property DragCursor;
  property DragMode;
  property Enabled;
  property OnChangeBounds;
  property OnClick;
  property OnDblClick;
  property OnDragDrop;
  property OnDragOver;
  property OnEndDrag;
  property OnMouseDown;
  property OnMouseEnter;
  property OnMouseLeave;
  property OnMouseMove;
  property OnMouseUp;
  property OnMouseWheel;
  property OnMouseWheelDown;
  property OnMouseWheelUp;
  property OnPaint;
  property OnPictureChanged;
  property OnResize;
  property OnStartDrag;
  property ParentShowHint;
  property Picture;
  property PopupMenu;
  property Proportional;
  property ShowHint;
  property Stretch;
  property Transparent;
  property Visible;
end;

implementation

end.

