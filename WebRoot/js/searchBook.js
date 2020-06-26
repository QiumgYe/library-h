/**
 * 
 */
function onKeyPress(e){
		if(e.which)
			keyCode = e.which;
		else if(e.keyCode)
			keyCode = e.keyCode;
		if(keyCode == 13){
			var searchInfo = document.getElementById("searchInfo").value;
			window.location="userBook_searhResult.action?searchInfo='"+searchInfo+"'";
		}
		return true;
}