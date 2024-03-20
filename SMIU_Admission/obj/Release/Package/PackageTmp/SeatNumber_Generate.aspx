<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SeatNumber_Generate.aspx.cs"
    Inherits="SMIU_Admission.SeatNumber_Generate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Convert number into words" />
    </div>
    <div id="box" runat="server" visible="false">
        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
    </div>
    <asp:Button ID="btnSave" runat="server" Text="show/hide" 
        onclick="btnSave_Click" />
    </form>
</body>
</html>
