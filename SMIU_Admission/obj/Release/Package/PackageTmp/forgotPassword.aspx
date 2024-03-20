<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="SMIU_Admission.ForgotPassword" MasterPageFile="~/MasterPages/CreateMaster.master" %>
<asp:Content ID="cDashboard" ContentPlaceHolderID="contentScreen" runat="Server">
<asp:Panel ID="pnlMsg" runat="server" CssClass="error" Visible="false"><asp:Label ID="lblPanel" runat="server"></asp:Label></asp:Panel>
<script language="javascript" type="text/javascript">
    window.history.forward(1);
    document.attachEvent("onkeydown", setClipBoardData);
    function setClipBoardData() {
        setInterval("window.clipboardData.setData('text','')", 20);
    }
    function blockError()
    {
        window.location.reload(true);
        return true;
    }
    window.onerror = blockError;

</script>

    <div class="row g-0">
            <div class="col-md-6 col-lg-5 d-none d-md-block" style="background-image:url('Images/bgscene0.5.png'); background-size:cover; background-repeat:no-repeat; padding:10px;">
                 <div style="padding:5px; color:white; background-color:rgba(0,0,0,0.6)">

                    <div style="background-color:black; padding:5px; border-radius:5px; text-align:center;" class="d-flex align-items-center mb-3 pb-1">
                        <img src="Images/smiu_logo.png" style="background-color:white; border-radius:2px; padding:5px; width:70px; height:50px;" alt="" />
                        <span style="margin-left:15px; margin-top:15px; color:white" class="h4 fw-bold mb-0"> ADMISSIONS SPRING 2024</span>
                    </div>
                    <h6 style=" text-align:center;">INSTRUCTIONS</h6>
                    <ul>
                        <li>Provide your CNIC and Email address that you submitted during the creation of account. You will receive your account credentials in your email address.</li>
                    </ul>
                    <br />
                     <br />
                    <h6 style=" text-align:center;">FOR MORE INFORMATION</h6>
                    <p style="text-align:center;">
                        Admissions and Examination Department
                        <br />
                        Email: admission@smiu.edu.pk
                        <br />
                        Phone: 111-111-885 Ext 221
                        <br />
                        <a href="http://www.smiu.edu.pk">http://www.smiu.edu.pk</a>
                    </p>
                </div>
            </div>
            <div class="col-md-6 col-lg-7 d-flex align-items-center">
              <div class="card-body p-4 p-lg-5 text-black">
                <form runat="server" id="formRegistration">
                    <asp:ScriptManager runat="server"></asp:ScriptManager>
                  <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">New Applicant Registration</h5>
                  <div class="row">
                      <div class="col-md-12">
                          <asp:Label ID="lblError" ForeColor="Red" runat="server" Visible="false"></asp:Label>
                      </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <label class="form-label" for="txtCNIC">CNIC #<span style="color:red">*</span></label>
                      <input type="text"  placeholder="format: 12345-1234567-1" runat="server" ValidationGroup="formRegistration" ID="txtCNIC" class="form-control" />
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCNIC"
                            ErrorMessage="CNIC # is required." ValidationGroup="formRegistration"
                            Display="Dynamic">
                    </asp:RequiredFieldValidator> 
                    <asp:RegularExpressionValidator runat="server"  ValidationGroup="formRegistration" Display="Dynamic" ErrorMessage="CNIC # is not valid" ControlToValidate="txtCNIC" ValidationExpression="^[0-9]{5}-[0-9]{7}-[0-9]$"></asp:RegularExpressionValidator>
                  </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                       <label class="form-label" for="txtEmail">Email Address<span style="color:red">*</span></label>
                       <input type="email"  placeholder="format: abc@xyz.com" runat="server" ValidationGroup="formRegistration" id="txtEmail" class="form-control" />
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail"
                            ErrorMessage="Email is required." ValidationGroup="formRegistration"
                            Display="Dynamic">
                    </asp:RequiredFieldValidator>  
                    <asp:RegularExpressionValidator runat="server" ValidationGroup="formRegistration" Display="Dynamic" ErrorMessage="Email address is not valid" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                  </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                    <br />
                    <asp:Button ID="btnForgot" runat="server" ValidationGroup="formRegistration" CssClass="btn btn-primary btn-block" OnClick="btnForgot_Click" Text="Recover Password" />
                  </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                    <br />
                    <p class="mb-5 pb-lg-2" style="color: #393f81;">Already created account? 
                        <asp:LinkButton ID="btnLogin" Text="Login" runat="server" OnClick="btnLogin_Click"  />
                    </p>
                  </div>
                  </div>
                </form>
              </div>
            </div>
          </div>

</asp:Content>

