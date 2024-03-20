<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="_AcademicInfo.aspx.cs" Inherits="SMIU_Admission.NewForms._AcademicInfo" MasterPageFile="~/MasterPages/PortalMaster.master" %>

<asp:Content ID="cDashboard" ContentPlaceHolderID="contentScreen" runat="Server">
 <asp:Panel ID="pnlMsg" runat="server" CssClass="error" Visible="false"><asp:Label ID="lblPanel" runat="server"></asp:Label></asp:Panel>
    <div class="row">
        <div class="col-md-10" style="text-align:center;">
            <h4>Academic Information</h4>
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
            <form runat="server" id="formAcademicInfo">
                 <asp:ScriptManager runat="server"></asp:ScriptManager>
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
                            <asp:RequiredFieldValidator ID="ReqFldValMDegreeLevel" runat="server" ControlToValidate="ddlDegreeSSC"
                                ErrorMessage="Degree is required." InitialValue="-1" SetFocusOnError="True"
                                ValidationGroup="formAcademicInfo" Display="Dynamic"></asp:RequiredFieldValidator>
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
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlGroupSSC"
                                ErrorMessage="Group is required." InitialValue="-1" SetFocusOnError="True"
                                ValidationGroup="formAcademicInfo" Display="Dynamic"></asp:RequiredFieldValidator>
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
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlBoardSSC"
                                ErrorMessage="Board is required." InitialValue="-1" SetFocusOnError="True"
                                ValidationGroup="formAcademicInfo" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-4">
                         <label class="form-label" for="txtInstitutionSSC">Institution<span style="color:red">*</span></label>
                         <input type="text" id="txtInstitution" runat="server" ValidationGroup="formAcademicInfo"   class="form-control" />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtInstitution"
                                ErrorMessage="Institution is required" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="clearfix"></div>                
                    
                     </div>
                             <div class="row">
                                          <div class="col-md-3">
                        <label class="form-label" for="txtSeatNoSSC">Seat#<span style="color:red">*</span> </label>
                        <input type="text" id="txtSeatNoSSC" runat="server" ValidationGroup="formAcademicInfo"   class="form-control" />
                            <asp:RequiredFieldValidator ID="ReqFldValtxtMSeatNumber" runat="server" ControlToValidate="txtSeatNoSSC"
                                ErrorMessage="Seat# is required" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                                  <div class="col-md-3">
                         <label class="form-label" for="ddlExamTypeSSC">Exam Type<span style="color:red">*</span></label>
                        <asp:DropDownList ID="ddlExamTypeSSC" runat="server" ValidationGroup="formAcademicInfo"   class="form-control">
                              <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="Annual">Annual</asp:ListItem>
                                <asp:ListItem Value="Supplementary">Supplementary</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="ddlExamTypeSSC"
                                ErrorMessage="Exam type is required." InitialValue="-1" SetFocusOnError="True"
                                ValidationGroup="formAcademicInfo" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                                 <div class="col-md-3">
                         <label class="form-label" for="txtFromYearSSC">Start Year<span style="color:red">*</span></label>
                         <input type="number" min="1900" value="2020" id="txtFromYearSSC" runat="server" ValidationGroup="formAcademicInfo"   class="form-control" />
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtFromYearSSC"
                                Display="Dynamic" ErrorMessage="Only numbers are allowed" ValidationExpression="\d+"
                                ValidationGroup="formAcademicInfo"></asp:RegularExpressionValidator>  
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtFromYearSSC"
                                ErrorMessage="Start year is required" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                        <%--        <asp:CompareValidator ID="CompareValidator8" runat="server" ControlToValidate="txtFromYearSSC"
                                ControlToCompare="txtPassYearSSC" Operator="LessThan"
                                ErrorMessage="Start year can't be same or greater than the passing year." ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:CompareValidator>--%>
                               <%-- <asp:CompareValidator ID="CompareValidator11" runat="server" ControlToValidate="txtFromYearSSC"
                                ValueToCompare="2023" Operator="LessThan"
                                ErrorMessage="Start year can't be same or greater than the current calender year." ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:CompareValidator>--%>
                    </div>
                      <div class="col-md-3">
                         <label class="form-label" for="txtPassYearSSC">Passing Year<span style="color:red">*</span></label>
                         <input type="number" min="1900" value="2021" id="txtPassYearSSC" runat="server" ValidationGroup="formAcademicInfo"  class="form-control"  />
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtPassYearSSC"
                                Display="Dynamic" ErrorMessage="Only numbers are allowed" ValidationExpression="\d+"
                                ValidationGroup="formAcademicInfo"></asp:RegularExpressionValidator>  
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtPassYearSSC"
                                ErrorMessage="Passing year is required" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                           <asp:CompareValidator ID="CompareValidator15" runat="server" ControlToValidate="txtPassYearSSC"
                                ControlToCompare="txtFromYearSSC" Operator="GreaterThan"
                                ErrorMessage="Passing year can't be same or less than the Start year." ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:CompareValidator>
                            <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txtPassYearSSC"
                                ValueToCompare="2023" Operator="LessThanEqual"
                                ErrorMessage="Passing year can't be greater than the current calender year." ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:CompareValidator>
                    </div>
                    <div class="clearfix"></div>
                </div>
                         <div class="row">
                             <div class="col-md-3">
                                         <label class="form-label" for="txtObtainedMarksSSC">Obtained marks</label>
                            <input type="number" min="0" id="txtObtainedMarksSSC" ValidationGroup="formAcademicInfo" runat="server" class="form-control" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtObtainedMarksSSC"
                                Display="Dynamic" ErrorMessage="Only numbers are allowed" ValidationExpression="\d+"
                                ValidationGroup="formAcademicInfo"></asp:RegularExpressionValidator>
                           <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtObtainedMarksSSC"
                                ErrorMessage="Obtained marks is required field." ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>--%>
                             <%--<asp:CompareValidator ID="CompareValidator17" runat="server" ControlToValidate="txtObtainedMarksSSC" ControlToCompare="txtTotalMarksSSC"
                                ErrorMessage="Obtained marks can't exceed the total marks." Operator="LessThanEqual" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:CompareValidator>--%>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label" for="txtTotalMarksSSC">Total marks</label>
                        <input type="number" min="0" id="txtTotalMarksSSC" ValidationGroup="formAcademicInfo" runat="server" class="form-control" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtTotalMarksSSC"
                                Display="Dynamic" ErrorMessage="Only numbers are allowed" ValidationExpression="\d+"
                                ValidationGroup="formAcademicInfo"></asp:RegularExpressionValidator>
                         <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtTotalMarksSSC"
                                ErrorMessage="Total marks is required field." ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>--%>
                        <asp:CompareValidator ID="CompareValidator5" runat="server" ControlToValidate="txtTotalMarksSSC" ControlToCompare="txtObtainedMarksSSC"
                                ErrorMessage="Total marks can't be less than obtained marks." Operator="GreaterThanEqual" Type="Integer" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:CompareValidator>
                        
                        
                    </div>
                                 <div class="col-md-3">
                                            <label class="form-label" for="txtPercentageSSC">Percentage<span style="color:red">*</span> </label>
                         <input type="number" min="0" max="100" step="0.1" id="txtPercentageSSC" runat="server" ValidationGroup="formAcademicInfo" class="form-control" />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator56" runat="server" ControlToValidate="txtPercentageSSC"
                                ErrorMessage="Percentage is required" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>
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
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ddlGradeSSC"
                                ErrorMessage="Grade is required." InitialValue="-1" SetFocusOnError="True" 
                                ValidationGroup="formAcademicInfo" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                             <div class="clearfix"></div>
                         </div>
                     </div>
                </div>
                  <br />
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
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="ddlDegreeHSC"
                                ErrorMessage="Degree is required." InitialValue="-1" SetFocusOnError="True"
                                ValidationGroup="formAcademicInfo" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    
                                    <div class="col-md-3">
                        <label class="form-label" for="ddlGroupHSC">Group<span style="color:red">*</span></label>
                        <asp:DropDownList ID="ddlGroupHSC" runat="server" ValidationGroup="formAcademicInfo"   class="form-control">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="Pre-Engineering">Pre-Engineering</asp:ListItem>
                                <asp:ListItem Value="Pre-Medical">Pre-Medical</asp:ListItem>
                                <asp:ListItem Value="Humanities">Humanities</asp:ListItem>
                                <asp:ListItem Value="Computer Science">Computer Science</asp:ListItem>
                                <asp:ListItem Value="Commerce">Commerce</asp:ListItem>
                                <asp:ListItem Value="Other">Other</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="ddlGroupHSC"
                                ErrorMessage="Group is required." InitialValue="-1" SetFocusOnError="True"
                                ValidationGroup="formAcademicInfo" Display="Dynamic"></asp:RequiredFieldValidator>
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
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="ddlBoardHSC"
                                ErrorMessage="Board is required." InitialValue="-1" SetFocusOnError="True"
                                ValidationGroup="formAcademicInfo" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    
                    <div class="col-md-4">
                         <label class="form-label" for="txtInstitutionHSC">Institution <span style="color:red">*</span></label>
                         <input type="text" id="txtInstitutionHSC" runat="server" ValidationGroup="formAcademicInfo"   class="form-control" />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtInstitutionHSC"
                                ErrorMessage="Institution is required" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    
                    <div class="clearfix"></div>
                     </div>
                             <div class="row">
                                 <div class="col-md-3">
                        <label class="form-label" for="txtSeatNoHSC">Seat# <span style="color:red">*</span></label>
                        <input type="text" id="txtSeatNoHSC" runat="server" ValidationGroup="formAcademicInfo"   class="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtSeatNoHSC"
                                ErrorMessage="Seat# is required" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                   
                      <div class="col-md-3">
                         <label class="form-label" for="ddlExamTypeHSC">Exam Type<span style="color:red">*</span></label>
                        <asp:DropDownList ID="ddlExamTypeHSC" runat="server" ValidationGroup="formAcademicInfo"   class="form-control">
                              <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="Annual">Annual</asp:ListItem>
                                <asp:ListItem Value="Supplementary">Supplementary</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="ddlExamTypeHSC"
                                ErrorMessage="Exam type is required." InitialValue="-1" SetFocusOnError="True"
                                ValidationGroup="formAcademicInfo" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                                 
                     <div class="col-md-3">
                         <label class="form-label" for="txtFromYearHSC">Start Year<span style="color:red">*</span></label>
                         <input type="number" min="0" value="2020" id="txtFromYearHSC" runat="server" ValidationGroup="formAcademicInfo"   class="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtFromYearHSC"
                                ErrorMessage="Year from is required" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>                            
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtFromYearHSC"
                                Display="Dynamic" ErrorMessage="Only numbers are allowed" ValidationExpression="\d+"
                                ValidationGroup="formAcademicInfo"></asp:RegularExpressionValidator>
                            <%--<asp:CompareValidator ID="CompareValidator12" runat="server" ControlToValidate="txtFromYearHSC"
                                ControlToCompare="txtPassYearHSC" Operator="LessThan"
                                ErrorMessage="Start year can't be same or greater than the passing year." ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:CompareValidator>
                             <asp:CompareValidator ID="CompareValidator13" runat="server" ControlToValidate="txtFromYearHSC"
                                ValueToCompare="2023" Operator="LessThan"
                                ErrorMessage="Start year can't be same or greater than the current calender year." ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:CompareValidator>--%>
                    </div>
                      <div class="col-md-3">
                         <label class="form-label" for="txtPassYearHSC">Passing Year<span style="color:red">*</span></label>
                         <input type="number" min="0" value="2021" id="txtPassYearHSC" runat="server" ValidationGroup="formAcademicInfo"   class="form-control" />
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtPassYearHSC"
                                Display="Dynamic" ErrorMessage="Only numbers are allowed" ValidationExpression="\d+"
                                ValidationGroup="formAcademicInfo"></asp:RegularExpressionValidator>  
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtPassYearHSC"
                                ErrorMessage="Passing year is required" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator20"  Type="Integer" runat="server" ControlToValidate="txtPassYearHSC"
                                ControlToCompare="txtFromYearHSC" Operator="GreaterThan"
                                ErrorMessage="Passing year must be greater than Start year." ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:CompareValidator>
                             <asp:CompareValidator ID="CompareValidator19"  Type="Integer" runat="server" ControlToValidate="txtPassYearHSC"
                                ValueToCompare="2023" Operator="LessThanEqual"
                                ErrorMessage="Passing year can't exceed current year." ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:CompareValidator>

                    </div>
                    <div class="clearfix"></div>
                </div>
                         <div class="row">
                            <div class="col-md-3">
                                         <label class="form-label" for="txtObtainedMarksHSC">Obtained marks</label>
                            <input type="number" min="0" id="txtObtainedMarksHSC" ValidationGroup="formAcademicInfo" runat="server" class="form-control" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtObtainedMarksHSC"
                                Display="Dynamic" ErrorMessage="Only numbers are allowed" ValidationExpression="\d+"
                                ValidationGroup="formAcademicInfo"></asp:RegularExpressionValidator>
                           <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtObtainedMarksHSC"
                                ErrorMessage="Obtained marks is required field." ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>--%>
                             <%--<asp:CompareValidator ID="CompareValidator17" runat="server" ControlToValidate="txtObtainedMarksHSC" ControlToCompare="txtTotalMarksHSC"
                                ErrorMessage="Obtained marks can't exceed the total marks." Operator="LessThanEqual" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:CompareValidator>--%>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label" for="txtTotalMarksHSC">Total marks</label>
                        <input type="number" min="0" id="txtTotalMarksHSC" ValidationGroup="formAcademicInfo" runat="server" class="form-control" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="txtTotalMarksHSC"
                                Display="Dynamic" ErrorMessage="Only numbers are allowed" ValidationExpression="\d+"
                                ValidationGroup="formAcademicInfo"></asp:RegularExpressionValidator>
                         <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtTotalMarksHSC"
                                ErrorMessage="Total marks is required field." ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>--%>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" Type="Integer" ControlToValidate="txtTotalMarksHSC" ControlToCompare="txtObtainedMarksHSC"
                                ErrorMessage="Total marks can't be less than obtained marks." Operator="GreaterThanEqual" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:CompareValidator>
                        
                        
                    </div>
                                   <div class="col-md-3">
                          <label class="form-label" for="txtPercentageHSC">Percentage<span style="color:red">*</span> </label>
                         <input type="number" min="0" max="100" step="0.1" id="txtPercentageHSC" runat="server"   ValidationGroup="formAcademicInfo"  class="form-control" />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator55" runat="server" ControlToValidate="txtPercentageHSC"
                                ErrorMessage="Percentage is required" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>
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
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="ddlGradeHSC"
                                ErrorMessage="Grade is required." InitialValue="-1" SetFocusOnError="True"
                                ValidationGroup="formAcademicInfo" Display="Dynamic"></asp:RequiredFieldValidator>
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
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ControlToValidate="txtUniversityB14"
                                ErrorMessage="University is required" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                                <div class="col-md-4">
                         <label class="form-label" for="txtInstitutionB14">Institution <span style="color:red">*</span></label>
                         <input type="text" id="txtInstitutionB14" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="txtInstitutionB14"
                                ErrorMessage="Institution is required" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                                <div class="col-md-2">
                         <label class="form-label" for="txtProgramB14">Program/Dicipline <span style="color:red">*</span></label>
                         <input type="text" id="txtProgramB14" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ControlToValidate="txtProgramB14"
                                ErrorMessage="Program/Dicipline is required" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                                           <div class="col-md-3">
                         <label class="form-label" for="txtMajorsB14">Major Subjects<span style="color:red">*</span></label>
                         <input type="text" id="txtMajorsB14" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" ControlToValidate="txtMajorsB14"
                                ErrorMessage="Major subjects is required field." ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                                <div class="clearfix"></div>

                     </div>
                             <div class="row">
                                 <div class="col-md-3">
                        <label class="form-label" for="txtSeatNoB14">Seat# <span style="color:red">*</span></label>
                        <input type="text" id="txtSeatNoB14" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="txtSeatNoB14"
                                ErrorMessage="Seat# is required" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                                        <div class="col-md-3">
                         <label class="form-label" for="ddlExamTypeB14">Exam Type<span style="color:red">*</span></label>
                        <asp:DropDownList ID="ddlExamTypeB14" runat="server" ValidationGroup="formAcademicInfo"  class="form-control">
                              <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="Annual">Annual</asp:ListItem>
                                <asp:ListItem Value="Supplementary">Supplementary</asp:ListItem>
                            <asp:ListItem Value="Semester">Semester</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ControlToValidate="ddlExamTypeB14"
                                ErrorMessage="Exam type is required." InitialValue="-1" SetFocusOnError="True"
                                ValidationGroup="formAcademicInfo" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                                 <div class="col-md-3">
                         <label class="form-label" for="txtFromYearB14">Start Year<span style="color:red">*</span></label>
                         <input type="number" min="0" value="2020" id="txtFromYearB14" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ControlToValidate="txtFromYearB14"
                                ErrorMessage="Year from is required" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                      <div class="col-md-3">
                         <label class="form-label" for="txtPassYearB14">Passing Year<span style="color:red">*</span></label>
                         <input type="number" min="0" value="2021" id="txtPassYearB14" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ControlToValidate="txtPassYearB14"
                                ErrorMessage="Passing year is required" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                          <asp:CompareValidator ID="CompareValidator21"  Type="Integer" runat="server" ControlToValidate="txtPassYearB14"
                                ControlToCompare="txtFromYearB14" Operator="GreaterThan"
                                ErrorMessage="Passing year must be greater than the start year." ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:CompareValidator>
                          <asp:CompareValidator ID="CompareValidator22" Type="Integer" runat="server" ControlToValidate="txtPassYearB14"
                                ValueToCompare="2023" Operator="LessThanEqual"
                                ErrorMessage="Passing year can't be greater than current calender year." ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:CompareValidator>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="row">
                    
                    <div class="col-md-3">
                         <label class="form-label" for="txtObtainedMarksB14">Obtained marks</label>
                         <input type="number" min="0" id="txtObtainedMarksB14" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                    <div class="col-md-3">
                         <label class="form-label" for="txtTotalMarksB14">Total marks</label>
                         <input type="number" min="0" id="txtTotalMarksB14" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                        <asp:CompareValidator ID="CompareValidator16" runat="server" Type="Integer" ControlToValidate="txtTotalMarksB14" ControlToCompare="txtObtainedMarksB14"
                                ErrorMessage="Total marks can't be less than obtained marks." Operator="GreaterThanEqual" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:CompareValidator>
                    </div>
                                          <div class="col-md-3">
                          <label class="form-label" for="txtPercentageB14">Percentage<span style="color:red">*</span> </label>
                         <input type="number" min="0" max="100" step="0.1" id="txtPercentageB14" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator57" runat="server" ControlToValidate="txtPercentageB14"
                                ErrorMessage="Percentage is required" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                      <div class="col-md-3">
                         <label class="form-label" for="ddlGradeB14">Division<span style="color:red">*</span></label>
                        <asp:DropDownList ID="ddlGradeB14" runat="server" ValidationGroup="formAcademicInfo"  class="form-control">
                                    <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="1st Division">1st Division</asp:ListItem>
                                    <asp:ListItem Value="2nd Division">2nd Division</asp:ListItem>
                            <asp:ListItem Value="3rd Division">3rd Division</asp:ListItem>
                            <asp:ListItem Value="A-1">A-1</asp:ListItem>
                                <asp:ListItem Value="A">A</asp:ListItem>
                                <asp:ListItem Value="B">B</asp:ListItem>
                                <asp:ListItem Value="C">C</asp:ListItem>
                                <asp:ListItem Value="D">D</asp:ListItem>                                
                            <asp:ListItem Value="Other">Other</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" ControlToValidate="ddlGradeB14"
                                ErrorMessage="Division is required." InitialValue="-1" SetFocusOnError="True"
                                ValidationGroup="formAcademicInfo" Display="Dynamic"></asp:RequiredFieldValidator>
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
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ControlToValidate="txtUniversityB16"
                                ErrorMessage="University is required" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-4">
                         <label class="form-label" for="txtInstitutionB16">Institution <span style="color:red">*</span></label>
                         <input type="text" id="txtInstitutionB16" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="txtInstitutionB16"
                                ErrorMessage="Institution is required" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                                
                                           <div class="col-md-2">
                         <label class="form-label" for="txtProgramB16">Program/Dicipline <span style="color:red">*</span></label>
                         <input type="text" id="txtProgramB16" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" ControlToValidate="txtProgramB16"
                                ErrorMessage="Program/Dicipline is required" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                                     <div class="col-md-3">
                         <label class="form-label" for="txtMajorsB16">Major Subjects<span style="color:red">*</span></label>
                         <input type="text" id="txtMajorsB16" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" ControlToValidate="txtMajorsB16"
                                ErrorMessage="Major subjects is required field." ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>

                    <div class="clearfix"></div>
                     </div>
                             <div class="row">
                                 
                                  <div class="col-md-3">
                        <label class="form-label" for="txtSeatNoB16">Seat# <span style="color:red">*</span></label>
                        <input type="text" id="txtSeatNoB16" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="txtSeatNoB16"
                                ErrorMessage="Seat# is required" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                     <div class="col-md-3">
                         <label class="form-label" for="ddlExamTypeB16">Exam Type<span style="color:red">*</span></label>
                        <asp:DropDownList ID="ddlExamTypeB16" runat="server" ValidationGroup="formAcademicInfo"  class="form-control">
                              <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="Annual">Annual</asp:ListItem>
                                <asp:ListItem Value="Supplementary">Supplementary</asp:ListItem>
                            <asp:ListItem Value="Semester">Semester</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator43" runat="server" ControlToValidate="ddlExamTypeB16"
                                ErrorMessage="Exam type is required." InitialValue="-1" SetFocusOnError="True"
                                ValidationGroup="formAcademicInfo" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                                 <div class="col-md-3">
                         <label class="form-label" for="txtFromYearB16">Start Year<span style="color:red">*</span></label>
                         <input type="number" min="0" value="2020" id="txtFromYearB16" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator38" runat="server" ControlToValidate="txtFromYearB16"
                                ErrorMessage="Start year is required" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                            <%--<asp:CompareValidator ID="CompareValidator9" runat="server" ControlToValidate="txtFromYearB16"
                                ControlToCompare="txtPassYearB16" Operator="LessThanEqual"
                                ErrorMessage="Start year can't exceed Passing year." ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:CompareValidator>
                            <asp:CompareValidator ID="CompareValidator23" runat="server" ControlToValidate="txtFromYearB16"
                                ValueToCompare="2023" Operator="LessThan"
                                ErrorMessage="Start year can't be same or greater than the current calender year." ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:CompareValidator>--%>
                    </div>
                      <div class="col-md-3">
                         <label class="form-label" for="txtPassYearB16">Passing Year<span style="color:red">*</span></label>
                         <input type="number" min="0" value="2021" id="txtPassYearB16" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator39" runat="server" ControlToValidate="txtPassYearB16"
                                ErrorMessage="Passing year is required" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator24" Type="Integer" runat="server" ControlToValidate="txtPassYearB16"
                                ControlToCompare="txtFromYearB16" Operator="GreaterThan"
                                ErrorMessage="Passing year can't be less same or less than the start year." ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:CompareValidator>
                            <asp:CompareValidator ID="CompareValidator25" Type="Integer" runat="server" ControlToValidate="txtPassYearB16"
                                ValueToCompare="2023" Operator="LessThanEqual"
                                ErrorMessage="Passing year can't be greater than the current calender year." ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:CompareValidator>
                    </div>
                    <div class="clearfix"></div>
                    
                </div>
                         <div class="row">
                             <div class="col-md-2">
                         <label class="form-label" for="txtObtainedMarksB16">Obtained marks</label>
                         <input type="number" min="0" id="txtObtainedMarksB16" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator40" runat="server" ControlToValidate="txtObtainedMarksB16"
                                ErrorMessage="Obtained marks is required field." ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>--%>
                            <%--<asp:CompareValidator ID="CompareValidator10" runat="server" ControlToValidate="txtObtainedMarksB16" ControlToCompare="txtTotalMarksB16"
                                ErrorMessage="Obtained marks can't exceed total marks." Operator="LessThanEqual" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:CompareValidator>--%>
                    </div>
                    <div class="col-md-2">
                         <label class="form-label" for="txtTotalMarksB16">Total marks</label>
                         <input type="number" min="0" id="txtTotalMarksB16" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                         <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator41" runat="server" ControlToValidate="txtTotalMarksB16"
                                ErrorMessage="Total marks is required field." ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>--%>
                         <asp:CompareValidator ID="CompareValidator10" runat="server" ControlToValidate="txtTotalMarksB16" ControlToCompare="txtObtainedMarksB16"
                                ErrorMessage="Total marks can't be less than obtained marks." Type="Integer" Operator="GreaterThanEqual" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:CompareValidator>
                    </div>
                                          <div class="col-md-2">
                          <label class="form-label" for="txtPercentageB16">Percentage</label>
                         <input type="number" min="0" max="100" step="0.1" id="txtPercentageB16" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                         <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator58" runat="server" ControlToValidate="txtPercentageB16"
                                ErrorMessage="Percentage is required" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>--%>
                    </div>
                                             <div class="col-md-2">
                          <label class="form-label" for="txtCGPAB16">CGPA</label>
                         <input type="number" min="0" max="4" step="0.1" id="txtCGPAB16" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                         <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtCGPAB16"
                                ErrorMessage="CGPA is required" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>--%>
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
                            <asp:ListItem Value="Other">Other</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator42" runat="server" ControlToValidate="ddlGradeB16"
                                ErrorMessage="Division is required." InitialValue="-1" SetFocusOnError="True"
                                ValidationGroup="formAcademicInfo" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                             <div class="clearfix"></div>
                         </div>
                 
                         </div>
                      </div>
                <br />
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
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtUniversityM18"
                                ErrorMessage="University is required" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-4">
                         <label class="form-label" for="txtInstitutionM18">Institution <span style="color:red">*</span></label>
                         <input type="text" id="txtInstitutionM18" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator44" runat="server" ControlToValidate="txtInstitutionM18"
                                ErrorMessage="Institution is required" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                                
                                           <div class="col-md-2">
                         <label class="form-label" for="txtProgramM18">Program/Dicipline <span style="color:red">*</span></label>
                         <input type="text" id="txtProgramM18" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator45" runat="server" ControlToValidate="txtProgramM18"
                                ErrorMessage="Program/Dicipline is required" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                                     <div class="col-md-3">
                         <label class="form-label" for="txtMajorsM18">Major Subjects<span style="color:red">*</span></label>
                         <input type="text" id="txtMajorsM18" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator46" runat="server" ControlToValidate="txtMajorsM18"
                                ErrorMessage="Major subjects is required field." ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>

                    <div class="clearfix"></div>
                     </div>
                             <div class="row">
                                 
                                  <div class="col-md-3">
                        <label class="form-label" for="txtSeatNoM18">Seat# <span style="color:red">*</span></label>
                        <input type="text" id="txtSeatNoM18" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator47" runat="server" ControlToValidate="txtSeatNoM18"
                                ErrorMessage="Seat# is required" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                     <div class="col-md-3">
                         <label class="form-label" for="ddlExamTypeM18">Exam Type<span style="color:red">*</span></label>
                        <asp:DropDownList ID="ddlExamTypeM18" runat="server" ValidationGroup="formAcademicInfo"  class="form-control">
                              <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="Annual">Annual</asp:ListItem>
                                <asp:ListItem Value="Supplementary">Supplementary</asp:ListItem>
                            <asp:ListItem Value="Semester">Semester</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator48" runat="server" ControlToValidate="ddlExamTypeM18"
                                ErrorMessage="Exam type is required." InitialValue="-1" SetFocusOnError="True"
                                ValidationGroup="formAcademicInfo" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                                 <div class="col-md-3">
                         <label class="form-label" for="txtFromYearM18">Start Year<span style="color:red">*</span></label>
                         <input type="number" min="0" value="2020" id="txtFromYearM18" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator49" runat="server" ControlToValidate="txtFromYearM18"
                                ErrorMessage="Start year is required" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                         <%--   <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtFromYearM18"
                                ControlToCompare="txtPassYearM18" Operator="LessThanEqual"
                                ErrorMessage="Start year can't exceed Passing year." ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:CompareValidator>
                            <asp:CompareValidator ID="CompareValidator26" runat="server" ControlToValidate="txtFromYearM18"
                                ToCompare="2023" Operator="LessThan"
                                ErrorMessage="Start year can't be same or greater than the current calender year." ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:CompareValidator>--%>
                    </div>
                      <div class="col-md-3">
                         <label class="form-label" for="txtPassYearM18">Passing Year<span style="color:red">*</span></label>
                         <input type="number" min="0" value="2021" id="txtPassYearM18" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator50" runat="server" ControlToValidate="txtPassYearM18"
                                ErrorMessage="Passing year is required" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator27" Type="Integer" runat="server" ControlToValidate="txtPassYearM18"
                                ControlToCompare="txtFromYearM18" Operator="GreaterThan"
                                ErrorMessage="Passing year can't be same or less than the start year." ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:CompareValidator>
                            <asp:CompareValidator ID="CompareValidator28" Type="Integer" runat="server" ControlToValidate="txtPassYearM18"
                                ValueToCompare="2023" Operator="LessThanEqual"
                                ErrorMessage="Passing year can't be greater than the current calender year." ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:CompareValidator>
                    </div>
                    <div class="clearfix"></div>
                    
                </div>
                         <div class="row">
                             <div class="col-md-2">
                         <label class="form-label" for="txtObtainedMarksM18">Obtained marks</label>
                         <input type="number" min="0" id="txtObtainedMarksM18" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator51" runat="server" ControlToValidate="txtObtainedMarksM18"
                                ErrorMessage="Obtained marks is required field." ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>--%>
                        <%--    <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="txtObtainedMarksM18" 
                                ControlToCompare="txtTotalMarksM18" ErrorMessage="Obtained marks can't exceed total marks." 
                                Operator="LessThanEqual" ValidationGroup="formAcademicInf" Display="Dynamic"></asp:CompareValidator>--%>
                    </div>
                    <div class="col-md-2">
                         <label class="form-label" for="txtTotalMarksM18">Total marks</label>
                         <input type="number" min="0" id="txtTotalMarksM18" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                       <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator52" runat="server" ControlToValidate="txtTotalMarksM18" 
                             ErrorMessage="Total marks is required field." ValidationGroup="formAcademicInfo" 
                             Display="Dynamic"></asp:RequiredFieldValidator>--%>
                        <asp:CompareValidator ID="CompareValidator29" runat="server" ControlToValidate="txtTotalMarksM18" 
                                ControlToCompare="txtObtainedMarksM18" Type="Integer" ErrorMessage="Total marks can't be less than the obtained marks." 
                                Operator="GreaterThanEqual" ValidationGroup="formAcademicInf" Display="Dynamic"></asp:CompareValidator>
                    </div>
                                          <div class="col-md-2">
                          <label class="form-label" for="txtPercentageM18">Percentage</label>
                         <input type="number" min="0" max="100" step="0.1" id="txtPercentageM18" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                         <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator58" runat="server" ControlToValidate="txtPercentageB16"
                                ErrorMessage="Percentage is required" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>--%>
                    </div>
                                             <div class="col-md-2">
                          <label class="form-label" for="txtCGPAM18">CGPA</label>
                         <input type="number" min="0" max="4" step="0.1" id="txtCGPAM18" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                         <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtCGPAB16"
                                ErrorMessage="CGPA is required" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>--%>
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
                            <asp:ListItem Value="Other">Other</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator53" runat="server" ControlToValidate="ddlGradeM18"
                                ErrorMessage="Division is required." InitialValue="-1" SetFocusOnError="True"
                                ValidationGroup="formAcademicInfo" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                             <div class="clearfix"></div>
                         </div>
                 
                         </div>
                      </div>
                <br />
                <hr />
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
                         <input type="date" id="txtNTSDate" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                         <input type="text" id="txtNTSDateLocked" visible="false" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
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
                         <input type="number" min="0" id="txtNTSObtainedMarks" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                    </div>
                    <div class="col-md-4">
                         <label class="form-label" for="txtNTSTotalMarks">Max Score</label>
                         <input type="number" min="0" id="txtNTSTotalMarks" runat="server" ValidationGroup="formAcademicInfo"  class="form-control" />
                         <asp:CompareValidator ID="CompareValidator6" runat="server" ControlToValidate="txtNTSTotalMarks" ControlToCompare="txtNTSObtainedMarks"
                                ErrorMessage="Total marks can't be less than obtained marks." Type="Integer" Operator="GreaterThanEqual" ValidationGroup="formAcademicInfo"
                                Display="Dynamic"></asp:CompareValidator>
                    </div>
                    
                </div>
                     </div>
                    </div>
                <br />
                <br />
                 <div class="row">
                    <div class="col-md-2">
                        <asp:Button ID="btnSave" runat="server" ValidationGroup="formAcademicInfo" CssClass="btn btn-primary btn-block" OnClick="btnSave_Click" Text="Save and Next" />
                    </div>
                </div>
                <br />
            </form>
            </div>
<%--        <div class="col-md-3" style="border-left:1px solid black;">
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