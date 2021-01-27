var app = angular.module("app", ["angularFileUpload"]);

app.controller('AppController', function ($rootScope, $scope, $http, FileUploader) {
    $scope.isMsg = false;
    $scope.status = 0;
    $scope.msg = '';

    $scope.courseId = '-1';
    $scope.bookName = '';

    $scope.setMsg = function (status, msg) {
        $scope.isMsg = true;
        $scope.status = status;
        $scope.msg = msg;
    }

    var uploader = $scope.uploader = new FileUploader({
        url: '/Instructor/WebServices/UploadCourseBook.ashx',
        formData: []
    });
    uploader.filters.push({
        name: 'customFilter',
        fn: function (item /*{File|FileLikeObject}*/, options) {
            if (item.type != "application/pdf") {
                $scope.setMsg(0, 'الرجاء إضافة الكتاب بصيغة pdf')
                return false;
            }
            $scope.uploader.clearQueue();
            return true;
        }
    });

    $scope.$watch('courseId', function (newValue, oldValue) {
        $scope.uploader.formData = [{ courseId: $scope.courseId, bookName: $scope.bookName }];
    });

    $scope.$watch('bookName', function (newValue, oldValue) {
        $scope.uploader.formData = [{ courseId: $scope.courseId, bookName: $scope.bookName }];
    });


    $scope.UploadCourseBook = function () {
        console.log($scope.uploader.formData);
        if ($scope.courseId == -1) {
            $scope.setMsg(0, 'الرجاء إختيار المساق لحفظ الكتاب')
        } else if ($scope.bookName == '') {
            $scope.setMsg(0, 'الرجاء إدخال اسم الكتاب')
        } else {
            $scope.uploader.uploadAll();
        }
    };

    uploader.onSuccessItem = function (fileItem, response, status, headers) {
        console.log(response);
        $scope.setMsg(response.status, response.msg)
    };
});