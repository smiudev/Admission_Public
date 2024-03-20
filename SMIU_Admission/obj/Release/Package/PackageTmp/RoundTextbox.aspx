<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoundTextbox.aspx.cs" Inherits="SMIU_Admission.RoundTextbox" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Circle</title>
   <%-- <style type="text/css">
        .circle{
    height: 65px;
    width: 65px;
    border-radius: 50%;
    border:1px solid red;
    line-height: 65px;
    text-align: center;
}
    </style>--%>
</head>
<body>
    <form id="form1" runat="server">
    <div>
  <%--  here  i am placing a labelto print the circles --%>
        <asp:Label ID="lbl_circle" runat="server" Text=""></asp:Label>
    </div>
    </form>
</body>
</html>
