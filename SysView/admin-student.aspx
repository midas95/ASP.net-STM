﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="admin-student.aspx.cs" Inherits="AdminStudent" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
         <div class="container-fluid">
            <div class="row align-items-center mb-30 pt-30">
                <div class="col-md-12 mr-auto ml-auto">
                    <div class="mb-0">
                        <a href='/repair.aspx' class='float-right btn btn-sm btn-info btn-icon'>
                            <i class="fas fa-download"></i>
                            Scan Device

                        </a>
                        <h4>Welcome, <%= FirstName %></h4>
                    </div>
                </div>
            </div>


        </div>
        <div class="container-fluid">
            <div class="bg-white table-responsive rounded shadow-sm pt-3 pb-3 mb-30">
                <h6 class="pl-3 pr-3 text-capitalize font400 mb-20">Student list</h6>
                <table id="data-table" class="table mb-0 table-striped" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>First name</th>
                            <th>Last name</th>
                            <th>Email</th>
                            <th>Grade</th>
                            <th>Teacher</th>
                            <th>UserStatus</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody id="Studentlist" runat="server">
                    </tbody>
                </table>
            </div>
        </div>
        <script type="text/javascript" src="lib/data-tables/jquery.dataTables.min.js"></script> 
        <script type="text/javascript" src="lib/data-tables/dataTables.bootstrap4.min.js"></script> 
        <script type="text/javascript" src="lib/data-tables/dataTables.responsive.min.js"></script> 
        <script type="text/javascript" src="lib/data-tables/responsive.bootstrap4.min.js"></script> 
        <script src="js/plugins-custom/datatables-custom.js"></script>
        <script>
            $(".invRow").click(function () {
                var invKey = $(this).attr("id");
                window.location.href = '/admin-assetdetail.aspx?inventorykey=' + invKey;
            })

            $(".student").addClass("active");

            $(".btn-student-del").click(function () {
                var studentKey = $(this).data("studentkey");
                var $this = $(this);
                var result = window.confirm("Are you sure to delete this?");
                if (result) {
                    $("#loader-wrapper").show();
                    $.ajax({
                        type: "POST",
                        url: "admin-student.aspx/deleteStudent",
                        data: JSON.stringify({
                            studentKey: studentKey
                        }),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            $("#loader-wrapper").hide();
                            $this.parent().parent().remove();
                            toastr.success("That student is deleted successfully");
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            console.log(errorThrown);
                            toastr.error("Something wrong");
                            $("#loader-wrapper").hide();
                        }
                    });
                }

            });
        </script>
    </asp:Content>
