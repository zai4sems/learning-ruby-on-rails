/* global $ */
/* global show_spinner */
/* global hide_spinner */
/* global jQuery */

var ready;
ready = function () {
    
    $('#all_overheads_list').DataTable({
        /*responsive: true*/
    });
    
    $('.best_in_place').best_in_place();

};
$(document).ready(ready);
$(document).on('page:load', ready);
$(document).on('turbolinks:render', ready);




