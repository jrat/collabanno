package
{
	import flash.display.*;
	import flash.events.*;
  import DynTextBox;

	public class CircleGreen extends MovieClip
	{
  	var xpos:Number = 0;
  	var ypos:Number = 0;
  	var noteText:String = "";
    var dynTextBox:DynTextBox = new DynTextBox();

  	public function CircleGreen():void
  	{
    	this.addEventListener(MouseEvent.MOUSE_UP, toggle_display_note);
  	}
    public function set_pos(_xpos:Number, _ypos:Number):void
    {
      xpos = _xpos;
      ypos = _ypos;
      dynTextBox.set_pos(_xpos, _ypos);
    }
    public function get_xpos():Number
    {
      return(xpos);
    }
    public function get_ypos():Number
    {
      return(ypos);
    }

  	public function set_noteText(_noteText:String):void
  	{
      noteText = _noteText;
      dynTextBox.set_text(_noteText);
  	}
  	public function get_noteText():String
  	{
      return(noteText);
  	}

    //If the note is hidden, we'll display it. Otherwise, we'll hide it
  	function toggle_display_note(Event:MouseEvent):void
  	{
      MovieClip(this.parent).addChild(dynTextBox);
      dynTextBox.show_dynTextBox();
  	}
	}
}