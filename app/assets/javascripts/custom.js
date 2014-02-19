$(document).ready( function() {

  var $img = $(".transcribe-image-holder");

  function getMousePos(e, $img) {
    var pos = {};
    if(e) {
      pos.x = e.pageX;
      pos.y = e.pageY;
    }
    else {
      pos.x = window.event.clientX + $img.scrollLeft - $img.clientLeft;
      pos.y = window.event.clientY + $img.scrollTop - $img.clientTop;
    }
    return pos;
  }

  $img.on("mousedown", function(e) {
    console.log(getMousePos(e));
  });

  $img.on("mouseup", function(e) {
    console.log(getMousePos(e));
  });
});