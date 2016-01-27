// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var dynamicSelect = function() {
  $('#complaint_city_id').parent().hide();
  var cities = $('#complaint_city_id').html();

  $('#complaint_state_id').change(function() {
    var state = $("#complaint_state_id :selected").text();
		var options = $(cities).filter("optgroup[label='" + state + "']").html();
    if (options) {
      $('#complaint_city_id').html(options);
      $('#complaint_city_id').parent().show();
    } else {
      $('#complaint_city_id').empty();
      $('#complaint_city_id').parent().hide();
    }
  });
}

$(document).ready(dynamicSelect);
$(document).on('page:load', dynamicSelect);
