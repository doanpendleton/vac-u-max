/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */CKEDITOR.dialog.add("textarea",function(e){return{title:e.lang.forms.textarea.title,minWidth:350,minHeight:220,onShow:function(){delete this.textarea;var e=this.getParentEditor().getSelection().getSelectedElement();if(e&&e.getName()=="textarea"){this.textarea=e;this.setupContent(e)}},onOk:function(){var e,t=this.textarea,n=!t;if(n){e=this.getParentEditor();t=e.document.createElement("textarea")}this.commitContent(t);n&&e.insertElement(t)},contents:[{id:"info",label:e.lang.forms.textarea.title,title:e.lang.forms.textarea.title,elements:[{id:"_cke_saved_name",type:"text",label:e.lang.common.name,"default":"",accessKey:"N",setup:function(e){this.setValue(e.data("cke-saved-name")||e.getAttribute("name")||"")},commit:function(e){if(this.getValue())e.data("cke-saved-name",this.getValue());else{e.data("cke-saved-name",!1);e.removeAttribute("name")}}},{type:"hbox",widths:["50%","50%"],children:[{id:"cols",type:"text",label:e.lang.forms.textarea.cols,"default":"",accessKey:"C",style:"width:50px",validate:CKEDITOR.dialog.validate.integer(e.lang.common.validateNumberFailed),setup:function(e){var t=e.hasAttribute("cols")&&e.getAttribute("cols");this.setValue(t||"")},commit:function(e){this.getValue()?e.setAttribute("cols",this.getValue()):e.removeAttribute("cols")}},{id:"rows",type:"text",label:e.lang.forms.textarea.rows,"default":"",accessKey:"R",style:"width:50px",validate:CKEDITOR.dialog.validate.integer(e.lang.common.validateNumberFailed),setup:function(e){var t=e.hasAttribute("rows")&&e.getAttribute("rows");this.setValue(t||"")},commit:function(e){this.getValue()?e.setAttribute("rows",this.getValue()):e.removeAttribute("rows")}}]},{id:"value",type:"textarea",label:e.lang.forms.textfield.value,"default":"",setup:function(e){this.setValue(e.$.defaultValue)},commit:function(e){e.$.value=e.$.defaultValue=this.getValue()}},{id:"data-required",type:"select",label:"Required","default":"false",items:[["False","false"],["True","true"]],setup:function(e){var t=e.hasAttribute("data-required")&&e.getAttribute("data-required");this.setValue(t||"")},commit:function(e){this.getValue()?e.setAttribute("data-required",this.getValue()):e.removeAttribute("data-required")}},{id:"data-validate",type:"select",label:"Validation","default":"",items:[["None",""],["Regex","regex"]],setup:function(e){var t=e.hasAttribute("data-validate")&&e.getAttribute("data-validate");this.setValue(t||"")},commit:function(e){this.getValue()?e.setAttribute("data-validate",this.getValue()):e.removeAttribute("data-validate")}},{id:"data-message",type:"text",label:"Validation Failure Message","default":"",setup:function(e){var t=e.hasAttribute("data-message")&&e.getAttribute("data-message");this.setValue(t||"")},commit:function(e){this.getValue()?e.setAttribute("data-message",this.getValue()):e.removeAttribute("data-message")}},{id:"data-regex",type:"text",label:"Regex Expression (Use when validate is set to Regex)","default":"",setup:function(e){var t=e.hasAttribute("data-regex")&&e.getAttribute("data-regex");this.setValue(t||"")},commit:function(e){this.getValue()?e.setAttribute("data-regex",this.getValue()):e.removeAttribute("data-regex")}}]}]}});