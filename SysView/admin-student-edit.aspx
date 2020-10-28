<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="admin-student-edit.aspx.cs" Inherits="AdminStudentEdit" %>

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
                 <div class="portlet-box portlet-gutter ui-buttons-col mb-30">
                    <div class="portlet-header flex-row flex d-flex align-items-center b-b">
                        <div class="flex d-flex flex-column">
                            <h3>Student detail info</h3> 
                            <span class="portlet-subtitle">You can update detail info of student</span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <form id="form1" runat="server" class="edit-student-form">
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">First Name</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control first-name" id="firstName" runat="server" required="required"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Last Name</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control last-name" id="lastName" runat="server" required="required"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Email</label>
                                <div class="col-sm-10">
                                    <input type="email" class="form-control email" id="email" name="email" runat="server" required="required"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Grade</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control grade" id="grade" name="grade" required="required" runat="server"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputEmail3" class="col-sm-2 col-form-label">Teacher</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control teacher" id="teacher" name="teacher" required="required" runat="server"/>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-form-label col-sm-2 pt-0">User Status</label>
                                <div class="col-sm-10">
									<select class="form-control user-status" name="user_status" runat="server" id="user_status">
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
									</select>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-10 ml-auto">
                                    <button type="submit" class="btn btn-primary btn-block">Update</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
        </div>

        <script>
            $(".invRow").click(function () {
                var invKey = $(this).attr("id");
                window.location.href = '/admin-assetdetail.aspx?inventorykey=' + invKey;
            })

            $(".student").addClass("active");

            $(".edit-student-form").submit(function (e) {

                $("#loader-wrapper").show();
                e.preventDefault();
                $.ajax({
                    type: "POST",
                    url: "admin-student-edit.aspx/updateStudent",
                    data: JSON.stringify({
                        firstName: $('.first-name').val(),
                        lastName: $('.last-name').val(),
                        email: $('.email').val(),
                        grade: $('.grade').val(),
                        teacher: $('.teacher').val(),
                        status: $('.user-status').val()
                    }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        $("#loader-wrapper").hide();
                        toastr.success("This student is udpated successfully");
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        console.log(errorThrown);
                        toastr.error("Something wrong");
                        $("#loader-wrapper").hide();
                    }
                });
            });

        </script>
    </asp:Content>

