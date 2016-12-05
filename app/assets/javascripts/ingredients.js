/* global $ */
/* global show_spinner */
/* global hide_spinner */
/* global jQuery */
var init_ingredient_lookup;

init_ingredient_lookup = function() {
    $('#ingredient-lookup-form').on('ajax:before', function(event, data, status){
        show_spinner();
    })
        $('#ingredient-lookup-form').on('ajax:after', function(event, data, status){
        hide_spinner();
    })
    $('#ingredient-lookup-form').on('ajax:success', function(event, data, status){
        $('#ingredient-lookup').replaceWith(data);
        init_ingredient_lookup();
    });
    
    $('#ingredient-lookup-form').on('ajax:error', function(event, xhr, status, error){
        hide_spinner();
        $('#ingredient-lookup-results').replaceWith(' ');
        $('#ingredient-lookup-errors').replaceWith('Ingredient was not found.');
    });
}

var ready;
ready = function () {
    init_ingredient_lookup();
    
    $('.best_in_place').best_in_place();
    
    $('#all_ingredients_list').DataTable({
        /*responsive: true*/
    });
    

};
$(document).ready(ready);
$(document).on('page:load', ready);
$(document).on('turbolinks:render', ready);



jQuery.fn.submitOnCheck = function(){
    this.find('input[type=submit]').click(function() {
       $(this).parent('form').submit(); 
    });
    return this;
}


