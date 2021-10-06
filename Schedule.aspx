<%@ Page Title="Course Schedule" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Schedule.aspx.cs" Inherits="Student_Schedule.Schedule" %>

<%@ MasterType VirtualPath="~/MasterPage.Master" %>



<asp:Content ID="scheduleContent" ContentPlaceHolderID="mainPlaceHolder" runat="server">
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

    <div class="form-group">
        <div class="col-md-2 text-right">
            <asp:Label ID="lblSchCourseName" runat="server" Font-Size="X-Large"
                Text=" Select Course" Font-Names="Georgia"></asp:Label>
        </div>
        <div class="col-md-4">
            <asp:DropDownList ID="ddlCourseSelection" runat="server" CssClass="form-control" DataSourceID="ddlNewDataSource" DataTextField="CourseName" DataValueField="CourseName" AutoPostBack="True" OnSelectedIndexChanged="ddlCourseSelection_SelectedIndexChanged" Font-Bold="False" Font-Size="Larger" ForeColor="Black"></asp:DropDownList>
        </div>
    </div>
    <div id="gridStyles" class="col-sm-12 table-responsive">
        <asp:GridView ID="gvAssignments" runat="server" AutoGenerateColumns="False"
            DataSourceID="NewAssignmentDataSource"
            CssClass="table table-striped table-bordered"
            OnPreRender="gvAssignments_PreRender" AllowPaging="True"
            AllowSorting="True" BackColor="White" BorderColor="#999999"
            BorderStyle="Solid" BorderWidth="1px" CellPadding="3" GridLines="Vertical"
            ForeColor="Black" DataKeyNames="Assignments" ShowFooter="True" OnRowDataBound="gvAssignments_RowDataBound">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="Assignments" HeaderText="Assignments"
                    SortExpression="Assignments" ReadOnly="True">
                    <ItemStyle CssClass="col-md-3" />
                </asp:BoundField>
                <asp:BoundField DataField="Notes" HeaderText="Notes"
                    SortExpression="Notes">
                    <ItemStyle CssClass="col-md-3" />
                </asp:BoundField>
                <asp:BoundField DataField="DueDate" HeaderText="Due Date"
                    DataFormatString="{0:MM/dd/yyyy}" SortExpression="DueDate">
                    <ItemStyle CssClass="col-md-1" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Point Value" SortExpression="PointValue">
                    <ItemTemplate>
                        <asp:Label ID="lblPointValueAmount" runat="server" Text='<%# Bind("PointValue") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="lblPointValueTotal"
                            CssClass="col-md-2 text-right" runat="server" Text="&nbsp;&nbsp;&nbsp;Total:"></asp:Label>
                    </FooterTemplate>
                    <HeaderStyle CssClass="text-center" Font-Size="Small" />
                    <ItemStyle CssClass="col-md-1 text-center" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Time To Comp" SortExpression="TimeToComp">
                    <ItemTemplate>
                        <asp:Label ID="lblTimeToCompAmount" runat="server" 
                            Text='<%# Bind("TimeToComp") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="lblTimeToCompTotal"
                            CssClass="col-md-2 text-right" runat="server"></asp:Label>
                    </FooterTemplate>
                    <HeaderStyle CssClass="text-center" Font-Size="Smaller" />
                    <ItemStyle CssClass="col-md-1 text-center" />
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True">
                    <ItemStyle CssClass="col-md-1" />
                </asp:CommandField>
            </Columns>
            <FooterStyle BackColor="#999999" />
            <HeaderStyle BackColor="#999999" Font-Bold="True" ForeColor="Black" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />

        </asp:GridView>
    </div>
    <%--buttons--%>
    <div class="form-group scheduleButtons">
        <div class="col-sm-3">
        </div>
        <div class="col-sm-3">
        </div>
        <div class="col-sm-3">
            <asp:Button ID="btnAddNew2" runat="server" OnClick="btnAddNew2_Click" Text="Add Assignment" CssClass="btn-primary btn-lg" Width="200px" BackColor="#999999" BorderColor="Black" Font-Bold="True" ForeColor="Black" />
        </div>
        <div class="col-sm-3">
            <asp:Button ID="btnMainMenu2" runat="server" OnClick="btnMainMenu2_Click" Text="Add Course" CssClass="btn-primary btn-lg" Width="200px" BackColor="#999999" BorderColor="Black" Font-Bold="True" ForeColor="Black" />
        </div>
    </div>
    <br />
    <asp:SqlDataSource ID="ddlNewDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Courses]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="NewAssignmentDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Assignments] WHERE ([CourseName] = @CourseName)" DeleteCommand="DELETE FROM [Assignments] WHERE [Assignments] = @Assignments" InsertCommand="INSERT INTO [Assignments] ([CourseName], [Assignments], [Notes], [DueDate], [PointValue], [TimeToComp]) VALUES (@CourseName, @Assignments, @Notes, @DueDate, @PointValue, @TimeToComp)" UpdateCommand="UPDATE [Assignments] SET [CourseNumber] = @CourseNumber, [CourseName] = @CourseName, [Notes] = @Notes, [DueDate] = @DueDate, [PointValue] = @PointValue, [TimeToComp] = @TimeToComp WHERE [Assignments] = @Assignments">
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
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCourseSelection" Name="CourseName" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
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
    <br />

</asp:Content>
