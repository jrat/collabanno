//  
import flash.events.MouseEvent;
import flash.display.*;
import flash.text.*;
import com.classes.Note;
//import DynTextBox;

//////////////Constants//////////////
const DOC_ORIGIN_X:Number = 41;
const DOC_ORIGIN_Y:Number = 27;
const DOC_WIDTH:Number = 800;
const DOC_HEIGHT:Number = 3108.4;
const TXT_ADD_COMMENT_INITX:Number = 0;
const TXT_ADD_COMMENT_INITY:Number = 0;
const BTN_CONFIRM_ADD_COMMENT_INITX:Number = 176;
const BTN_CONFIRM_ADD_COMMENT_INITY:Number = 72;
const BTN_CANCEL_ADD_COMMENT_INITX:Number = 120;
const BTN_CANCEL_ADD_COMMENT_INITY:Number = 72;
const NOTE_XPOS:Number = 725;
//////////////Constants//////////////


//////////////Event Handlers//////////////
//Dragging
Document.addEventListener(MouseEvent.MOUSE_DOWN, hnd_drag);
Document.addEventListener(MouseEvent.MOUSE_UP, hnd_drag_stop);
//Add Comment Buttons
btnAddComment.addEventListener(MouseEvent.MOUSE_UP, hnd_addComment);
btnConfirmAddComment.addEventListener(MouseEvent.MOUSE_UP, hnd_confAddComment);
btnCancelAddComment.addEventListener(MouseEvent.MOUSE_UP, hnd_cancelAddComment);
//////////////Event Handlers//////////////


//////////////Initialize//////////////
init_all();
//////////////Initialize//////////////


//////////////Global Vars//////////////
//Make a list of Notes to store all the ntoes created in thi session
var NoteList:Array = new Array();
var CurrentUser:String;
var ButtonClasses:Array = new Array("CircleBlue", "CircleGreen", "CircleRed", "CircleOrange");
//var RectDragBounds:Rectangle = new Rectangle(DOC_ORIGIN_X, (-1*Number.MAX_VALUE), DOC_WIDTH, Number.MAX_VALUE);------------wont let me drag off stge
//////////////Global Vars//////////////

//////////////RUN//////////////
var XmlLoaderData:URLLoader = new URLLoader();
var XmlData:XML = new XML(); //global
XmlLoaderData.addEventListener(Event.COMPLETE, hnd_load_data);
XmlLoaderData.load(new URLRequest("data/data.xml"));

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
      var tmpNote:Note = new Note( annotators[i].attribute("name"), curNote.text(), curNote.attribute("ypos"));
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
   
   //JR
   var crc01:CircleBlue = new CircleBlue();
   crc01.set_noteText(NoteList[0].get_note());
   crc01.set_pos(NOTE_XPOS, NoteList[0].get_ypos());
   this.addChild(crc01);//Document.addChild   ????
   crc01.x = crc01.get_xpos();
   crc01.y = crc01.get_ypos();

   var crc02:CircleBlue = new CircleBlue();
   crc02.set_noteText(NoteList[1].get_note());
   crc02.set_pos(NOTE_XPOS, NoteList[1].get_ypos());
   this.addChild(crc02);//Document.addChild   ????
   crc02.x = crc02.get_xpos();
   crc02.y = crc02.get_ypos();
   
   //Jenna
   var crc03:CircleGreen = new CircleGreen();
   crc03.set_noteText(NoteList[2].get_note());
   crc03.set_pos(NOTE_XPOS, NoteList[2].get_ypos());
   this.addChild(crc03);//Document.addChild   ????
   crc03.x = crc03.get_xpos() + 25;
   crc03.y = crc03.get_ypos();

   var crc04:CircleGreen = new CircleGreen();
   crc04.set_noteText(NoteList[3].get_note());
   crc04.set_pos(NOTE_XPOS, NoteList[3].get_ypos());
   this.addChild(crc04);//Document.addChild   ????
   crc04.x = crc04.get_xpos();
   crc04.y = crc04.get_ypos();

   //Steve
   var crc05:CircleRed = new CircleRed();
   crc05.set_noteText(NoteList[4].get_note());
   crc05.set_pos(NOTE_XPOS, NoteList[4].get_ypos());
   this.addChild(crc05);//Document.addChild   ????
   crc05.x = crc05.get_xpos() + 50;
   crc05.y = crc05.get_ypos();

   //Kristen
   var crc06:CircleOrange = new CircleOrange();
   crc06.set_noteText(NoteList[5].get_note());
   crc06.set_pos(NOTE_XPOS, NoteList[5].get_ypos());
   this.addChild(crc06);//Document.addChild   ????
   crc06.x = crc06.get_xpos();
   crc06.y = crc06.get_ypos();

   var crc07:CircleOrange = new CircleOrange();
   crc07.set_noteText(NoteList[6].get_note());
   crc07.set_pos(NOTE_XPOS, NoteList[6].get_ypos());
   this.addChild(crc07);//Document.addChild   ????
   crc07.x = crc07.get_xpos();
   crc07.y = crc07.get_ypos();
   
   var crc08:CircleOrange = new CircleOrange();
   crc08.set_noteText(NoteList[7].get_note());
   crc08.set_pos(NOTE_XPOS, NoteList[7].get_ypos());
   this.addChild(crc08);//Document.addChild   ????
   crc08.x = crc08.get_xpos();
   crc08.y = crc08.get_ypos();

   var crc09:CircleOrange = new CircleOrange();
   crc09.set_noteText(NoteList[8].get_note());
   crc09.set_pos(NOTE_XPOS, NoteList[8].get_ypos());
   this.addChild(crc09);//Document.addChild   ????
   crc09.x = crc09.get_xpos();
   crc09.y = crc09.get_ypos();

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
  show_addComment();
}
function hnd_confAddComment(Event:MouseEvent):void
{
  //Hide the comment box
  reset_addComment();
  //Create a new Note and add it to our list of current notes
  var tmpNote:Note = new Note(txtAddComment.text, CurrentUser, btnAddComment.y);
  NoteList.push(tmpNote);

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
function show_addComment():void
{
  //Hide all the elements
  txtAddComment.visible = true;
  btnConfirmAddComment.visible = true;
  btnCancelAddComment.visible = true;
  //Place them in their appropriate place by the button
  txtAddComment.x = btnAddComment.x + 10;
  txtAddComment.y = btnAddComment.y;
  //These are relative to the placement of the text box
  btnConfirmAddComment.x = txtAddComment.x + (BTN_CONFIRM_ADD_COMMENT_INITX-TXT_ADD_COMMENT_INITX);
  btnConfirmAddComment.y = txtAddComment.y + (BTN_CONFIRM_ADD_COMMENT_INITY-TXT_ADD_COMMENT_INITY);
  btnCancelAddComment.x = txtAddComment.x + (BTN_CANCEL_ADD_COMMENT_INITX-TXT_ADD_COMMENT_INITX);
  btnCancelAddComment.y = txtAddComment.y + (BTN_CANCEL_ADD_COMMENT_INITY-TXT_ADD_COMMENT_INITY);
}

//////////////Other Functionality//////////////


















