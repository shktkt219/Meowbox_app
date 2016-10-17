// plan show page
$(function(){
  $("a.load_boxes").on("click", function(e){
    alert("You clicked this link")
    e.preventDefault();
  })
})

// plan index page
$(function(){
  $(".js-more").on("click", function(){
    var id = $(this).data("id");
    $.get("/plans/" + id + ".json", function(data){
      var plan = data["plan"];
      var descriptionText = "<p>" + plan["description"] + "</p>";
      $("#plan-" + id).html(descriptionText);
    });
  });
});
