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
//= require turbolinks
//= require bootstrap

//= require moment
//= require bootstrap-datetimepicker
//= require pickers
//= require moment/pt-br
//= require select2

//= require_tree .



$(document).on("turbolinks:load", function() {

	$(".sk-circle").hide();

  // show spinner on AJAX start
  $(document).ajaxStart(function(){
    $(".sk-circle").show();
    $("#diario").hide();
  });

  // hide spinner on AJAX stop
  $(document).ajaxStop(function(){
    $(".sk-circle").hide();
    $("#diario").show();
  });

	// Every time a modal is shown, if it has an autofocus element, focus on it.
	//Ajuste para conseguir fazer funcionar o autofocus: true dentro de um modal
	$('.modal').on('shown.bs.modal', function() {
	  $(this).find('[autofocus]').focus();
	});

	$('.link-paciente-selecao').click(function() {
		alert("clicado!");
	});

	$(".auto-close-alert").fadeTo(2000, 500).slideUp(500, function(){
		$(".auto-close-alert").slideUp(500);
	});

    $("#attend_requester_id").select2({
    	theme: "bootstrap"
    });
 });
