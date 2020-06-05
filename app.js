var app = angular.module('labapp',['ngRoute']);

app.controller('labListController', function ($scope, $route, $routeParams, $location, $http) {
    $scope.labs = {};
    $scope.data = {};
    $scope.state = {};
    $scope.$route = $route;
    $scope.$location = $location;
    $scope.$routeParams = $routeParams;
    var data = $scope.data;
    function reset()
    {
        if($routeParams.lab)
        {
            $scope.getLab($routeParams.lab);
            if($routeParams.labId)
            {
                $scope.labfileDisplay($routeParams.labId);
                if($routeParams.qNo)
                {
                    $scope.codeDisplay($routeParams.qNo);
                }
            }
            else
            {
                $scope.labfileDisplay(0);
            }
        }
        else
        {
            $scope.getLab(Object.keys($scope.labs)[0]);
            $scope.labfileDisplay(0);
        }
    };

    $scope.getLab = function(lab)
    {
        $scope.state.labname = lab;
        $http.get($scope.labs[lab]["path"]+"/api.json").success(function(response) {
            $scope.data = response;
        });
        $location.path("/"+$scope.state.labname+"/0");
    };
    $scope.labfileDisplay = function(labno)
    {
        $scope.state.displayLab = labno;
        $scope.state.filename = "";
        $location.path("/"+$scope.state.labname+"/"+labno);
    };
    $scope.codeDisplay = function(qNo)
    {
        $scope.state.filename = $scope.labs[$scope.state.labname].path+ "/" + $scope.data.labs[$scope.state.displayLab].files[qNo].src;
        $http.get($scope.state.filename).success(function(response) {
            $scope.state.filecontent = response;
        });
        $location.path("/" + $scope.state.labname+"/"+$scope.state.displayLab+"/"+qNo);
    };
    $http.get('/api.json').success(function(response) {
        $scope.labs = response;
        reset();
    });
}
              );

app.config(function ($routeProvider) {
    $routeProvider
        .when("/:lab/:labId/:qNo",{})
        .when("/:lab/:labId",{})
        .when("/:lab",{})
        .when("/",{});
}
          );


