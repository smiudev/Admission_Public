<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GridviewHeader.aspx.cs"
    Inherits="SMIU_Admission.GridviewHeader" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <th colspan="11">
                            Online Submission
                        </th>
                        <th colspan="10">
                            Submission
                        </th>
                        <tr>
                            <th>
                            </th>
                            <th>
                            </th>
                            <th colspan="3">
                                Morning
                            </th>
                            <th colspan="3">
                                Evening
                            </th>
                            <th colspan="3">
                                Weekend
                            </th>
                            <th rowspan="2">
                                Total
                            </th>
                            <th colspan="3">
                                Morning
                            </th>
                            <th colspan="3">
                                Evening
                            </th>
                            <th colspan="3">
                                Weekend
                            </th>
                            <th rowspan="2">
                                Total
                            </th>
                        </tr>
                        <tr>
                            <th>
                            </th>
                            <th>
                                Program Name
                            </th>
                            <th>
                                Male
                            </th>
                            <th>
                                Female
                            </th>
                            <th>
                                Total
                            </th>
                            <th>
                                Male
                            </th>
                            <th>
                                Female
                            </th>
                            <th>
                                Total
                            </th>
                            <th>
                                Male
                            </th>
                            <th>
                                Female
                            </th>
                            <th>
                                Total
                            </th>
                            <th>
                                Male
                            </th>
                            <th>
                                Female
                            </th>
                            <th>
                                Total
                            </th>
                            <th>
                                Male
                            </th>
                            <th>
                                Female
                            </th>
                            <th>
                                Total
                            </th>
                            <th>
                                Male
                            </th>
                            <th>
                                Female
                            </th>
                            <th>
                                Total
                            </th>
                            <th>
                            </th>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <td>
                            <%# Eval("ProgramGroup")%>
                        </td>
                        <td>
                            <%# Eval("MorningMaleCount")%>
                        </td>
                        <td>
                            <%# Eval("MorningFemaleCount")%>
                        </td>
                        <td>
                            <%# Eval("TotalMorning")%>
                        </td>
                        <td>
                            <%# Eval("EveningMaleCount")%>
                        </td>
                        <td>
                            <%# Eval("EveningFemaleCount")%>
                        </td>
                        <td>
                            <%# Eval("TotalEvening")%>
                        </td>
                        <td>
                            <%# Eval("WeekendMaleCount")%>
                        </td>
                        <td>
                            <%# Eval("WeekendFemaleCount")%>
                        </td>
                        <td>
                            <%# Eval("TotalWeekend")%>
                        </td>
                        <td>
                            <%# Eval("total")%>
                        </td>
                        <td>
                            <%# Eval("MorningGenderMalePayment")%>
                        </td>
                        <td>
                            <%# Eval("MorningGenderFemalePayment")%>
                        </td>
                        <td>
                            <%# Eval("MorningGenderTotalPayment")%>
                        </td>
                        <td>
                            <%# Eval("EveningGenderMalePayment")%>
                        </td>
                        <td>
                            <%# Eval("EveningGenderFemalePayment")%>
                        </td>
                        <td>
                            <%# Eval("EveningGenderTotalPayment")%>
                        </td>
                        <td>
                            <%# Eval("WeekendGenderMalePayment")%>
                        </td>
                        <td>
                            <%# Eval("WeekendGenderFemalePayment")%>
                        </td>
                        <td>
                            <%# Eval("WeekendGenderTotalPayment")%>
                        </td>
                        <td>
                            <%# Eval("TotalPayment")%>
                        </td>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
      
    </div>
    </form>
</body>
</html>
