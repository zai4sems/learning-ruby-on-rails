/* global $ */
/* global show_spinner */
/* global hide_spinner */
/* global jQuery */
var init_material_lookup;

init_material_lookup = function() {
    $('#material-lookup-form').on('ajax:before', function(event, data, status){
        show_spinner();
    })
        $('#material-lookup-form').on('ajax:after', function(event, data, status){
        hide_spinner();
    })
    $('#material-lookup-form').on('ajax:success', function(event, data, status){
        $('#material-lookup').replaceWith(data);
        init_material_lookup();
    });
    
    $('#material-lookup-form').on('ajax:error', function(event, xhr, status, error){
        hide_spinner();
        $('#material-lookup-results').replaceWith(' ');
        $('#material-lookup-errors').replaceWith('Material was not found.');
    });
}



var ready;
ready = function () {
    init_material_lookup();
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


