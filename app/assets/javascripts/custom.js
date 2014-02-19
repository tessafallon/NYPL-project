$(document).ready( function() {

  var $img = $(".transcribe-image-holder");

  $img.on("mousedown", function() {
    console.log("hello");
  });

  $img.on("mouseup", function() {
    console.log("goodbye");
  });
});