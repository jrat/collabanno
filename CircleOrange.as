package
{
	import flash.display.*;
	import flash.events.*;
	 
	public class CircleOrange extends MovieClip
	{
  	var xpos:Number = 0;
  	var ypos:Number = 0;
  	var noteText:String = "";

  	public function CircleOrange():void
  	{
    	this.addEventListener(MouseEvent.MOUSE_UP, toggle_display_note);
  	}
    public function set_pos(_xpos:Number, _ypos:Number):void
    {
      xpos = _xpos;
      ypos = _ypos;
    }
    public function set_xpos(_xpos:Number):void
    {
      xpos = _xpos;
    }

    public function get_xpos():Number
    {
      return(xpos);
    }

    public function set_ypos(_ypos:Number):void
    {
      ypos = _ypos;
    }

    public function get_ypos():Number
    {
      return(ypos);
    }

  	public function set_noteText(_noteText:String):void
  	{
      noteText = _noteText;
  	}

  	public function get_noteText():String
  	{
      return(noteText);
  	}

    //If the note is hidden, we'll display it. Otherwise, we'll hide it
  	function toggle_display_note(Event:MouseEvent):void
  	{
      trace("x, y" + xpos + ypos + " note: " + noteText);
  	}
	}
}