<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IncomingOutgoingGraph.aspx.cs" Inherits="WMSAdministration.IncomingOutgoingGraph" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="server">
    <style>
        .datepicker-container.modal-content {
            display: block;
        }
    </style>   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <section class="py-5">
        <div class="row mb-2">
            <div class="col-lg-12 mb-4 mb-lg-0">
                <div class="card">
                    <div class="card-header">
                        <h2 class="h6 text-uppercase mb-0">Comparison Of Incoming and Outgoing Graph</h2>
                    </div>
                    <div class="card-body">
                        <div class="input-field col m4 s12 right-align" style="float:right">
                            <asp:TextBox ID="graphDate" runat="server" ClientIDMode="Static" />
                            <label for="graphDate">Choose Date Time</label>
                        </div>
                        <div class="chart-holder mt-5 mb-5">
                            <canvas id="chart"></canvas>
                        </div>                                             
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="server">
    <script>       
        var chartInstance;
        $(document).ready(function () {
            var month = new Date().getMonth() + 1;
            var year = new Date().getFullYear();            
            GraphContruct(month,year);
            function Cancel() {
                if (!this.hasEvent) {
                    this.hasEvent = true;
                    //console.log('Clicked on cancel btn:', this.cancelBtn);
                }
            }
            function Done() {
                if (!this.hasEvent) {
                    this.hasEvent = true;
                    var graphdatetime = $("#graphDate").val();
                    var m = graphdatetime.split("/")[0];
                    var y = graphdatetime.split("/")[1];                    
                    GraphContruct(m,y);
                }
            }
           
            $("#graphDate").datepicker({
                "format": "mm/yyyy",
                defaultDate: new Date(Date.now()),
                setDefaultDate:true,
                onOpen: function (e) {
                    var that = this;
                    that.hasEvent = false;
                    this.cancelBtn.addEventListener('click', Cancel.bind(that))
                    this.doneBtn.addEventListener('click', Done.bind(that))
                },
                onClose: function (e) {
                    var that = this;
                    this.cancelBtn.removeEventListener('click', Cancel.bind(that))
                    this.doneBtn.removeEventListener('click', Done.bind(that))
                }
            });
          
        });
     

        function GraphContruct(month, year) {
            var chart = document.getElementById('chart').getContext('2d');

            var listGraph;
            var incomingGraph = new Array();
            var outgoingGraph = new Array();
            var getDaysInMonth = parseInt(new Date(year, month, 0).getDate());
            var dayNumber = new Array();
            for (i = 0; i <= getDaysInMonth; i++) {
                dayNumber.push(i.toString());
                incomingGraph.push(0);
                outgoingGraph.push(0);
            }

            var options = {
                responsive: true,
                maintainAspectRatio: true,
                animation: {
                    easing: 'easeInOutQuad',
                    duration: 520
                },
                scales: {
                    xAxes: [{
                        gridLines: {
                            display: false
                        },
                        scaleLabel: {
                            display: true,
                            labelString: "Day",
                            fontColor: "black",
                            fontSize: 16,
                            fontStyle: 'bold'
                        }
                    }],
                    yAxes: [{
                        gridLines: {
                            display: false
                        },
                        scaleLabel: {
                            display: true,
                            labelString: "Price(Ks)",
                            fontColor: "black",
                            fontSize: 16,
                            fontStyle: 'bold'
                        },
                        ticks: {
                            beginAtZero: true,
                            stepSize: 1000000,
                            callback: function (value, index, values) {
                                if (value % 100000 === 0) {
                                    return value;
                                } else {
                                    return ' ';
                                }
                            },
                        },

                    },
                    ]
                },
                elements: {
                    line: {
                        tension: 0.4
                    }
                },
                legend: {
                    display: true,
                    position: 'bottom'
                },
                point: {
                    backgroundColor: 'white'
                },
                tooltips: {
                    titleFontFamily: 'Open Sans',
                    backgroundColor: 'rgba(0,0,0,0.3)',
                    titleFontColor: 'white',
                    caretSize: 5,
                    cornerRadius: 2,
                    xPadding: 10,
                    yPadding: 10
                }
            };

            var gradient2 = chart.createLinearGradient(25, 200, 175, 0);
            gradient2.addColorStop(0, 'rgba(153,218,255,1)');
            gradient2.addColorStop(1, 'rgba(0,128,128,1)');


            var gradient1 = chart.createLinearGradient(0, 200, 200, 0);
            gradient1.addColorStop(0, 'rgba(185,186,189,1)');
            gradient1.addColorStop(0.99, 'rgba(57,201,46,1)');
            gradient1.addColorStop(1, 'rgba(57,201,46,1)');

           
            
            $.ajax({
                url: "IncomingOutgoingGraph.aspx/getIncomingOutgoingGraphData",
                type: "POST",
                data: JSON.stringify({ monthName: month, yearName: year}),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response)
                {
                   
                    if (response.d != null && response.d != "[]") {
                        listGraph = JSON.parse(response.d);
                        for (x in listGraph)
                        {
                            if (listGraph[x].stockType == "Incoming")
                                incomingGraph[parseInt(listGraph[x].dayNumber)] = parseFloat(listGraph[x].stockPrice);
                            else
                                outgoingGraph[parseInt(listGraph[x].dayNumber)] = parseFloat(listGraph[x].stockPrice);
                        }                     

                        var data =
                            {
                                labels: dayNumber,
                                datasets: [{
                                    label: 'Incoming Stock',
                                    backgroundColor: gradient1,
                                    pointBackgroundColor: 'white',
                                    pointHoverBackgroundColor: 'green',
                                    borderWidth: 1,
                                    borderColor: '#121f91',
                                    data: incomingGraph
                                },
                                {
                                    label: 'Outgoing Stock',
                                    backgroundColor: gradient2,
                                    pointBackgroundColor: 'white',
                                    pointHoverBackgroundColor: 'blue',
                                    borderWidth: 1,
                                    borderColor: '#911215',
                                    data: outgoingGraph
                                }]
                            };
                        chartInstance = new Chart(chart,
                         {
                             type: 'line',
                             data: data,
                             options: options
                         });
                    }
                    else {
                        chartInstance.data.datasets[0].data = incomingGraph;
                        chartInstance.data.datasets[1].data = outgoingGraph;
                        chartInstance.update();
                      }

                },
                error: function (response) {
                    console.log();
                }
            });
        }
       
    </script>
</asp:Content>
