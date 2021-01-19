var StudyTable = function () {
  return {
    init: function () {

      function onSelect(start, end, jsEvent, view) {
        console.log("onSelect _ " + $('#study-table-semester').val());
        var s = moment(start).toDate().toISOString();
        var e = moment(end).toDate().toISOString();
        $("#pop-up-md .modal-dialog").load('/Academic/Lecture/Add?semesterId=' + $('#study-table-semester').val() + '&departmentId=' + $('#study-table-department').val() + '&studyLevelId=' + $('#study-table-study-level').val() + '&roomId=' + $('#study-table-room').val() + '&start=' + s + '&end=' + e, function () {
          $("#pop-up-md").modal("show");
        });
      };

      function onSelect2(start, end, jsEvent, view) {
        console.log("onSelect2");
        var s = moment(start).toDate().toISOString();
        var e = moment(end).toDate().toISOString();
        $("#pop-up-md .modal-dialog").load('/Academic/Lecture/Add?semesterId=' + $('#study-table-semester').val()+'&departmentId=-1&studyLevelId=-1&roomId=-1&start=' + s + '&end=' + e, function () {
          $("#pop-up-md").modal("show");
        });
      };

      function onSelect3(start, end, jsEvent, view) {
        console.log("onSelect3 _ " + $('#student-study-table-semester').val());
        var s = moment(start).toDate().toISOString();
        var e = moment(end).toDate().toISOString();
        $("#pop-up-md .modal-dialog").load('/Academic/Lecture/Add?semesterId=' + $('#student-study-table-semester').val() + '&departmentId=' + $('#student-study-table-department').val() + '&studyLevelId=' + $('#student-study-table-study-level').val() + '&roomId=-1&start=' + s + '&end=' + e, function () {
          $("#pop-up-md").modal("show");
        });
      };

      function onEventClick(event, jsEvent, view) {
        $("#pop-up-md .modal-dialog").load('/Academic/Lecture/Edit/' + event.id, function () {
          $("#pop-up-md").modal("show");
        });
      };

      function onDrop(event, delta, revertFunc, jsEvent, ui, view) {
        var s = moment(event.start).toDate().toISOString();
        var e = moment(event.end).toDate().toISOString();

        var d = { id: event.id, start: s, end: e };

        $.post("/Academic/Lecture/SetDayTime", d, function (data) {
          showToastTitle(data.title, data.msg, (data.status === "1") ? "success" : "error");
          if (data.status === "0") {
            revertFunc();
          }
        });
      };

      function onResize(event, delta, revertFunc, jsEvent, ui, view) {
        var s = moment(event.start).toDate().toISOString();
        var e = moment(event.end).toDate().toISOString();

        var d = { id: event.id, start: s, end: e };

        $.post("/Academic/Lecture/SetDayTime", d, function (data) {
          showToastTitle(data.title, data.msg, (data.status === "1") ? "success" : "error");
          if (data.status === "0") {
            revertFunc();
          }
        });
      };

      function onEventMouseover(event, jsEvent, view) {
        $(this).popover({ html: true, title: event.Course + '<button class="close" style="margin-top: 4px;" type="button"></button>', content: 'الشعبة : ' + event.SectionNum + ' , القاعة : ' + event.Room + '<br />' + 'المحاضر : ' + event.Instructor, placement: 'top', container: 'body' }).popover('show');
        $('.close').click(function () {
          $(this).parent().parent().remove();
        });
        return false;
      }

      function onEventMouseout(event, jsEvent, view) {
        $(this).popover('hide');
        return false;
      }

      $('#calendar1').fullCalendar({
        height: 550,
        header: {
          left: '',
          center: '',
          right: ''
        },
        editable: true,
        selectable: true,
        lang: 'ar',
        columnFormat: 'dddd',
        defaultDate: '2016-10-01',
        defaultView: 'agendaWeek',
        hiddenDays: [5],
        minTime: "07:00:00",
        maxTime: "18:00:00",
        allDaySlot: false,
        select: onSelect,
        eventClick: onEventClick,
        eventDrop: onDrop,
        eventResize: onResize,
        eventMouseover: onEventMouseover,
        eventMouseout: onEventMouseout
      });

      $('#section-study-table-calendar').fullCalendar({
        height: 550,
        header: {
          left: '',
          center: '',
          right: ''
        },
        editable: true,
        selectable: true,
        lang: 'ar',
        columnFormat: 'dddd',
        defaultDate: '2016-10-01',
        defaultView: 'agendaWeek',
        hiddenDays: [5],
        minTime: "07:00:00",
        maxTime: "18:00:00",
        allDaySlot: false,
        select: onSelect,
        eventClick: onEventClick,
        eventDrop: onDrop,
        eventResize: onResize,
        eventMouseover: onEventMouseover,
        eventMouseout: onEventMouseout
      });

      $('#student-calendar').fullCalendar({
        height: 550,
        header: {
          left: '',
          center: '',
          right: ''
        },
        editable: true,
        selectable: true,
        lang: 'ar',
        columnFormat: 'dddd',
        defaultDate: '2016-10-01',
        defaultView: 'agendaWeek',
        hiddenDays: [5],
        minTime: "07:00:00",
        maxTime: "18:00:00",
        allDaySlot: false,
        select: onSelect3,
        eventClick: onEventClick,
        eventDrop: onDrop,
        eventResize: onResize,
        eventMouseover: onEventMouseover,
        eventMouseout: onEventMouseout
      });

      $('#calendar3').fullCalendar({
        height: 550,
        header: {
          left: '',
          center: '',
          right: ''
        },
        editable: true,
        selectable: true,
        lang: 'ar',
        columnFormat: 'dddd',
        defaultDate: '2016-10-01',
        defaultView: 'agendaWeek',
        hiddenDays: [5],
        minTime: "07:00:00",
        maxTime: "18:00:00",
        allDaySlot: false,
        select: onSelect,
        eventClick: onEventClick,
        eventDrop: onDrop,
        eventResize: onResize,
        eventMouseover: onEventMouseover,
        eventMouseout: onEventMouseout
      });

      $('#calendar4').fullCalendar({
        height: 550,
        header: {
          left: '',
          center: '',
          right: ''
        },
        editable: true,
        selectable: true,
        lang: 'ar',
        columnFormat: 'dddd',
        defaultDate: '2016-10-01',
        defaultView: 'agendaWeek',
        hiddenDays: [5],
        minTime: "07:00:00",
        maxTime: "18:00:00",
        allDaySlot: false,
        select: onSelect,
        eventClick: onEventClick,
        eventDrop: onDrop,
        eventResize: onResize,
        eventMouseover: onEventMouseover,
        eventMouseout: onEventMouseout
      });

      $('#calendar5').fullCalendar({
        height: 550,
        header: {
          left: '',
          center: '',
          right: ''
        },
        editable: true,
        selectable: true,
        lang: 'ar',
        columnFormat: 'dddd',
        defaultDate: '2016-10-01',
        defaultView: 'agendaWeek',
        hiddenDays: [5],
        minTime: "07:00:00",
        maxTime: "18:00:00",
        allDaySlot: false,
        select: onSelect,
        eventClick: onEventClick,
        eventDrop: onDrop,
        eventResize: onResize,
        eventMouseover: onEventMouseover,
        eventMouseout: onEventMouseout
      });

      $('#calendar6').fullCalendar({
        height: 550,
        header: {
          left: '',
          center: '',
          right: ''
        },
        editable: true,
        selectable: true,
        lang: 'ar',
        columnFormat: 'dddd',
        defaultDate: '2016-10-01',
        defaultView: 'agendaWeek',
        hiddenDays: [5],
        minTime: "07:00:00",
        maxTime: "18:00:00",
        allDaySlot: false,
        select: onSelect2,
        eventClick: onEventClick,
        eventDrop: onDrop,
        eventResize: onResize,
        eventMouseover: onEventMouseover,
        eventMouseout: onEventMouseout
      });

      $('#section-calendar').fullCalendar({
        height: 550,
        header: {
          left: '',
          center: '',
          right: ''
        },
        editable: true,
        selectable: true,
        lang: 'ar',
        columnFormat: 'dddd',
        defaultDate: '2016-10-01',
        defaultView: 'agendaWeek',
        hiddenDays: [5],
        minTime: "07:00:00",
        maxTime: "18:00:00",
        allDaySlot: false,
        select: onSelect,
        eventClick: onEventClick,
        eventDrop: onDrop,
        eventResize: onResize,
        eventMouseover: onEventMouseover,
        eventMouseout: onEventMouseout
      });

      function getStudyTableLectures() {

        var semesterId = $('#study-table-semester').val();
        var departmentId = $('#study-table-department').val();
        var studyLevelId = $('#study-table-study-level').val();
        var genderId = $('#study-table-gender').val();
        var instructorId = $('#study-table-instructor').val();
        var roomId = $('#study-table-room').val();

        var d = { SemesterID: semesterId, DepartmentID: departmentId, StudyLevelID: studyLevelId, GenderID: genderId, InstructorID: instructorId, RoomID: roomId };

        var events = {
          url: '/Academic/StudyTable/Lectures',
          type: 'GET',
          data: d
        }
        $('#calendar1').fullCalendar('removeEventSource', events);
        $('#calendar1').fullCalendar('addEventSource', events);
      }

      function getSectionStudyTableLectures() {
        var sectionId = $('#section-study-table-section1').val();

        var d = { SectionID: sectionId };

        var events = {
          url: '/Academic/StudyTable/SectionStudyTableLectures',
          type: 'GET',
          data: d
        }
        $('#section-study-table-calendar').fullCalendar('removeEventSource', events);
        $('#section-study-table-calendar').fullCalendar('addEventSource', events);
      }

      function getStudentLectures() {
        var semesterId = $('#student-study-table-semester').val();
        var departmentId = $('#student-study-table-department').val();
        var studyLevelId = $('#student-study-table-study-level').val();
        var genderId = $('#student-study-table-gender').val();
        var branchId = $('#student-study-table-branch').val();

        var d = { SemesterID: semesterId, DepartmentID: departmentId, StudyLevelID: studyLevelId, GenderID: genderId, BranchId: branchId };

        var events = {
          url: '/Academic/StudyTable/StudentLectures',
          type: 'GET',
          data: d
        }
        $('#student-calendar').fullCalendar('removeEventSource', events);
        $('#student-calendar').fullCalendar('addEventSource', events);
      }

      function getInstructorLectures() {
        var semesterId = $('#instructor-study-table-semester').val();
        var instructorId = $('#instructor-study-table-instructor').val();

        var d = { SemesterID: semesterId, InstructorID: instructorId };

        var events = {
          url: '/Academic/StudyTable/InstructorLectures',
          type: 'GET',
          data: d
        }
        $('#calendar3').fullCalendar('removeEventSource', events);
        $('#calendar3').fullCalendar('addEventSource', events);
      }

      function getCourseLectures() {
        var courseId = $('#course-study-table-course').val();
        var semesterId = $('#course-study-table-semester').val();
        var d = { SemesterID: semesterId, CourseID: courseId };

        var events = {
          url: '/Academic/StudyTable/CourseLectures',
          type: 'GET',
          data: d
        }
        $('#calendar5').fullCalendar('removeEventSource', events);
        $('#calendar5').fullCalendar('addEventSource', events);
      }

      function getSectionLectures() {
        var sectionId = $('#section-study-table-section').val();

        var d = { SectionID: sectionId };

        var events = {
          url: '/Academic/StudyTable/SectionLectures',
          type: 'GET',
          data: d
        }
        $('#section-calendar').fullCalendar('removeEventSource', events);
        $('#section-calendar').fullCalendar('addEventSource', events);
      }

      function getRoomLectures() {
        var semesterId = $('#room-study-table-semester').val();
        var roomId = $('#room-study-table-room').val();

        var d = { SemesterID: semesterId, RoomID: roomId };

        var events = {
          url: '/Academic/StudyTable/RoomLectures',
          type: 'GET',
          data: d
        }
        $('#calendar4').fullCalendar('removeEventSource', events);
        $('#calendar4').fullCalendar('addEventSource', events);
      }

      getStudyTableLectures();
      getSectionStudyTableLectures();
      getStudentLectures();
      getInstructorLectures();
      getCourseLectures();
      getSectionLectures();
      getRoomLectures();

      $('.study-table-change').change(function () {
        getStudyTableLectures();
      });
      $('.section-study-table-change1').change(function () {
        getSectionStudyTableLectures();
      });
      $('.student-study-table-change').change(function () {
        getStudentLectures();
      });
      $('.instructor-study-table-change').change(function () {
        getInstructorLectures();
      });
      $('.course-study-table-change').change(function () {
        getCourseLectures();
      });
      $('.section-study-table-change').change(function () {
        getSectionLectures();
      });
      $('.room-study-table-change').change(function () {
        getRoomLectures();
      });

      $('#study-table-refresh').click(function () {
        getStudyTableLectures();
      });
      $('#section-study-table-refresh1').click(function () {
        getSectionStudyTableLectures();
      });
      $('#student-study-table-refresh').click(function () {
        getStudentLectures();
      });
      $('#instructor-study-table-refresh').click(function () {
        getInstructorLectures();
      });
      $('#course-study-table-refresh').click(function () {
        getCourseLectures();
      });
      $('#section-study-table-refresh').click(function () {
        getCourseLectures();
      });
      $('#room-study-table-refresh').click(function () {
        getRoomLectures();
      });

      $('#section-study-table-tab').removeClass('active');
      $('#student-tab').removeClass('active');
      $('#instructor-tab').removeClass('active');
      $('#course-tab').removeClass('active');
      $('#section-tab').removeClass('active');
      $('#room-tab').removeClass('active');
      $('#lecture-tab').removeClass('active');
      $('#print-tab').removeClass('active');
    }
  };
}();

$(document).ready(function () {

  StudyTable.init();

  // set semester id in hidden for Print Forms
  var smID = $('#filter_SemesterID option:selected').val();
  $('.SemesterID_ddl').val(smID)


  $("#filter_SemesterID").change(function () {
    var smID = $('#filter_SemesterID option:selected').val();
    $('.SemesterID_ddl').val(smID)
  });

  // set semester id in hidden for Print Forms
  var BrID = $('#filter_BranchID option:selected').val();
  $('.BranchID_ddl').val(BrID)


  $("#filter_BranchID").change(function () {
    var smID = $('#filter_BranchID option:selected').val();
    $('.BranchID_ddl').val(smID)
  });








});