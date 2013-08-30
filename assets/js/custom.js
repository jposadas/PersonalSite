$(document).ready(function () {

	$('#linkedin_icon').click(function() {
		window.open("http://www.linkedin.com/pub/juan-posadas-castillo/6b/22a/213");
	});

	$('#facebook_icon').click(function() {
		window.open("https://www.facebook.com/jposadas92");
	});

	$('#twitter_icon').click(function() {
		window.open("https://twitter.com/jposadasc");
	});

	$('#github_icon').click(function() {
		window.open("https://github.com/jposadas");
	});

	$('#email_icon').click(function () {
		window.location.href = "mailto:jposadas@stanford.edu";
	});

	$('#peru-link').click(function () {
		window.open("https://en.wikipedia.org/wiki/Peru");
	});

	$('#stanford-link').click(function () {
		window.open("https://www.stanford.edu");
	});

});

// Generate Random color from brand_colors array
$(document).ready(function () {

	var brand_colors = ["ADEE1D", "02B0F0", "FF358B", "FF6900"];
	var random_index = Math.floor(Math.random() * brand_colors.length);
	$('.navbar > .container .navbar-brand').css('color', '#' + brand_colors[random_index]);

});
