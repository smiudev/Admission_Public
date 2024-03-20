<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="SMIU_Admission.CreateAccount" MasterPageFile="~/MasterPages/CreateMaster.master" %>
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
                        <li>Type your email address correctly, you will receive all the admission related updates on provided email address.</li>
                    </ul>
                    <br />
                    <h6 style=" text-align:center;">RESULT AWAITING</h6>
                    <ul>
                        <li>Students applying for Undergraduate program can apply on the basis of HSC-I</li>
                    </ul>
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
                        <label class="form-label" for="txtName">Applicant Name<span style="color:red">*</span></label>
                        <input type="text"  runat="server" ID="txtName" class="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtName"
                            ErrorMessage="Applicant Name is required." ValidationGroup="formRegistration"
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>                         
                    </div>
                  </div>
<%--                  <div class="row">
                    <div class="col-md-6">
                    <label class="form-label" for="ddlDegreeProgram">Select Degree<span style="color:red">*</span></label>
                    <asp:DropDownList ID="ddlDegreeProgram" OnSelectedIndexChanged="ddlDegreeProgram_SelectedIndexChanged" runat="server" ValidationGroup="formRegistration"  class="form-control" AutoPostBack="true">
                        <asp:ListItem Text="--Select Degree--" Value="-1" />
                        <asp:ListItem Text="Undergraduate" Value="2" />
                        <asp:ListItem Text="Graduate" Value="1" />
                        <asp:ListItem Text="Postgraduate" Value="3" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="reqddlDegreeProgram" runat="server" ControlToValidate="ddlDegreeProgram"
                        ErrorMessage="Degree is required." InitialValue="-1" ValidationGroup="formRegistration"
                        Display="Dynamic">
                    </asp:RequiredFieldValidator>                    
                  </div>
                    <div class="col-md-6">
                    <label class="form-label" for="ddlProgram">Program<span style="color:red">*</span></label>
                    <asp:DropDownList ID="ddlProgram" AutoPostBack="true" OnSelectedIndexChanged="ddlProgram_SelectedIndexChanged" runat="server" ValidationGroup="formRegistration"  class="form-control">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlProgram"
                        ErrorMessage="Program is required." InitialValue="-1" ValidationGroup="formRegistration"
                        Display="Dynamic">
                    </asp:RequiredFieldValidator>  
                  </div>
                  </div>
                  <div class="row" id="divLastQualification" runat="server">
                       <div class="col-md-6" runat="server">
                            <label class="form-label" id="lblLastQualification" runat="server" for="txtLastDegreePercentage">Last Qualification Percentage</label>
                            <input type="number" runat="server" step="0.1" max="100" id="txtLastDegreePercentage" class="form-control" />
                        </div>
                       <div class="col-md-6" runat="server" visible="false" id="divCGPA">
                    <label class="form-label" for="txtLastDegreeCGPA">Last Qualification CGPA</label>
                    <input type="number" runat="server" step="0.1" max="4" id="txtLastDegreeCGPA" class="form-control" />
                  </div>
                    <div class="col-md-6" id="divResultAwaiting" runat="server" visible="false">
                    <label class="form-label" for="ddlLastQualification">Select If Result Awaiting</label>
                    <asp:DropDownList AutoPostBack="true"  ID="ddlLastQualification" OnSelectedIndexChanged="ddlLastQualification_SelectedIndexChanged"  runat="server" ValidationGroup="formRegistration"  class="form-control">
                        <asp:ListItem Text="--Select--" Value="-1" />
                        <asp:ListItem Text="Result Awaiting" Value="3" />
                    </asp:DropDownList>
                  </div>
                      <div class="clearfix"></div>
                  </div>--%>
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

