﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="SMIU_Admission.CreateAccount" MasterPageFile="~/MasterPages/CreateMaster.master" %>
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
            <div class="col-md-6 col-lg-5 d-none d-md-block" style="background-image:url(''); background-size:cover; background-repeat:no-repeat; padding:10px;">
                 <div style="padding:5px; color:white; background-color:rgba(0,0,0,0.6)">
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
                        <label class="form-label" for="txtName">Applicant Name<span style="color:red">*</span></label>
                        <input type="text"  runat="server" ID="txtName" class="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtName"
                            ErrorMessage="Applicant Name is required." ValidationGroup="formRegistration"
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>                         
                    </div>
                  </div>

                  <div class="row">
                    <div class="col-md-6">
                      <label class="form-label" for="txtCNIC">CNIC #<span style="color:red">*</span></label>
                      <input type="text"  placeholder="format: 12345-1234567-1" runat="server" ValidationGroup="formRegistration" ID="txtCNIC" class="form-control" />
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCNIC"
                            ErrorMessage="CNIC # is required." ValidationGroup="formRegistration"
                            Display="Dynamic">
                    </asp:RequiredFieldValidator> 
                    <asp:RegularExpressionValidator runat="server"  ValidationGroup="formRegistration" Display="Dynamic" ErrorMessage="CNIC # is not valid" ControlToValidate="txtCNIC" ValidationExpression="^[0-9]{5}-[0-9]{7}-[0-9]$"></asp:RegularExpressionValidator>
                  </div>
                    <div class="col-md-6">
                      <label class="form-label" for="txtMobileNo">Mobile#<span style="color:red">*</span></label>
                       <input type="text"  class="form-control" placeholder="format: 03123456789" ID="txtMobileNo" runat="server" ValidationGroup="formRegistration" />
                            <asp:RequiredFieldValidator ID="ReqFldMobileNo" runat="server" ControlToValidate="txtMobileNo"
                                ErrorMessage="Mobile# is required." ValidationGroup="formRegistration"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegExptxtLandLineNumber" runat="server" ErrorMessage="Mobile# format is incorrect."
                                ControlToValidate="txtMobileNo" Display="Static" ValidationExpression="^\d{11}$"
                                ValidChars="0123456789" ValidationGroup="formRegistration"></asp:RegularExpressionValidator>
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
                    <div class="col-md-6">
                    <label class="form-label" for="txtPassword">Password<span style="color:red">*</span></label>
                    <input type="password"  runat="server" ValidationGroup="formRegistration" id="txtPassword" class="form-control" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPassword"
                            ErrorMessage="Password is required." ValidationGroup="formRegistration"
                            Display="Dynamic">
                    </asp:RequiredFieldValidator> 
                  </div>
                    <div class="col-md-6">
                    <label class="form-label" for="txtConfirmPassword">Confirm Password<span style="color:red">*</span></label>
                    <input type="password"  runat="server" ValidationGroup="formRegistration" id="txtConfirmPassword" class="form-control" />
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtConfirmPassword"
                            ErrorMessage="Confirm Password is required." ValidationGroup="formRegistration"
                            Display="Dynamic">
                    </asp:RequiredFieldValidator> 
                    <asp:CompareValidator runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword"
                        ValidationGroup="formRegistration" ErrorMessage="Password does not match" Display="Dynamic"></asp:CompareValidator>
                  </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                    <br />
                    <asp:Button ID="btnRegister" runat="server" ValidationGroup="formRegistration" CssClass="btn btn-primary btn-block" OnClick="btnRegister_Click" Text="Register" />
                  </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                    <br />
                    <p class="mb-5 pb-lg-2" style="color: #393f81;">Already created account? 
                        <asp:LinkButton ID="LinkButton2" Text="Login" runat="server" OnClick="btnLogin_Click" />
                    </p>
                  </div>
                  </div>
                </form>
              </div>
            </div>
          </div>

</asp:Content>

