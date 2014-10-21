function showhide(id)
{
    name = id;
    el = document.getElementById(name);
    if (el == null) {
	alert("no such element: " + name);
    } else if (el.style.display == "block") {
	el.style.display = "none";
    } else if (el.style == "none") {
	el.style.display = "block";
    } else {
	el.style.display = "block";
    }
}

function showonload()
{
    arr = document.location.href.split('?');
    if (arr == null || arr.length == 1)
	return;

    arr = arr[1].split('&')
    
    for(var x = 0; x < arr.length; x++){
	var tmp = arr[x].split('=');
	if (tmp[0] == "show") {
	    el = document.getElementById(unescape(tmp[1]));
	    if (el != null) {
		el.style.display = "block";
	    }		
	}
    }
}

