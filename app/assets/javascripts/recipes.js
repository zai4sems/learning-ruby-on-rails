/* global $ */


var ready;
ready = function () {

$("#ingredients a.add_fields").
  data("association-insertion-position", 'before').
  data("association-insertion-node", 'this');


     
 $('#recipe_ingredients').on('cocoon:after-insert',
 function() {
     $(".recipe-ingredient-fields a.add_fields").
         data("association-insertion-position", 'before').
         data("association-insertion-node", 'this');
     $('.recipe-ingredient-fields').on('cocoon:after-insert',
          function() {
            $(this).children(".ingredient_from_list").remove();
            $(this).children("a.add_fields").hide();
          });
 });
     
     
$("#materials a.add_fields").
  data("association-insertion-position", 'before').
  data("association-insertion-node", 'this');

$('#recipe_materials').on('cocoon:after-insert',
     function() {
         $(".recipe-material-fields a.add_fields").
             data("association-insertion-position", 'before').
             data("association-insertion-node", 'this');
         $('.recipe-material-fields').on('cocoon:after-insert',
              function() {
                $(this).children(".material_from_list").remove();
                $(this).children("a.add_fields").hide();
              });
     });

$('#ingredients_list').dataTable();
$('#recipe_ingredient_list').dataTable();
$('#recipes_list').dataTable();
$('.best_in_place').best_in_place();

    
};
$(document).ready(ready);
$(document).on('page:load', ready);
$(document).on('turbolinks:render', ready);
