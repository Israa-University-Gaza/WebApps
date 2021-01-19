

var israaApp = (function () {

	var that = {};

    that.initSsdCascadingDropDown = function () {

	    $('.cascadingDropDown').ssdCascadingDropDown({
		    startCall: function (trigger, props) {

			    var spinner = '<div class="spinner"><i class="fa fa-spinner fa-spin"></i> processing</div>';

			    trigger.hide();
			    trigger.parent().prepend(spinner);

		    },
		    endCall: function (trigger, props) {

			    trigger.parent().find('.spinner').remove();
			    trigger.show();

		    },
		    nonFinalEmptyCallback: function (trigger, props, self) {

			    console.log('non final');

		    },
		    nonFinalCallback: function (trigger, props, data, self) {

			    trigger.closest('form')
				    .find('input[type="submit"]')
				    .attr('disabled', true);

		    },
		    finalEmptyCallback: function (trigger, props, self) {

			    console.log('final');

		    },
		    finalCallback: function (trigger, props, data) {

			    if (props.isValueEmpty()) {
				    trigger.closest('form')
					    .find('input[type="submit"]')
					    .attr('disabled', true);
			    } else {
				    trigger.closest('form')
					    .find('input[type="submit"]')
					    .attr('disabled', false);
			    }

		    }
	    });

	}

	return that;

})();





