/**
 * Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 *
 * CKFinder 2.x - sample "dummy" plugin.
 *
 * To enable it, add the following line to config.js:
 *     config.extraPlugins = 'dummy';
 *//**
 * See http://docs.cksource.com/ckfinder_2.x_api/symbols/CKFinder.html#.addPlugin
 */CKFinder.addPlugin("dummy",{lang:["en","pl"],appReady:function(e){CKFinder.dialog.add("dummydialog",function(e){var t={title:e.lang.dummy.title,minWidth:390,minHeight:230,onOk:function(){var t=this.getValueOf("tab1","textareaId");if(!t){e.openMsgDialog("",e.lang.dummy.typeText);return!1}alert("You have entered: "+t);return!0},contents:[{id:"tab1",label:"",title:"",expand:!0,padding:0,elements:[{type:"html",html:"<h3>"+e.lang.dummy.typeText+"</h3>"},{type:"textarea",id:"textareaId",rows:10,cols:40}]}],buttons:[CKFinder.dialog.cancelButton,CKFinder.dialog.okButton]};return t});e.addFileContextMenuOption({label:e.lang.dummy.menuItem,command:"dummycommand"},function(e,t){e.openDialog("dummydialog")})}});