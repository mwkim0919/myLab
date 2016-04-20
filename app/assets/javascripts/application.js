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
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require moment
//= require bootstrap-datetimepicker
//= require_tree .

$(function () {
    $('#searchStart').datetimepicker({
        format: 'YYYY-MM-DD',
        toolbarPlacement: 'top',
    });
    $('#searchEnd').datetimepicker({
        useCurrent: false, //Important! See issue #1075
        format: 'YYYY-MM-DD',
        toolbarPlacement: 'top',
    });
    $("#searchStart").on("dp.change", function (e) {
        $('#searchEnd').data("DateTimePicker").minDate(e.date);
    });
    $("#searchEnd").on("dp.change", function (e) {
        $('#searchStart').data("DateTimePicker").maxDate(e.date);
    });


    $('#startDateTime').datetimepicker({
    	format: 'YYYY-MM-DD h:mm a',
        toolbarPlacement: 'top',
    	// inline: true,
        // sideBySide: true
    });
    $('#endDateTime').datetimepicker({
        useCurrent: false, //Important! See issue #1075
        format: 'YYYY-MM-DD h:mm a',
        toolbarPlacement: 'top',
    	// inline: true,
        // sideBySide: true
    });
    $("#startDateTime").on("dp.change", function (e) {
        $('#endDateTime').data("DateTimePicker").minDate(e.date);
    });
    $("#endDateTime").on("dp.change", function (e) {
        $('#startDateTime').data("DateTimePicker").maxDate(e.date);
    });
});