/*
Copyright (c) 2003-2010, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
CKEDITOR.editorConfig = function( config )
{
    
    config.startupFocus = 'false';
    
	CKEditorBasePath='/js';
	CKFinderBasePath='/js';
	
	config.skin = 'mura';
	
    // config.ignoreEmptyParagraph = 'false';
    
    /* Pasting into Editor Options */
    // config.forcePasteAsPlainText = 'true';
    config.pasteFromWordPromptCleanup = 'true';
    config.pasteFromWordNumberedHeadingToList = 'true';
    config.pasteFromWordRemoveFontStyles = 'true';
    config.pasteFromWordRemoveStyles = 'true';
	config.startupFocus=false;
	
	config.toolbar_Default = [
	                                	{name: 'group1', items:['Source']},
	                                	{name: 'group2', items:['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print','SpellChecker','Scayt']},
	                                	{name: 'group3', items:['Undo','Redo','-','Find','Replace','-','RemoveFormat']},
	                                	{name: 'group4', items:['BidiLtr','BidiRtl']},
	                                	{name: 'group5', items:['Bold','Italic','Underline','Strike','-','Subscript','Superscript']},'/',
	                                	{name: 'group6', items:['NumberedList','BulletedList','-','Outdent','Indent','Blockquote','CreateDiv']},
	                                	{name: 'group7', items:['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock']},
	                                	{name: 'group8', items:['Link','Unlink','Anchor']},'/',
	                                	{name: 'group9', items:['Image','Flash','Media','gmap','-','Table','HorizontalRule','SpecialChar','PageBreak','-','Selectlink','SelectComponent','Templates']},
										{name: 'group10', items:['Styles','Format','-','Maximize','ShowBlocks','About']}
	                                ] ;
	
	config.toolbar_Summary = [
										['Source'],
										['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print','SpellChecker','Scayt'],
										['Undo','Redo','-','Find','Replace','-','RemoveFormat'],
										['BidiLtr','BidiRtl'],
										['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
										['NumberedList','BulletedList','-','Outdent','Indent','Blockquote','CreateDiv'],
										['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
										['Link','Unlink','Anchor'],
										['Image','Flash','Media','gmap','-','Table','HorizontalRule','SpecialChar','PageBreak','-','Selectlink','SelectComponent','Templates'],
										['Styles','Format','-','Maximize','ShowBlocks','About']
	                                ] ;

	config.toolbar_Form = [
										['Source'],
										['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print','SpellChecker','Scayt'],
										['Undo','Redo','-','Find','Replace','-','RemoveFormat'],
										['BidiLtr','BidiRtl'],
										['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
										['NumberedList','BulletedList','-','Outdent','Indent','Blockquote','CreateDiv'],
										['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
										['Link','Unlink','Anchor'],
										['Image','Flash','Media','gmap','-','Table','HorizontalRule','SpecialChar','PageBreak','-','Selectlink','SelectComponent','Templates'],
										['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField'],
										['Styles','Format','-','Maximize','ShowBlocks','About']
	                                ] ;

	config.toolbar_Basic = [
	                                	['Bold','Italic','-','NumberedList','BulletedList','-','Link','Unlink']
	                                ] ;

	config.toolbar_htmlEditor = [
	                                	['Bold','Italic','-','NumberedList','BulletedList','-','Link','Unlink','-','Image']
	                                ] ;

	config.toolbar_bbcode = [
	                                	['Source'],['Bold','Italic','-','NumberedList','BulletedList','-','Link','Unlink','-','Image']
	                                ] ;

	config.extraPlugins = 'SelectComponent,media,Selectlink,gmap,tableresize,onchange,justify,find,bidi,div,showblocks,forms,templates,pagebreak';
	
	config.protectedSource.push( /<i class\=\"[\s\S]*?\"\>/g ); //allows beginning <i class=""> tag
	config.protectedSource.push( /<\/i\>/g ); //allows ending </i> tag

	// Remove the Resize plugin as it does not make sense to use it in conjunction with the AutoGrow plugin.
	//removePlugins : 'resize';
	
	config.entities_additional = "";
	//config.protectedSource.push( /\[mura\][\s\S]*?\[\/mura\]/g );
	
	// Media Plugin - http://forge.clermont-universite.fr/projects/show/ckmedia
	config.menu_groups = 'clipboard,form,tablecell,tablecellproperties,tablerow,tablecolumn,table,anchor,link,image,flash,checkbox,radio,textfield,hiddenfield,imagebutton,button,select,textarea,removeMedia';
};

// keep CKEDITOR from putting a line break and indentation after each tag in 'Source' view
CKEDITOR.on('instanceReady', function(ev){
	var dtd = CKEDITOR.dtd;
	var tags = CKEDITOR.tools.extend( {}, dtd.$nonBodyContent, dtd.$block, dtd.$listItem, dtd.$tableContent );

	for ( var tag in tags )	{
		if ( tag == 'pre' )	{
			continue;
		} else {
			ev.editor.dataProcessor.writer.setRules(
				tag
				, {
					indent: true
					, breakBeforeOpen: true
					, breakAfterOpen: false
					, breakBeforeClose: false
					, breakAfterClose: true
				}
			);	
		};
	};
});
