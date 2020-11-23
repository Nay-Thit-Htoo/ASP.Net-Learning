<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SlickSliderExample2.aspx.cs" Inherits="AdminDashboard.SlickSliderExample21" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <!-- Add the slick-theme.css if you want default styling -->
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <!-- Add the slick-theme.css if you want default styling -->
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" />

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        body {
            background: #ccc;
        }

        .main {
            font-family: Arial;
            width: 150vh;
            display: block;
            margin: 0 auto;
        }

        h3 {
            background: #fff;
            color: #3498db;
            font-size: 36px;
            line-height: 100px;
            margin: 10px;
            padding: 2%;
            position: relative;
            text-align: center;
        }

        .action {
            display: block;
            margin: 100px auto;
            width: 100%;
            text-align: center;
        }

            .action a {
                display: inline-block;
                padding: 5px 10px;
                background: #f30;
                color: #fff;
                text-decoration: none;
            }

                .action a:hover {
                    background: #000;
                }

        .slick-prev:before { 
            font-size: 30px;
        }

        .slick-next:before {  
            font-size: 30px;
        }

            .slick-dots li button:before
            {
                font-family: 'slick';
                font-size: 12px;                          
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main">
            <div class="slider slider-nav">
                <div class="card w-25">
                    <div class="card-body">
                        <h3>1</h3>
                    </div>
                </div>
                <div>
                    <div class="card w-25">
                        <div class="card-body">
                            <h3>2</h3>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="card w-25">
                        <div class="card-body">
                            <h3>3</h3>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="card w-25">
                        <div class="card-body">
                            <h3>4</h3>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="card w-25">
                        <div class="card-body">
                            <h3>5</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script>
        $('.slider-nav').slick({
            slidesToShow: 3,
            slidesToScroll: 1,
            dots: true,
            focusOnSelect: true,
            autoplay: true,
            autoplaySpeed: 1000,        
        });

        $('a[data-slide]').click(function (e) {
            e.preventDefault();
            var slideno = $(this).data('slide');
            $('.slider-nav').slick('slickGoTo', slideno - 1);
        });

    </script>
</body>
</html>
