<%@ Page Title="" Language="C#" MasterPageFile="~/Library/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Library_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .button-link {
            padding: 10px 15px;
            font-size: 14px;
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .isra-inline {
            display: inline-block !important;
            width: 100% !important;
            margin: 0px 0 13px 0 !important;
            font-size: 18px !important;
        }

        .inlineh {
            font-family: hasanin;
            font-size: 16px;
            display: block;
            margin: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <li>
        <i class="fa fa-home"></i>
        <a href="Default.aspx" class="font-ha">الصفحة الرئيسية</a>
        
    </li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="portlet box red">
            <div class="portlet-title">
                <div class="caption font-ha"><i class="fa fa-book"></i>المكتبة المركزية</div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
                <h3 class="font-ha" style="text-align: center">مرحبا بكم في المكتبة المركزية</h3>
           
                <div class="col-md-3">
                    <a href="InsertBook.aspx" class="btn default btn-sm isra-inline dark-stripe font-ha">اضافة كتب</a>
                </div>
                <div class="clearfix"></div>
                 <div class="col-md-3">
                    <a href="E_BookAddEdit.aspx" class="btn default btn-sm isra-inline dark-stripe font-ha">اضافة الكتب الالكترونية</a>
                </div>
                <div class="clearfix"></div>
                <div class="col-md-3">
                    <a href="search.aspx" class="btn default btn-sm isra-inline dark-stripe font-ha">البحث</a>
                </div>
                <div class="clearfix"></div>
              <%--   <div class="col-md-3">
                    <a href="AllBooksView.aspx" class="btn default btn-sm isra-inline dark-stripe font-ha">عرض الكتب</a>
                </div>--%>
                 <div class="clearfix"></div>
                     <div class="col-md-3">
                    <a href="BorrowCat.aspx" class="btn default btn-sm isra-inline dark-stripe font-ha">فئات المستعيرين</a>
                </div>
                <div class="clearfix"></div>
                <div class="col-md-3">
                    <a href="VisitorAddEdit.aspx" class="btn default btn-sm isra-inline dark-stripe font-ha">الزوار</a>
                </div>
                <div class="clearfix"></div>
                     <div class="col-md-3">
                    <a href="BorrowBook.aspx" class="btn default btn-sm isra-inline dark-stripe font-ha">الاعارة</a>
                </div>
                <div class="clearfix"></div>

                    <div class="col-md-3">
                    <a href="DelayNotification.aspx" class="btn default btn-sm isra-inline dark-stripe font-ha">التنبيهات</a>
                </div>
                <div class="clearfix"></div>
                            </div>
            <div class="clearfix"></div>
        </div>

    </div>
</asp:Content>

