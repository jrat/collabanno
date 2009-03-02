package
{
	import flash.display.*;
	import flash.text.*;

  public class DynTextBox extends TextField
  {
    public function DynTextBox():void
    {
    }
    public function hide_dynTextBox():void
    {
      this.visible = false;
    }
    public function show_dynTextBox():void
    {
      this.visible = true;
    }
    public function set_text(_text:String):void
    {
      this.text = _text;
    }
    public function set_pos(_xpos:Number, _ypos:Number):void
    {
      this.x = _xpos;
      this.y = _ypos;
    }
  }
}