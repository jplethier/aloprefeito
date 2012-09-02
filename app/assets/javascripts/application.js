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


$(document).ready(function () {
    setTimeout(hideFlashes, 2500);
});

$(function () {
    $("#complaint_tags").tokenInput("/complaints/tags.json",
        {
            hintText:'Digite sua tag...',
            noResultsText:'Nenhuma tag encontrada, digite uma nova e aperte espaço.',
            preventDuplicates:true,
            animateDropdown:true,
            theme:'facebook'
        });
});

var hideFlashes = function () {
    $('#flashes').fadeOut(1500);
}