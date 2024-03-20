<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Message.aspx.cs" Inherits="SMIU_Admission.Message" MasterPageFile="~/MasterPages/CreateMaster.master" %>

<asp:Content ID="LoginAccount" ContentPlaceHolderID="contentScreen" runat="Server">
 <asp:Panel ID="pnlMsg" runat="server" CssClass="error" Visible="false"><asp:Label ID="lblPanel" runat="server"></asp:Label></asp:Panel>

<div class="row g-0">
            <div class="col-md-12">
              <div class="card-body p-4 p-lg-5 text-black" style="text-align:center;">
                    <div style="text-align:center;">
                        <img src="Images/smiu_logo.png" style="width:70px; height:50px;" alt="" />
                        <span style="margin-left:15px; margin-top:15px;" class="h4 fw-bold mb-0"> Admissions Spring 2024</span>
                    </div>
                  <div style="text-align:center;">
                      <h4 id="headingSuccess" visible="false" style="color:green;letter-spacing: 1px;" runat="server" class="fw-normal mb-3 pb-3">Success</h4>
                  <h5 id="headingError" visible="false" style="color:red; letter-spacing: 1px;" runat="server" class="fw-normal mb-3 pb-3">Error</h5>
                  </div>
                  
                  <div class="row">
                      <div class="col-md-12">
                          <asp:Label ID="lblSuccess" ForeColor="Green" runat="server" Visible="false"></asp:Label>
                          <asp:Label ID="lblError" ForeColor="Red" runat="server" Visible="false"></asp:Label>
                      </div>
                  </div>
                  <div class="row" id="lnkLogin" runat="server" visible="false">
                      <div class="col-md-12" style="text-align:center;">
                          <a href="index.aspx">Login to your Account NOW!</a>
                          <asp:Label ID="Label1" ForeColor="Green" runat="server" Visible="false"></asp:Label>
                          <asp:Label ID="Label2" ForeColor="Red" runat="server" Visible="false"></asp:Label>
                      </div>
                  </div>
              </div>
            </div>
          </div>
</asp:Content>