<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgot.aspx.cs" Inherits="SMIU_Admission.Forgot" %>
<html5>
<head>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.0/mdb.min.css" rel="stylesheet"/>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.0/mdb.min.js"></script>

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
</head>
<body>    
<div style="background-image:url('Images/Bg1.jpg'); background-size:contain;">
<section class="vh-100">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-xl-10">
        <div class="card" style="border-radius: 1rem;">
          <div class="row g-0">
            <div class="col-md-6 col-lg-5 d-none d-md-block">
              <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/img1.webp"
                alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
            </div>
            <div class="col-md-6 col-lg-7 d-flex align-items-center">
              <div class="card-body p-4 p-lg-5 text-black">

                <form runat="server">

                  <div class="d-flex align-items-center mb-3 pb-1">
                    <img src="Images/logo2.png" style="width:120px; height:100px;" />
                    <%--<i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>--%>
                    <span style="margin-left:15px; margin-top:15px;" class="h3 fw-bold mb-0"> Admissions Spring 2024</span>
                  </div>

                  <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Sign into your account</h5>

                  <div class="form-outline mb-4">
                    <input type="email" runat="server" id="txtEmail" class="form-control form-control-lg" required="required" />
                    <label class="form-label" for="txtEmail">Email address</label>
                  </div>

                  <div class="pt-1 mb-4">
                    <asp:Button ID="btnSendPassword" Text="Login" runat="server" CssClass="btn btn-dark btn-lg btn-block" OnClick="btnSendPassword_Click" />
                  </div>
                  <a class="small text-muted" href="#!">Back to Login</a>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</div>
</body>
</html5>