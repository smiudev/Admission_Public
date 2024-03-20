<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Testbutton.aspx.cs" Inherits="SMIU_Admission.Testbutton" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="scripts/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            jQuery('[id$="LinkProducts"]').click(function () {
                var customID = $(this).attr('myCustomID');
                alert(customID);
            });
        }); 
  
    </script>
</head>
<body>
    <form id="form1" runat="server">
   <div>
        <asp:GridView ID="ShowProducts" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:TemplateField HeaderText="Product Name">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkProducts" runat="server" myCustomID='<%# Eval("ID")%>' Text='<%# Eval("Name")%>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Description" HeaderText="Description" />
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
