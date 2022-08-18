<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3>
        <asp:Label ID="Label1" runat="server" Text="Insert a new contact" Font-Bold="True" Font-Size="Larger"></asp:Label>
    </h3>
    <p>
        <asp:Label ID="NameLabel" runat="server" Text="Name"></asp:Label>
        <br />
        <asp:TextBox ID="NameTextBox" runat="server" Width="263px"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="PhoneNumberLabel" runat="server" Text="Phone Number"></asp:Label>
        <br />
        <asp:TextBox ID="PhoneNumberTextBox" runat="server" Width="263px"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="EmailLabel" runat="server" Text="Email"></asp:Label>
        <br />
        <asp:TextBox ID="EmailTextBox" runat="server" TextMode="Email" Width="263px"></asp:TextBox>
        <p>
            <asp:Button ID="AddButton" runat="server" Text="Add" Width="269px" Font-Bold="True" Font-Size="Large" OnClick="AddButton_Click" />
        </p>
    <h3>&nbsp;Contact list</h3>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" CellPadding="6" DataSourceID="SqlDataSourceContact" ForeColor="#333333" GridLines="None" Width="472px" AutoGenerateColumns="False" CellSpacing="1" DataKeyNames="Id">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" DeleteText="Delete" ShowEditButton="True" EditText="Edit" ShowSelectButton="True" SelectText="Select" CancelText="Cancel" UpdateText="Save"/>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceContact" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        DeleteCommand="DELETE FROM [Contact] WHERE [Id] = @Id"
        InsertCommand="INSERT INTO [Contact] ([Name], [Email], [PhoneNumber]) VALUES (@Name, @Email, @PhoneNumber)"
        SelectCommand="SELECT [Id], [Name], [Email], [PhoneNumber] FROM [Contact]"
        UpdateCommand="UPDATE [Contact] SET [Name] = @Name, [Email] = @Email, [PhoneNumber] = @PhoneNumber WHERE [Id] = @Id" OnInserted="Contact_ExceptionHandle" OnUpdated="Contact_ExceptionHandle">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="PhoneNumber" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="PhoneNumber" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:Label ID="lMsg" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
    <br />
</asp:Content>

