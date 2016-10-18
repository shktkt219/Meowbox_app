$(function(){
  $("form#new_item").on("submit", function(event){
    event.preventDefault();
    var $form = $(this);
    var action = $form.attr("action")
    var params = $form.serialize()

    $.ajax({
      url: action,
      data: params,
      dataType: "json",
      method: "POST"
    })
    .success(function(json){
      var item = new Item(json);

      $("div.item").append(html);
    })
    .error(function(response){
      console.log("You broke it?", response)
    })
  })
})
