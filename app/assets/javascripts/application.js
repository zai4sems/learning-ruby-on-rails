/* global $ */
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.purr
//= require best_in_place
//= require best_in_place.purr
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require dataTables/extras/dataTables.responsive
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require dataTables/jquery.dataTables

//= require cocoon
//= require global

//= require twitter/bootstrap
//= require twitter/bootstrap/modal
//= require turbolinks
//= require_tree .




var hide_spinner = function(){
    $('#spinner').hide();
}

var show_spinner = function(){
    $('#spinner').show();
}

$("#menu-toggle").click(function(e) {
    e.preventDefault();
    $("#wrapper").toggleClass("toggled");
});


$("#btn").on("click", function(event) {
        $("#container_recipe_ingredient").hide();
});




var ready;
ready = function () {
    
$("#menu-toggle").click(function(e) {
    e.preventDefault();
    $("#wrapper").toggleClass("toggled");
});

$('#table_datatable').DataTable({
    responsive: true
});

$('#table2_datatable').DataTable({
    responsive: true
});

};
$(document).ready(ready);
$(document).on('page:load', ready);
$(document).on('turbolinks:render', ready);