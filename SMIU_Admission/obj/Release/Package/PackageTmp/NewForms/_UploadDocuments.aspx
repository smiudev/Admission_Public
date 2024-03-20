<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="_UploadDocuments.aspx.cs" Inherits="SMIU_Admission.NewForms._UploadDocuments" MasterPageFile="~/MasterPages/PortalMaster.master" %>

<asp:Content ID="cDashboard" ContentPlaceHolderID="contentScreen" runat="Server">
 <asp:Panel ID="pnlMsg" runat="server" CssClass="error" Visible="false"><asp:Label ID="lblPanel" runat="server"></asp:Label></asp:Panel>

        <div class="row">
            <div class="col-md-10" style="text-align:center;">
                <h4>Upload Documents</h4>
            </div>
            <div class="col-md-2" style="text-align:center;"></div>
            <div class="clearfix"></div>
         </div>
        <br />
        <div class="row">
            <div class="col-md-10">
                <span>Upload all the required documents one by one. choose a relevant document and click its upload button. Once all the documents are uploaded click "Submit Documents" button at the bottom to complete document upload process. </span>
            </div>
            <div class="col-md-2"></div>
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
    <div class="row" runat="server" id="divDocuments">
        <div class="col-md-12">
             <form runat="server" id="formDocumentsInfo">
                    <asp:ScriptManager runat="server"></asp:ScriptManager>
                  <div class="row">
                     <div class="col-md-1">
                         <%--<span><strong>SNO.</strong></span>--%>
                    </div>
                     <div class="col-md-3">
                        <label class="form-label"><strong>DESCRIPTION</strong></label>
                    </div>
                    <div class="col-md-2">
                       <label class="form-label"><strong>IMAGE PREVIEW</strong></label>
                    </div>
                      <div class="col-md-4">
                        <label class="form-label"><strong>UPLOAD</strong></label>
                    </div>
                   
                    
                    <div class="col-md-2">
                       <label class="form-label"><strong>STATUS</strong></label>
                    </div>
                    <div class="clearfix"></div>
                </div>
                 <br />
                    <div class="row" id="divFeeVoucher" runat="server">
                    <div class="col-md-1">
                        <%--<span><strong>1.</strong></span>--%>
                    </div>
                    <div class="col-md-3">
                        
                        <label class="form-label">Fee Voucher / Challan</label>
                    </div>
                    <div class="col-md-2" style="padding-bottom:10px;">
                       <asp:HyperLink ID="imgFeeVoucher" Target="_blank" runat="server" NavigateUrl="../Content/Theme/images/noImage.jpg" ImageUrl="../Content/Theme/images/noImage.jpg" ImageHeight="65" ImageWidth="80"></asp:HyperLink>
                    </div>
                    <div class="col-md-4">
                        <asp:FileUpload runat="server" ID="uploadFeeVoucher"  CssClass="form-control form-control-sm" Font-Size="X-Small" />
                        <div style="float:right;">
                        <asp:Button runat="server" ID="btnFeeVoucher" OnClick="btnFeeVoucher_Click" Text="Upload" CssClass="btn btn-sm btn-primary" Font-Size="X-Small"/>
                        </div>
                    </div>
                    
                    
                    <div class="col-md-2">
                       <label class="form-label" id="lblFeeVoucherNotUpl" runat="server"><i style="color:red;" class="bx bx-message-x"></i> Not Uploaded</label>
                       <label class="form-label" id="lblFeeVoucherUpl" runat="server" visible="false"><i style="color:green" class="bx bx-message-check"></i> Uploaded</label>
                       
                    </div>
                    
                    <div class="clearfix"></div>
                </div>
                    <div class="row" id="divCNICF" runat="server">
                    <div class="col-md-1">
                        <%--<span><strong>2.</strong></span>--%>
                    </div>
                    <div class="col-md-3">
                        
                        <label class="form-label">CNIC / FormB</label>
                    </div>
                    <div class="col-md-2" style="padding-bottom:10px;">
                       <asp:HyperLink ID="imgCNIC" Target="_blank" runat="server" NavigateUrl="../Content/Theme/images/noImage.jpg" ImageUrl="../Content/Theme/images/noImage.jpg" ImageHeight="65" ImageWidth="80"></asp:HyperLink>
                    </div>
                    <div class="col-md-4">
                        <asp:FileUpload runat="server" ID="uploadCNIC" CssClass="form-control form-control-sm" Font-Size="X-Small" />
                        <div style="float:right;">
                        <asp:Button runat="server" ID="btnCNIC" Text="Upload" OnClick="btnCNIC_Click" CssClass="btn btn-sm btn-primary" Font-Size="X-Small"/>
                        </div>
                    </div>
                    
                    <div class="col-md-2">
                       <label class="form-label" id="lblCNICNotUpl" runat="server"><i style="color:red;" class="bx bx-message-x"></i> Not Uploaded</label>
                       <label class="form-label" id="lblCNICUpl" runat="server" visible="false"><i style="color:green" class="bx bx-message-check"></i> Uploaded</label>
                       
                    </div>
                    
                    <div class="clearfix"></div>
                </div>
                    <div class="row" id="divSSC" runat="server">
                    <div class="col-md-1">
                        <%--<span><strong>3.</strong></span>--%>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">SSC Marksheet</label>
                    </div>
                    <div class="col-md-2" style="padding-bottom:10px;">
                       <asp:HyperLink ID="imgSSC" Target="_blank" runat="server" NavigateUrl="../Content/Theme/images/noImage.jpg" ImageUrl="../Content/Theme/images/noImage.jpg" ImageHeight="65" ImageWidth="80"></asp:HyperLink>
                    </div>
                    <div class="col-md-4">
                        <asp:FileUpload runat="server" ID="uploadSSC" CssClass="form-control form-control-sm" Font-Size="X-Small" />
                        <div style="float:right;">
                        <asp:Button runat="server" ID="btnSSC" Text="Upload" OnClick="btnSSC_Click" CssClass="btn btn-sm btn-primary" Font-Size="X-Small"/>
                        </div>
                    </div>
                    <div class="col-md-2">
                       <label class="form-label" id="lblSSCNotUpl" runat="server"><i style="color:red;" class="bx bx-message-x"></i> Not Uploaded</label>
                       <label class="form-label" id="lblSSCUpl" runat="server" visible="false"><i style="color:green" class="bx bx-message-check"></i> Uploaded</label>
                       
                    </div>
                    
                    <div class="clearfix"></div>
                </div>
                    <div class="row" id="divHSC" runat="server">
                    <div class="col-md-1">
                        <%--<span><strong>4.</strong></span>--%>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">HSC Marksheet</label>
                    </div>
                    <div class="col-md-2" style="padding-bottom:10px;">
                       <asp:HyperLink ID="imgHSC" Target="_blank" runat="server" NavigateUrl="../Content/Theme/images/noImage.jpg" ImageUrl="../Content/Theme/images/noImage.jpg" ImageHeight="65" ImageWidth="80"></asp:HyperLink>
                    </div>
                    <div class="col-md-4">
                        <asp:FileUpload runat="server" ID="uploadHSC" CssClass="form-control form-control-sm" Font-Size="X-Small" />
                        <div style="float:right;">
                        <asp:Button runat="server" ID="btnHSC" Text="Upload" OnClick="btnHSC_Click" CssClass="btn btn-sm btn-primary" Font-Size="X-Small"/>
                        </div>
                    </div>
                    <div class="col-md-2">
                       <label class="form-label" id="lblHSCNotUpl" runat="server"><i style="color:red;" class="bx bx-message-x"></i> Not Uploaded</label>
                       <label class="form-label" id="lblHSCUpl" runat="server" visible="false"><i style="color:green" class="bx bx-message-check"></i> Uploaded</label>
                       
                    </div>
                    
                    <div class="clearfix"></div>
                </div>
                    <div class="row" id="divLastTranscript" runat="server">
                    <div class="col-md-1">
                        <%--<span><strong>4.</strong></span>--%>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Last Qualification Transcript</label>
                    </div>
                    <div class="col-md-2" style="padding-bottom:10px;">
                       <asp:HyperLink ID="imgTranscript" Target="_blank" runat="server" NavigateUrl="../Content/Theme/images/noImage.jpg" ImageUrl="../Content/Theme/images/noImage.jpg" ImageHeight="65" ImageWidth="80"></asp:HyperLink>
                    </div>
                    <div class="col-md-4">
                        <asp:FileUpload runat="server" ID="uploadTranscript" CssClass="form-control form-control-sm" Font-Size="X-Small" />
                        <div style="float:right;">
                        <asp:Button runat="server" ID="btnTranscript" Text="Upload" OnClick="btnTranscript_Click" CssClass="btn btn-sm btn-primary" Font-Size="X-Small"/>
                        </div>
                    </div>
                    <div class="col-md-2">
                       <label class="form-label" id="lblTranscriptNotUpl" runat="server"><i style="color:red;" class="bx bx-message-x"></i> Not Uploaded</label>
                       <label class="form-label" id="lblTranscriptUpl" runat="server" visible="false"><i style="color:green" class="bx bx-message-check"></i> Uploaded</label>
                    </div>
                    <div class="clearfix"></div>
                </div>
                 <br />
                 <br />
                 <div class="row">
                     <div class="col-md-12">
                         <asp:Button ID="btnSubmitDocs" ValidationGroup="formDocumentInfo" runat="server" Text="Submit Documents" CssClass="btn btn-primary" OnClick="btnSubmitDocs_Click"/>
                         <br />
                         <label id="lblNote" runat="server" class="form-label"><strong style="color:red">Note: </strong> Make sure that documents being submitted are correct. Documents once submitted can not be changed.</label>
                     </div>
                 </div>
                </form>
        </div>
    <%--    <div class="col-md-3" style="border-left:1px solid black;">
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