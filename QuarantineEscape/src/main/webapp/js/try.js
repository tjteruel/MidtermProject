$(".event-block").on("click", function(){
  alert("clicked");
});

$(".store-dropdown").on("change",function(){
   // window.location.href = ' '+$(this);
     alert("selection changed");
});


$(".store-appointment, .store-modal-close").on("click", function(){
  if ($(window).width() >= 768) {
    $(".store-modal").toggle();
    return false;
  }
  else{
    window.location.replace($(this).attr("href"));
  }
});

$(".find-store-link, .find-store-close").on("click",function(){
  if ($(window).width() > 768) {
    $(".store-search").toggle();
    return false;
  }
  else{
    window.location.replace($(this).parents("a").attr("href"));
  }
});

