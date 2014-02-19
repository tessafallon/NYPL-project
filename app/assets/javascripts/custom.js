$(document).ready( function() {

  var $imgDiv = $(".transcribe-image-holder");
  var imgDivOffset = $imgDiv.offset();
  var $img = $imgDiv.find("img");

  var startCoordinate = {};
  var endCoordinate = {};

  $img.on("dragstart", function() {
    return false;
  });

  function getMousePos(e) {
    var pos = {
      x: e.pageX, //- imgDivOffset.left,
      y: e.pageY //- imgDivOffset.top
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
            .css("left", startCoordinate.x)
            .css("height", endCoordinate.y - startCoordinate.y)
            .css("width", endCoordinate.x - startCoordinate.x);
  });
});