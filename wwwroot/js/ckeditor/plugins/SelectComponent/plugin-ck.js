var iframeWindow=null;CKEDITOR.plugins.add("SelectComponent",{init:function(e){e.ui.addButton("SelectComponent",{label:"Insert Component",command:"SelectComponent",icon:this.path+"btn_selectcomponent.png"});var t=e.addCommand("SelectComponent",new CKEDITOR.dialogCommand("SelectComponent"));t.canUndo=!1;var n=this;CKEDITOR.dialog.add("SelectComponent",function(){return{title:"Select Component",minWidth:340,minHeight:50,contents:[{id:"iframe",label:"Insert Component...",expand:!0,elements:[{type:"iframe",src:n.path+"fck_selectComponent.cfm",width:"100%",height:"100%",onContentLoad:function(){var e=document.getElementById(this._.frameId);iframeWindow=e.contentWindow}}]}],onOk:function(){if(iframeWindow.document.getElementById("btnComponents").value==""){alert("Please select a component.");return!1}this._.editor.insertHtml(iframeWindow.document.getElementById("btnComponents").value)}}})},requires:["iframedialog"]});