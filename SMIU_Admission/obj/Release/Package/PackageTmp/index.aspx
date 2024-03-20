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
            <div class="col-md-6 col-lg-5 d-none d-md-block" style="background-image:url('Images/bgscene0.5.png');background-size:cover; background-repeat:no-repeat; padding:20px; ">
                <div style="padding:5px; color:white; background-color:rgba(0,0,0,0.6)">
                    <br />
                    <h6 style=" text-align:center;">INSTRUCTIONS</h6>
                    <ul>
                        <li> Keep all the required documents with you before you start to fill Admission form.</li>
                        <li> Fill your Admission form carefully. Forms with incomplete or false information will be rejected.</li>
                        <li> No Verbal communication reference will be accepted at any stage of admission process.</li>
                    </ul>
                    <br />
                    <div style=" text-align:center;">
                    <h6>IMPORTANT LINKS</h6>
                        <%--<a href="#" target="_blank" style="background-color:black; padding:2px; border-radius:4px;">Guidelines</a><br />--%>
                        <a href="https://www.smiu.edu.pk/admissions/" target="_blank" style="background-color:black; padding:2px; border-radius:4px;">Admission Calender</a><br />
                        <a href="https://www.smiu.edu.pk/admissions/minimum-criteria-and-seat-allocation" target="_blank" style="background-color:black; padding:2px; border-radius:4px;">Eligibility Criteria</a><br />
                        <a href="https://www.smiu.edu.pk/admissions/fee-structure" target="_blank" style="background-color:black; padding:2px; border-radius:4px;">Fee Structure</a><br />
                        <%--<a href="#" target="_blank" style="background-color:black; padding:2px; border-radius:4px;">Required Documents</a><br />--%>
                        
                    <br />
                    <h6>FOR MORE INFORMATION</h6>
                    <p>
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
            </div>
            <div class="col-md-6 col-lg-7 d-flex align-items-center">
              <div class="card-body p-4 p-lg-5 text-black">

                <form runat="server" id="formLogin">
                      <div class="d-flex align-items-center mb-3 pb-1">
                    <img src="Images/smiu_logo.png" alt="" style="width:140px; height:100px;" />
                    <span style="margin-left:15px; margin-top:15px;" class="h3 fw-bold mb-0"> ADMISSIONS SPRING 2024</span>
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
                      </div>
                  </div>
                  <div class="row">
                      <div class="col-md-12">
                        <%--<a style="margin-top:10px;" href="CreateAccount.aspx" id="btnRegister" class="btn btn-primary btn-block">Create New Account</a>--%>
                      </div>
                  </div>
                  <br />          
                    <div class="row" style="text-align:center;">
                      <div class="col-md-12">
                        <p class="" style="color: #393f81;">
                            <%--<span><strong style="color:red">Important<br /> </strong><strong>Student accounts have been published.</strong></span>    
                            <br />--%>
                            <span style="border:1px solid green; padding:3px; border-radius:4px;">Last Date to Apply: <strong style="color:red">20<sup>th</sup> DECEMBER 2023</strong></span>
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