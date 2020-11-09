<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Passion Hotel</title>
        <link rel="shortcut icon" href="{{asset('img/heart.svg')}}" type="image/x-icon">

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha512-SfTiTlX6kk+qitfevl/7LibUOeJWlt9rbyDn92a1DqWOw9vWG2MFoays0sgObmWazO5BQPiFucnnEAjpAB+/Sw==" crossorigin="anonymous" />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
        />

        <!-- Styles -->
        <style>
            html, body {
                background: #f2709c;  /* fallback for old browsers */
                background: -webkit-linear-gradient(to right, #ff9472, #f2709c);  /* Chrome 10-25, Safari 5.1-6 */
                background: linear-gradient(to right, #ff9472, #f2709c); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                color: rgb(252, 200, 226);
                font-family: 'Nunito', sans-serif;
                font-weight: 200;
                height: 100vh;
                margin: 0;
            }

            .full-height {
                height: 100vh;
            }

            .flex-center {
                align-items: center;
                display: flex;
                justify-content: center;
            }

            .position-ref {
                position: relative;
            }

            .top-right {
                position: absolute;
                right: 10px;
                top: 18px;
            }

            .content {
                text-align: center;
            }

            .title {
                font-size: 84px;
            }

            .links > a {
                color: rgb(252, 200, 226);
                padding: 0 25px;
                font-size: 15px;
                font-weight: 700;
                letter-spacing: .1rem;
                text-decoration: none;
                text-transform: uppercase;
            }

            .m-b-md {
                margin-bottom: 30px;
            }

            .fa-heart {
                text-shadow: 0 0 5px rgb(240, 198, 227), 0 0 20px rgb(219, 131, 131);
                margin: 10px;
                animation: beat 2s ease-in infinite
            }

            @keyframes beat {
                0% {
                    transform: scale(1)
                }
                75% {
                    transform: scale(1.5)
                }
                100% {
                    transform: scale(1)
                }
            }

            @media only screen and (max-width:620px) {
                .fa-heart {
                display: block;
                }
            }

        </style>
    </head>
    <body>
        <div class="flex-center position-ref full-height">
            @if (Route::has('login'))
                <div class="top-right links">
                    @auth
                        <a href="{{ url('/home') }}">Home</a>
                    @else
                        <a href="{{ route('login') }}">Login</a>

                        @if (Route::has('register'))
                            <a href="{{ route('register') }}">Register</a>
                        @endif
                    @endauth
                </div>
            @endif

            <div class="content">
                <div class="title m-b-md animate__animated animate__fadeInTopLeft">
                    Passion <i class="fa fa-heart"></i> Hotel
                </div>
            </div>
        </div>
    </body>
</html>
