// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function PopupWindow(url, width, height){
  newwindow = window.open(url,"fullpic","height="+height+",width="+width+",toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes");
  if (window.focus) {
    newwindow.focus();
  }
 return false;
}
