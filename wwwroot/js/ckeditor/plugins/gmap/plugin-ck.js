/**
 * QR CODES plugin for CKEditor 3.x 
 * @Author: Cedric Dugas, http://www.position-absolute.com
 * @Copyright Cakemail
 * @Licence: MIT
 * @version:	 1.0
 */CKEDITOR.plugins.add("gmap",{requires:["dialog"],lang:["en","fr"],init:function(e){var t="gmap",n=e.addCommand(t,new CKEDITOR.dialogCommand(t));n.modes={wysiwyg:1,source:0};n.canUndo=!1;e.ui.addButton("gmap",{label:e.lang.gmap.title,command:t,icon:this.path+"gmap.png"});CKEDITOR.dialog.add(t,this.path+"dialogs/gmap.js")}});