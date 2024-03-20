<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EntryTestInterviewMarks.aspx.cs"
    Inherits="SMIU_Admission.Modules.Forms.EntryTestInterviewMarks" MaintainScrollPositionOnPostback="false"
    ValidateRequest="false" MasterPageFile="~/MasterPages/FrontPage.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Add Entry Test Interview Marks
    </h1>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphbody">
    <style>
        th
        {
            text-align: left;
        }
        .style1
        {
            width: 123px;
        }
    </style>
    <table>
        <tr>
            <td class="menu_list" style="width: 163px">
                Semester<span style="color: Red">*</span>
            </td>
            <td colspan="2">
                <asp:DropDownList ID="ddlSemester" runat="server" ValidationGroup="EntryTestMarks"
                    Width="200px">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvddlSemester" runat="server" ControlToValidate="ddlSemester"
                    ErrorMessage="Please Select Semester" InitialValue="-1" ValidationGroup="EntryTestInterviewMarks"
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="menu_list" style="width: 163px">
                Reference/Tracking ID <span style="color: Red">*</span>
                <br />
                <span style="color: Red">(last 5 digit only)</span>
            </td>
            <td>
                <asp:TextBox ID="txtReferenceID" runat="server" ToolTip="Reference/Tracking ID" Width="130px"
                    MaxLength="5" ValidationGroup="EntryTestInterviewMarks" autocomplete="off"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ReqFieldValtxtReferenceID" runat="server" ControlToValidate="txtReferenceID"
                    ErrorMessage="Please Enter Reference ID " ValidationGroup="EntryTestInterviewMarks"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegExpValtxtReferenceID" runat="server" ErrorMessage="Please enter only digits"
                    ControlToValidate="txtReferenceID" Display="Dynamic" ValidationExpression="^[0-9]*$"
                    ValidChars="0123456789" ValidationGroup="EntryTestInterviewMarks"></asp:RegularExpressionValidator>
                <cc1:FilteredTextBoxExtender ID="FlttxtExttxtReferenceID" runat="server" TargetControlID="txtReferenceID"
                    FilterMode="ValidChars" FilterType="Numbers" ValidChars="0123456789">
                </cc1:FilteredTextBoxExtender>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;<asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn" OnClick="btnSearch_Click"
                    ValidationGroup="EntryTestInterviewMarks" />
            </td>
        </tr>
    </table>
    <br />
    <div id="Studentdetails" runat="server" visible="false">
        <fieldset>
            <legend>Student Information</legend>
            <br />
            <asp:DetailsView ID="dtlPersonalInfo" runat="server" AutoGenerateRows="false">
                <Fields>
                    <asp:TemplateField HeaderText="Photo">
                        <ItemTemplate>
                            <asp:Image ImageUrl='<%# Eval("ImagePath") %>' runat="server" Height="102px" Width="77px"
                                CssClass="imageStyle" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Name" DataField="StudentName" ConvertEmptyStringToNull="true"
                        NullDisplayText="-" ItemStyle-Font-Bold="true" />
                    <asp:BoundField HeaderText="Father's Name" DataField="FathersName" ConvertEmptyStringToNull="true"
                        NullDisplayText="-" ItemStyle-Font-Bold="true" />
                    <asp:BoundField HeaderText="Father's Occupation" DataField="FathersOccupation" ConvertEmptyStringToNull="true"
                        NullDisplayText="-" ItemStyle-Font-Bold="true" />
                    <asp:BoundField HeaderText="Date Of Birth" DataField="DateofBirth" ConvertEmptyStringToNull="true"
                        NullDisplayText="-" ItemStyle-Font-Bold="true" DataFormatString="{0:MMM dd, yyyy}" />
                    <asp:BoundField HeaderText="Postal Address" DataField="PostalAddress" ConvertEmptyStringToNull="true"
                        NullDisplayText="-" ItemStyle-Font-Bold="true" />
                    <asp:BoundField HeaderText="Permanent Address" DataField="PermanentAddress" ConvertEmptyStringToNull="true"
                        NullDisplayText="-" ItemStyle-Font-Bold="true" />
                    <asp:BoundField HeaderText="First Choice" DataField="FirstChoice" ConvertEmptyStringToNull="true"
                        NullDisplayText="-" ItemStyle-Font-Bold="true" />
                    <asp:BoundField HeaderText="Second Choice" DataField="SecondChoice" ConvertEmptyStringToNull="true"
                        NullDisplayText="-" ItemStyle-Font-Bold="true" />
                    <asp:BoundField HeaderText="Third Choice" DataField="ThirdChoice" ConvertEmptyStringToNull="true"
                        NullDisplayText="-" ItemStyle-Font-Bold="true" />
                </Fields>
            </asp:DetailsView>
        </fieldset>
        <br />
        <fieldset>
            <legend>Previous Acadmic Record </legend>
            <br />
            <table>
                <tr>
                    <th colspan="9" style="text-align: left;">
                        Secondary School Certificate (SSC) / O-Level
                    </th>
                </tr>
                <tr>
                    <td>
                        Degree
                    </td>
                    <td>
                        Seat Number
                    </td>
                    <td>
                        Board
                    </td>
                    <td>
                        Group
                    </td>
                    <td>
                        Passing Year
                    </td>
                    <td>
                        Marks Obtained
                    </td>
                    <td>
                        Total Marks
                    </td>
                    <td>
                        Percentage
                    </td>
                    <td>
                        Grade
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblMDegreeLevel" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblMSeatNumber" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblMInstitution" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblMGroup" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblMyear" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblMarksObtainedM" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblMTotalMarks" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblMPercentage" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblMGrade" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th colspan="9" style="text-align: left;">
                        Higher School Certificate (HSC) / A-Level
                    </th>
                </tr>
                <tr>
                    <td>
                        Degree
                    </td>
                    <td>
                        Seat Number
                    </td>
                    <td>
                        Board
                    </td>
                    <td>
                        Group
                    </td>
                    <td>
                        Passing Year
                    </td>
                    <td>
                        Marks Obtained
                    </td>
                    <td>
                        Total Marks
                    </td>
                    <td>
                        Percentage
                    </td>
                    <td>
                        Grade
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblIDegreeLevel" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblISeatNumber" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblInstitution" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblIGroup" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblIyear" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblMarksObtainedI" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblITotalMarks" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblIPercentage" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblIgrade" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <table id="UgradDegree" runat="server" visible="false">
                <tr>
                    <th colspan="9" style="text-align: left;">
                        Bachelor's Degree Program
                    </th>
                </tr>
                <tr>
                    <td>
                        Seat Number
                    </td>
                    <td>
                        Passing Year
                    </td>
                    <td>
                        University
                    </td>
                    <td>
                        Program
                    </td>
                    <td>
                        Marks Obtained
                    </td>
                    <td>
                        Total Marks
                    </td>
                    <td>
                        Percentage
                    </td>
                    <td>
                        Grade/ Division
                    </td>
                    <td>
                        CGPA
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUgradSeatNumber" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblUgradyear" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblUgradInstitution" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblUgradProgram" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblMarksUgradbtained" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblUgradTotalMarks" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblUgradPercentage" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lbllUgradDivision" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblCGPAUgrad" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <table id="gradDegree" runat="server" visible="false">
                <tr>
                    <th colspan="9" style="text-align: left;">
                        Master's Degree Program
                    </th>
                </tr>
                <tr>
                    <td>
                        Seat Number
                    </td>
                    <td>
                        Passing Year
                    </td>
                    <td>
                        University
                    </td>
                    <td>
                        Program<br />
                    </td>
                    <td>
                        Marks Obtained
                    </td>
                    <td>
                        Total Marks
                    </td>
                    <td>
                        Percentage
                    </td>
                    <td>
                        Grade/ Division
                    </td>
                    <td>
                        CGPA
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblgradSeatNumber" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblgradyear" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblgradInstitution" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblgradProgram" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblMarksgradbtained" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblgradTotalMarks" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblgradPercentage" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblgradDivision" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblCGPAgrad" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <table id="OtherDegree" runat="server" visible="false">
                <tr>
                    <th colspan="9" style="text-align: left;">
                        Other's Degree Program / Diploma / Certificate
                    </th>
                </tr>
                <tr>
                    <td>
                        Program
                    </td>
                    <td>
                        Seat Number
                    </td>
                    <td>
                        Board /University
                    </td>
                    <td>
                        Passing Year
                    </td>
                    <td>
                        Marks Obtained
                    </td>
                    <td>
                        Total Marks
                    </td>
                    <td>
                        Percentage
                    </td>
                    <td>
                        Grade /Division
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbloProgram" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblOSeatNumber" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblOInstitution" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblOyea" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblMarksObtainedO" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblOTotalMarks" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblOPercentage" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblOGradeDivision" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </fieldset>
        <br />
        <table id="tblFirstInterviewMarks" runat="server" visible="false">
            <tr>
                <th colspan="9" style="text-align: left;">
                    First Interview Details
                </th>
            </tr>
            <tr>
                <td class="style1">
                    Interview Marks
                </td>
                <td>
                    <asp:Label ID="lblInterviewMarks" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Program Shift
                </td>
                <td>
                    <asp:Label ID="lblProgramShift" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Remarks
                </td>
                <td>
                    <asp:Label ID="lblRemarks" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <fieldset id="FirstInterviewDetails" runat="server" visible="false">
            <legend>Add Interview Marks</legend>
            <br />
            <table>
                <tr>
                    <td class="style1">
                        Interview Marks <span style="color: Red">*</span>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEntryTestInterviewMarks" runat="server" ValidationGroup="InterviewMarks"
                            MaxLength="2" Width="70px" autocomplete="off"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqdFieldValtxtEntryTestInterviewMarks" runat="server"
                            ControlToValidate="txtEntryTestInterviewMarks" ErrorMessage="Please Enter Interview Marks "
                            ValidationGroup="InterviewMarks" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="rvtxtScore" ControlToValidate="txtEntryTestInterviewMarks"
                            Display="Dynamic" MinimumValue="0" MaximumValue="10" SetFocusOnError="true" Type="Integer"
                            runat="server" ErrorMessage="Inerview marks can't be greater than 10">
                        </asp:RangeValidator>
                        <asp:RegularExpressionValidator ID="RegExpMcqstxtTestInterviewMarks" runat="server"
                            ErrorMessage="Please enter only digits" ForeColor="Red" ControlToValidate="txtEntryTestInterviewMarks"
                            Display="Dynamic" ValidationExpression="\d+" ValidChars="0123456789" ValidationGroup="InterviewMarks"></asp:RegularExpressionValidator>
                        <cc1:FilteredTextBoxExtender ID="FilteredtxtMcqsTestInterviewMarks" runat="server"
                            TargetControlID="txtEntryTestInterviewMarks" FilterMode="ValidChars" FilterType="Numbers"
                            ValidChars="0123456789">
                        </cc1:FilteredTextBoxExtender>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Program Shift
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlProgramShift" runat="server" ValidationGroup="InterviewMarks"
                            Width="200px">
                            <asp:ListItem Value="-1">--Select--</asp:ListItem>
                            <asp:ListItem Value="Morning">Morning</asp:ListItem>
                            <asp:ListItem Value="Evening">Evening </asp:ListItem>
                            <asp:ListItem Value="Weekend">Weekend </asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="ReqFidValddlProgramShift" runat="server" ControlToValidate="ddlProgramShift"
                            ErrorMessage="Please Select Program Shift" InitialValue="-1" ValidationGroup="InterviewMarks"
                            Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        Remarks (if any)
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" Width="900px" Height="80px" />
                        <cc1:FilteredTextBoxExtender ID="FltEtxtRemarks" runat="server" TargetControlID="txtRemarks"
                            FilterMode="ValidChars" FilterType="UppercaseLetters,lowercaseLetters,Numbers,Custom"
                            ValidChars=" .,:;/*-=_+?'`|}{[]\)(^%$#@!~&quot;&amp;">
                        </cc1:FilteredTextBoxExtender>
                        <%-- <asp:RequiredFieldValidator ID="ReqFtxtRemarks" runat="server" ControlToValidate="txtRemarks"
                            ErrorMessage="Please Enter Remarks " ValidationGroup="InterviewMarks" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                    </td>
                </tr>
            </table>
        </fieldset>
        <fieldset id="secondPanelInterview" runat="server" visible="false">
            <legend>Second Interview Remarks</legend>
            <br />
            <table>
                <tr>
                    <td class="style1">
                        Second Option
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlSecondOption" runat="server" ValidationGroup="InterviewMarks"
                            Width="200px">
                            <asp:ListItem Value="-1">--Select--</asp:ListItem>
                            <asp:ListItem Value="Morning">Morning</asp:ListItem>
                            <asp:ListItem Value="Evening">Evening </asp:ListItem>
                            <asp:ListItem Value="Weekend">Weekend </asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        Department
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlDepartment" runat="server" ValidationGroup="InterviewMarks"
                            Width="200px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Status<span style="color: Red">*</span>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlSecondStatus" runat="server" ValidationGroup="InterviewMarks"
                            Width="200px">
                            <asp:ListItem Value="-1">--Select--</asp:ListItem>
                            <asp:ListItem Value="Approved">Approved</asp:ListItem>
                            <asp:ListItem Value="Evening"> Disapproved </asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="ReqFldValddlSecondStatus" runat="server" ControlToValidate="ddlSecondStatus"
                            ErrorMessage="Please Select Status" InitialValue="-1" ValidationGroup="InterviewMarks"
                            Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        Remarks (if any)
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:TextBox ID="txtSecondRemarks" runat="server" TextMode="MultiLine" Width="900px"
                            Height="80px" />
                        <cc1:FilteredTextBoxExtender ID="FltEtxtSecoondRemarks" runat="server" TargetControlID="txtRemarks"
                            FilterMode="ValidChars" FilterType="UppercaseLetters,lowercaseLetters,Numbers,Custom"
                            ValidChars=" .,:;/*-=_+?'`|}{[]\)(^%$#@!~&quot;&amp;">
                        </cc1:FilteredTextBoxExtender>
                    </td>
                </tr>
            </table>
        </fieldset>
        <table>
            <tr>
                <td colspan="2">
                    &nbsp;<asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn" OnClick="btnSubmit_Click"
                        ValidationGroup="InterviewMarks" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
