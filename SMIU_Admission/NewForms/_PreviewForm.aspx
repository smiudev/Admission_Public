<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="_PreviewForm.aspx.cs" Inherits="SMIU_Admission.NewForms._PreviewForm" MasterPageFile="~/MasterPages/PortalMaster.master" %>

<asp:Content ID="cDashboard" ContentPlaceHolderID="contentScreen" runat="Server">
 <asp:Panel ID="pnlMsg" runat="server" CssClass="error" Visible="false"><asp:Label ID="lblPanel" runat="server"></asp:Label></asp:Panel>

    <form runat="server" id="formAcademicInfo">
    <div class="row">
        <div class="col-md-10" style="text-align:center;">
            <h4>Admission Form</h4>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <asp:Label ID="lblError" ForeColor="Red" runat="server"></asp:Label>
                <asp:Label ID="lblSuccess" ForeColor="Green" runat="server"></asp:Label>
        </div>
    </div>
    <br />
    <div class="row" runat="server" id="divAcademicInfo">
        <div class="col-md-12">
            
                 <asp:ScriptManager runat="server"></asp:ScriptManager>
            <div class="row">
        <div class="col-md-12" style="text-align:right">
            <asp:Button ID="btnApplicationForm" runat="server" Text="Download Application Form" CssClass="btn btn-primary" OnClick="btnApplicationForm_Click" />
            <%--<asp:Button ID="btnFeeVoucher" runat="server" Text="Download HBL Fee Voucher" CssClass="btn btn-primary" OnClick="btnFeeVoucher_Click" />--%>
            <asp:Button ID="btnFeeVoucherHBL" runat="server" Text="Download Fee Voucher" CssClass="btn btn-primary" OnClick="btnFeeVoucherHBL_Click" />
        </div>
    </div>
            <hr />
            <br />
                  <div class="row">
                      <div class="col-md-3" style="text-align:center;">
                          <asp:Image ID="imgPhoto" ImageUrl="../Content/Theme/images/noImage.jpg" runat="server" Height="150" Width="120" />
                      </div>
                      <div class="col-md-9">
                          <div class="row">
                    <div class="col-md-4">
                        <label class="form-label" for="txtFirstname">Firstname<span style="color:red">*</span></label>
                        <input type="text" runat="server" class="form-control" id="txtFirstname"  />
                    
                    </div>
                    <div class="col-md-4">
                        <label class="form-label" for="Middlename">Middlename</label>
                        <input type="text" runat="server" class="form-control" id="txtMiddlename"/>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label" for="txtLastname">Lastname<span style="color:red">*</span></label>
                        <input type="text" runat="server" class="form-control" id="txtLastname"  />
                    </div>
                    <div class="clearfix"></div>
                </div>
                          <div class="row">
                    <div class="col-md-4">
                      <label class="form-label" for="txtFatherName">Father's Name<span style="color:red">*</span></label>
                      <input type="text"  runat="server" ValidationGroup="formPersonalInfo" ID="txtFatherName" class="form-control" />
                    </div>
                    <div class="col-md-4">
                      <label class="form-label" for="txtFatherOccupation">Father's Occupation<span style="color:red">*</span></label>
                      <input type="text"  runat="server" ValidationGroup="formPersonalInfo" ID="txtFatherOccupation" class="form-control" />
                    </div>
                    <div class="col-md-4">
                        <label class="form-label" for="ddlNationality">Nationality<span style="color:red">*</span></label>
                       <asp:DropDownList ID="ddlNationality" runat="server" ValidationGroup="formPersonalInfo"  class="form-control">
                        <asp:ListItem Value="-1">--Select--</asp:ListItem>
                        <asp:ListItem Text="Pakistan" Value="Pakistani" />
                        <asp:ListItem Text="Other" Value="Other" />
                    </asp:DropDownList>
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
                      <input type="text"  disabled="disabled" runat="server" ValidationGroup="formPersonalInfo" ID="txtCNIC" class="form-control" />
                    </div>
                    <div class="col-md-4">
                      <label class="form-label" for="txtEmail">Email Address<span style="color:red">*</span></label>
                      <input type="text"  disabled="disabled" runat="server" ValidationGroup="formPersonalInfo" ID="txtEmail" class="form-control" />
                    </div>
                    <div class="clearfix"></div>
                  </div>
                  
                  <div class="row">
                       <div class="col-md-3">
                      <label class="form-label" for="txtDOB">Date of Birth<span style="color:red">*</span></label>
                      <input type="text" id="txtDOB" runat="server"  class="form-control" />                        
                    </div>
                    <div class="col-md-3">
                      <label class="form-label" for="ddlGender">Gender<span style="color:red">*</span></label>
                       <asp:DropDownList ID="ddlGender" runat="server" ValidationGroup="formPersonalInfo"  class="form-control">
                        <asp:ListItem Value="-1">--Select--</asp:ListItem>
                        <asp:ListItem Text="Male" Value="Male" />
                        <asp:ListItem Text="Female" Value="Female" />
                        <asp:ListItem Text="Other" Value="Other" />
                    </asp:DropDownList>
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
                    </div>
                    <div class="col-md-3">
                      <label class="form-label" for="txtDomicileDistrict">Domicile District<span style="color:red">*</span></label>
                      <input type="text"  runat="server" ValidationGroup="formPersonalInfo" ID="txtDomicileDistrict" class="form-control" />
                    </div>
                    <div class="col-md-3">
                           <label class="form-label" for="txtMobileNo">Applicant Mobile#<span style="color:red">*</span></label>
                            <input type="text"  class="form-control" ID="txtMobileNo"  disabled="disabled" runat="server" ValidationGroup="formPersonalInfo" />
                    </div>
                    <div class="col-md-3">
                    <label class="form-label" for="txtHomeNo">Home Phone</label>
                        <input type="text"  class="form-control" ID="txtHomeNo" runat="server" ValidationGroup="formPersonalInfo" />
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                      <label class="form-label" for="txtPostalAddress">Postal Address (Specify complete address)<span style="color:red">*</span></label>
                      <input type="text"  runat="server" ValidationGroup="formPersonalInfo" ID="txtPostalAddress" class="form-control" />
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                      <label class="form-label" for="txtPermanentAddress">Permanent Address (Specify complete address)<span style="color:red">*</span></label>
                      <input type="text"  runat="server" ValidationGroup="formPersonalInfo" ID="txtPermanentAddress" class="form-control" />
                    </div>
                    <div class="clearfix"></div>
                </div>
                
                <br />

                <div class="row">
                    <div class="col-md-12" style="text-align:center;">
                        <h4>Guardian Info</h4>
                    </div>
                </div>
                  <div class="row">
                    <div class="col-md-4">
                        <label class="form-label" for="txtGuardName">Guardian Name</label>
                        <input type="text" runat="server" class="form-control" id="txtGuardName" />
                    </div>
                    <div class="col-md-4">
                        <label class="form-label" for="txtGuardOccu">Occupation</label>
                        <input type="text" runat="server" class="form-control" id="txtGuardOccu" />
                    </div>
                      <div class="col-md-4">
                        <label class="form-label" for="ddlGuardJobNature">Job Nature<span style="color:red">*</span></label>
                       <asp:DropDownList ID="ddlGuardJobNature" runat="server" ValidationGroup="formPersonalInfo"  class="form-control">
                            <asp:ListItem Value="-1">--Select--</asp:ListItem>
                            <asp:ListItem Text="Government Job" Value="Government Job" />
                            <asp:ListItem Text="Private Job" Value="Private Job" />
                       </asp:DropDownList>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                      <label class="form-label" for="txtGuardRelation">Relationship with Applicant</label>
                      <input type="text" runat="server" class="form-control" id="txtGuardRelation" />
                    </div>                    
                    <div class="col-md-4">
                        <label class="form-label" for="txtGuardIncome">Monthly Income</label>
                        <input type="number" min="0" runat="server" class="form-control" id="txtGuardIncome" />
                    </div>
                    <div class="col-md-4">
                         <label class="form-label" for="txtGuardMobileNo">Mobile#<span style="color:red">*</span></label>
                       <input type="text"  class="form-control" placeholder="format: 03123456789" ID="txtGuardMobileNo" runat="server" />
                    </div>
                    <div class="clearfix"></div>
                </div>
                  <div class="row">
                      <div class="col-md-6">
                        <label class="form-label" for="txtGuardOrganization">Organization</label>
                        <input type="text" runat="server" class="form-control" id="txtGuardOrganization" />
                    </div>
                    <div class="col-md-6">
                      <label class="form-label" for="txtGuardDesignation">Designation</label>
                      <input type="text" runat="server" class="form-control" id="txtGuardDesignation" />
                    </div>
                    <div class="clearfix"></div>
                  </div>
                <div class="row">
                      <div class="col-md-12">
                        <label class="form-label" for="txtGuardAddress">Address</label>
                        <input type="text" runat="server" class="form-control" id="txtGuardAddress" />
                    </div>
                  </div>
                 <br />
                <div class="row">
                    <div class="col-md-12" style="text-align:center;">
                        <h4>Emergency Contact Information</h4>
                    </div>
                </div>
                  <div class="row">
                    <div class="col-md-4">
                        <label class="form-label" for="txtEmrgName">Emergency Contact Name<span style="color:red">*</span></label>
                        <input type="text" runat="server" class="form-control" id="txtEmrgName"  />
                    </div>
                    <div class="col-md-4">
                            <label class="form-label" for="txtEmrgRelation">Relationship with Applicant<span style="color:red">*</span></label>
                            <input type="text"  class="form-control" ID="txtEmrgRelation" runat="server" ValidationGroup="formGuardianInfo" />
                    </div>
                    <div class="col-md-4">
                          <label class="form-label" for="txtEmrgMobileNo">Mobile#<span style="color:red">*</span></label>
                       <input type="text"  class="form-control" placeholder="format: 03123456789" ID="txtEmrgMobileNo" runat="server" ValidationGroup="formRegistration" />
                    </div>
                    <div class="clearfix"></div>
                </div>
                  <div class="row">
                      <div class="col-md-12">
                              <label class="form-label" for="txtEmrgAddress">Address (Specify complete address)<span style="color:red">*</span></label>
                            <input type="text"  class="form-control" ID="txtEmrgAddress" runat="server" ValidationGroup="formGuardianInfo" />
                    </div>
                    <div class="clearfix"></div>
                  </div>

                <br />
                
                <div class="row" runat="server" id="divSSC">
                     <div class="col-md-12">
                         <div class="row">
                             <div class="col-md-12">
                                 <h4>SSC / O-LEVEL Education</h4>

                             </div>

                         </div>
                            <div class="row">
                         <div class="col-md-2">
                        <label class="form-label" for="ddlDegreeSSC">Degree<span style="color:red">*</span></label>
                        <asp:DropDownList ID="ddlDegreeSSC" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" >
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="SSC">SSC</asp:ListItem>
                                <asp:ListItem Value="O-Level">O-Level</asp:ListItem>
                            </asp:DropDownList>
                    </div>
           
                                   <div class="col-md-3">
                        <label class="form-label" for="ddlGroupSSC">Group<span style="color:red">*</span></label>
                        <asp:DropDownList ID="ddlGroupSSC" runat="server" ValidationGroup="formAcademicInfo"   class="form-control">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="General Science">General Science</asp:ListItem>
                                <asp:ListItem Value="Science">Science</asp:ListItem>
                                <asp:ListItem Value="Humanities">Humanities</asp:ListItem>
                                <asp:ListItem Value="Computer Science">Computer Science</asp:ListItem>
                                <asp:ListItem Value="Other">Other</asp:ListItem>
                            </asp:DropDownList>
                    </div>
                                 <div class="col-md-3">
                        <label class="form-label" for="ddlBoardSSC">Board<span style="color:red">*</span></label>
                        <asp:DropDownList ID="ddlBoardSSC" runat="server" ValidationGroup="formAcademicInfo"   class="form-control">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="BIE Karachi">BIE Karachi</asp:ListItem>
                                <asp:ListItem Value="BSE Karachi">BSE Karachi</asp:ListItem>
                                <asp:ListItem Value="BISE Sukkur">BISE Sukkur</asp:ListItem>
                                <asp:ListItem Value="BISE Hyderabad">BISE Hyderabad</asp:ListItem>
                                <asp:ListItem Value="BISE Larkana">BISE Larkana</asp:ListItem>
                                <asp:ListItem Value="BISE Mirpurkhas">BISE Mirpurkhas</asp:ListItem>
                                <asp:ListItem Value="Aga Khan Board">Aga Khan Board</asp:ListItem>
                                <asp:ListItem Value="BISE Lahore">BISE Lahore</asp:ListItem>
                                <asp:ListItem Value="BISE Gujranwala">BISE Gujranwala</asp:ListItem>
                                <asp:ListItem Value="BISE Multan">BISE Multan</asp:ListItem>
                                <asp:ListItem Value="BISE Faisalabad">BISE Faisalabad</asp:ListItem>
                                <asp:ListItem Value="BISE Sargodha">BISE Sargodha</asp:ListItem>
                                <asp:ListItem Value="BISE Rawalpindi">BISE Rawalpindi</asp:ListItem>
                                <asp:ListItem Value="BISE Bahawalpur">BISE Bahawalpur</asp:ListItem>
                                <asp:ListItem Value="BISE DG Khan">BISE DG Khan</asp:ListItem>
                                <asp:ListItem Value="BISE Sahiwal">BISE Sahiwal</asp:ListItem>
                                <asp:ListItem Value="BISE Federal">BISE Federal</asp:ListItem>
                                <asp:ListItem Value="BISE Peshawar">BISE Peshawar</asp:ListItem>
                                <asp:ListItem Value="BISE Swat">BISE Swat</asp:ListItem>
                                <asp:ListItem Value="BISE Kohat"> BISE Kohatr</asp:ListItem>
                                <asp:ListItem Value="BISE Malakand">BISE Malakand</asp:ListItem>
                                <asp:ListItem Value="BISE Abbottabad">BISE Abbottabad</asp:ListItem>
                                <asp:ListItem Value="BISE Bannu">BISE Bannu</asp:ListItem>
                                <asp:ListItem Value="BISE Quetta">BISE Quetta</asp:ListItem>
                                <asp:ListItem Value="BISE Turbat">BISE Turbat</asp:ListItem>
                                <asp:ListItem Value="FBISE Islamabad">FBISE Islamabad</asp:ListItem>
                                <asp:ListItem Value="Other">Other</asp:ListItem>
                            </asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                         <label class="form-label" for="txtInstitutionSSC">Institution<span style="color:red">*</span></label>
                         <input type="text" id="txtInstitution" runat="server" ValidationGroup="formAcademicInfo"   class="form-control" />
                    </div>
                    <div class="clearfix"></div>                
                    
                     </div>
                             <div class="row">
                                          <div class="col-md-3">
                        <label class="form-label" for="txtSeatNoSSC">Seat#<span style="color:red">*</span> </label>
                        <input type="text" id="txtSeatNoSSC" runat="server" ValidationGroup="formAcademicInfo"   class="form-control" />
                    </div>
                                  <div class="col-md-3">
                         <label class="form-label" for="ddlExamTypeSSC">Exam Type<span style="color:red">*</span></label>
                        <asp:DropDownList ID="ddlExamTypeSSC" runat="server" ValidationGroup="formAcademicInfo"   class="form-control">
                              <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="Annual">Annual</asp:ListItem>
                                <asp:ListItem Value="Supplementary">Supplementary</asp:ListItem>
                            </asp:DropDownList>
                    </div>
                                 <div class="col-md-3">
                         <label class="form-label" for="txtFromYearSSC">Start Year<span style="color:red">*</span></label>
                         <input type="number" value="2020" id="txtFromYearSSC" runat="server" ValidationGroup="formAcademicInfo"   class="form-control" />
                    </div>
                      <div class="col-md-3">
                         <label class="form-label" for="txtPassYearSSC">Passing Year<span style="color:red">*</span></label>
                         <input type="number"  value="2021" id="txtPassYearSSC" runat="server" ValidationGroup="formAcademicInfo"  class="form-control"  />
                    </div>
                    <div class="clearfix"></div>
                </div>
                         <div class="row">
                             <div class="col-md-3">
                                         <label class="form-label" for="txtObtainedMarksSSC">Obtained marks</label>
                            <input type="number" id="txtObtainedMarksSSC" ValidationGroup="formAcademicInfo" runat="server" class="form-control" />
                    </div>
                    <div class="col-md-3">
                        <label class="form-label" for="txtTotalMarksSSC">Total marks</label>
                        <input type="number" id="txtTotalMarksSSC" ValidationGroup="formAcademicInfo" runat="server" class="form-control" />
                    </div>
                                 <div class="col-md-3">
                                            <label class="form-label" for="txtPercentageSSC">Percentage<span style="color:red">*</span> </label>
                         <input type="number" max="100" step="0.1" id="txtPercentageSSC" runat="server" ValidationGroup="formAcademicInfo" class="form-control" />
                                 </div>
                      <div class="col-md-3">
                         <label class="form-label" for="ddlGradeSSC">Grade<span style="color:red">*</span></label>
                        <asp:DropDownList ID="ddlGradeSSC" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" >
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="A-1">A-1</asp:ListItem>
                                <asp:ListItem Value="A">A</asp:ListItem>
                                <asp:ListItem Value="B">B</asp:ListItem>
                                <asp:ListItem Value="C">C</asp:ListItem>
                                <asp:ListItem Value="D">D</asp:ListItem>
                                <asp:ListItem Value="Other">Other</asp:ListItem>
                            </asp:DropDownList>
                    </div>
                             <div class="clearfix"></div>
                         </div>
                     </div>
                </div>
                <br />
                  <div class="row" runat="server" id="divHSC">
                     <div class="col-md-12">
                         <div class="row">
                             <div class="col-md-12">
                                 <h4>HSC / A-LEVEL Education</h4>

                             </div>

                         </div>
                            <div class="row">
                         <div class="col-md-2">
                        <label class="form-label" for="ddlDegreeHSC">Degree<span style="color:red">*</span></label>
                        <asp:DropDownList ID="ddlDegreeHSC" runat="server" ValidationGroup="formAcademicInfo"    class="form-control">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="HSC">HSC</asp:ListItem>
                                <asp:ListItem Value="A-Level">A-Level</asp:ListItem>
                            </asp:DropDownList>
                    </div>
                    
                                    <div class="col-md-3">
                        <label class="form-label" for="ddlGroupHSC">Group<span style="color:red">*</span></label>
                        <asp:DropDownList ID="ddlGroupHSC" runat="server" ValidationGroup="formAcademicInfo"   class="form-control">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="General Science">General Science</asp:ListItem>
                                <asp:ListItem Value="Science">Science</asp:ListItem>
                                <asp:ListItem Value="Humanities">Humanities</asp:ListItem>
                                <asp:ListItem Value="Computer Science">Computer Science</asp:ListItem>
                                <asp:ListItem Value="Other">Other</asp:ListItem>
                            </asp:DropDownList>
                    </div>
                                <div class="col-md-3">
                        <label class="form-label" for="ddlBoardHSC">Board<span style="color:red">*</span></label>
                        <asp:DropDownList ID="ddlBoardHSC" runat="server" ValidationGroup="formAcademicInfo"   class="form-control">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="BIE Karachi">BIE Karachi</asp:ListItem>
                                <asp:ListItem Value="BSE Karachi">BSE Karachi</asp:ListItem>
                                <asp:ListItem Value="BISE Sukkur">BISE Sukkur</asp:ListItem>
                                <asp:ListItem Value="BISE Hyderabad">BISE Hyderabad</asp:ListItem>
                                <asp:ListItem Value="BISE Larkana">BISE Larkana</asp:ListItem>
                                <asp:ListItem Value="BISE Mirpurkhas">BISE Mirpurkhas</asp:ListItem>
                                <asp:ListItem Value="Aga Khan Board">Aga Khan Board</asp:ListItem>
                                <asp:ListItem Value="BISE Lahore">BISE Lahore</asp:ListItem>
                                <asp:ListItem Value="BISE Gujranwala">BISE Gujranwala</asp:ListItem>
                                <asp:ListItem Value="BISE Multan">BISE Multan</asp:ListItem>
                                <asp:ListItem Value="BISE Faisalabad">BISE Faisalabad</asp:ListItem>
                                <asp:ListItem Value="BISE Sargodha">BISE Sargodha</asp:ListItem>
                                <asp:ListItem Value="BISE Rawalpindi">BISE Rawalpindi</asp:ListItem>
                                <asp:ListItem Value="BISE Bahawalpur">BISE Bahawalpur</asp:ListItem>
                                <asp:ListItem Value="BISE DG Khan">BISE DG Khan</asp:ListItem>
                                <asp:ListItem Value="BISE Sahiwal">BISE Sahiwal</asp:ListItem>
                                <asp:ListItem Value="BISE Federal">BISE Federal</asp:ListItem>
                                <asp:ListItem Value="BISE Peshawar">BISE Peshawar</asp:ListItem>
                                <asp:ListItem Value="BISE Swat">BISE Swat</asp:ListItem>
                                <asp:ListItem Value="BISE Kohat"> BISE Kohatr</asp:ListItem>
                                <asp:ListItem Value="BISE Malakand">BISE Malakand</asp:ListItem>
                                <asp:ListItem Value="BISE Abbottabad">BISE Abbottabad</asp:ListItem>
                                <asp:ListItem Value="BISE Bannu">BISE Bannu</asp:ListItem>
                                <asp:ListItem Value="BISE Quetta">BISE Quetta</asp:ListItem>
                                <asp:ListItem Value="BISE Turbat">BISE Turbat</asp:ListItem>
                                <asp:ListItem Value="FBISE Islamabad">FBISE Islamabad</asp:ListItem>
                                <asp:ListItem Value="Other">Other</asp:ListItem>
                            </asp:DropDownList>
                    </div>
                    
                    <div class="col-md-4">
                         <label class="form-label" for="txtInstitutionHSC">Institution <span style="color:red">*</span></label>
                         <input type="text" id="txtInstitutionHSC" runat="server" ValidationGroup="formAcademicInfo"   class="form-control" />
                    </div>
                    
                    <div class="clearfix"></div>
                     </div>
                             <div class="row">
                                 <div class="col-md-3">
                        <label class="form-label" for="txtSeatNoHSC">Seat# <span style="color:red">*</span></label>
                        <input type="text" id="txtSeatNoHSC" runat="server" ValidationGroup="formAcademicInfo"   class="form-control" />
                    </div>
                   
                      <div class="col-md-3">
                         <label class="form-label" for="ddlExamTypeHSC">Exam Type<span style="color:red">*</span></label>
                        <asp:DropDownList ID="ddlExamTypeHSC" runat="server" ValidationGroup="formAcademicInfo"   class="form-control">
                              <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="Annual">Annual</asp:ListItem>
                                <asp:ListItem Value="Supplementary">Supplementary</asp:ListItem>
                            </asp:DropDownList>
                    </div>
                                 
                     <div class="col-md-3">
                         <label class="form-label" for="txtFromYearHSC">Start Year<span style="color:red">*</span></label>
                         <input type="number" value="2020" id="txtFromYearHSC" runat="server" ValidationGroup="formAcademicInfo"   class="form-control" />
                    </div>
                      <div class="col-md-3">
                         <label class="form-label" for="txtPassYearHSC">Passing Year<span style="color:red">*</span></label>
                         <input type="number" value="2021" id="txtPassYearHSC" runat="server" ValidationGroup="formAcademicInfo"   class="form-control" />
                    </div>
                    <div class="clearfix"></div>
                </div>
                         <div class="row">
                            <div class="col-md-3">
                                         <label class="form-label" for="txtObtainedMarksHSC">Obtained marks</label>
                            <input type="number" id="txtObtainedMarksHSC" ValidationGroup="formAcademicInfo" runat="server" class="form-control" />
                    </div>
                    <div class="col-md-3">
                        <label class="form-label" for="txtTotalMarksHSC">Total marks</label>
                        <input type="number" id="txtTotalMarksHSC" ValidationGroup="formAcademicInfo" runat="server" class="form-control" />
                    </div>
                                   <div class="col-md-3">
                          <label class="form-label" for="txtPercentageHSC">Percentage<span style="color:red">*</span> </label>
                         <input type="number" min="45" max="100" step="0.1" id="txtPercentageHSC" runat="server"   ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                      <div class="col-md-3">
                         <label class="form-label" for="ddlGradeHSC">Grade<span style="color:red">*</span></label>
                        <asp:DropDownList ID="ddlGradeHSC" runat="server" ValidationGroup="formAcademicInfo"  class="form-control"  >
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="A-1">A-1</asp:ListItem>
                                <asp:ListItem Value="A">A</asp:ListItem>
                                <asp:ListItem Value="B">B</asp:ListItem>
                                <asp:ListItem Value="C">C</asp:ListItem>
                                <asp:ListItem Value="D">D</asp:ListItem>
                                <asp:ListItem Value="Other">Other</asp:ListItem>
                                <asp:ListItem Value="Result Awaiting">Result Awaiting</asp:ListItem>
                            </asp:DropDownList>
                    </div>
                             <div class="clearfix"></div>
                         </div>
                     </div>
                </div>
                    <br />
                  <div class="row" runat="server" id="divBachelor14">
                     <div class="col-md-12">
                         <div class="row">
                             <div class="col-md-12">
                                 <h4>Bachelors 14 Years</h4>

                             </div>

                         </div>
                            <div class="row">
                                             <div class="col-md-3">
                         <label class="form-label" for="txtUniversityB14">University<span style="color:red">*</span> </label>
                         <input type="text" id="txtUniversityB14" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                                <div class="col-md-4">
                         <label class="form-label" for="txtInstitutionB14">Institution <span style="color:red">*</span></label>
                         <input type="text" id="txtInstitutionB14" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                                <div class="col-md-2">
                         <label class="form-label" for="txtProgramB14">Program/Dicipline <span style="color:red">*</span></label>
                         <input type="text" id="txtProgramB14" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                                           <div class="col-md-3">
                         <label class="form-label" for="txtMajorsB14">Major Subjects<span style="color:red">*</span></label>
                         <input type="text" id="txtMajorsB14" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                                <div class="clearfix"></div>

                     </div>
                             <div class="row">
                                 <div class="col-md-3">
                        <label class="form-label" for="txtSeatNoB14">Seat# <span style="color:red">*</span></label>
                        <input type="text" id="txtSeatNoB14" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                                   <div class="col-md-3">
                         <label class="form-label" for="ddlExamTypeB14">Exam Type<span style="color:red">*</span></label>
                        <asp:DropDownList ID="ddlExamTypeB14" runat="server" ValidationGroup="formAcademicInfo"  class="form-control">
                              <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="Annual">Annual</asp:ListItem>
                                <asp:ListItem Value="Supplementary">Supplementary</asp:ListItem>
                            <asp:ListItem Value="Semester">Semester</asp:ListItem>
                            </asp:DropDownList>
                    </div>
                                 <div class="col-md-3">
                         <label class="form-label" for="txtFromYearB14">Start Year<span style="color:red">*</span></label>
                         <input type="number" id="txtFromYearB14" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                      <div class="col-md-3">
                         <label class="form-label" for="txtPassYearB14">Passing Year<span style="color:red">*</span></label>
                         <input type="number" id="txtPassYearB14" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                    <div class="clearfix"></div>
                    </div>
                    <div class="row">
                    <div class="col-md-3">
                         <label class="form-label" for="txtObtainedMarksB14">Obtained marks</label>
                         <input type="number" id="txtObtainedMarksB14" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                    <div class="col-md-3">
                         <label class="form-label" for="txtTotalMarksB14">Total marks</label>
                         <input type="number" id="txtTotalMarksB14" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                                          <div class="col-md-3">
                          <label class="form-label" for="txtPercentageB14">Percentage<span style="color:red">*</span> </label>
                         <input type="number" min="0" max="100" step="0.1" id="txtPercentageB14" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                      <div class="col-md-3">
                         <label class="form-label" for="ddlGradeB14">Division<span style="color:red">*</span></label>
                        <asp:DropDownList ID="ddlGradeB14" runat="server" ValidationGroup="formAcademicInfo"  class="form-control">
                                    <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="1st Division">1st Division</asp:ListItem>
                                    <asp:ListItem Value="2nd Division">2nd Division</asp:ListItem>
                            <asp:ListItem Value="3rd Division">3rd Division</asp:ListItem>
                                <asp:ListItem Value="Result Awaiting">Result Awaiting</asp:ListItem>                                
                            <asp:ListItem Value="Other">Other</asp:ListItem>
                            </asp:DropDownList>
                    </div>
                    
                </div>
                 
                      </div>
                   </div>
                 <br />
                  <div class="row" runat="server" id="divBachelor16">
                     <div class="col-md-12">
                         <div class="row">
                             <div class="col-md-12">
                                 <h4>Bachelors 16 Years</h4>

                             </div>

                         </div>
                            <div class="row">

                                            <div class="col-md-3">
                         <label class="form-label" for="txtUniversityB16">University <span style="color:red">*</span></label>
                         <input type="text" id="txtUniversityB16" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                    <div class="col-md-4">
                         <label class="form-label" for="txtInstitutionB16">Institution <span style="color:red">*</span></label>
                         <input type="text" id="txtInstitutionB16" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                                
                                           <div class="col-md-2">
                         <label class="form-label" for="txtProgramB16">Program/Dicipline <span style="color:red">*</span></label>
                         <input type="text" id="txtProgramB16" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                                     <div class="col-md-3">
                         <label class="form-label" for="txtMajorsB16">Major Subjects<span style="color:red">*</span></label>
                         <input type="text" id="txtMajorsB16" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>

                    <div class="clearfix"></div>
                     </div>
                             <div class="row">
                                 
                                  <div class="col-md-3">
                        <label class="form-label" for="txtSeatNoB16">Seat# <span style="color:red">*</span></label>
                        <input type="text" id="txtSeatNoB16" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                     <div class="col-md-3">
                         <label class="form-label" for="ddlExamTypeB16">Exam Type<span style="color:red">*</span></label>
                        <asp:DropDownList ID="ddlExamTypeB16" runat="server" ValidationGroup="formAcademicInfo"  class="form-control">
                              <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="Annual">Annual</asp:ListItem>
                                <asp:ListItem Value="Supplementary">Supplementary</asp:ListItem>
                            <asp:ListItem Value="Semester">Semester</asp:ListItem>
                            </asp:DropDownList>
                    </div>
                                 <div class="col-md-3">
                         <label class="form-label" for="txtFromYearB16">Start Year<span style="color:red">*</span></label>
                         <input type="number" value="2020" id="txtFromYearB16" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                      <div class="col-md-3">
                         <label class="form-label" for="txtPassYearB16">Passing Year<span style="color:red">*</span></label>
                         <input type="number" value="2021" id="txtPassYearB16" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                    <div class="clearfix"></div>
                    
                </div>
                         <div class="row">
                             <div class="col-md-2">
                         <label class="form-label" for="txtObtainedMarksB16">Obtained marks</label>
                         <input type="number" id="txtObtainedMarksB16" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                    <div class="col-md-2">
                         <label class="form-label" for="txtTotalMarksB16">Total marks</label>
                         <input type="number" id="txtTotalMarksB16" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                                          <div class="col-md-2">
                          <label class="form-label" for="txtPercentageB16">Percentage</label>
                         <input type="number" max="100" step="0.1" id="txtPercentageB16" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                                             <div class="col-md-2">
                          <label class="form-label" for="txtCGPAB16">CGPA</label>
                         <input type="number" max="4" step="0.1" id="txtCGPAB16" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                      <div class="col-md-4">
                         <label class="form-label" for="ddlGradeB16">Division<span style="color:red">*</span></label>
                        <asp:DropDownList ID="ddlGradeB16" runat="server" ValidationGroup="formAcademicInfo"  class="form-control">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="1st Division">1st Division</asp:ListItem>
                                    <asp:ListItem Value="2nd Division">2nd Division</asp:ListItem>
                            <asp:ListItem Value="3rd Division">3rd Division</asp:ListItem>
                              <asp:ListItem Value="A-1">A-1</asp:ListItem>
                                <asp:ListItem Value="A">A</asp:ListItem>
                                <asp:ListItem Value="B">B</asp:ListItem>
                                <asp:ListItem Value="C">C</asp:ListItem>
                                <asp:ListItem Value="D">D</asp:ListItem>
                                <asp:ListItem Value="Result Awaiting">Result Awaiting</asp:ListItem>
                            <asp:ListItem Value="Other">Other</asp:ListItem>
                            </asp:DropDownList>
                    </div>
                             <div class="clearfix"></div>
                         </div>
                 
                         </div>
                      </div>
                  <br />
                  <div class="row" runat="server" id="divMasters18">
                     <div class="col-md-12">
                         <div class="row">
                             <div class="col-md-12">
                                 <h4>Masters 18 Years</h4>

                             </div>

                         </div>

                            <div class="row">

                                            <div class="col-md-3">
                         <label class="form-label" for="txtUniversityM18">University <span style="color:red">*</span></label>
                         <input type="text" id="txtUniversityM18" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                    <div class="col-md-4">
                         <label class="form-label" for="txtInstitutionM18">Institution <span style="color:red">*</span></label>
                         <input type="text" id="txtInstitutionM18" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                                
                                           <div class="col-md-2">
                         <label class="form-label" for="txtProgramM18">Program/Dicipline <span style="color:red">*</span></label>
                         <input type="text" id="txtProgramM18" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                                     <div class="col-md-3">
                         <label class="form-label" for="txtMajorsM18">Major Subjects<span style="color:red">*</span></label>
                         <input type="text" id="txtMajorsM18" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>

                    <div class="clearfix"></div>
                     </div>
                             <div class="row">
                                 
                                  <div class="col-md-3">
                        <label class="form-label" for="txtSeatNoM18">Seat# <span style="color:red">*</span></label>
                        <input type="text" id="txtSeatNoM18" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                     <div class="col-md-3">
                         <label class="form-label" for="ddlExamTypeM18">Exam Type<span style="color:red">*</span></label>
                        <asp:DropDownList ID="ddlExamTypeM18" runat="server" ValidationGroup="formAcademicInfo"  class="form-control">
                              <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="Annual">Annual</asp:ListItem>
                                <asp:ListItem Value="Supplementary">Supplementary</asp:ListItem>
                            <asp:ListItem Value="Semester">Semester</asp:ListItem>
                            </asp:DropDownList>
                    </div>
                                 <div class="col-md-3">
                         <label class="form-label" for="txtFromYearM18">Start Year<span style="color:red">*</span></label>
                         <input type="number" value="2020" id="txtFromYearM18" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                      <div class="col-md-3">
                         <label class="form-label" for="txtPassYearM18">Passing Year<span style="color:red">*</span></label>
                         <input type="number" value="2021" id="txtPassYearM18" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                    <div class="clearfix"></div>
                    
                </div>
                         <div class="row">
                             <div class="col-md-2">
                         <label class="form-label" for="txtObtainedMarksM18">Obtained marks</label>
                         <input type="number" id="txtObtainedMarksM18" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                    <div class="col-md-2">
                         <label class="form-label" for="txtTotalMarksM18">Total marks</label>
                         <input type="number" id="txtTotalMarksM18" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                                          <div class="col-md-2">
                          <label class="form-label" for="txtPercentageM18">Percentage</label>
                         <input type="number" max="100" step="0.1" id="txtPercentageM18" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                                             <div class="col-md-2">
                          <label class="form-label" for="txtCGPAM18">CGPA</label>
                         <input type="number" max="4" step="0.1" id="txtCGPAM18" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                      <div class="col-md-4">
                         <label class="form-label" for="ddlGradeM18">Division<span style="color:red">*</span></label>
                        <asp:DropDownList ID="ddlGradeM18" runat="server" ValidationGroup="formAcademicInfo"  class="form-control">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="1st Division">1st Division</asp:ListItem>
                                    <asp:ListItem Value="2nd Division">2nd Division</asp:ListItem>
                            <asp:ListItem Value="3rd Division">3rd Division</asp:ListItem>
                              <asp:ListItem Value="A-1">A-1</asp:ListItem>
                                <asp:ListItem Value="A">A</asp:ListItem>
                                <asp:ListItem Value="B">B</asp:ListItem>
                                <asp:ListItem Value="C">C</asp:ListItem>
                                <asp:ListItem Value="D">D</asp:ListItem>
                                <asp:ListItem Value="Result Awaiting">Result Awaiting</asp:ListItem>
                            <asp:ListItem Value="Other">Other</asp:ListItem>
                            </asp:DropDownList>
                    </div>
                             <div class="clearfix"></div>
                         </div>
                 
                         </div>
                      </div>
                <br />

                <div class="row" runat="server" id="divNTSInfo">
                     <div class="col-md-12">
                         <div class="row">
                             <div class="col-md-12">
                                 <h4>NTS / Other Test (Optional)</h4>

                             </div>

                         </div>
                            <div class="row">

                         <div class="col-md-4">
                         <label class="form-label" for="ddlNTSType">Test Type</label>
                          <asp:DropDownList ID="ddlNTSType" runat="server" ValidationGroup="formAcademicInfo" CssClass="form-control">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="GAT">GAT</asp:ListItem>
                                <asp:ListItem Value="GAT Subject">GAT Subject</asp:ListItem>
                                <asp:ListItem Value="NAT">NAT</asp:ListItem>
                            </asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                         <label class="form-label" for="txtNTSService">Testing Service</label>
                         <input type="text" id="txtNTSService" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                                
                    <div class="col-md-4">
                         <label class="form-label" for="txtNTSDate">Attempt Date</label>
                         <input type="text" id="txtNTSDate" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                    <div class="clearfix"></div>
                     </div>
                             <div class="row">
                                 <div class="col-md-4">
                         <label class="form-label" for="txtNTSRoll">Roll#</label>
                         <input type="text" id="txtNTSRoll" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                                        <div class="col-md-4">
                         <label class="form-label" for="txtNTSObtainedMarks">Test Score</label>
                         <input type="number" id="txtNTSObtainedMarks" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                    <div class="col-md-4">
                         <label class="form-label" for="txtNTSTotalMarks">Max Score</label>
                         <input type="number" id="txtNTSTotalMarks" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                    
                </div>
                     </div>
                    </div>
                <br />
                <div class="row">
                    <div class="col-md-12" style="text-align:center;">
                        <h4>Degree Program Information</h4>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                    <label class="form-label" for="ddlDegreeProgram">Select Degree Program<span style="color:red">*</span></label>
                    <asp:DropDownList ID="ddlDegreeProgram" Enabled="false" runat="server" ValidationGroup="formDegreeProgram"  class="form-control">
                        <asp:ListItem Text="--Select--" Value="-1" />
                        <asp:ListItem Text="Undergraduate" Value="2" />
                        <%--<asp:ListItem Text="Associate (2 Years - After 14 Years Education)" Value="4" />--%>
                        <asp:ListItem Text="Graduate" Value="1" />
                        <asp:ListItem Text="Postgraduate" Value="3" />
                    </asp:DropDownList>
                  </div>
                  <div class="clearfix"></div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label class="form-label" for="ddlFirstChoice">1st Choice<span style="color:red">*</span></label>
                        <asp:DropDownList ID="ddlFirstChoice" Enabled="false" runat="server" ValidationGroup="formDegreeProgram"  class="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label" for="ddlSecondChoice">2nd Choice<span style="color:red">*</span></label>
                        <asp:DropDownList ID="ddlSecondChoice" AutoPostBack="true" runat="server" ValidationGroup="formDegreeProgram"  class="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label class="form-label" for="ddlThirdChoice">3rd Choice<span style="color:red">*</span></label>
                        <asp:DropDownList ID="ddlThirdChoice" AutoPostBack="true" runat="server" ValidationGroup="formDegreeProgram"  class="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label" for="ddlFourthChoice">4th Choice</label>
                        <asp:DropDownList ID="ddlFourthChoice" AutoPostBack="true" runat="server" ValidationGroup="formDegreeProgram"  class="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label class="form-label" for="ddlFifthChoice">5th Choice</label>
                        <asp:DropDownList ID="ddlFifthChoice" AutoPostBack="true" runat="server" ValidationGroup="formDegreeProgram"  class="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label" for="ddlSixthChoice">6th Choice</label>
                        <asp:DropDownList ID="ddlSixthChoice" AutoPostBack="true" runat="server" ValidationGroup="formDegreeProgram"  class="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label class="form-label" for="ddlSeventhChoice">7th Choice</label>
                        <asp:DropDownList ID="ddlSeventhChoice" AutoPostBack="true" runat="server" ValidationGroup="formDegreeProgram"  class="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label" for="ddlEighthChoice">8th Choice</label>
                        <asp:DropDownList ID="ddlEighthChoice" AutoPostBack="true" runat="server" ValidationGroup="formDegreeProgram"  class="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="clearfix"></div>
                </div>
                 <div class="row">
                    <div class="col-md-6">
                        <label class="form-label" for="ddlNinthChoice">9th Choice</label>
                        <asp:DropDownList ID="ddlNinthChoice" AutoPostBack="true" runat="server" ValidationGroup="formDegreeProgram"  class="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label" for="ddlTenthChoice">10th Choice</label>
                        <asp:DropDownList ID="ddlTenthChoice" AutoPostBack="true" runat="server" ValidationGroup="formDegreeProgram"  class="form-control">
                        </asp:DropDownList>
                    </div>
                     <div class="clearfix"></div>
                </div>
                <br />
                <div id="divUndergraduateFacility" runat="server" >
                <div class="row">
                    <div class="col-md-12">
                        <label class="form-label" for="chkTransport">Check the box if you are intrested in Self Finance Scheme.</label>
                        <asp:CheckBox ID="chkSelfFinance" Text="Self Finance Scheme" runat="server" CssClass="form-control" />
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <label class="form-label" for="chkTransport">Check the box if you are interested to avail SMI University Transport facility.</label>
                        <asp:CheckBox ID="chkTransport" Text="Self Finance Scheme" runat="server" CssClass="form-control" />
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <label class="form-label" for="chkTransport">Specify your pickup location.</label>
                        <asp:TextBox ID="txtTransport" Visible="false" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="clearfix"></div>
                </div>
                </div>
                <br />
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
        </form>
</asp:Content>