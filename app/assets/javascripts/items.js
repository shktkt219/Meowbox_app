function Item(json){
  this.item_name = json.item_name;
  this.description = json.description;
  this.image = json.image;
  this.url = json.url;
  this.size = json.size;
};

Item.prototype.renderItem = function(){
  var my_html = ""
  my_html += '    <div>';
  my_html += '      <h3>'+ this.item_name + '</h3>';
  my_html += '      <p>' + this.description + '</p>';
  my_html += '      <p>' + this.image + '</p>';
  my_html += '      <p>' + this.size + '</p>';
  my_html += '      <p>' + this.url + '</p>';
  my_html += '    </div>';

  return my_html;
};

$(function(){
  $("form#new_item").on("submit", function(event){
    event.preventDefault();
    var $form = $(this);
    var action = $form.attr("action");
    var params = $form.serialize();

    $.ajax({
      url: action,
      data: params,
      dataType: "json",
      method: "POST"
    })
    .success(function(json){
      var item = new Item(json);
      var itemDisplay = item.renderItem()

      $("div.item").append(itemDisplay);
    })
    .error(function(response){
      console.log("You broke it?", response)
    })
  })
})
