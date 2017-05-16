(function () {
    'use strict';

    angular
        .module('app', [
            'ui-notification'

            //modules
        ])
        .controller('chooseController', chooseController)
        .config(configure)
        .run(runBlock);

    function configure($locationProvider, $httpProvider, $sceProvider) {
        // Satellizer configuration that specifies which API
        // route the JWT should be retrieved from

        $sceProvider.enabled(false);
        /******************************************************************************/
        $httpProvider.defaults.headers.common["X-Requested-With"] = 'XMLHttpRequest';
        $httpProvider.defaults.useXDomain = true;

        $locationProvider.html5Mode({
            enabled: false,
            requireBase: false
        });
    }

    function runBlock($window) {
        //auth init
        VK.init({
             apiId: 6032114 // semak app
            // apiId: 5660830 //test app
        });
        VK.Widgets.Auth('vk_auth', {});

        $window.fbAsyncInit = function () {
            FB.init({
                 appId: '932980976842235',
                // appId: '1310527085646322',//test app
                status: true,
                cookie: true,
                xfbml: true,
                version: 'v2.4'
            });
        };
    }

    function chooseController($http, $scope, $timeout, Notification) {
        //vars
        $scope.chooseObj = {
            film: 0,
            actress: 0,
            actor: 0,
            regiser: 0,
            style: 0
        };
        $scope.isAuth = false;
        var langResources = {
            votes: {
                ua: {
                    film: ['"Дволикий коханець"', '"Окча"', '“Світ повний чудес”', '“Світло”', '“Роден”'],
                    actress: ['Джуліан Мур', 'Тільда Свінтон', 'Маріон Котіяр', 'Ніколь Кідман', 'Шарлотта Генсбур'],
                    actor: ['Венсан Лендон', 'Колін Фаррел', 'Роберт Паттінсон', 'Адам Сендлер', 'Бен Стіллер'],
                    regiser: ['Софія Коппола', 'Мішель Хазанавічус', 'Сергій Лозниця', 'Міхаель Ханеке', 'Пон Чжу Хо'],
                    style: ['Renault Kadjar', 'Renault Captur', 'Renault Megane', 'Renault Logan', '']
                },
                ru: {
                    film: ['"Двойной любовник"', '"Окча"', '“Мир, полный чудес”', '“Свет”', '“Роден”'],
                    actress: ['Джулиана Мур', 'Тильда Суинтон', 'Марион Котияр', 'Николь Кидман', 'Шарлотта Генсбур'],
                    actor: ['Венсан Линдон', 'Колин Фаррел', 'Роберт Паттинсон', 'Адам Сендлер', 'Бэн Cтиллер'],
                    regiser: ['София Коппола', 'Мишель Хазанавичус', 'Сергей Лозница', 'Михаэль Ханеке', 'Пон Чжу Хо'],
                    style: ['Renault Kadjar', 'Renault Captur', 'Renault Megane', 'Renault Logan', '']
                }
            },
            share:{
                ua:{
                    title:'Я - Голова Журі Каннського кінофестивалю 2017 і мій вибір такий!',
                    voteFilm:'Кращий фільм - ',
                    voteActress:'Краща актриса - ',
                    voteActor:'Кращий актор - ',
                    voteRegiser:'Кращий режисер - ',
                    voteStyle:'Кращий стиль - '
                },
                ru:{
                    title:'Я - Председатель Жюри Каннского кинофестиваля 2017 и мой выбор такой!',
                    voteFilm:'Лучший фільм - ',
                    voteActress:'Лучшая актриса - ',
                    voteActor:'Лучший актор - ',
                    voteRegiser:'Лучший режисер - ',
                    voteStyle:'Лучший стиль - '
                }
            },
            errors: {
                ua: {
                    notAuth: 'Авторизуйтесь'
                },
                ru: {
                    notAuth: 'Авторизируйтесь'
                }
            }
        };
        $scope.authType = '';
        $scope.choose = choose;
        $scope.sendResults = sendResults;
        $scope.shareVK = shareVk;
        $scope.shareFB = shareFB;

        $scope.vkLogin = vkLogin;
        $scope.fbLogin = fbLogin;
        function vkLogin() {
            VK.Auth.login(getVkCallback);
        }

//vk auth callback
        function getVkCallback(response) {
            $scope.authType = 'vk';
            if (response.session) {
                var userId = response.session.user.id;
                $scope.user = response.session.user;
                // social_net = '/saveVK.php';
                //get photo
                $http.jsonp("https://api.vk.com/method/users.get", {
                    params: {
                        user_id: userId,
                        fields: "photo_max_orig,sex,country,screen_name,bdate,city,has_mobile",
                        v: 5.63
                    }
                }).then(function (response) {
                    $scope.user = response.data.response[0];
                    $scope.vkImgUrl = response.data.response[0].photo_max_orig;
                }).then(function (resp) {
                    $http.post('/saveVK.php', $scope.user).then(function (resp) {

                    }, function (error) {

                    })
                });
                $scope.isAuth = true;
            } else {
                Notification.error({message: '', delay: 1500})
            }
        }

        function fbLogin() {
            FB.login(function (response) {
                statusChangeCallback(response);
            }, {
                scope: 'public_profile,email'
            });
        }

        //FB auth callback
        function statusChangeCallback(response) {
            // The response object is returned with a status field that lets the
            // app know the current login status of the person.
            // Full docs on the response object can be found in the documentation
            // for FB.getLoginStatus().
            if (response.status === 'connected') {
                // Logged into your app and Facebook.
                FB.api('/me', {fields: 'id, name, email, birthday, cover, first_name, last_name, link, locale, location'}, function (response) {
                    $scope.user = response;
                    $scope.fbImgUrl = 'https://graph.facebook.com/' + $scope.user.id + '/picture?type=large';
                    $scope.$digest();
                    $timeout(function () {
                        console.log($scope.user);
                        $http.post('/saveFB.php', $scope.user).then(function (resp) {
                            console.log(resp);
                        }, function (err) {

                        });
                    }, 1000);
                    $scope.isAuth = true;
                });

            } else if (response.status === 'not_authorized') {
                // The person is logged into Facebook, but not your app.
                document.getElementById('status').innerHTML = 'Please log ' +
                    'into this app.';
            } else {
                // The person is not logged into Facebook, so we're not sure if
                // they are logged into this app or not.
                document.getElementById('status').innerHTML = 'Please log ' +
                    'into Facebook.';
            }
        }

        function choose(chooseNum, type) {
            $scope.chooseObj[type] = chooseNum;
        }


        function sendResults() {
            if (!$scope.isAuth) {
                Notification.error({message: langResources.errors[$scope.lang].notAuth, delay: 1500});
                return;
            }
            $http.post('/storeVote.php', $scope.chooseObj).then(function (resp) {
                if($scope.lang == 'ua'){
                    alert('Ваш вибір збережено');
                }
                if($scope.lang == 'ru'){
                    alert('Ваш выбор сохранен');
                }
            }, function (err) {

            });
        }

        function shareVk() {
            var fbDescription = langResources.share[$scope.lang].voteFilm +langResources.votes[$scope.lang].film[$scope.chooseObj.film - 1] + '. '+
                langResources.share[$scope.lang].voteActor +langResources.votes[$scope.lang].actor[$scope.chooseObj.actor - 1] + '. '+
                langResources.share[$scope.lang].voteActress +langResources.votes[$scope.lang].actress[$scope.chooseObj.actress - 1] + '. '+
                langResources.share[$scope.lang].voteRegiser +langResources.votes[$scope.lang].regiser[$scope.chooseObj.regiser - 1] + '. '+
                langResources.share[$scope.lang].voteStyle +langResources.votes[$scope.lang].style[$scope.chooseObj.style - 1];

            var params = {
                url: 'http://renault-cannes.korrespondent.net/test.htm',
                title: langResources.share[$scope.lang].title
            };

            var encodeParams = encodeQueryData(params);
            window.open('http://vk.com/share.php' + encodeParams, '_blank')
        }

        function shareFB() {
            //todo make description
            var fbDescription = langResources.share[$scope.lang].voteFilm +langResources.votes[$scope.lang].film[$scope.chooseObj.film - 1] + '. '+
                langResources.share[$scope.lang].voteActor +langResources.votes[$scope.lang].actor[$scope.chooseObj.actor - 1] + '. '+
                langResources.share[$scope.lang].voteActress +langResources.votes[$scope.lang].actress[$scope.chooseObj.actress - 1] + '. '+
                langResources.share[$scope.lang].voteRegiser +langResources.votes[$scope.lang].regiser[$scope.chooseObj.regiser - 1] + '. '+
                langResources.share[$scope.lang].voteStyle +langResources.votes[$scope.lang].style[$scope.chooseObj.style - 1];
            var params = {
                u: 'http://renault-cannes.korrespondent.net/test.htm',
                description: fbDescription,
                caption: langResources.share[$scope.lang].title
            };

            var encodeParams = encodeQueryData(params);
            window.open('http://facebook.com/sharer/sharer.php' + encodeParams, '_blank')
        }

        //helper function
        function encodeQueryData(obj) {
            return '?' + Object.keys(obj).reduce(function (a, k) {
                    a.push(k + '=' + encodeURIComponent(obj[k]));
                    return a
                }, []).join('&')
        }
    }
})();

