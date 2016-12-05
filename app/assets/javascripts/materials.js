/* global $ */
/* global show_spinner */
/* global hide_spinner */
/* global jQuery */




var ready;
ready = function () {
   
    $('#all_materials_list').DataTable({
        /*responsive: true*/
    });
  
    $('form-test').addClass('form-group');

};
$(document).ready(ready);
$(document).on('page:load', ready);
$(document).on('turbolinks:render', ready);




