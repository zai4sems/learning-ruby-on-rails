/* global $ */
/* global show_spinner */
/* global hide_spinner */
/* global jQuery */

var ready;
ready = function () {
    
    $('#all_overheads_list').dataTable();
    $('.best_in_place').best_in_place();
    $('.best_in_place').bind("ajax:success", function(){
        alert('Value updated, refresh to recalculate total cost summary');  /*check update work or not */
    });
};
$(document).ready(ready);
$(document).on('page:load', ready);
$(document).on('turbolinks:render', ready);




