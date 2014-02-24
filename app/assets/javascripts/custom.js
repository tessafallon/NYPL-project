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
      x: e.pageX - $imgDiv.offset().left,
      y: e.pageY - $imgDiv.offset().top
    };
    return pos;
  }

  $highlighter.on("click", function() {
    boxColor = this.className.split(" ")[1];
    console.log(boxColor);
  });

  $imgDiv.on("mousedown", function(e) {
    var overlays = [];
    startCoordinate = getMousePos(e);
    $imgDiv.on("mousemove", function(e) {
      endCoordinate = getMousePos(e);
      
      var $overlay = $("<div class='overlay'></div>").appendTo($imgDiv);
      $overlay.attr("id","box"+startCoordinate.y+startCoordinate.x)
              .css("top", Math.min(startCoordinate.y, endCoordinate.y))
              .css("left", Math.min(startCoordinate.x, endCoordinate.x))
              .css("height", Math.abs(endCoordinate.y - startCoordinate.y))
              .css("width", Math.abs(endCoordinate.x - startCoordinate.x))
              .addClass(boxColor)
              .on('click', function(){
                console.log('WTF');
                $(this).one("mouseout", function(){
                  console.log("exited");
                });
              });
      if (overlays.length > 0) {overlays.pop().remove()}
      overlays.push($overlay);  
    })
    .on("mouseup", function(){
      $(this).unbind("mousemove");
    }); 
  });
  
  // $imgDiv.on("click", "div.overlay", function(){
  //   console.log(this);
  //   console.log("clicked!");
  //   }).

});