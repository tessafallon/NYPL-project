$(document).ready( function() {

  var $imgDiv = $(".transcribe-image-holder");
  var $img = $imgDiv.find("img");

  var startCoordinate = {};
  var endCoordinate = {};

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
    startCoordinate = getMousePos(e);
    console.log(startCoordinate);
  });

  $imgDiv.on("mouseup", function(e) {
    endCoordinate = getMousePos(e);
    console.log(endCoordinate);
    var $overlay = $("<div class='overlay'></div>").appendTo($imgDiv);
    $overlay.attr("id","box"+startCoordinate.y+startCoordinate.x)
            .css("top", startCoordinate.y)
            .css("left", startCoordinate.x);
  });
});