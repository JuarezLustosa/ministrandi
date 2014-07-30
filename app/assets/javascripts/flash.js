(function ($) {  
  $.extend({
    flash: function (message, err) {
      set_close_time(".bootstrap-flash");
            
      var div = '<div class="bootstrap-flash alert alert-success" style="position:absolute;top:60px;left:25%;width:50%;float:left;z-index:1500;"><a class="close" href="#" onclick="$(this).parent().hide();return false;">&times;</a><p style="margin:0!important"></p></div>'
      $(".container").prepend(div);
      
      var box = $(".bootstrap-flash");
      
      set_class_alert(box, err);
      
      box.find("p").html(message);
      box.show(); 
    }
  });
})(jQuery);

function set_close_time (div) {
  setInterval(function() {
      $(div).fadeOut("slow");
  }, 10000);
  
}

function set_class_alert (box, err) {
  if (err)
    box.addClass("alert-danger");
  else
    box.removeClass("alert-danger");  
}