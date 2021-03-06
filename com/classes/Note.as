//////////////Classes//////////////
//This class will be used in the list of notes added in this session.
package com.classes
{
  public class Note
  {
    private var username:String = "";
    private var note:String = "";
    private var ypos:Number = 0;
  	var colorBtn:String = "";
/*
    function Note():void
    {
      username = "";
      note = "";
      ypos = -1;
    }*/
    public function Note(_username:String, _colorBtn:String, _note:String, _ypos:Number):void
    {
      username = _username;
      colorBtn = _colorBtn;
      note = _note;
      ypos = _ypos;
    }
    public function set_username(_username:String):void
    {
      username = _username;
    }
    public function set_note(_note:String):void
    {
      note = _note;
    }
    public function set_ypos(_ypos:Number):void
    {
      ypos = _ypos;
    }

  	public function set_colorBtn(_color:String):void
  	{
  	  colorBtn = _color;
  	}
  	public function get_colorBtn():String
  	{
  	  return(colorBtn);
  	}
    public function get_username():String
    {
      return(username);
    }
    public function get_note():String
    {
      return(note);
    }
    public function get_ypos():Number
    {
      return(ypos);
    }
  }
//////////////Classes//////////////
}