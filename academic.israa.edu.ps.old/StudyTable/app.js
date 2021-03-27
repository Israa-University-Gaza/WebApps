
var app = angular.module("CalenderApp", ["ui.bootstrap", "ui-notification"]);

app.config(function (NotificationProvider) {
    NotificationProvider.setOptions({
        delay: 20000,
        startTop: 20,
        startRight: 10,
        verticalSpacing: 20,
        horizontalSpacing: 20,
        positionX: 'left',
        positionY: 'top'
    });
});

app.directive("select", function ($timeout, $parse) {
    return {
        restrict: 'AC',
        require: 'ngModel',
        link: function (scope, element, attrs) {
            $timeout(function () {
                console.log('initializedSelect');
                element.select2();
                element.select2Initialized = true;
            });

            var refreshSelect = function () {
                console.log('refreshSelect');
                if (!element.select2Initialized) return;
                $timeout(function () {
                    element.trigger('change');
                });
            };

            scope.$watch(attrs.ngModel, refreshSelect);
        }
    };
});

app.controller('AppController', function ($scope, $http, $compile, $log, Notification) {

    $scope.blockid = '-1';
    $scope.instructorid = '-1';
    $scope.roomid = '-1';
    $scope.courseid = '-1';

    $scope.blockHours = '0';
    $scope.instructorHours = '0';
    $scope.roomHours = '0';
    $scope.courseHours = '0';

    $scope.sections = {};

    $scope.lecture = {
        selectedID: ''
    };

    $scope.changeBlock = function (blockid) {

        $http.get('WebServices/GetBlockHours.ashx', { params: { selectedBlock: $scope.blockid } }).then(function (response) {
            $scope.blockHours = response.data.hours;
        }, function (response) {
            console.log(response)
        });

        var events = {
            url: 'WebServices/GetBlockLectures.ashx',
            type: 'GET',
            data: {
                blockid: $scope.blockid
            }
        }
        $('#calendar1').fullCalendar('removeEventSource', events);
        $('#calendar1').fullCalendar('addEventSource', events);
    }
    $scope.changeInstructor = function (instructorid) {

        $http.get('WebServices/GetInstructorHours.ashx', { params: { selectedInstructor: $scope.instructorid } }).then(function (response) {
            $scope.instructorHours = response.data.hours;
        }, function (response) {
            console.log(response)
        });

        var events = {
            url: 'WebServices/GetInstructorLectures.ashx',
            type: 'GET',
            data: {
                instructorid: $scope.instructorid
            }
        }
        $('#calendar2').fullCalendar('removeEventSource', events);
        $('#calendar2').fullCalendar('addEventSource', events);


    }
    $scope.changeRoom = function (roomid) {
        var events = {
            url: 'WebServices/GetRoomLectures.ashx',
            type: 'GET',
            data: {
                roomid: $scope.roomid
            }
        }
        $('#calendar3').fullCalendar('removeEventSource', events);
        $('#calendar3').fullCalendar('addEventSource', events);
    }
    $scope.changeCourse = function (courseid) {
        var events = {
            url: 'WebServices/GetCourseLectures.ashx',
            type: 'GET',
            data: {
                courseid: $scope.courseid
            }
        }
        $('#calendar4').fullCalendar('removeEventSource', events);
        $('#calendar4').fullCalendar('addEventSource', events);
    }

    $scope.changeOfferdCourse = function () {
        $http.get('WebServices/GetOfferdCourseSections.ashx', { params: { offerdCourseid: $scope.lecture.selectedOfferedCourse } }).then(function (response) {
            $scope.sections = response.data;
            $scope.lecture.selectedSection = "-1";
        }, function (response) {
            console.log(response)
        });
    }

    ///* alert on eventClick */
    $scope.alertOnEventClick = function (event, jsEvent, view) {
        $scope.lecture.selectedID = event.id;
        $scope.lecture.selectedCourse = event.Course;
        $scope.lecture.selectedSection = event.SectionID;
        $scope.lecture.selectedSectionNum = event.SectionNum;
        $scope.lecture.selectedRoom = event.RoomID;
        $scope.lecture.selectedDay = event.DayID;
        $scope.lecture.selectedFromHour = event.FromHour;
        $scope.lecture.selectedToHour = event.ToHour;
        $scope.$apply();
        $('#myModal').modal('show');
    };

    /* alert on Drop */
    $scope.alertOnDrop = function (event, delta, revertFunc, jsEvent, ui, view) {

        $scope.lecture.selectedID = event.id;
        $scope.lecture.selectedSection = event.SectionID;
        $scope.lecture.selectedRoom = event.RoomID;

        var start = moment(event.start).toDate().toISOString();
        var end = moment(event.end).toDate().toISOString();

        $scope.lecture.selectedDay = (parseInt(start.substring(9, 10)) + 14).toString();
        $scope.lecture.selectedFromHour = start.substring(11, 16);
        $scope.lecture.selectedToHour = end.substring(11, 16);

        $http.get("WebServices/LectureAddEdit.ashx", { params: $scope.lecture }).then(function (response) {
            Notification({ title: response.data.title, message: response.data.msg }, (response.data.status === "1") ? 'success' : 'error');
            if (response.data.status === "0") {
                revertFunc();
            }
        }, function (response) {
            console.log(response);
        });
    };

    $scope.alertOnResize = function (event, delta, revertFunc, jsEvent, ui, view) {
        $scope.lecture.selectedID = event.id;
        $scope.lecture.selectedSection = event.SectionID;
        $scope.lecture.selectedRoom = event.RoomID;

        var start = moment(event.start).toDate().toISOString();
        var end = moment(event.end).toDate().toISOString();

        $scope.lecture.selectedDay = (parseInt(start.substring(9, 10)) + 14).toString();
        $scope.lecture.selectedFromHour = start.substring(11, 16);
        $scope.lecture.selectedToHour = end.substring(11, 16);

        $http.get("WebServices/LectureAddEdit.ashx", { params: $scope.lecture }).then(function (response) {
            Notification({ title: response.data.title, message: response.data.msg }, (response.data.status === "1") ? 'success' : 'error');
            if (response.data.status === "0") {
                revertFunc();
            }
        }, function (response) {
            console.log(response);
        });
    };

    $scope.renderCalender = function () {
        $scope.changeBlock($scope.blockid);
        $scope.changeInstructor($scope.instructorid);
        $scope.changeRoom($scope.roomid);
        $scope.changeCourse($scope.courseid);
    }
    /* alert on Resize */

    $scope.save = function () {
        $http.get("WebServices/LectureAddEdit.ashx", { params: $scope.lecture }).then(function (response) {
            Notification({ title: response.data.title, message: response.data.msg }, (response.data.status === "1") ? 'success' : 'error');
            $scope.renderCalender();
            if (response.data.status === "1")
                $('#myModal').modal('hide');
        }, function (response) {
            console.log(response);
        });
    };

    $scope.deleteLecture = function () {
        if (confirm('هل أنت متأكد من أنك تود حذف المحاضرة لمساق ' + $scope.lecture.selectedCourse + ' لشعبة ' + $scope.lecture.selectedSectionNum + ' ?')) {
            $http.get("WebServices/DeleteLecture.ashx", { params: { 'selectedID': $scope.lecture.selectedID } }).then(function (response) {
                Notification({ message: response.data.msg }, (response.data.status === "1") ? 'success' : 'error');
                $('#calendar1').fullCalendar('removeEvents', $scope.lecture.selectedID);
                $('#calendar2').fullCalendar('removeEvents', $scope.lecture.selectedID);
                $('#calendar3').fullCalendar('removeEvents', $scope.lecture.selectedID);
                $('#calendar4').fullCalendar('removeEvents', $scope.lecture.selectedID);
                $('#myModal').modal('hide');
            }, function (response) {
                console.log(response);
            });
        }
    };

    $scope.deleteFromBlock = function () {
        if (confirm('هل أنت متأكد من أنك تود حذف الشعبة رقم ' + $scope.lecture.selectedSectionNum + ' لمساق ' + $scope.lecture.selectedCourse + ' ?')) {
            $http.get("WebServices/DeleteSectionFromBlock.ashx", { params: { 'selectedBlockID': $scope.blockid, 'selectedSectionID': $scope.lecture.selectedSection } }).then(function (response) {
                Notification({ message: response.data.msg }, (response.data.status === "1") ? 'success' : 'error');
                $('#calendar1').fullCalendar('removeEvents', $scope.lecture.selectedID);
                $('#calendar2').fullCalendar('removeEvents', $scope.lecture.selectedID);
                $('#calendar3').fullCalendar('removeEvents', $scope.lecture.selectedID);
                $('#calendar4').fullCalendar('removeEvents', $scope.lecture.selectedID);
                $('#myModal').modal('hide');
            }, function (response) {
                console.log(response);
            });
        }
    };

    //$scope.alertOnSelect = function (start, end, jsEvent, view) {
    //    $scope.lecture.selectedID = '';
    //    $scope.lecture.selectedCourse = '';
    //    $scope.lecture.selectedBlock = $scope.blockid;
    //    $scope.lecture.selectedOfferedCourse = '-1';
    //    $scope.lecture.selectedSection = '-1';
    //    $scope.lecture.selectedInstructor = $scope.instructorid;
    //    $scope.lecture.selectedRoom = '-1';

    //    var s = moment(start).toDate().toISOString();
    //    var e = moment(end).toDate().toISOString();

    //    $scope.lecture.selectedDay = (parseInt(s.substring(9, 10)) + 14).toString();
    //    $scope.lecture.selectedFromHour = s.substring(11, 16);
    //    $scope.lecture.selectedToHour = e.substring(11, 16);
    //    $scope.$apply();
    //    $('#myModal').modal('show');
    //};

    $scope.isSelectedLecture = function () {
        return $scope.lecture.selectedID !== '';
    }

    $scope.onEventMouseover = function (event, jsEvent, view) {
        $(this).popover({ html: true, title: event.Course + '<button class="close" style="margin-top: 4px;" type="button"></button>', content: 'الشعبة : ' + event.SectionNum + ' , القاعة : ' + event.Room + '<br />' + 'المحاضر : ' + event.Instructor, placement: 'top', container: 'body' }).popover('show');
        $('.close').click(function () {
            $(this).parent().parent().remove();
        });
        return false;
    }

    $scope.onEventMouseout = function (event, jsEvent, view) {
        $(this).popover('hide');
        return false;
    }

    $('#calendar1').fullCalendar({
        height: 500,
        header: {
            left: '',
            center: '',
            right: ''
        },
        editable: true,
        selectable: false,
        lang: 'ar',
        columnFormat: 'dddd',
        defaultDate: '2016-10-01',
        defaultView: 'agendaWeek',
        hiddenDays: [5],
        minTime: "07:00:00",
        maxTime: "21:00:00",
        allDaySlot: false,
        eventClick: $scope.alertOnEventClick,
        eventDrop: $scope.alertOnDrop,
        eventResize: $scope.alertOnResize,
        eventMouseover: $scope.onEventMouseover,
        eventMouseout: $scope.onEventMouseout
    });
    $('#calendar2').fullCalendar({
        height: 500,
        header: {
            left: '',
            center: '',
            right: ''
        },
        editable: true,
        selectable: false,
        lang: 'ar',
        columnFormat: 'dddd',
        defaultDate: '2016-10-01',
        defaultView: 'agendaWeek',
        hiddenDays: [5],
        minTime: "07:00:00",
        maxTime: "21:00:00",
        allDaySlot: false,
        eventClick: $scope.alertOnEventClick,
        eventDrop: $scope.alertOnDrop,
        eventResize: $scope.alertOnResize,
        eventMouseover: $scope.onEventMouseover,
        eventMouseout: $scope.onEventMouseout
    });
    $('#calendar3').fullCalendar({
        height: 500,
        header: {
            left: '',
            center: '',
            right: ''
        },
        editable: true,
        selectable: false,
        lang: 'ar',
        columnFormat: 'dddd',
        defaultDate: '2016-10-01',
        defaultView: 'agendaWeek',
        hiddenDays: [5],
        minTime: "07:00:00",
        maxTime: "21:00:00",
        allDaySlot: false,
        eventClick: $scope.alertOnEventClick,
        eventDrop: $scope.alertOnDrop,
        eventResize: $scope.alertOnResize,
        eventMouseover: $scope.onEventMouseover,
        eventMouseout: $scope.onEventMouseout
    });
    $('#calendar4').fullCalendar({
        height: 500,
        header: {
            left: '',
            center: '',
            right: ''
        },
        editable: true,
        selectable: false,
        lang: 'ar',
        columnFormat: 'dddd',
        defaultDate: '2016-10-01',
        defaultView: 'agendaWeek',
        hiddenDays: [5],
        minTime: "07:00:00",
        maxTime: "21:00:00",
        allDaySlot: false,
        eventClick: $scope.alertOnEventClick,
        eventDrop: $scope.alertOnDrop,
        eventResize: $scope.alertOnResize,
        eventMouseover: $scope.onEventMouseover,
        eventMouseout: $scope.onEventMouseout
    });
});