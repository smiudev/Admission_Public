<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Testbtnclick.aspx.cs" Inherits="SMIU_Admission.Testbtnclick"
    MasterPageFile="~/MasterPages/student.Master" MaintainScrollPositionOnPostback="false"
    ValidateRequest="false" %>

<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>--%>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphTitle">
    <h2>
        Test Asp.net Link button
    </h2>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphbody">
    <script src="scripts/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            jQuery('[id$="LinkProducts"]').click(function () {
                var customID = $(this).attr('myCustomID');
                alert(customID);
            });
        }); 
  
    </script>
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
</asp:Content>
