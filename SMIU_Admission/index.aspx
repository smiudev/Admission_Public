<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="SMIU_Admission.Index" MasterPageFile="~/MasterPages/CreateMaster.master" %>

<asp:Content ID="LoginAccount" ContentPlaceHolderID="contentScreen" runat="Server">
 <asp:Panel ID="pnlMsg" runat="server" CssClass="error" Visible="false"><asp:Label ID="lblPanel" runat="server"></asp:Label></asp:Panel>
<script language="javascript" type="text/javascript">
     window.history.forward(1);
     document.attachEvent("onkeydown", setClipBoardData);
     function setClipBoardData() {
         setInterval("window.clipboardData.setData('text','')", 20);
     }
     function blockError() {
         window.location.reload(true);
         return true;
     }
    window.onerror = blockError;             



</script>
<div class="row g-0">
            <div class="col-md-6 col-lg-5 d-none d-md-block" style="background-image:url('');background-size:cover; background-repeat:no-repeat; padding:20px; ">
                <div style="padding:5px; color:white; background-color:rgba(0,0,0,0.6)">
                </div>
            </div>
            <div class="col-md-6 col-lg-7 d-flex align-items-center">
              <div class="card-body p-4 p-lg-5 text-black">

                <form runat="server" id="formLogin">
                    <div class="d-flex align-items-center mb-3 pb-1">
                    <span style="margin-left:15px; margin-top:15px;" class="h3 fw-bold mb-0"> ADMISSIONS</span>
                  </div>
                
                  <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Sign into your account</h5>
                  <div class="row">
                      <div class="col-md-12">
                          <asp:Label ID="lblError" ForeColor="Red" runat="server" Visible="false"></asp:Label>
                      </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12 col-lg-12">
                        <label class="form-label" for="txtEmail">Email</label>
                        <input type="email" placeholder="" runat="server" ValidationGroup="formLogin" id="txtEmail" class="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail"
                            ErrorMessage="Email is required." ValidationGroup="formLogin"
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>  
                        <asp:RegularExpressionValidator runat="server" ValidationGroup="formLogin" Display="Dynamic" ErrorMessage="Email address is not valid" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                  </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12 col-lg-12">
                    <label class="form-label" for="txtPassword">Password</label>
                    <input type="password" runat="server" id="txtPassword" class="form-control" />
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPassword"
                            ErrorMessage="Password is required." ValidationGroup="formLogin"
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>  
                  </div>
                  </div>
                  <br />
                  <div class="row">
                      <div class="col-md-12">
                        <asp:Button ID="btnLogin" runat="server" ValidationGroup="formLogin" CssClass="btn btn-primary btn-block" OnClick="btnLogin_Click" Text="Login" />
                          <asp:Button ID="btnRegister" runat="server" ValidationGroup="formCreate" CssClass="btn btn-primary btn-block" OnClick="btnRegister_Click" Text="Create Account" />
                      </div>
                  </div>
                  <div class="row">
                      <div class="col-md-12">
                      </div>
                  </div>
                  <br />          
                    <div class="row" style="text-align:center;">
                      <div class="col-md-12">
                        <p class="" style="color: #393f81;">
                        </p>
                      </div>
                  </div>
                    <div class="row">
                      <div class="col-md-12">
                        <p class="" style="color: #393f81;">
                            <span>Forgot Password? </span>
                            <asp:LinkButton ID="btnForgot" Text="Recover NOW!" runat="server" OnClick="btnForgot_Click" />
                        </p>
                      </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
</asp:Content>