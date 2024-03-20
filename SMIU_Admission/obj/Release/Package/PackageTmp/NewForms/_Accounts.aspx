<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="_Accounts.aspx.cs" Inherits="SMIU_Admission.Modules.Forms._Accounts" MaintainScrollPositionOnPostback="false" ValidateRequest="false" MasterPageFile="~/MasterPages/PortalMaster.master"
    EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="contentScreen">
    <form runat="server">
    <div class="row">
        <div class="col-md-12" style="text-align:center;">
            <h4>---- Accounts Detail ----</h4>
        </div>
        <div class="col-md-2" style="text-align:center;"></div>
        <div class="clearfix"></div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-12" style="text-align:center;">
            <span runat="server" id="lblMessage" visible="false"></span>
        </div>
        <div class="clearfix"></div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-12" style="text-align:center;">
            <span runat="server" id="lblAccountsMessage" visible="false"></span>
            <div runat="server" id="divAccounts" visible="false">
                <div class="row">
                    <div class="col-md-12">
                        <table class="table">
                          <thead>
                            <tr>
                              <th scope="col">Reference#</th>
                              <th scope="col">Name</th>
                              <th scope="col">Program</th>
                              <th scope="col">Office365 ID</th>
                              <th scope="col">LMS ID</th>
                              <th scope="col">CMS ID</th>
                              <th scope="col">Accounts Password</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <td runat="server" id="lblRefenceNumber"></td>
                              <td runat="server" id="lblName"></td>
                              <td runat="server" id="lblProgram"></td>
                              <td runat="server" id="lblOffice365"></td>
                              <td runat="server" id="lblLMS"></td>
                              <td runat="server" id="lblCMS"></td>
                              <td runat="server" id="lblPassword"></td>

                            </tr>
                          </tbody>
                        </table>
                    </div>                    
                    <div class="clearfix"></div>
                </div>
                <br />
                <div class="row">
                     <div class="col-md-12">
                        <span><strong style="color:red">Note.</strong> Password is same for all accounts (Office365, LMS and CMS).</span>
                        <br />
                        <br />
                        <p>
                        For any query you may contact at admission@smiu.edu.pk, 111-111-885 Ext 221
                        <br />
                        Admission Office SMIU
                        </p>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
        </form>
</asp:Content>
