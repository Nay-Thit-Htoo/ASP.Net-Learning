<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="boostrapItem.aspx.cs" Inherits="AdminDashboard.boostrapItem" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        .carousel-control-next-icon {
            height: 50px;
            width: 50px;
            outline: black;
            background-size: 100%, 100%;
            border-radius: 50%;
            border: 1px solid black;
        }


        .carousel-control-prev-icon {
            height: 50px;
            width: 50px;
            outline: black;
            background-size: 100%, 100%;
            border-radius: 50%;
            border: 1px solid black;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner" id="carouselMain">  
            </div>
            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <div id="testdiv">
        </div>
        <button type="button" class="btn btn-primary" onclick="CreateNewDiv();return false;">Add Div</button>
        <button type="button" class="btn btn-secondary">Clean Div</button>

    </form>
    <script>  
        var NameArray = ["Aung Aung", "Mya Mya", "Kyaw Kyaw", "Ko Ko", "Aye Aye", "Maung Maung", "La La", "Moe Moe", "Aye Aung", "Thar Aye", "Aung Kyaw", "Moe Aye", "Aung Ko Oo","Bo Bo"];
        function CreateNewDiv() {
            var carouselItem, carouselItemRow, divColumn, card, cardBody, text;
            for (var i = 0; i < NameArray.length; i++) {
                if (i == 0)
                {
                    carouselItem = document.createElement('div');
                    carouselItem.setAttribute("class", "carousel-item active");
                    carouselItemRow = document.createElement('div');
                    carouselItemRow.setAttribute("class", "row mx-md-2 mx-sm-0 mx-0 mt-3");
                    
                }
                if (i % 6 == 0 && i!=0)
                {
                    carouselItem.appendChild(carouselItemRow);
                    document.getElementById("carouselMain").appendChild(carouselItem);
                    if ((i + 1) != NameArray.length)
                    {
                        carouselItem = document.createElement('div');
                        carouselItem.setAttribute("class", "carousel-item");
                        carouselItemRow = document.createElement('div');
                        carouselItemRow.setAttribute("class", "row mx-md-2 mx-sm-0 mx-0 mt-3");
                    }

                }
                if ((i + 1) == NameArray.length && (i % 6) != 0)
                {
                    carouselItem.appendChild(carouselItemRow);
                    document.getElementById("carouselMain").appendChild(carouselItem);
                }

                divColumn = document.createElement('div');
                divColumn.setAttribute("class", "col-lg-4 col-md-6 mb-md-4 mb-sm-3 mb-3 mt-lg-0");


                card = document.createElement('div');
                card.setAttribute('class', 'card');

                cardBody = document.createElement('div');
                cardBody.setAttribute('class', 'card-body');

                text = document.createElement('h1');
                text.textContent = NameArray[i];


                cardBody.appendChild(text);
                card.appendChild(cardBody);
                divColumn.appendChild(card);
                carouselItemRow.appendChild(divColumn);

            }

        }



    </script>
</body>
</html>
