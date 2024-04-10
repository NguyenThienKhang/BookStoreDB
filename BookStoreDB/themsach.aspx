<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="themsach.aspx.cs" Inherits="BookStoreDB.themsach" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <form>
       <h2 class="text-center">THÊM SACSC MỚI</h2>
         <div class="container p-3 my-3 border text-center border border-primary">

        <div class="form-group row mb-2">
            <label for="" class="col-sm-2 col-form-label" >Tên sách</label>
            <asp:TextBox ID="txtTenSach" runat="server" class="col-sm-10" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="reqTenHoa" CssClass="text-danger" runat="server" ControlToValidate="txtTenSach" ErrorMessage="Tên sách không được bỏ trống"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group row mb-2">
            <label for="" class="col-sm-2 col-form-label">Đơn giá</label>
            <asp:TextBox ID="txtDonGia" runat="server" class="col-sm-10"></asp:TextBox>
            <asp:RequiredFieldValidator ID="reqGia" CssClass="text-danger" runat="server" ControlToValidate="txtDonGia" ErrorMessage="Đơn giá không được bỏ trống"></asp:RequiredFieldValidator><br />
            <asp:RegularExpressionValidator ID="regGia" CssClass="text-danger" runat="server" ControlToValidate="txtDonGia" ErrorMessage="Đơn giá phải là kiểu số" ValidationExpression="^\d+$"></asp:RegularExpressionValidator><br />
            <asp:CompareValidator ID="compGia" runat="server" ErrorMessage="Đơn giá phải lớn hơn 0" ControlToValidate="txtDonGia" Type="Currency" ValueToCompare="0" Operator="GreaterThan" CssClass="text-danger"></asp:CompareValidator>
        </div>
        <div class="form-group row mb-2">
            <label for="" class="col-sm-2 col-form-label">Ngày cập nhật</label>
            <asp:TextBox ID="txtNgayCapNhat" type="date" runat="server" class="col-sm-10"></asp:TextBox>
            <asp:RequiredFieldValidator ID="reqNgayCapNhat" CssClass="text-danger" runat="server" ControlToValidate="txtNgayCapNhat" ErrorMessage="Ngày cập nhật không được bỏ trống"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group row mb-2">
            <label for="" class="col-sm-2 col-form-label">Hình</label>
            <asp:FileUpload ID="FHinh" runat="server" class="col-sm-10"></asp:FileUpload>
        </div>
        <div class="form-group row mb-2">
            <label for="" class="col-sm-2 col-form-label">Danh mục sách</label>
            <asp:DropDownList ID="ddlChuDe" CssClass="text-center" runat="server" DataSourceID="dsChuDe" DataTextField="TenCD" DataValueField="MaCD"></asp:DropDownList>
            <asp:SqlDataSource ID="dsChuDe" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" SelectCommand="SELECT * FROM [ChuDe]"></asp:SqlDataSource>
        </div>
        <div class="form-group row mb-2">
            <label for="" class="col-sm-2 col-form-label">Nhà Xuất Bản</label>
            <asp:DropDownList ID="ddlNXB" CssClass="text-center" runat="server" DataSourceID="dsNXB" DataTextField="TenNXB" DataValueField="MaNXB"></asp:DropDownList>
            <asp:SqlDataSource ID="dsNXB" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" SelectCommand="SELECT * FROM [NhaXuatBan]"></asp:SqlDataSource>
        </div>
        <div class="text-center">
            <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Thêm" OnClick="btnSave_Click1" />
        </div>
        <asp:Label ID="lblketqua" runat="server" Text=""></asp:Label>
             </div>
    </form>

</asp:Content>
