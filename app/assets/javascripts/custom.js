$(document).ready( function() {

  var $imgDiv = $(".transcribe-image-holder");

  var $img = $imgDiv.find("img");

  $img.on("dragstart", function() {
    return false;
  });

  function getMousePos(e, $imgDiv) {
    var pos = {};
    if(e) {
      pos.x = e.pageX;
      pos.y = e.pageY;
    }
    else {
      pos.x = window.event.clientX + $imgDiv.scrollLeft - $imgDiv.clientLeft;
      pos.y = window.event.clientY + $imgDiv.scrollTop - $imgDiv.clientTop;
    }
    return pos;
  }

  $imgDiv.on("mousedown", function(e) {
    console.log(getMousePos(e));
  });

  $imgDiv.on("mouseup", function(e) {
    console.log(getMousePos(e));
  });
});