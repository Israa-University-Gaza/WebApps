'use strict';

(function($){

  $(function() {
    $('#chart-container').orgchart({
        'data': '../../App_HRM/WebServices/OrgChart.ashx',
        'depth': 3,
        'nodeContent': 'title'
    });
  });
})(jQuery);


