// JavaScript Document

function LoadOnImg( menuid )
{
	imgname = menuid + "Img";
	if (img = document.getElementById(imgname)){
		img.src = "../images/links/popout_on.gif";
		img.style.zIndex = 200;
//		if (navigator.appName != "Microsoft Internet Explorer")
			img.style.marginLeft = 	"153px";
	}
}

function LoadOffImg( menuid )
{
	imgname = menuid + "Img";
	if (img = document.getElementById(imgname)){
		img.src = "../images/links/popout_off.gif";
		img.style.zIndex = 50;
		img.style.marginLeft = 	"142px";		
	}
}

/************************************/

var activemenu = null;
var activemenuid = null;
var menutimer = null;

function ShowMenu( menuid ) 
{
	if (!menutimer) {
		activemenu = document.getElementById( menuid );
		activemenu.style.visibility = "visible";
		activemenuid = menuid;
		LoadOnImg(menuid);
	} else if (menuid != activemenuid) {
		clearTimeout(menutimer);
		Hide();
		ShowMenu(menuid);
	} else {
		clearTimeout(menutimer);
	}
}

function Hide() 
{
	if (activemenu){
		activemenu.style.visibility = "hidden";
		LoadOffImg(activemenuid);
	}
	activemenu = null;
	menutimer = null;
}

function HideMenu()
{
	menutimer = setTimeout( "Hide()", 250 );
}