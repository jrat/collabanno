package
{
  import flash.display.*;
  import flash.text.*;

  public class DynTextBox extends TextField
  {
    var txtField:TextField = new TextField();

    public function DynTextBox():void
    {
/*      txtField.background(true);
      txtField.borderColor(0x1879BE);*/
    }
    public function hide_dynTextBox():void
    {
      txtField.visible = false;
    }
    public function show_dynTextBox():void
    {
      txtField.visible = true;
    }
    public function set_text(_text:String):void
    {
      txtField.text = _text;
    }
    public function set_pos(_xpos:Number, _ypos:Number):void
    {
      txtField.x = _xpos;
      txtField.y = _ypos;
    }
  }
}