<%@ Page Title="Course Organizer" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Start page.aspx.cs" Inherits="Student_Schedule.Start_page" %>

<%@ MasterType VirtualPath="~/MasterPage.Master" %>

<asp:Content ID="mainStartPageContent" ContentPlaceHolderID="mainPlaceHolder" runat="server">

    <nav id="navbarBack" class="navbar navbar-default">
        <div class="container-fluid">
            <ul id="navbarLinks" class="nav navbar-nav navbar-right">
                <li><a class="navbarLinks" href="Start page.aspx">Add Course</a></li>
                <li><a class="navbarLinks" href="EntryForm.aspx">Add Assignment</a></li>
                <li><a class="navbarLinks" href="Schedule.aspx">View Schedule</a></li>
            </ul>
        </div>
    </nav>

    <%--course name button--%>
    <div class="form-group">
        <div class=" col-md-offset-1 col-md-3 text-right">
            <asp:Label ID="lblChooseCourse" runat="server" Text="Course List:"
                Font-Names="Times New Roman" Font-Size="16pt"
                CssClass="control-label" Font-Bold="True"></asp:Label>
        </div>
        <div class="col-md-4">
            <asp:DropDownList ID="ddlCourseSelector" runat="server"
                CssClass="dropdown" Font-Bold="False" Font-Names="Times New Roman"
                Width="100%" DataSourceID="ddlNewestDataSource"
                DataTextField="CourseName" DataValueField="CourseName">
            </asp:DropDownList>
            <div class="col-md-3"></div>
            <br />
            <br />
        </div>
    </div>
    <%-- add course row--%>
    <div class="form-group">
        <div class="col-md-4 text-right">
            <asp:Label ID="lblAddCourse" runat="server"
                Text="Enter a New Course:" CssClass="control-label"
                Font-Names="Times New Roman" Font-Size="16pt"
                Font-Bold="True"></asp:Label>
        </div>
        <div class="col-md-4">
            <asp:TextBox ID="txtNewCourseEntry" runat="server"
                CssClass="form-control" Font-Names="Times New Roman"
                Font-Size="16pt"></asp:TextBox>
        </div>
        <div class="col-md-3">
            <asp:Button ID="btnAddNewCourse" runat="server"
                Text="Add Course" OnClick="addButton_Click"
                CssClass="btn-primary btn-lg" Width="200px"
                Font-Bold="True" BackColor="#999999"
                BorderColor="Black" ForeColor="Black" />

        </div>
    </div>
    <br />
    <%--  remove course row--%>
    <div class="form-group">
        <div class="col-md-4 text-right">
            <asp:Label ID="lblRemove" runat="server"
                Text="Enter Course to be Removed: "
                CssClass="control-label" Font-Names="Times New Roman"
                Font-Size="16pt" Font-Bold="True"></asp:Label>
        </div>
        <div class="col-md-4">
            <asp:TextBox ID="txtRemoveEntry" runat="server"
                CssClass="form-control" Font-Names="Times New Roman"
                Font-Size="16pt"></asp:TextBox>
        </div>
        <div class="col-md-3">
            <asp:Button ID="btnRemove" runat="server"
                CssClass="btn-secondary btn-lg" Text="Remove Course"
                OnClick="btnRemove_Click" Width="200px"
                Font-Bold="True" BackColor="#999999" BorderColor="Black" F
                oreColor="Black" ForeColor="Black" />
        </div>
    </div>
    <div class="form-group">
        <div class="col-md-12 text-center errorLabel">
            <asp:Label ID="lblError" CssClass="errorLabel" runat="server" Text=""></asp:Label>
        </div>
    </div>
    <br />


    <%-- add new assignment button--%>
    <div class="form-group">
        <div class="col-sm-6 text-center">
            <asp:Button ID="btnNewTask" runat="server"
                OnClick="btnNewTask_Click" Text="Add Assignment"
                CssClass="btn-primary btn-lg" BackColor="#999999"
                BorderColor="Black" ForeColor="Black" Font-Bold="True" Width="200px" />
        </div>
        <%--view schedule button--%>
        <div class="col-sm-6 text-center">
            <asp:Button ID="btnSchedule" runat="server"
                OnClick="btnSchedule_Click" Text="View Schedule"
                CssClass="btn-info btn-lg" BackColor="#999999"
                BorderColor="Black" ForeColor="Black" Font-Bold="True" Width="200px" />
        </div>
    </div>
    <%--old database model--%>
    <asp:SqlDataSource ID="ddlNewestDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Courses] WHERE [CourseName] = @CourseName" InsertCommand="INSERT INTO [Courses] ([CourseName], [CourseNumber]) VALUES (@CourseName, @CourseNumber)" SelectCommand="SELECT * FROM [Courses]" UpdateCommand="UPDATE [Courses] SET [CourseNumber] = @CourseNumber WHERE [CourseName] = @CourseName">
        <DeleteParameters>
            <asp:Parameter Name="CourseName" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CourseName" Type="String" />
            <asp:Parameter Name="CourseNumber" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CourseNumber" Type="String" />
            <asp:Parameter Name="CourseName" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
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
