$(document).ready( function() {

  var $imgDiv = $(".transcribe-image-holder");
  var imgDivOffset = $imgDiv.offset();
  var $img = $imgDiv.find("img");
  var $highlighter = $(".highlighter");

  var startCoordinate = {};
  var endCoordinate = {};
  var boxColor = "";
  var description = "";

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
    boxColor = $(this).attr("class").split(" ")[1];
    description = $(this).text().trim();
  });

  $imgDiv.on("mousedown input:not('.overlay')", function(e) {
    var overlays = [];
    startCoordinate = getMousePos(e);
    $imgDiv.on("mousemove", function(e) {
      endCoordinate = getMousePos(e);
      
      var $overlay = $("<div class='overlay' title='" + description + "'></div>").appendTo($imgDiv);
      $overlay.attr("id","box"+startCoordinate.y+startCoordinate.x)
              .css("top", Math.min(startCoordinate.y, endCoordinate.y))
              .css("left", Math.min(startCoordinate.x, endCoordinate.x))
              .css("height", Math.abs(endCoordinate.y - startCoordinate.y))
              .css("width", Math.abs(endCoordinate.x - startCoordinate.x))
              .addClass(boxColor)
              .on('mousedown', function(e) {
                switch(e.which) {
                  case 1:
                    console.log('WTF');
                    $(this).one("mouseout", function(){
                      console.log("exited");
                    });
                    break;
                  case 2:
                    break;
                  case 3:
                    $(this).remove();
                    e.stopImmediatePropagation();
                    break;
                  default:
                    alert("what is this?");
                    break;
                  }
              });
              // .on("contextmenu", function(e) {
              //   alert("context!");
              //   e.preventDefault();
              //   return false;
              // });
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