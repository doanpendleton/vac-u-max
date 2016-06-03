/* A few useful utility functions. */// Capture a method on an object.
function method(e,t){return function(){e[t].apply(e,arguments)}}function forEach(e,t){if(e.next)try{for(;;)t(e.next())}catch(n){if(n!=StopIteration)throw n}else for(var r=0;r<e.length;r++)t(e[r])}function map(e,t){var n=[];forEach(e,function(e){n.push(t(e))});return n}function matcher(e){return function(t){return e.test(t)}}function hasClass(e,t){var n=e.className;return n&&(new RegExp("(^| )"+t+"($| )")).test(n)}function removeClass(e,t){e.className=e.className.replace(new RegExp(" "+t+"\\b","g"),"");return e}function insertAfter(e,t){var n=t.parentNode;n.insertBefore(e,t.nextSibling);return e}function removeElement(e){e.parentNode&&e.parentNode.removeChild(e)}function clearElement(e){while(e.firstChild)e.removeChild(e.firstChild)}function isAncestor(e,t){while(t=t.parentNode)if(e==t)return!0;return!1}function normalizeEvent(e){if(!e.stopPropagation){e.stopPropagation=function(){this.cancelBubble=!0};e.preventDefault=function(){this.returnValue=!1}}e.stop||(e.stop=function(){this.stopPropagation();this.preventDefault()});if(e.type=="keypress"){e.code=e.charCode==null?e.keyCode:e.charCode;e.character=String.fromCharCode(e.code)}return e}function addEventHandler(e,t,n,r){function i(e){n(normalizeEvent(e||window.event))}if(typeof e.addEventListener=="function"){e.addEventListener(t,i,!1);if(r)return function(){e.removeEventListener(t,i,!1)}}else{e.attachEvent("on"+t,i);if(r)return function(){e.detachEvent("on"+t,i)}}}function nodeText(e){return e.textContent||e.innerText||e.nodeValue||""}function nodeTop(e){var t=0;while(e.offsetParent){t+=e.offsetTop;e=e.offsetParent}return t}function isBR(e){var t=e.nodeName;return t=="BR"||t=="br"}function isSpan(e){var t=e.nodeName;return t=="SPAN"||t=="span"}var StopIteration={toString:function(){return"StopIteration"}},nbsp=" ",matching={"{":"}","[":"]","(":")","}":"{","]":"[",")":"("};