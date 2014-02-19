$(document).ready( function() {

  var $imgDiv = $(".transcribe-image-holder");

  var $img = $imgDiv.find("img");

  $img.on("dragstart", function() {
    return false;
  });

  function getMousePos(e) {
    var pos = {
      x: e.pageX,
      y: e.pageY
    };
    return pos;
  }

  $imgDiv.on("mousedown", function(e) {
    console.log(getMousePos(e));
  });

  $imgDiv.on("mouseup", function(e) {
    console.log(getMousePos(e));
  });
});