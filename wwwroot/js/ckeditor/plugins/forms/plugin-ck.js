/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 *//**
 * @fileOverview Forms Plugin
 */CKEDITOR.plugins.add("forms",{requires:"dialog,fakeobjects",lang:"af,ar,bg,bn,bs,ca,cs,cy,da,de,el,en-au,en-ca,en-gb,en,eo,es,et,eu,fa,fi,fo,fr-ca,fr,gl,gu,he,hi,hr,hu,is,it,ja,ka,km,ko,ku,lt,lv,mk,mn,ms,nb,nl,no,pl,pt-br,pt,ro,ru,sk,sl,sr-latn,sr,sv,th,tr,ug,uk,vi,zh-cn,zh",icons:"button,checkbox,form,hiddenfield,imagebutton,radio,select,select-rtl,textarea,textarea-rtl,textfield",onLoad:function(){CKEDITOR.addCss(".cke_editable form{border: 1px dotted #FF0000;padding: 2px;}\n");CKEDITOR.addCss("img.cke_hidden{background-image: url("+CKEDITOR.getUrl(this.path+"images/hiddenfield.gif")+");"+"background-position: center center;"+"background-repeat: no-repeat;"+"border: 1px solid #a9a9a9;"+"width: 16px !important;"+"height: 16px !important;"+"}")},init:function(e){var t=e.lang,n=0,r={email:1,password:1,search:1,tel:1,text:1,url:1},i=function(r,i,s){var o={};i=="form"&&(o.context="form");e.addCommand(i,new CKEDITOR.dialogCommand(i,o));e.ui.addButton&&e.ui.addButton(r,{label:t.common[r.charAt(0).toLowerCase()+r.slice(1)],command:i,toolbar:"forms,"+(n+=10)});CKEDITOR.dialog.add(i,s)},s=this.path+"dialogs/";!e.blockless&&i("Form","form",s+"form.js");i("Checkbox","checkbox",s+"checkbox.js");i("Radio","radio",s+"radio.js");i("TextField","textfield",s+"textfield.js");i("Textarea","textarea",s+"textarea.js");i("Select","select",s+"select.js");i("Button","button",s+"button.js");var o=CKEDITOR.plugins.get("image");o&&i("ImageButton","imagebutton",CKEDITOR.plugins.getPath("image")+"dialogs/image.js");i("HiddenField","hiddenfield",s+"hiddenfield.js");if(e.addMenuItems){var u={checkbox:{label:t.forms.checkboxAndRadio.checkboxTitle,command:"checkbox",group:"checkbox"},radio:{label:t.forms.checkboxAndRadio.radioTitle,command:"radio",group:"radio"},textfield:{label:t.forms.textfield.title,command:"textfield",group:"textfield"},hiddenfield:{label:t.forms.hidden.title,command:"hiddenfield",group:"hiddenfield"},imagebutton:{label:t.image.titleButton,command:"imagebutton",group:"imagebutton"},button:{label:t.forms.button.title,command:"button",group:"button"},select:{label:t.forms.select.title,command:"select",group:"select"},textarea:{label:t.forms.textarea.title,command:"textarea",group:"textarea"}};!e.blockless&&(u.form={label:t.forms.form.menu,command:"form",group:"form"});e.addMenuItems(u)}if(e.contextMenu){!e.blockless&&e.contextMenu.addListener(function(e,t,n){var r=n.contains("form",1);if(r&&!r.isReadOnly())return{form:CKEDITOR.TRISTATE_OFF}});e.contextMenu.addListener(function(e){if(e&&!e.isReadOnly()){var t=e.getName();if(t=="select")return{select:CKEDITOR.TRISTATE_OFF};if(t=="textarea")return{textarea:CKEDITOR.TRISTATE_OFF};if(t=="input"){var n=e.getAttribute("type")||"text";switch(n){case"button":case"submit":case"reset":return{button:CKEDITOR.TRISTATE_OFF};case"checkbox":return{checkbox:CKEDITOR.TRISTATE_OFF};case"radio":return{radio:CKEDITOR.TRISTATE_OFF};case"image":return o?{imagebutton:CKEDITOR.TRISTATE_OFF}:null}if(r[n])return{textfield:CKEDITOR.TRISTATE_OFF}}if(t=="img"&&e.data("cke-real-element-type")=="hiddenfield")return{hiddenfield:CKEDITOR.TRISTATE_OFF}}})}e.on("doubleclick",function(t){var n=t.data.element;if(!e.blockless&&n.is("form"))t.data.dialog="form";else if(n.is("select"))t.data.dialog="select";else if(n.is("textarea"))t.data.dialog="textarea";else if(n.is("img")&&n.data("cke-real-element-type")=="hiddenfield")t.data.dialog="hiddenfield";else if(n.is("input")){var i=n.getAttribute("type")||"text";switch(i){case"button":case"submit":case"reset":t.data.dialog="button";break;case"checkbox":t.data.dialog="checkbox";break;case"radio":t.data.dialog="radio";break;case"image":t.data.dialog="imagebutton"}r[i]&&(t.data.dialog="textfield")}})},afterInit:function(e){var t=e.dataProcessor,n=t&&t.htmlFilter,r=t&&t.dataFilter;CKEDITOR.env.ie&&n&&n.addRules({elements:{input:function(e){var t=e.attributes,n=t.type;n||(t.type="text");(n=="checkbox"||n=="radio")&&t.value=="on"&&delete t.value}}});r&&r.addRules({elements:{input:function(t){if(t.attributes.type=="hidden")return e.createFakeParserElement(t,"cke_hidden","hiddenfield")}}})}});CKEDITOR.env.ie&&(CKEDITOR.dom.element.prototype.hasAttribute=CKEDITOR.tools.override(CKEDITOR.dom.element.prototype.hasAttribute,function(e){return function(t){var n=this.$.attributes.getNamedItem(t);if(this.getName()=="input")switch(t){case"class":return this.$.className.length>0;case"checked":return!!this.$.checked;case"value":var r=this.getAttribute("type");return r=="checkbox"||r=="radio"?this.$.value!="on":this.$.value}return e.apply(this,arguments)}}));