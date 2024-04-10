<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="quantri.aspx.cs" Inherits="BookStoreDB.quantri" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>Trang quản trị</h1>
    <div class="row">
        <div class="col-md-6">
            <div class="form-inline">
                Nhập tên sách muốn tìm:<asp:TextBox ID="txtTen" runat="server"  CssClass="m-3" Width="549px"></asp:TextBox>
                <asp:Button ID="btnTimSach" runat="server" Text="Tìm sách" CssClass="btn btn-success" Width="171px" />
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-inline">
                <a href="themsach.aspx" class="btn btn-primary">Thêm sách mới</a>
            </div>
        </div>
    </div>
    <asp:GridView ID="gvsach" runat="server" AutoGenerateColumns="False" DataKeyNames="MaSach" DataSourceID="dsSach">
        <Columns>
            <asp:BoundField DataField="TenSach" HeaderText="TenSach" ReadOnly="true" SortExpression="TenSach" />
            <asp:BoundField DataField="Dongia" HeaderText="Dongia" ReadOnly="false" SortExpression="Dongia" />
            <asp:ImageField DataImageUrlField="Hinh"  ReadOnly="true" DataImageUrlFormatString="Bia_sach/{0}" HeaderText="Hinh" SortExpression="Hinh" />
            <asp:BoundField DataField="Ngaycapnhat" ReadOnly="true" HeaderText="Ngaycapnhat" SortExpression="Ngaycapnhat" />

              <asp:TemplateField ItemStyle-Wrap="false">
                 <ItemTemplate>
                     <asp:Button ID="btSua" runat="server" CssClass="btn btn-success" CommandName="Edit" Text="Sửa" />
                     <asp:Button ID="btXoa" OnClientClick="return confirm('Bạn có muốn xoá sách này?')" runat="server" CssClass="btn btn-danger" CommandName="Delete" Text="Xoá" />
                 </ItemTemplate>
                <EditItemTemplate>
                       <asp:Button ID="btCapnhat" runat="server" CssClass="btn btn-success" CommandName="Update" Text="Ghi" />
                       <asp:Button ID="btKhong" runat="server" CssClass="btn btn-warning" CommandName="Cancel" Text="Không" />
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="dsSach" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>"
        DeleteCommand="DELETE FROM [Sach] WHERE [MaSach] = @MaSach" 
        InsertCommand="INSERT INTO [Sach] ([TenSach], [MaCD], [MaNXB], [Dongia], [Hinh], [Ngaycapnhat]) VALUES (@TenSach, @MaCD, @MaNXB, @Dongia, @Hinh, @Ngaycapnhat)" 
        SelectCommand="SELECT * FROM [Sach] WHERE ([TenSach] LIKE '%' + @TenSach + '%')"
        UpdateCommand="UPDATE [Sach] SET [Dongia] = @Dongia WHERE [MaSach] = @MaSach">
        <DeleteParameters>
            <asp:Parameter Name="MaSach" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TenSach" Type="String" />
            <asp:Parameter Name="MaCD" Type="Int32" />
            <asp:Parameter Name="MaNXB" Type="Int32" />
            <asp:Parameter Name="Dongia" Type="Decimal" />
            <asp:Parameter Name="Hinh" Type="String" />
            <asp:Parameter Name="Ngaycapnhat" Type="DateTime" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtTen" DefaultValue="a" Name="TenSach" PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="TenSach" Type="String" />
            <asp:Parameter Name="MaCD" Type="Int32" />
            <asp:Parameter Name="MaNXB" Type="Int32" />
            <asp:Parameter Name="Dongia" Type="Decimal" />
            <asp:Parameter Name="Hinh" Type="String" />
            <asp:Parameter Name="Ngaycapnhat" Type="DateTime" />
            <asp:Parameter Name="MaSach" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    </asp:Content>
