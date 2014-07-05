$(function () {

	var

	ckeditor = function () {

		//Add the CKeditor to the page
        CKEDITOR.replace("ckeditor");

	},

	findSelectedContent = function (selected) {

		var sectionsContent = $(".section-content");

		if (selected.hasClass("selected")) {
			for (var j = 0; j < sectionsContent.length; j++) {
				if (selected.data("title") === $(sectionsContent[j]).data("title")) {
					$(sectionsContent[j]).addClass("selected");
				}
			}
		}
		
	},

	clickEvents = function () {
		$(".section-title").click(function () {
			$(".section-title").removeClass("selected");
			$(".section-content").removeClass("selected");

			$(this).addClass("selected");
			findSelectedContent($(this));		
		})
	},

	init = function (callback) {
		
		if ($("#ckeditor").length) {
			ckeditor();
		}

		var sectionsTitles = $(".section-title");

			sectionsTitles.first().addClass("selected");

			findSelectedContent(sectionsTitles.first())

			callback();
	};



	init: init(function () {
		clickEvents();
	});
});