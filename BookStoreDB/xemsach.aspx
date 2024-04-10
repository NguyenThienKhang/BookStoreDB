<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="xemsach.aspx.cs" Inherits="BookStoreDB.xemsach" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>Trang xem sách</h1>
    <div class="row">
          <div class="col -md-3">
              <ul class="list-group">
                  <a class="list-group-item active">Chủ đề sách</a>
                  <asp:Repeater ID="rptChuDe" runat="server" DataSourceID="dsChuDe">
                      <ItemTemplate>
                          <a href="xemsach.aspx?macd=<%# Eval("macd")%>" class="list-group-item list-group-item-action"><%# Eval("Tencd") %></a>
                      </ItemTemplate>
                  </asp:Repeater>
              </ul>
          </div>
        <div class="col-md-9 row">
            <asp:Repeater runat="server" DataSourceID="dsSach">
                <ItemTemplate>
                    <div class="col-4">
                        <img src="/Bia_sach/<%#Eval("Hinh") %>" alt="Alternate Text" /><br /> <br /> 
                       <asp:Button ID="btnMua" runat="server" CssClass="btn btn-success" Text="Đặt mua" /><br />
                       <span><%# Eval("TenSach") %></span><br />
                       Đơn giá:<span class="text-danger"><%# Eval("Dongia") %></span><br />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <asp:SqlDataSource ID="dsChuDe" runat="server"
        ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>"
        ProviderName="<%$ ConnectionStrings:BookStoreConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM [ChuDe]">
    </asp:SqlDataSource>
    <%--Lấy sách theo macd--%>
    <asp:SqlDataSource ID="dsSach" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" SelectCommand="SELECT * FROM [Sach] WHERE ([MaCD] = @MaCD)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="5" Name="MaCD" QueryStringField="macd" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
