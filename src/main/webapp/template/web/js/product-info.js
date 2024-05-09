window.onscroll = function () {
  stickyMenu();
};

var myheader = document.querySelector(".myheader");
var sticky = myheader.offsetTop;

function stickyMenu() {
  if (window.pageYOffset > sticky) {
    myheader.classList.add("sticky");
  } else {
    myheader.classList.remove("sticky");
  }
}