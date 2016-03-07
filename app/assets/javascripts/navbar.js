(function($) {
	var ready;
	ready = function() {
		$(".button-collapse").sideNav();
		$('.dropdown-button').dropdown();
	}
	$(document).on('page:load', ready); // End Document Ready
})(jQuery); // End of jQuery name space

