<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="_GuardianInfo.aspx.cs" Inherits="SMIU_Admission.NewForms._GuardianInfo" MasterPageFile="~/MasterPages/PortalMaster.master" %>

<asp:Content ID="cDashboard" ContentPlaceHolderID="contentScreen" runat="Server">
 <asp:Panel ID="pnlMsg" runat="server" CssClass="error" Visible="false"><asp:Label ID="lblPanel" runat="server"></asp:Label></asp:Panel>

        <div class="row">
            <div class="col-md-10" style="text-align:center;">
                <span><h4>Guardian/Sponsor Information</h4></span>
            </div>
            <div class="col-md-2" style="text-align:center;"></div>
            <div class="clearfix"></div>
         </div>
            <br />
           <div class="row">
            <div class="col-md-12">
                <asp:Label ID="lblError" ForeColor="Red" runat="server"></asp:Label>
                <asp:Label ID="lblSuccess" ForeColor="Green" runat="server"></asp:Label>
         </div>
               <div class="clearfix"></div>
        </div>
     <br />
    <div class="row" runat="server" id="divGuardianInfo">
        <div class="col-md-12">
             <form runat="server" id="formGuardianInfo">
                    <asp:ScriptManager runat="server"></asp:ScriptManager>
                  <div class="row">
                    <div class="col-md-4">
                        <label class="form-label" for="txtGuardName">Guardian/Sponsor Name<span style="color:red">*</span></label>
                        <input type="text" runat="server" class="form-control" id="txtGuardName" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtGuardName"
                            ErrorMessage="Guardian/Sponsor name is required." ValidationGroup="formGuardianInfo"
                            Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label" for="txtGuardOccu">Occupation</label>
                        <input type="text" runat="server" class="form-control" id="txtGuardOccu" />
                    </div>
                      <div class="col-md-4">
                        <label class="form-label" for="ddlGuardJobNature">Job Nature</label>
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
                      <label class="form-label" for="txtGuardRelation">Relationship with Applicant<span style="color:red">*</span></label>
                      <input type="text" runat="server" class="form-control" id="txtGuardRelation" />
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtGuardRelation"
                            ErrorMessage="Relationship is required." ValidationGroup="formGuardianInfo"
                            Display="Dynamic"></asp:RequiredFieldValidator>

                    </div>                    
                    <div class="col-md-4">
                        <label class="form-label" for="txtGuardIncome">Monthly Income</label>
                        <input type="number" min="0" runat="server" class="form-control" id="txtGuardIncome" />
                    </div>
                    <div class="col-md-4">
                       <label class="form-label" for="txtGuardMobileNo">Mobile#<span style="color:red">*</span></label>
                       <input type="text"  class="form-control" placeholder="format: 03123456789" ID="txtGuardMobileNo" runat="server" />
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtGuardMobileNo"
                            ErrorMessage="Mobile# is required." ValidationGroup="formGuardianInfo"
                            Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegExptxtLandLineNumber" runat="server" ErrorMessage="Mobile# format is incorrect."
                                ControlToValidate="txtGuardMobileNo" ValidationGroup="formGuardianInfo" Display="Static" ValidationExpression="^\d{11}$"
                                ValidChars="0123456789"></asp:RegularExpressionValidator>
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
                <hr />
                <div class="row">
                    <div class="col-md-12" style="text-align:center;">
                        <h4>Emergency Contact Information</h4>
                    </div>
                </div>
                <br />
                  <div class="row">
                    <div class="col-md-4">
                        <label class="form-label" for="txtEmrgName">Emergency Name<span style="color:red">*</span></label>
                        <input type="text" runat="server" class="form-control" id="txtEmrgName" required="required" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmrgName"
                            ErrorMessage="Emergency contact name is required." ValidationGroup="formGuardianInfo"
                            Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-4">
                              <label class="form-label" for="txtEmrgRelation">Relationship with Applicant<span style="color:red">*</span></label>
                            <input type="text"  class="form-control" ID="txtEmrgRelation" runat="server" ValidationGroup="formGuardianInfo" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmrgRelation"
                                ErrorMessage="Relationship is required." ValidationGroup="formGuardianInfo"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-4">
                          <label class="form-label" for="txtEmrgMobileNo">Mobile#<span style="color:red">*</span></label>
                       <input type="text"  class="form-control" placeholder="format: 03123456789" ID="txtEmrgMobileNo" runat="server" ValidationGroup="formGuardianInfo" />
                            <asp:RequiredFieldValidator ID="ReqFldMobileNo" runat="server" ControlToValidate="txtEmrgMobileNo"
                                ErrorMessage="Mobile# is required." ValidationGroup="formGuardianInfo"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Mobile# format is not valid."
                                ControlToValidate="txtEmrgMobileNo" Display="Static" ValidationExpression="^\d{11}$"
                                ValidChars="0123456789" ValidationGroup="formGuardianInfo"></asp:RegularExpressionValidator>
                    </div>
                    <div class="clearfix"></div>
                </div>
                  <div class="row">
                    <div class="col-md-12">
                              <label class="form-label" for="txtEmrgAddress">Complete Address<span style="color:red">*
                                                                                             </span></label>
                            <input type="text"  class="form-control" ID="txtEmrgAddress" runat="server" ValidationGroup="formGuardianInfo" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmrgAddress"
                                ErrorMessage="Address is required." ValidationGroup="formGuardianInfo"></asp:RequiredFieldValidator>
                    </div>
                    <div class="clearfix"></div>
                  </div>
                <br />
                <div class="row">
                    <div class="col-md-2">
                        <asp:Button ID="btnSave" runat="server" ValidationGroup="formGuardianInfo" CssClass="btn btn-primary btn-block" OnClick="btnSave_Click" Text="Save and Next" />
                    </div>
                </div>
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