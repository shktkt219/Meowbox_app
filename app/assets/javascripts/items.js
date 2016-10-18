function Item(attributes){
  this.item_name = attributes.item_name;
  this.description = attributes.description;
  this.image = attributes.image;
  this.url = attributes.url;
  this.size = attributes.size;
}

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
      var itemLi = item.renderLI()

      $("div.item").append(itemLi);
    })
    .error(function(response){
      console.log("You broke it?", response)
    })
  })
})
