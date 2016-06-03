"use strict";window.elFinderSupportVer1=function(e){var t=this;this.upload=e||"auto";this.init=function(e){this.fm=e;this.fm.parseUploadData=function(e){var n;if(!$.trim(e))return{error:["errResponse","errDataEmpty"]};try{n=$.parseJSON(e)}catch(r){return{error:["errResponse","errDataNotJSON"]}}return t.normalize("upload",n)}};this.send=function(e){var t=this,n=this.fm,r=$.Deferred(),i=e.data.cmd,s=[],o={},u,a;r.abort=function(){!a.isRejected()&&!a.isResolved()&&a.abort()};switch(i){case"open":e.data.tree=1;break;case"parents":case"tree":return r.resolve({tree:[]});case"get":e.data.cmd="read";e.data.current=n.file(e.data.target).phash;break;case"put":e.data.cmd="edit";e.data.current=n.file(e.data.target).phash;break;case"archive":case"rm":e.data.current=n.file(e.data.targets[0]).phash;break;case"extract":case"rename":case"resize":e.data.current=n.file(e.data.target).phash;break;case"duplicate":o=$.extend(!0,{},e);$.each(e.data.targets,function(e,r){$.ajax($.extend(o,{data:{cmd:"duplicate",target:r,current:n.file(r).phash}})).error(function(e){n.error(n.res("error","connect"))}).done(function(e){e=t.normalize("duplicate",e);e.error?n.error(e.error):e.added&&n.trigger("add",{added:e.added})})});return r.resolve({});case"mkdir":case"mkfile":e.data.current=e.data.target;break;case"paste":e.data.current=e.data.dst;break;case"size":return r.resolve({error:n.res("error","cmdsupport")});case"search":return r.resolve({error:n.res("error","cmdsupport")})}a=$.ajax(e).fail(function(e){r.reject(e)}).done(function(e){u=t.normalize(i,e);if(i=="paste"&&!u.error){n.sync();r.resolve({})}else r.resolve(u)});return r};this.normalize=function(e,t){var n=this,r={},i=function(e){return e&&e.hash&&e.name&&e.mime?e:null},s;if(e=="tmb"||e=="get")return t;if(e=="upload"&&t.error&&t.cwd){t.warning=$.extend({},t.error);t.error=!1}if(t.error)return t;if(e=="put"){s=this.fm.file(t.target.hash).phash;return{changed:[this.normalizeFile(t.target,s)]}}s=t.cwd.hash;t.tree&&$.each(this.normalizeTree(t.tree),function(e,t){r[t.hash]=t});$.each(t.cdc||[],function(e,i){var o=i.hash;if(r[o]){r[o].date=i.date;r[o].locked=i.hash==s?!0:i.rm===void 0?!1:!i.rm}else r[o]=n.normalizeFile(i,s,t.tmb)});t.tree||$.each(this.fm.files(),function(e,t){!r[e]&&t.phash!=s&&t.mime=="directory"&&(r[e]=t)});return e=="open"?{cwd:r[s]||this.normalizeFile(t.cwd),files:$.map(r,function(e){return e}),options:n.normalizeOptions(t),init:!!t.params,debug:t.debug}:$.extend({current:t.cwd.hash,error:t.error,warning:t.warning,options:{tmb:!!t.tmb}},this.fm.diff($.map(r,i)))};this.normalizeTree=function(e){var t=this,n=[],r=function(e,i){var s,o;for(s=0;s<e.length;s++){o=e[s];n.push(t.normalizeFile(o,i));o.dirs.length&&r(o.dirs,o.hash)}};r([e]);return n};this.normalizeFile=function(e,t,n){var r=e.mime||"directory",i=r=="directory"&&!e.linkTo?0:e.size,s={url:e.url,hash:e.hash,phash:t,name:e.name,mime:r,date:e.date||"unknown",size:i,read:e.read,write:e.write,locked:t?e.rm===void 0?!1:!e.rm:!0};e.mime=="application/x-empty"&&(s.mime="text/plain");e.linkTo&&(s.alias=e.linkTo);e.linkTo&&(s.linkTo=e.linkTo);e.tmb?s.tmb=e.tmb:s.mime.indexOf("image/")===0&&n&&(s.tmb=1);e.dirs&&e.dirs.length&&(s.dirs=!0);e.dim&&(s.dim=e.dim);e.resize&&(s.resize=e.resize);return s};this.normalizeOptions=function(e){var t={path:e.cwd.rel,disabled:e.disabled||[],tmb:!!e.tmb,copyOverwrite:!0};if(e.params){t.api=1;t.url=e.params.url;t.archivers={create:e.params.archives||[],extract:e.params.extract||[]}}t.path.indexOf("/")!==-1?t.separator="/":t.path.indexOf("\\")!==-1&&(t.separator="\\");return t}};