//  
import flash.events.MouseEvent;
import flash.display.*;
import flash.text.*;
import com.classes.Note;
//import DynTextBox;

//////////////Constants//////////////
const DOC_ORIGIN_X:Number = 18;
const DOC_ORIGIN_Y:Number = 146;
const DOC_WIDTH:Number = 900;
const DOC_HEIGHT:Number = 3494;
const TXT_ADD_COMMENT_INITX:Number = 0;
const TXT_ADD_COMMENT_INITY:Number = 0;
const BTN_CONFIRM_ADD_COMMENT_INITX:Number = 188;
const BTN_CONFIRM_ADD_COMMENT_INITY:Number = 56;
const BTN_CANCEL_ADD_COMMENT_INITX:Number = 155;
const BTN_CANCEL_ADD_COMMENT_INITY:Number = 56;
const BTN_NOTE_WIDTH:Number = 25;
const NOTE_XPOS:Number = 825;
//////////////Constants//////////////


//////////////Event Handlers//////////////
//Dragging
Document.addEventListener(MouseEvent.MOUSE_DOWN, hnd_drag);
Document.addEventListener(MouseEvent.MOUSE_UP, hnd_drag_stop);
Document.addEventListener(MouseEvent.DOUBLE_CLICK, hnd_addComment);
//Add Comment Buttons
//Document.btnAddComment.addEventListener(MouseEvent.MOUSE_UP, hnd_addComment);
btnConfirmAddComment.addEventListener(MouseEvent.MOUSE_UP, hnd_confAddComment);
btnCancelAddComment.addEventListener(MouseEvent.MOUSE_UP, hnd_cancelAddComment);
//////////////Event Handlers//////////////


//////////////Initialize//////////////
init_all();
//////////////Initialize//////////////


//////////////Global Vars//////////////
//Make a list of Notes to store all the ntoes created in thi session
var NoteList:Array = new Array();
var CurrentUser:String = "JR";
var CurrentUserColor:String = "blue";
var CurrBtnsY:Array = new Array();
//var ButtonClasses:Array = new Array("CircleBlue", "CircleGreen", "CircleRed", "CircleOrange");
//var RectDragBounds:Rectangle = new Rectangle(DOC_ORIGIN_X, (-1*Number.MAX_VALUE), DOC_WIDTH, Number.MAX_VALUE);------------wont let me drag off stge
//////////////Global Vars//////////////

//////////////RUN//////////////
var XmlLoaderData:URLLoader = new URLLoader();
var XmlData:XML = new XML(); //global
XmlLoaderData.addEventListener(Event.COMPLETE, hnd_load_data);
XmlLoaderData.load(new URLRequest("data/data.xml"));

Document.doubleClickEnabled = true;
//////////////RUN//////////////
 


//////////////Data Handling//////////////
function hnd_load_data(e:Event):void 
{
  XmlData = new XML(e.target.data);
  //Returns all nodes in a particular document
  var annotators:XMLList = XmlData.DOCUMENT.USER;
//  trace(annotators.attribute("name"));
  for (var i:int = 0; i < annotators.length(); i++)
  {
//    trace(annotators[i].attribute("name")); //Prints the name
    //Get all notes for this annotator and loop through each one
    for each (var curNote in annotators[i].NOTE)
    {
      var tmpNote:Note = new Note( annotators[i].attribute("name"), annotators[i].attribute("color"), curNote.text(), curNote.attribute("ypos"));
      //Add it to our list
      NoteList.push(tmpNote);
//      trace(curNote.text()); //Prints the note
    }
//    trace(annotators[i].NOTE.text());
  }

  //Now that existing notes are loaded, lets show our buttons
  init_noteBtns();
}

//Loop through oure note list and create a new button for each
function init_noteBtns():void
{
    //Loop through all the notes for the document and create a new instance
    // of the NOTE_BUTTON button and add it to Document movieclip

/*   var tmpName:String = NoteList[0].get_username();
   for (var i:int = 0; i < NoteList.length; i++)
   {
      //Check to see if we've changed users yet
      //if not, keep adding notes to the current button class
      if( tmpName == NoteList[i].get_username() )
      {
        //Adds a button
        var newCircle:CircleBlue = new CircleBlue();
        newCircle.set_noteText(NoteList[i].get_note());
        newCircle.set_pos(NOTE_XPOS, NoteList[i].get_ypos());
        this.addChild(newCircle);//Document.addChild   ????

        newCircle.x = newCircle.get_xpos();
        newCircle.y = newCircle.get_ypos();
      }
      else
      {
        //if we changed users, start using the next button class
        break;
      }
   }*/


  //loop through all notes
  for (var i:int = 0; i < NoteList.length; i++)/////////////////////////////////////////////////////////////now need to make a fxn that checks the ypos
  {//////////////////////////////////////////////////////////////////////////////////of all the entered notes. if one exists where this one is trying to
    //check if we're looking at a new user yet///////////////////////////////////////////go, then add 25pixels to it. this should be called anytime
    addBtn(NoteList[i]);
  }
}

function addBtn(_curNote:Note):void
{
//  var CurrBtnsY:Array = new Array();

  if( _curNote.get_colorBtn() == "blue" )//////////////////////////////a new btn is created (here and in the hnd_check)------
  {
    var tmpBlue:CircleBlue = new CircleBlue();
    tmpBlue.set_noteText(_curNote.get_note());
    tmpBlue.set_pos( (NOTE_XPOS + neededOffset(_curNote.get_ypos())), _curNote.get_ypos());
    Document.addChild(tmpBlue);
    tmpBlue.x = tmpBlue.get_xpos();
    tmpBlue.y = tmpBlue.get_ypos();
//    CurrBtnsY.push(tmpBlue.x);
  }
  else if( _curNote.get_colorBtn() == "green" )
  {
    var tmpGreen:CircleGreen = new CircleGreen();
    tmpGreen.set_noteText(_curNote.get_note());
    tmpGreen.set_pos( (NOTE_XPOS + neededOffset(_curNote.get_ypos())), _curNote.get_ypos());
    Document.addChild(tmpGreen);
    tmpGreen.x = tmpGreen.get_xpos();
    tmpGreen.y = tmpGreen.get_ypos();
//    CurrBtnsY.push(tmpGreen.y);
  }
  else if( _curNote.get_colorBtn() == "orange" )
  {
    var tmpOrange:CircleOrange = new CircleOrange();
    tmpOrange.set_noteText(_curNote.get_note());
    tmpOrange.set_pos( (NOTE_XPOS + neededOffset(_curNote.get_ypos())), _curNote.get_ypos());
    Document.addChild(tmpOrange);
    tmpOrange.x = tmpOrange.get_xpos();
    tmpOrange.y = tmpOrange.get_ypos();
//    CurrBtnsY.push(tmpOrange.y);
  }
  else if( _curNote.get_colorBtn() == "red" )
  {
    var tmpRed:CircleRed = new CircleRed();
    tmpRed.set_noteText(_curNote.get_note());
    tmpRed.set_pos( (NOTE_XPOS + neededOffset(_curNote.get_ypos()) ), _curNote.get_ypos());//.set_pos(NOTE_XPOS, NoteList[i].get_ypos());
    Document.addChild(tmpRed);
    tmpRed.x = tmpRed.get_xpos();
    tmpRed.y = tmpRed.get_ypos();
  }
}

//Loops through existing buttons X positions to see if there's any overlapping
// buttons. if so, returns how much offset the one about to be added needs
function neededOffset(_newBtnY:Number):Number
{
//  trace("IN NEEDEDOFFSET _newBtnY: " + _newBtnY);
  var offset:Number = 0;
  for(var i:int=0; i<CurrBtnsY.length; i++)
  {
//    trace(CurrBtnsY[i]);
    if(_newBtnY == CurrBtnsY[i])
    {
//      trace("moving over");
      offset += BTN_NOTE_WIDTH;
    }
  }
//  trace("returning: " + offset);
  CurrBtnsY.push(_newBtnY);
  return(offset);
}

//Called by load_xml
function show_noteBtns():void
{


/*  var noteList:XMLList = XmlData.DOCUMENT.USER.NOTE;
  for each (var noteElement:XML in noteList)
  {
    trace(noteElement);
  }*/

}

function print_notes():void
{
  //This is the document we want
//  var desiredDocTitle:String = "Inventing the Medium";

/*  //Get every document's title
  var docAttributes:XMLList = XmlData.DOCUMENT.attribute("title");
  for each (var docTitle:XML in docAttributes)
  {
    //trace(docTitle);
    if(docTitle == desiredDocTitle)
    {
      trace(docTitle);
    }
  }*/

/*  //Prints out all the notes
  var noteList:XMLList = XmlData.DOCUMENT.USER.NOTE;
  for each (var noteElement:XML in noteList)
  {
    trace(noteElement);
  }*/

}
//////////////Load Data//////////////


//////////////Event Handlers//////////////
function hnd_drag(Event:MouseEvent):void
{
//	Document.startDrag(false, RectDragBounds);
  Document.startDrag();
	check_bounds();
}
function hnd_drag_stop(Event:MouseEvent):void
{
	Document.stopDrag();
	check_bounds();
}

function hnd_addComment(Event:MouseEvent):void
{
  //Display the text box and buttons
  show_addComment(Event.localX, Event.localY);
}
function hnd_confAddComment(Event:MouseEvent):void
{
  //Create a new Note and add it to our list of current notes
  var tmpNote:Note = new Note(CurrentUser, CurrentUserColor, txtAddComment.text, Document.btnAddComment.y);
  addBtn(tmpNote);
//  NoteList.push(tmpNote);////////////////////////////////////////----------------------------------------------------needed??????

  //Hide the comment box
  reset_addComment();
  //Refresh our comments so the new one is displayed
  
  //HACK
  //Create a new btnComment to indicate that a new comment was added--??
  //
  
}
function hnd_cancelAddComment(Event:MouseEvent):void
{
  //abort and reset the add comment fields
  reset_addComment();
}
//////////////Event Handlers//////////////


//////////////Other Functionality//////////////
function init_all():void
{
  //Init our global vars
  CurrentUser = "JR";//--------------------------------------------------------this should change to a drop down
  reset_addComment();
}

//Check whether the map is being moved too far
function check_bounds():void
{
	//check left
	if( Document.x > DOC_ORIGIN_X )
		Document.x = DOC_ORIGIN_X;
	
	//check top
/*  if( Document.y > DOC_ORIGIN_Y )
    Document.y = DOC_ORIGIN_Y;*/

	//check right
	if( (Document.x + Document.width) < (DOC_ORIGIN_X + DOC_WIDTH) )
		Document.x = (DOC_ORIGIN_X - (Document.width-DOC_WIDTH));

	//check bottom left
/*  if( (Document.y + Document.height) < (DOC_ORIGIN_Y + FRAME_HEIGHT) )
    Document.y = (DOC_ORIGIN_Y - (Document.height-FRAME_HEIGHT));*/
}

function reset_addComment():void
{
  //Hide all the elements
  txtAddComment.visible = false;
  btnConfirmAddComment.visible = false;
  btnCancelAddComment.visible = false;
  Document.btnAddComment.visible = false;

  //Clear the text
  txtAddComment.text = "";
  //Place them in their starting positions
  txtAddComment.x = TXT_ADD_COMMENT_INITX;
  txtAddComment.y = TXT_ADD_COMMENT_INITY;
  btnConfirmAddComment.x = BTN_CONFIRM_ADD_COMMENT_INITX;
  btnConfirmAddComment.y = BTN_CONFIRM_ADD_COMMENT_INITY;
  btnCancelAddComment.x = BTN_CANCEL_ADD_COMMENT_INITX;
  btnCancelAddComment.y = BTN_CANCEL_ADD_COMMENT_INITY;
}
function show_addComment(_xpos:Number, _ypos:Number):void
{
 
  Document.btnAddComment.x = DOC_WIDTH + 10;
  Document.btnAddComment.y = _ypos;
  
  //Place them in their appropriate place according to where they clicked
  txtAddComment.x = DOC_WIDTH + 40;//Document.btnAddComment.x + 10;
  txtAddComment.y = _ypos;//Document.btnAddComment.y;
  //These are relative to the placement of the text box
  btnConfirmAddComment.x = txtAddComment.x + (BTN_CONFIRM_ADD_COMMENT_INITX-TXT_ADD_COMMENT_INITX);
  btnConfirmAddComment.y = txtAddComment.y + (BTN_CONFIRM_ADD_COMMENT_INITY-TXT_ADD_COMMENT_INITY);
  btnCancelAddComment.x = txtAddComment.x + (BTN_CANCEL_ADD_COMMENT_INITX-TXT_ADD_COMMENT_INITX);
  btnCancelAddComment.y = txtAddComment.y + (BTN_CANCEL_ADD_COMMENT_INITY-TXT_ADD_COMMENT_INITY);

  //Show all the elements
  txtAddComment.visible = true;
  btnConfirmAddComment.visible = true;
  btnCancelAddComment.visible = true;
  Document.btnAddComment.visible = true;
}

//////////////Other Functionality//////////////


















