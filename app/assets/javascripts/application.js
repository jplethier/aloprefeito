// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require ckeditor/init
//= require_tree .

jQuery(document).ready(function () {
    setTimeout(hideFlashes, 2500);

//  Gmaps.map.callback = function() {
//    $("#markers_list li a").addClass("link");
//    var list = $("#markers_list li");
//    $("#markers_list li").remove();
//    list.each(function(index, domEl){$("#markers_list_searchable ul").append(domEl)});
//
//    var options = {
//      valueNames: ["link"]
//    };
//
//    var markersList = new List('markers_list_searchable', options);
//  }
});

jQuery(function () {
    jQuery("#complaint_tags").tokenInput("/complaints/tags.json",
        {
            hintText:'Digite sua tag...',
            noResultsText:'Nenhuma tag encontrada, digite uma nova e aperte espaço.',
            preventDuplicates:true,
            animateDropdown:true,
            theme:'facebook'
        });
});

var hideFlashes = function () {
    jQuery('#flashes').fadeOut(1500);
}

