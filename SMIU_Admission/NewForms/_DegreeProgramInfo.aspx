<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="_DegreeProgramInfo.aspx.cs" Inherits="SMIU_Admission.NewForms._DegreeProgramInfo" MasterPageFile="~/MasterPages/PortalMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentScreen" runat="Server">
 <asp:Panel ID="Panel1" runat="server" CssClass="error" Visible="false"><asp:Label ID="Label1" runat="server"></asp:Label></asp:Panel>
       <div class="row">
        <div class="col-md-10" style="text-align:center;">
            <h4>Degree Program Information</h4>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <asp:Label ID="lblError" ForeColor="Red" runat="server"></asp:Label>
                <asp:Label ID="lblSuccess" ForeColor="Green" runat="server"></asp:Label>
        </div>
    </div>
    <br />
    <br />
    <div class="row" runat="server" id="divDegreeProgramInfo">
        <div class="col-md-12">
            <form runat="server" id="formDegreeProgram">
                    <asp:ScriptManager runat="server"></asp:ScriptManager>
                  <div class="row">
                    <div class="col-md-12">
                    <label class="form-label" for="ddlDegreeProgram">Select Degree Program<span style="color:red">*</span></label>
                    <asp:DropDownList ID="ddlDegreeProgram" AutoPostBack="true" OnSelectedIndexChanged="ddlDegreeProgram_SelectedIndexChanged" runat="server" ValidationGroup="formDegreeProgram"  class="form-control">
                        <asp:ListItem Text="-- Select --" Value="-1" />
                        <asp:ListItem Text="Undergraduate" Value="2" />
                        <asp:ListItem Text="Graduate" Value="1" />
                        <asp:ListItem Text="Postgraduate" Value="3" />
                    </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlDegreeProgram"
                            ErrorMessage="Degree Program required." InitialValue="-1" ValidationGroup="formDegreeProgram"
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>  
                  </div>
                  <div class="clearfix"></div>
                </div>
                <br />
                <br />
                <div class="row">
                    <div class="col-md-6">
                        <label class="form-label" for="ddlFirstChoice">1st Choice<span style="color:red">*</span></label>
                        <asp:DropDownList ID="ddlFirstChoice" AutoPostBack="true" OnSelectedIndexChanged="ddlFirstChoice_SelectedIndexChanged" runat="server" ValidationGroup="formDegreeProgram"  class="form-control">
                        </asp:DropDownList>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlFirstChoice"
                            ErrorMessage="First choice is required." InitialValue="-1" ValidationGroup="formDegreeProgram"
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>  
                    </div>
                    <div class="col-md-6">
                        <label class="form-label" for="ddlSecondChoice">2nd Choice<span id="lblReq2" runat="server" style="color:red">*</span></label>
                        <asp:DropDownList ID="ddlSecondChoice" AutoPostBack="true" OnSelectedIndexChanged="ddlSecondChoice_SelectedIndexChanged" runat="server" ValidationGroup="formDegreeProgram"  class="form-control">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="req2" runat="server" ControlToValidate="ddlSecondChoice"
                            ErrorMessage="Second choice is required." InitialValue="-1" ValidationGroup="formDegreeProgram"
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>  
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label class="form-label" for="ddlThirdChoice">3rd Choice<span id="lblReq3" runat="server" style="color:red">*</span></label>
                        <asp:DropDownList ID="ddlThirdChoice" AutoPostBack="true" OnSelectedIndexChanged="ddlThirdChoice_SelectedIndexChanged" runat="server" ValidationGroup="formDegreeProgram"  class="form-control">
                        </asp:DropDownList>
                     <%--   <asp:RequiredFieldValidator ID="req3" runat="server" ControlToValidate="ddlThirdChoice"
                            ErrorMessage="Third choice is required." InitialValue="-1" ValidationGroup="formDegreeProgram"
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>  --%>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label" for="ddlFourthChoice">4th Choice</label>
                        <asp:DropDownList ID="ddlFourthChoice" AutoPostBack="true" OnSelectedIndexChanged="ddlFourthChoice_SelectedIndexChanged" runat="server" ValidationGroup="formDegreeProgram"  class="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label class="form-label" for="ddlFifthChoice">5th Choice</label>
                        <asp:DropDownList ID="ddlFifthChoice" AutoPostBack="true" OnSelectedIndexChanged="ddlFifthChoice_SelectedIndexChanged" runat="server" ValidationGroup="formDegreeProgram"  class="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label" for="ddlSixthChoice">6th Choice</label>
                        <asp:DropDownList ID="ddlSixthChoice" AutoPostBack="true" OnSelectedIndexChanged="ddlSixthChoice_SelectedIndexChanged" runat="server" ValidationGroup="formDegreeProgram"  class="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label class="form-label" for="ddlSeventhChoice">7th Choice</label>
                        <asp:DropDownList ID="ddlSeventhChoice" AutoPostBack="true" OnSelectedIndexChanged="ddlSeventhChoice_SelectedIndexChanged" runat="server" ValidationGroup="formDegreeProgram"  class="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label" for="ddlEighthChoice">8th Choice</label>
                        <asp:DropDownList ID="ddlEighthChoice" AutoPostBack="true" OnSelectedIndexChanged="ddlEighthChoice_SelectedIndexChanged" runat="server" ValidationGroup="formDegreeProgram"  class="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="clearfix"></div>
                </div>
                 <div class="row" style="display:none;">
                    <div class="col-md-6">
                        <label class="form-label" for="ddlNinthChoice">9th Choice</label>
                        <asp:DropDownList ID="ddlNinthChoice" AutoPostBack="true" OnSelectedIndexChanged="ddlNinthChoice_SelectedIndexChanged" runat="server" ValidationGroup="formDegreeProgram"  class="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label" for="ddlTenthChoice">10th Choice</label>
                        <asp:DropDownList ID="ddlTenthChoice" AutoPostBack="true" OnSelectedIndexChanged="ddlTenthChoice_SelectedIndexChanged" runat="server" ValidationGroup="formDegreeProgram"  class="form-control">
                        </asp:DropDownList>
                    </div>
                     <div class="clearfix"></div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-12">
                        <label class="form-label" for="chkSelfFinance">Are you the first person in your immediate family to attend university?</label>
                        <asp:RadioButton ID="rdYes" Text="Yes" runat="server" GroupName="Attend" CssClass="form-control" />
                        <asp:RadioButton ID="rdNo" Text="No" runat="server" GroupName="Attend" CssClass="form-control" />
                    </div>
                    <div class="clearfix"></div>
                </div>
                <br />
                <div id="divUndergraduateFacility" runat="server" visible="false">
                <div class="row">
                    <div class="col-md-12">
                        <label class="form-label" for="chkSelfFinance">Check the box if you are intrested in Self Finance Scheme.</label>
                        <asp:CheckBox ID="chkSelfFinance" Text="Self Finance Scheme" runat="server" CssClass="form-control" />
                    </div>
                    <div class="clearfix"></div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <label class="form-label" for="chkTransport">Check the box if you are interested to avail SMI University Transport facility.</label>
                        <asp:CheckBox ID="chkTransport" AutoPostBack="true" OnCheckedChanged="chkTransport_CheckedChanged" Text="Transport Facility" runat="server" CssClass="form-control" />
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="row"  id="divSpecifyLoc" runat="server" visible="false">
                    <div class="col-md-12">
                        <label class="form-label" for="txtTransport">Specify your pickup location.</label>
                        <asp:TextBox ID="txtTransport" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="clearfix"></div>
                </div>
                    </div>
                <br />
                <br />
                <div class="row">
                    <div class="col-md-2">
                        <asp:Button ID="btnSave" runat="server" ValidationGroup="formDegreeProgram" CssClass="btn btn-primary btn-block" OnClick="btnSave_Click" Text="Save and Next" />
                    </div>
                </div>
                </form>
        </div>
<%--        <div class="col-md-3">
            <div class="row">
                <div class="col-md-12" style="text-align:center;">
                    <h4>Instructions</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
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

