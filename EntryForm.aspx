<%@ Page Title="Assignment Entry Form" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EntryForm.aspx.cs" Inherits="Student_Schedule.EntryForm" %>
<%@ MasterType VirtualPath="~/MasterPage.Master" %>

<asp:Content ID="entryFormPlaceHolder" ContentPlaceHolderID="mainPlaceHolder" runat="server">
    <%--  Page Nav Bar--%>
    <nav id="navbarBack" class="navbar navbar-default">
        <div class="container-fluid">
            <ul id="navbarLinks" class="nav navbar-nav navbar-right">
                <li><a class="navbarLinks" href="Start page.aspx">Add Course</a></li>
                <li><a class="navbarLinks" href="EntryForm.aspx">Add Assignment</a></li>
                <li><a class="navbarLinks" href="Schedule.aspx">View Schedule</a></li>
            </ul>
        </div>
    </nav>
    <%--page header--%>
    <div class="form-group">
        <div class="col-sm-12 text-center pageHeader">
            <asp:Label ID="lblEntryFormHeader" runat="server" 
                Text="Assignment Entry Form" ></asp:Label>
        </div>
    </div>
    <%--assignment chooser using drop down list--%>
    <div class="form-group">
        <div class="col-sm-3 text-right">
            <asp:Label ID="lblCourseSelection" runat="server" 
                Text="Select Course: " CssClass="control-label" 
                Font-Bold="True" Font-Names="Eras Demi ITC" Font-Size="14pt"></asp:Label>
        </div>
        <div class="col-sm-3">
            <asp:DropDownList ID="ddlCourseSelection" runat="server" 
                CssClass="form-control" DataSourceID="ddlNewDataSource" 
                DataTextField="CourseName" DataValueField="CourseName" 
                OnSelectedIndexChanged="ddlCourseSelection_SelectedIndexChanged" 
                AutoPostBack="True" AppendDataBoundItems="True">
                <asp:ListItem Text="----------" Selected="True"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="col-sm-3 errorLabel">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                runat="server" ErrorMessage="Please Choose A Course!" 
                ControlToValidate="ddlCourseSelection" InitialValue="----------"></asp:RequiredFieldValidator>
        </div>
    </div>
    <%--Assignment name entry row--%>
    <div class="form-group">
        <div class="col-sm-3 text-right">
            <asp:Label ID="lblCourseName" runat="server" 
                Text="Course:" CssClass="control-label" Font-Bold="True" 
                Font-Names="Eras Demi ITC" Font-Size="14pt"></asp:Label>
        </div>
        <div class="col-sm-3">
            <asp:TextBox ID="txtCourseName" runat="server" 
                CssClass="form-control" ReadOnly="True"></asp:TextBox>
        </div>
    </div>
    <%--Assignment name entry row--%>
    <div class="form-group">
        <div class="col-sm-3 text-right">
            <asp:Label ID="lblAssignment" runat="server" 
                Text="Assignment:" CssClass="control-label" Font-Bold="True" 
                Font-Names="Eras Demi ITC" Font-Size="14pt"></asp:Label>
        </div>
        <div class="col-sm-9">
            <asp:TextBox ID="txtAssignment" runat="server" 
                CssClass="form-control"></asp:TextBox>
        </div>
    </div>
    <%--Notes entry row--%>
    <div class="form-group">
        <div class="col-sm-3 text-right">
            <asp:Label ID="lblNotes" runat="server" 
                Text="Notes:" CssClass="control-label" Font-Bold="True" 
                Font-Names="Eras Demi ITC" Font-Size="14pt"></asp:Label>
        </div>
        <div class="col-sm-9">
            <asp:TextBox ID="txtNotes" runat="server" 
                CssClass="form-control"></asp:TextBox>
        </div>
    </div>
    <%--Due date entry row--%>
    <div class="form-group">
        <div class="col-sm-3 text-right">
            <asp:Label ID="lblDueDate" runat="server"
                Text="Due Date:" CssClass="control-label"
                Font-Bold="True" Font-Names="Eras Demi ITC"
                Font-Size="14pt"></asp:Label>
        </div>
        <div class="col-sm-2">
            <asp:TextBox ID="txtDueDate" runat="server"
                CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-3 errorLabel">
            <asp:RegularExpressionValidator ID="dateValidator" runat="server" 
                ControlToValidate="txtDueDate" Visible="False" 
                ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" ErrorMessage="mm/dd/yyyy">
            </asp:RegularExpressionValidator>
        </div>
    </div>
    <%--Estimated time entry row--%>
    <div class="form-group">
        <div class="col-sm-3 text-right">
            <asp:Label ID="lblTimeToComp" runat="server"
                Text="Time to Complete (Hours):" CssClass="control-label"
                Font-Bold="True" Font-Names="Eras Demi ITC" Font-Size="14pt"></asp:Label>
        </div>
        <div class="col-sm-2">
            <asp:TextBox ID="txtTimeToComp" runat="server"
                CssClass="form-control" Text="0"></asp:TextBox>
        </div>
        <div class="col-sm-4 errorLabel">
            <asp:CompareValidator ID="timeToCompValidator" runat="server"
                ErrorMessage="Enter any amount greater that 0!" Type="Double"
                Operator="GreaterThanEqual" ControlToValidate="txtTimeToComp"
                ValueToCompare="0"></asp:CompareValidator>
        </div>
    </div>
    <%--Point value entry row--%>
    <div class="form-group">
        <div class="col-sm-3 text-right">
            <asp:Label ID="lblPointValue" runat="server" 
                Text="Point Value:" CssClass="control-label" 
                Font-Bold="True" Font-Names="Eras Demi ITC" Font-Size="14pt"></asp:Label>
        </div>
        <div class="col-sm-2">
            <asp:TextBox ID="txtPointValue" runat="server" 
                CssClass="form-control" Text="0"></asp:TextBox>
        </div>
        <div class="col-sm-4 errorLabel">
            <asp:CompareValidator ID="pointValueValidator" runat="server"
                ErrorMessage="Enter any amount greater that 0!" Type="Double"
                Operator="GreaterThanEqual" ControlToValidate="txtPointValue"
                ValueToCompare="0"></asp:CompareValidator>
        </div>
    </div>
   

    <%--First row of buttons--%>
    <div class="form-group">
        <div class ="col-md-7 text-right errorLabel">
            <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
        </div>
        <div class="col-md-offset-1 col-md-4 text-right">
            <asp:Button ID="btnAddAssignment" runat="server" 
                Text="Add Assignment to Course Schedule" 
                CssClass="btn-primary btn-lg" OnClick="btnAddAssignment_Click" BackColor="#999999" BorderColor="Black" Font-Bold="True" ForeColor="Black" />
        </div>
    
    </div>
    <br />
    <%--2nd row of buttons--%>
    <div class="form-group">
        <div class="col-sm-2">
            <asp:Button ID="btnViewSchedule" runat="server"
                Text="View Schedule" OnClick="btnViewSchedule_Click"
                CssClass="btn-primary btn-lg" BackColor="#999999" 
                BorderColor="Black" Font-Bold="True" ForeColor="Black" CausesValidation="False" />
        </div>
        <div class="col-sm-2">
            <asp:Button ID="btnAddCourse" runat="server"
                Text="Add Course" 
                CssClass="btn-primary btn-lg" BackColor="#999999" 
                BorderColor="Black" Font-Bold="True" ForeColor="Black" OnClick="btnAddCourse_Click" CausesValidation="False" />
        </div>

        <div class="col-md-offset-5 col-sm-3">
            <asp:Button ID="btnReset" runat="server"
                Text="Clear Entry Form" OnClick="btnReset_Click"
                CssClass="btn-danger btn-lg " BackColor="#999999" 
                BorderColor="Black" Font-Bold="True" ForeColor="Black" />
        </div>
    </div>
    <%--old data base model--%>
    <asp:SqlDataSource ID="ddlNewDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="DELETE FROM [Courses] WHERE [CourseName] = @CourseName" InsertCommand="INSERT INTO [Courses] ([CourseName], [CourseNumber]) VALUES (@CourseName, @CourseNumber)" SelectCommand="SELECT * FROM [Courses]" UpdateCommand="UPDATE [Courses] SET [CourseNumber] = @CourseNumber WHERE [CourseName] = @CourseName">
        <DeleteParameters>
            <asp:Parameter Name="CourseName" Type="String"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CourseName" Type="String"></asp:Parameter>
            <asp:Parameter Name="CourseNumber" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CourseNumber" Type="String"></asp:Parameter>
            <asp:Parameter Name="CourseName" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>

    <br />
    <asp:SqlDataSource ID="NewAssignmentDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Assignments] WHERE [Assignments] = @Assignments" InsertCommand="INSERT INTO [Assignments] ([CourseName], [Assignments], [Notes], [DueDate], [PointValue], [TimeToComp]) VALUES (@CourseName, @Assignments, @Notes, @DueDate, @PointValue, @TimeToComp)" SelectCommand="SELECT * FROM [Assignments]" UpdateCommand="UPDATE [Assignments] SET [CourseNumber] = @CourseNumber, [CourseName] = @CourseName, [Notes] = @Notes, [DueDate] = @DueDate, [PointValue] = @PointValue, [TimeToComp] = @TimeToComp WHERE [Assignments] = @Assignments">
        <DeleteParameters>
            <asp:Parameter Name="Assignments" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CourseName" Type="String" />
            <asp:Parameter Name="Assignments" Type="String" />
            <asp:Parameter Name="Notes" Type="String" />
            <asp:Parameter Name="DueDate" Type="DateTime" />
            <asp:Parameter Name="PointValue" Type="Decimal" />
            <asp:Parameter Name="TimeToComp" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CourseNumber" Type="Int32" />
            <asp:Parameter Name="CourseName" Type="String" />
            <asp:Parameter Name="Notes" Type="String" />
            <asp:Parameter Name="DueDate" Type="DateTime" />
            <asp:Parameter Name="PointValue" Type="Decimal" />
            <asp:Parameter Name="TimeToComp" Type="Decimal" />
            <asp:Parameter Name="Assignments" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    
</asp:Content>


