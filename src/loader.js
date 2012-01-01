if (typeof addLoadEvent === "undefined" || addLoadEvent === null) {
  var addLoadEvent = function(func) {
    var oldonload = window.onload;
    if (typeof window.onload != 'function') {
      window.onload = func;
    } else {
      window.onload = function() {
        if (oldonload) {
          oldonload();
        }
        func();
      }
    }
  }
  
  addLoadEvent(prettyPrint);
  prettyPrint();
}