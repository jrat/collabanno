/*import com.classes.io.FileUploader;
import com.classes.events.io.*;*/
import flash.events.MouseEvent;
import flash.net.FileReference;

btnBrowse.label = "Browse";
btnFinish.label = "Finish";
btnBrowse.addEventListener(MouseEvent.MOUSE_UP, hnd_openBrowseDialog);
btnFinish.addEventListener(MouseEvent.MOUSE_UP, hnd_finish);
txtFilename.addEventListener(MouseEvent.CLICK, hnd_txtFilenameClicked);
txtEmail.addEventListener(MouseEvent.CLICK, hnd_txtEmailClicked);
txtDesc.addEventListener(MouseEvent.CLICK, hnd_txtDescClicked);

var BlankFormat:TextFormat = new TextFormat();
BlankFormat.font = "Helvetica";
BlankFormat.color = 0xa1a1a1;
BlankFormat.size = 16;
var FilledFormat:TextFormat = new TextFormat();
FilledFormat.font = "Helvetica";
FilledFormat.color = 0x000000;
FilledFormat.size = 16;

init_elements();

/*var FileRef:FileReference;
//this.FileRef.addEventListener(Event.SELECT, this.hnd_select);
this.FileRef = new FileReference();
this.FileRef.addEventListener( Event.SELECT, this.hnd_select );
//  var appsFilter:FileFilter = new FileFilter( "Flash Applications", "*.swf" );
this.FileRef.browse();*/


function hnd_txtFilenameClicked(e:Event):void
{
  txtFilename.defaultTextFormat = FilledFormat;
  txtFilename.text = "";
}

function hnd_txtEmailClicked(e:Event):void
{
  txtEmail.defaultTextFormat = FilledFormat;
  txtEmail.text = "";
}

function hnd_txtDescClicked(e:Event):void
{
  txtDesc.defaultTextFormat = FilledFormat;
  txtDesc.text = "";
}

function hnd_finish(e:Event):void
{
  gotoAndStop("frmDoc");
}

function hnd_openBrowseDialog(e:Event):void
{
  var FileRef:FileReference = new FileReference();
  FileRef.addEventListener( Event.SELECT, this.hnd_select );
  FileRef.browse();

  txtFilename.text = ".../InventingTheMedium.pdf";
}

function hnd_select(event:Event):void
{
  trace("blah");
//  var file:FileReference = FileReference(event.target);
//  txtFilename.text = file.name;
}

function init_elements():void
{

  txtFilename.defaultTextFormat = BlankFormat;
  txtEmail.defaultTextFormat = BlankFormat;
  txtDesc.defaultTextFormat = BlankFormat;

  txtFilename.background = true;
  txtFilename.backgroundColor = 0xffffff;
  txtFilename.border = true;
  txtFilename.borderColor = 0x000000;
  txtFilename.text = "Choose a file...";

/*  txtFilename.x = 211;
  txtFilename.y = 225;*/
  txtEmail.background = true;
  txtEmail.border = true;
  txtEmail.borderColor = 0x000000;
  txtEmail.text = "john@example.com , jill@example.com , ...";
/*  txtFilename.x = 211;
  txtFilename.y = 225;*/
  txtDesc.background = true;
  txtDesc.border = true;
  txtDesc.borderColor = 0x000000;
  txtDesc.text = "Add your notes to this document I just uploaded.";
/*  txtFilename.x = 211;
  txtFilename.y = 225;*/
}


/*function hnd_openBrowseDialog(e:Event):void
{
  var up:FileUploader = new FileUploader("dynamicDir");
  
  up.addEventListener("uploadCompleteEvent", handleSuccess);
  up.addEventListener("uploadFailedEvent", handleFail);
  
  up.x = (this.stage.stageWidth / 2) - (up.width / 2);
  up.y = (this.stage.stageHeight / 2) - (up.height / 2);
  addChild(up);
}

function handleSuccess(e:UploadCompleteEvent):void
{
  trace("UPLOADED."); 
}

function handleFail(e:UploadFailedEvent):void
{
  trace("FAILED.");
}*/