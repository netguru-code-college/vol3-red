$(document).ready(function(){
  console.log("Message");
  var i = 0;
  var txt = "The best app for managing estate's community...";
  var speed = 150;
  typeWriter();

  function typeWriter() {
       $demo = document.getElementById("typing");
    if (i < txt.length) {
      $demo.innerHTML += txt.charAt(i);
      i++;
    }
    // else {
    //      $demo.innerHTML = '';
    //   i=0;
    // }
    setTimeout(typeWriter, speed);
  }
});
