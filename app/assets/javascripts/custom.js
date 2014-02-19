$(document).ready( function() {

  var $imgDiv = $(".transcribe-image-holder");
  var imgDivOffset = $imgDiv.offset();
  var $img = $imgDiv.find("img");
  var $highlighter = $(".highlighter");

  var startCoordinate = {};
  var endCoordinate = {};
  var boxColor = "";

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

  $highlighter.on("click", function(boxColor) {
    boxColor = this.className.split(" ")[1];
    console.log(boxColor);
  });

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
            .css("width", endCoordinate.x - startCoordinate.x)
            .addClass(boxColor);
  });
});