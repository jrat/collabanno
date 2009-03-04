package
{
	import flash.display.*;
	import flash.events.*;
	import flash.text.*
//  import DynTextBox;

	public class CircleOrange extends MovieClip
	{
  	var xpos:Number = 0;
  	var ypos:Number = 0;
//  	var noteText:String = "";
//    var dynTextBox:DynTextBox = new DynTextBox();
    var dynTextBox:TextField = new TextField();

  	public function CircleOrange():void
  	{
    	this.addEventListener(MouseEvent.MOUSE_UP, toggle_display_note);

      var format:TextFormat = new TextFormat();
      format.font = "Helvetica";
/*      format.bold = true;*/
      format.color = 0x161616;
      format.size = 14;
      dynTextBox.defaultTextFormat = format;
    	dynTextBox.background = true;
    	dynTextBox.border = true;
    	dynTextBox.borderColor = 0xae3510;
    	dynTextBox.wordWrap = true;
    	dynTextBox.visible = false;
    	dynTextBox.autoSize = TextFieldAutoSize.CENTER;
    	dynTextBox.width = 250;
  	}
    public function set_pos(_xpos:Number, _ypos:Number):void
    {
      xpos = _xpos;
      ypos = _ypos;
//      dynTextBox.set_pos(_xpos, _ypos);
      dynTextBox.x = 900;
      dynTextBox.y = _ypos;
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
//      noteText = _noteText;
//      dynTextBox.set_text(_noteText);
      dynTextBox.text = _noteText;
  	}
  	public function get_noteText():String
  	{
      return(dynTextBox.text);
  	}

    //If the note is hidden, we'll display it. Otherwise, we'll hide it
  	function toggle_display_note(Event:MouseEvent):void
  	{
  	  if(!dynTextBox.visible)
  	  {
        MovieClip(this.parent).addChild(dynTextBox);
        //dynTextBox.show_dynTextBox();
        dynTextBox.visible = true;
  	  }
  	  else
  	    dynTextBox.visible = false;
  	}
	}
}