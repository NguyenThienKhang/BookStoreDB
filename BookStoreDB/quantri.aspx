<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="quantri.aspx.cs" Inherits="BookStoreDB.quantri" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>Trang quản trị</h1>
    <div class="row">
        <div class="col-md-6">
            <div class="form-inline">
                Nhập tên sách muốn tìm:<asp:TextBox ID="txtTen" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:Button ID="btTraCuu" runat="server" Text="Tìm sách" CssClass="btn btn-success" />
            </div>
            </div>

                <div class="col-md-6 text-right">
                    <a href="themsach.aspx" class="btn btn-primary">Thêm sách mới</a>
                </div>
            </div>
       
    <asp:GridView ID="gvsach" runat="server" AutoGenerateColumns="False" DataKeyNames="MaSach" DataSourceID="dsSach" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1342px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="TenSach" HeaderText="TenSach" ReadOnly="true" SortExpression="TenSach" />
            <asp:BoundField DataField="Dongia" HeaderText="Dongia" DataFormatString="{0:#,##0} đồng"  ReadOnly="false" SortExpression="Dongia" />
            <asp:ImageField DataImageUrlField="Hinh"  ReadOnly="true" DataImageUrlFormatString="Bia_sach/{0}" HeaderText="Hinh" SortExpression="Hinh" />
            <asp:BoundField DataField="Ngaycapnhat" ReadOnly="true" DataFormatString="{0:d/MM/yyyy}" HeaderText="Ngaycapnhat" SortExpression="Ngaycapnhat" />

              <asp:TemplateField ItemStyle-Wrap="false">
                 <ItemTemplate>
                     <asp:Button ID="btSua" runat="server" CssClass="btn btn-success" CommandName="Edit" Text="Sửa" />
                     <asp:Button ID="btXoa" OnClientClick="return confirm('Bạn có muốn xoá sách này?')" runat="server" CssClass="btn btn-danger" CommandName="Delete" Text="Xoá" />
                 </ItemTemplate>
                <EditItemTemplate>
                       <asp:Button ID="btCapnhat" runat="server" CssClass="btn btn-success" CommandName="Update" Text="Ghi" />
                       <asp:Button ID="btKhong" runat="server" CssClass="btn btn-warning" CommandName="Cancel" Text="Không" />
                </EditItemTemplate>
          <ItemStyle Wrap="False"></ItemStyle>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            <div class="alert alert-info">
                Không có sách bạn tìm
            </div>
        </EmptyDataTemplate>
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
