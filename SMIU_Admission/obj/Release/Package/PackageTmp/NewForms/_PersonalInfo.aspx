<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="_PersonalInfo.aspx.cs" Inherits="SMIU_Admission.NewForms._PersonalInfo" MasterPageFile="~/MasterPages/PortalMaster.master" %>

<asp:Content ID="cDashboard" ContentPlaceHolderID="contentScreen" runat="Server">
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
    <div class="row">
        <div class="col-md-10" style="text-align:center;">
            <h4>Personal Information</h4>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <asp:Label ID="lblError" ForeColor="Red" runat="server"></asp:Label>
                <asp:Label ID="lblSuccess" ForeColor="Green" runat="server"></asp:Label>
        </div>
    </div>
    <br />
    <div class="row" runat="server" id="divPersonalInfo">
        <div class="col-md-12">
            <form runat="server" id="formPersonalInfo">
                    <asp:ScriptManager runat="server"></asp:ScriptManager>
                <%--<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="divPhotoSampleModal" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Strict Photo Instructions</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                               <img src="../Content/Theme/images/SamplePhoto.jpg" width="200" height="100"  />
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>--%>
                <div class="row">
                <div class="col-md-3" style="text-align:center;">
                    <asp:Image ID="imgPhoto" ImageUrl="../Content/Theme/images/noImage.jpg" runat="server" Height="100" Width="85" />
                    <p style="color: Red; font-size:smaller" id="txtImageFormat" runat="server">
                        1 MB | formats (JPG,JPEG,PNG,GIF,BMP)    
                        <%--<a href="#divPhotoSampleModal" data-bs-toggle="modal" data-bs-target="#divPhotoSampleModal">
                            Strict Photo Instructions
                        </a>--%>
                    </p>
                    <asp:FileUpload ID="uploadPhoto" AllowMultiple="false" runat="server" Font-Size="X-Small"  CssClass="form-control form-control-sm" />
                </div>
                <div class="col-md-9">
                    <div class="row">
                    <div class="col-md-4">
                        <label class="form-label" for="txtFirstname">Firstname<span style="color:red">*</span></label>
                        <input type="text" runat="server" class="form-control" id="txtFirstname" required="required" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstname"
                            ErrorMessage="Firstname is required." ValidationGroup="formPersonalInfo"
                            Display="Dynamic"></asp:RequiredFieldValidator>
                    
                    </div>
                    <div class="col-md-4">
                        <label class="form-label" for="Middlename">Middlename</label>
                        <input type="text" runat="server" class="form-control" id="txtMiddlename"/>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label" for="txtLastname">Lastname<span style="color:red">*</span></label>
                        <input type="text" runat="server" class="form-control" id="txtLastname" required="required" />
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastname"
                            ErrorMessage="Lastname is required." ValidationGroup="formPersonalInfo"
                            Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="clearfix"></div>
                </div>
                    <div class="row">
                    <div class="col-md-4">
                      <label class="form-label" for="txtFatherName">Father's Name<span style="color:red">*</span></label>
                      <input type="text" required="required" runat="server" ValidationGroup="formPersonalInfo" ID="txtFatherName" class="form-control" />
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtFatherName"
                            ErrorMessage="Father's Name is required." ValidationGroup="formPersonalInfo"
                            Display="Dynamic">
                    </asp:RequiredFieldValidator> 
                    </div>
                    <div class="col-md-4">
                      <label class="form-label" for="txtFatherOccupation">Father's Occupation<span style="color:red">*</span></label>
                      <input type="text" required="required" runat="server" ValidationGroup="formPersonalInfo" ID="txtFatherOccupation" class="form-control" />
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtFatherOccupation"
                            ErrorMessage="Father's Occupation is required." ValidationGroup="formPersonalInfo"
                            Display="Dynamic">
                    </asp:RequiredFieldValidator> 
                    </div>
                    <div class="col-md-4">
                        <label class="form-label" for="ddlNationality">Nationality<span style="color:red">*</span></label>
                       <asp:DropDownList ID="ddlNationality" runat="server" ValidationGroup="formPersonalInfo"  class="form-control">
                        <asp:ListItem Value="-1">--Select--</asp:ListItem>
                        <asp:ListItem Text="Pakistan" Value="Pakistani" />
                        <asp:ListItem Text="Other" Value="Other" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4"  InitialValue="-1" runat="server" ControlToValidate="ddlNationality"
                            ErrorMessage="Nationality is required." ValidationGroup="formPersonalInfo"
                            Display="Dynamic">
                    </asp:RequiredFieldValidator> 
                    </div>
                    <div class="clearfix"></div>
                </div>
                </div>  
                    </div>
                  <div class="row">
                      <div class="col-md-4">
                        <label class="form-label" for="txtPassport">Passport (For foreign applicant only)</label>
                        <input type="text" runat="server" class="form-control" id="txtPassport" />
                    </div>
                    <div class="col-md-4">
                      <label class="form-label" for="txtCNIC">CNIC#<span style="color:red">*</span></label>
                      <input type="text" required="required" disabled="disabled" runat="server" ValidationGroup="formPersonalInfo" ID="txtCNIC" class="form-control" />
                    </div>
                    <div class="col-md-4">
                      <label class="form-label" for="txtEmail">Email Address<span style="color:red">*</span></label>
                      <input type="text" required="required" disabled="disabled" runat="server" ValidationGroup="formPersonalInfo" ID="txtEmail" class="form-control" />
                    </div>
                    <div class="clearfix"></div>
                  </div>
                  <div class="row">
                    <div class="col-md-3">
                      <label class="form-label" for="txtDOB">Date of Birth<span style="color:red">*</span></label>
                      <input type="date" id="txtDOB" runat="server" required="required" class="form-control" />                        
                      <input type="text" id="txtDOBLocked" visible="false" runat="server" required="required" class="form-control" />                        
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtDOB"
                            ErrorMessage="Date of birth is required." ValidationGroup="formPersonalInfo"
                            Display="Dynamic">
                      </asp:RequiredFieldValidator> 
                    </div>
                    <div class="col-md-3">
                      <label class="form-label" for="ddlGender">Gender<span style="color:red">*</span></label>
                       <asp:DropDownList ID="ddlGender" runat="server" ValidationGroup="formPersonalInfo"  class="form-control">
                        <asp:ListItem Value="-1">--Select--</asp:ListItem>
                        <asp:ListItem Text="Male" Value="Male" />
                        <asp:ListItem Text="Female" Value="Female" />
                        <asp:ListItem Text="Other" Value="Other" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" InitialValue="-1" runat="server" ControlToValidate="ddlGender"
                            ErrorMessage="Gender is required." ValidationGroup="formPersonalInfo"
                            Display="Dynamic">
                    </asp:RequiredFieldValidator> 
                    </div>
                    <div class="col-md-3">
                          <label class="form-label" for="ddlReligion">Religion<span style="color:red">*</span></label>
                       <asp:DropDownList ID="ddlReligion" runat="server" ValidationGroup="formPersonalInfo"  class="form-control">
                        <asp:ListItem Value="-1">--Select--</asp:ListItem>
                        <asp:ListItem Text="Islam" Value="Islam" />
                        <asp:ListItem Text="Hinduism" Value="Hinduism" />
                        <asp:ListItem Text="Christianity" Value="Christianity" />
                        <asp:ListItem Text="Parsi" Value="Parsi" />
                        <asp:ListItem Text="Other" Value="Other" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7"  InitialValue="-1" runat="server" ControlToValidate="ddlReligion"
                            ErrorMessage="Religion is required." ValidationGroup="formPersonalInfo"
                            Display="Dynamic">
                    </asp:RequiredFieldValidator> 
                    </div>
                    <div class="col-md-3">
                    <label class="form-label" for="ddlMarital">Marital Status<span style="color:red">*</span></label>
                       <asp:DropDownList ID="ddlMarital" runat="server" ValidationGroup="formPersonalInfo"  class="form-control">
                        <asp:ListItem Value="-1">--Select--</asp:ListItem>
                        <asp:ListItem Text="Single" Value="Single" />
                        <asp:ListItem Text="Married" Value="Married" />
                        <asp:ListItem Text="Separated" Value="Separated" />
                        <asp:ListItem Text="Other" Value="Other" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6"  InitialValue="-1" runat="server" ControlToValidate="ddlMarital"
                            ErrorMessage="Marital Status is required." ValidationGroup="formPersonalInfo"
                            Display="Dynamic">
                    </asp:RequiredFieldValidator> 
                    </div>
                    <div class="clearfix"></div>
                </div>
                 <div class="row">
                    <div class="col-md-3">
                    <label class="form-label" for="ddlDomicile">Domicile<span style="color:red">*</span></label>
                       <asp:DropDownList ID="ddlDomicile" runat="server" ValidationGroup="formPersonalInfo"  class="form-control">
                      <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="Sindh Rural">Sindh Rural</asp:ListItem>
                                <asp:ListItem Value="Sindh Urban">Sindh Urban</asp:ListItem>
                                <asp:ListItem Value="Punjab">Punjab</asp:ListItem>
                                <asp:ListItem Value="Balochistan">Balochistan</asp:ListItem>
                                <asp:ListItem Value="KPK">KPK</asp:ListItem>
                                <asp:ListItem Value="Gilgit-Baltistan">Gilgit-Baltistan</asp:ListItem>
                                <asp:ListItem Value="AJK">AJK</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ddlDomicile"
                            ErrorMessage="Domicile is required." InitialValue="-1" ValidationGroup="formPersonalInfo"
                            Display="Dynamic">
                    </asp:RequiredFieldValidator> 
                    </div>
                    <div class="col-md-3">
                      <label class="form-label" for="txtDomicileDistrict">Domicile District<span style="color:red">*</span></label>
                      <input type="text" required="required" runat="server" ValidationGroup="formPersonalInfo" ID="txtDomicileDistrict" class="form-control" />
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtDomicileDistrict"
                            ErrorMessage="Domile District is required." ValidationGroup="formPersonalInfo"
                            Display="Dynamic">
                    </asp:RequiredFieldValidator> 
                    </div>
                    <div class="col-md-3">
                           <label class="form-label" for="txtMobileNo">Mobile#<span style="color:red">*</span></label>
                           <input type="text"  class="form-control" ID="txtMobileNo" required="required" disabled="disabled" runat="server" ValidationGroup="formPersonalInfo" />
                    </div>
                    <div class="col-md-3">
                    <label class="form-label" for="txtHomeNo">Home Phone</label>
                        <input type="text"  class="form-control" ID="txtHomeNo" runat="server" ValidationGroup="formPersonalInfo" />
                        <asp:RegularExpressionValidator ID="RegExptxtLandLineNumber" runat="server" ErrorMessage="Provide digits only"
                        ControlToValidate="txtHomeNo" Display="Dynamic" ValidationExpression="^\d+$"
                        ValidChars="0123456789" ValidationGroup="formPersonalInfo"></asp:RegularExpressionValidator>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                      <label class="form-label" for="txtPostalAddress">Postal Address (Specify complete address)<span style="color:red">*</span></label>
                      <input type="text" required="required" runat="server" ValidationGroup="formPersonalInfo" ID="txtPostalAddress" class="form-control" />
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtPostalAddress" ErrorMessage="Postal Address is required." ValidationGroup="formPersonalInfo"
                            Display="Dynamic">
                    </asp:RequiredFieldValidator> 
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                      <label class="form-label" for="txtPermanentAddress">Permanent Address (Specify complete address)<span style="color:red">*</span></label>
                      <input type="text" required="required" runat="server" ValidationGroup="formPersonalInfo" ID="txtPermanentAddress" class="form-control" />
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtPermanentAddress" ErrorMessage="Permanent Address is required." ValidationGroup="formPersonalInfo"
                            Display="Dynamic">
                    </asp:RequiredFieldValidator> 
                    </div>
                    <div class="clearfix"></div>
                </div>
                <br />
                <br />
                <div class="row">
                    <div class="col-md-2">
                        <asp:Button ID="btnSave" ValidationGroup="formPersonalInfo" runat="server" CssClass="btn btn-primary btn-block" OnClick="btnSave_Click" Text="Save and Next" />
                    </div>
                </div>

                </form>
        </div>
        <%--<div class="col-md-3" style="border-left:1px solid black;">
            <div class="row">
                <div class="col-md-11" style="text-align:center;">
                    <h4>Instructions</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-md-11">
                    <ul>
                        <li>Test Test Test Test</li>
                        <li>Test Test Test Test</li>
                        <li>Test Test Test Test</li>
                        <li>Test Test Test Test</li>
                    </ul>
                </div>
            </div>
        </div>--%>
    </div>
</asp:Content>