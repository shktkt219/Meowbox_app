function Item(item){
  this.item_name = item.item_name;
  this.description = item.description;
  this.image = item.image;
  this.size = item.size;
  this.url = item.url;
};

$(function(){
  Item.templateSource = $("#item-template").html()
  Item.template = Handlebars.compile(Item.templateSource);
})


Item.prototype.renderLI = function(){
  return Item.template(this);
};

$(function(){
  $("form#new_item").submit(function(event){
    event.preventDefault();
    var values = $(this).serialize();
    var posting = $.post('/items', values);

    posting.done(function(data){
      var item = data["item"];
      var newItem = new Item(item);
      var itemDisplay = newItem.renderLI()
      $("div.new_created_items").append(itemDisplay)
    });
  });
});
