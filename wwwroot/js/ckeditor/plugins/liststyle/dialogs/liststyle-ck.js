/*
 Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
 For licensing, see LICENSE.html or http://ckeditor.com/license
*/(function(){function e(e,t){var n;try{n=e.getSelection().getRanges()[0]}catch(r){return null}n.shrink(CKEDITOR.SHRINK_TEXT);return e.elementPath(n.getCommonAncestor()).contains(t,1)}function t(t,i){var s=t.lang.liststyle;if("bulletedListStyle"==i)return{title:s.bulletedTitle,minWidth:300,minHeight:50,contents:[{id:"info",accessKey:"I",elements:[{type:"select",label:s.type,id:"type",align:"center",style:"width:150px",items:[[s.notset,""],[s.circle,"circle"],[s.disc,"disc"],[s.square,"square"]],setup:function(e){this.setValue(e.getStyle("list-style-type")||r[e.getAttribute("type")]||e.getAttribute("type")||"")},commit:function(e){var t=this.getValue();t?e.setStyle("list-style-type",t):e.removeStyle("list-style-type")}}]}],onShow:function(){var t=this.getParentEditor();(t=e(t,"ul"))&&this.setupContent(t)},onOk:function(){var t=this.getParentEditor();(t=e(t,"ul"))&&this.commitContent(t)}};if("numberedListStyle"==i){var o=[[s.notset,""],[s.lowerRoman,"lower-roman"],[s.upperRoman,"upper-roman"],[s.lowerAlpha,"lower-alpha"],[s.upperAlpha,"upper-alpha"],[s.decimal,"decimal"]];(!CKEDITOR.env.ie||7<CKEDITOR.env.version)&&o.concat([[s.armenian,"armenian"],[s.decimalLeadingZero,"decimal-leading-zero"],[s.georgian,"georgian"],[s.lowerGreek,"lower-greek"]]);return{title:s.numberedTitle,minWidth:300,minHeight:50,contents:[{id:"info",accessKey:"I",elements:[{type:"hbox",widths:["25%","75%"],children:[{label:s.start,type:"text",id:"start",validate:CKEDITOR.dialog.validate.integer(s.validateStartNumber),setup:function(e){this.setValue(e.getFirst(n).getAttribute("value")||e.getAttribute("start")||1)},commit:function(e){var t=e.getFirst(n),r=t.getAttribute("value")||e.getAttribute("start")||1;e.getFirst(n).removeAttribute("value");var i=parseInt(this.getValue(),10);isNaN(i)?e.removeAttribute("start"):e.setAttribute("start",i);e=t;t=r;for(i=isNaN(i)?1:i;(e=e.getNext(n))&&t++;)e.getAttribute("value")==t&&e.setAttribute("value",i+t-r)}},{type:"select",label:s.type,id:"type",style:"width: 100%;",items:o,setup:function(e){this.setValue(e.getStyle("list-style-type")||r[e.getAttribute("type")]||e.getAttribute("type")||"")},commit:function(e){var t=this.getValue();t?e.setStyle("list-style-type",t):e.removeStyle("list-style-type")}}]}]}],onShow:function(){var t=this.getParentEditor();(t=e(t,"ol"))&&this.setupContent(t)},onOk:function(){var t=this.getParentEditor();(t=e(t,"ol"))&&this.commitContent(t)}}}}var n=function(e){return e.type==CKEDITOR.NODE_ELEMENT&&e.is("li")},r={a:"lower-alpha",A:"upper-alpha",i:"lower-roman",I:"upper-roman",1:"decimal",disc:"disc",circle:"circle",square:"square"};CKEDITOR.dialog.add("numberedListStyle",function(e){return t(e,"numberedListStyle")});CKEDITOR.dialog.add("bulletedListStyle",function(e){return t(e,"bulletedListStyle")})})();