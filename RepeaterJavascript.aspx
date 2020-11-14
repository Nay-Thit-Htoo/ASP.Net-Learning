<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RepeaterJavascript.aspx.cs" Inherits="AdminDashboard.RepeaterJavascript" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="itemdiv">           
                <asp:Repeater ID="repeaterlist" runat="server" ClientIDMode="Static">
                    <ItemTemplate>
                        <input type="checkbox" id="itemcheck" value='<%#Eval("itemName")%>' />
                        <label id="itemlabel"><%#Eval("itemName")%></label>
                        <br />
                    </ItemTemplate>
                </asp:Repeater>
                <asp:Button ID="btnGetAllCheck" runat="server" ClientIDMode="Static" Text="GetAllCheck" />
           
        </div>
    </form>
    <script>     
        var itemName=new Array();
        $('#btnGetAllCheck').click(function ()
        {           
            $("input[type='checkbox']").each(function ()
            {
                if($(this).is(":checked"))
                    itemName.push($(this).val());
            });
            alert(itemName[0]);
        });
    </script>
</body>
</html>
