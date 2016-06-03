<!---
This library is part of the Common Function Library Project. An open source
	collection of UDF libraries designed for ColdFusion 5.0 and higher. For more information,
	please see the web site at:

		http://www.cflib.org

	Warning:
	You may not need all the functions in this library. If speed
	is _extremely_ important, you may want to consider deleting
	functions you do not plan on using. Normally you should not
	have to worry about the size of the library.

	License:
	This code may be used freely.
	You may modify this code as you see fit, however, this header, and the header
	for the functions must remain intact.

	This code is provided as is.  We make no warranty or guarantee.  Use of this code is at your own risk.
--->

<cfscript>
/**
 * An enhanced version of left() that doesn't cut words off in the middle.
 * Minor edits by Rob Brooks-Bilson (rbils@amkor.com) and Raymond Camden (ray@camdenfamily.com)
 * 
 * Updates for version 2 include fixes where count was very short, and when count+1 was a space. Done by RCamden.
 * 
 * @param str 	 String to be checked. 
 * @param count 	 Number of characters from the left to return. 
 * @return Returns a string. 
 * @author Marc Esher (jonnycattt@aol.com) 
 * @version 2, April 16, 2002 
 */
function fullLeft(str, count) {
	if (not refind("[[:space:]]", str) or (count gte len(str)))
		return Left(str, count);
	else if(reFind("[[:space:]]",mid(str,count+1,1))) {
	  	return left(str,count);
	} else { 
		if(count-refind("[[:space:]]", reverse(mid(str,1,count)))) return Left(str, (count-refind("[[:space:]]", reverse(mid(str,1,count))))); 
		else return(left(str,1));
	}
}
</cfscript>






