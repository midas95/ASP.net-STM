<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="admin-assetdetail.aspx.cs" Inherits="AdminAssetDetail" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <style>
            #divAssetImg{
                text-align:center;
            }
            #divAssetImg img{
                margin:5px 15px 10px 0;
                height: 123px;
                width: auto;
            }

            #divSubmit{
                text-align:center;
            }


        </style>
        <div class="page-subheader mb-10">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <div class="col-md-7">
                                <div class="list">
                                    <div class="list-item pl-0">
                                        <div class="list-body">
                                            <div class="list-title fs-2x">
                                                <h3>Admin Device Details</h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-5 d-flex justify-content-end">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb no-padding bg-trans mb-0">
                                        <li class="breadcrumb-item"><a href="home.aspx"><i class="icon-Home mr-2 fs14"></i></a></li>
                                        <li class="breadcrumb-item active">Admin Device Details </li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div><!-- page-sub-Header end-->
                <div class="page-content">
                    <div class="container-fluid">

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="portlet-box portlet-gutter ui-buttons-col mb-30">
                                    <div class="portlet-header flex-row flex d-flex align-items-center b-b">
                                        <div class="flex d-flex flex-column">
                                            <h3>Device</h3> 
                                            <span class="portlet-subtitle">Basic device ID data</span>
                                        </div>
                                    </div>
                                    <div class="portlet-body">
                                        <div class="form-group">
                                            <label>Asset Tag</label>
                                            <input value="<%= InventoryKey %>" runat="server" id="txtAssetTag" type="text" class="form-control" placeholder="Asset Tag"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Serial Num/Service Tag</label>
                                            <input value="" runat="server" id="txtSerialNum" type="text" class="form-control" placeholder="Serial Number"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Model</label>
                                            <input value="" runat="server" id="txtModel" type="text" class="form-control" placeholder="Model"/>
                                        </div>
                                    </div>
                                </div><!--portlet-->
                            </div>
                            <div class="col-lg-6">
                                <div class="portlet-box portlet-gutter ui-buttons-col mb-30">
                                    <div class="portlet-header flex-row flex d-flex align-items-center b-b">
                                        <div class="flex d-flex flex-column">
                                            <h3>Details</h3> 
                                            <span class="portlet-subtitle">Device status</span>
                                        </div>
                                    </div>
                                    <div class="portlet-body">
                                        <div class="form-group">
                                            <label>Device Status</label>
                                            <select value="" runat="server" class="custom-select bg-light hidden-search" data-placeholder="Device Status">
                                                <option value="InUse">In Use</option>
                                                <option value="SubmittedRepair">Submitted For Repair</option>
                                                <option value="RepairInProgress">Repair In Progress</option>
                                                <option value="RepairComplete">Repair Complete</option>
                                                <option value="Decomissioned">Decomissioned</option>
                                                <option value="Lost">Lost</option>
                                                <option value="Stolen">Stolen</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                         <div class="customUi-switchToggle switchToggle-teal">
                                            <input value=">" runat="server" type="checkbox" id="swLoaner">
                                            <label for="swLoaner">
                                                <span class="label-switchToggle"></span>
                                                <span class="label-helper">Loaner</span>
                                            </label>
                                        </div>
                                        </div>
                                        <div class="form-group">
                                         <div class="customUi-switchToggle switchToggle-teal">
                                            <input value="" runat="server" type="checkbox" id="swHomeUse">
                                            <label for="swHomeUse">
                                                <span class="label-switchToggle"></span>
                                                <span class="label-helper">Home Use</span>
                                            </label>
                                          </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="portlet-box portlet-gutter ui-buttons-col mb-30">
                                        <div class="portlet-header flex-row flex d-flex align-items-center b-b">
                                            <div class="flex d-flex flex-column">
                                                <h3>Details</h3> 
                                                <span class="portlet-subtitle">Device status</span>
                                            </div>
                                        </div>
                                        <div class="portlet-body">


                                        <div class="form-group">
                                            <label>Classroom</label>
                                            <input runat="server" id="txtLocClassroom" type="text" class="form-control" placeholder="Classroom"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Teacher</label>
                                            <input runat="server" id="txtLocTeacher" type="text" class="form-control" placeholder="Teacher"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Grade</label>
                                            <input runat="server" id="txtLocGrade" type="text" class="form-control" placeholder="Teacher"/>
                                        </div>
                                    </div>
                                </div><!--portlet-->
                                    </div>
                                <div class="col-lg-6">

                                <div class="portlet-box portlet-gutter ui-buttons-col mb-30">
                                    <div class="portlet-header flex-row flex d-flex align-items-center b-b">
                                        <div class="flex d-flex flex-column">
                                            <h3>Student Info</h3> 
                                            <span runat="server" class="portlet-subtitle">Assigned student</span>
                                        </div>
                                    </div>
                                    <div class="portlet-body">
                                        <div class="form-group">
                                            <label>Student ID</label>
                                            <input runat="server" id="txtStudentID" type="text" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>Student Name</label>
                                            <input runat="server" id="txtStudentName" type="text" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>Student Email</label>
                                            <input value="" runat="server" id="txtStudentEmail" type="text" class="form-control">
                                        </div>
                                    </div>
                                </div><!--portlet-->
                            </div>
                        </div>
                        </div>
                    </div>
                    <div class="row">
                    <div class="row ml-5 mb-2">
                        <div class="col-md-12 text-right">
                            <a href="javascript:void(0)" class="btn btn-icon btn-primary btn-success mb-2 mr-1">
                                            <i class="icon-Calendar-4"></i>
                                            Save
                                        </a>
                            <a href="javascript:void(0)" class="btn btn-icon btn-danger btn-danger mb-2">
                                            <i class="icon-Calendar-4"></i>
                                            Revert
                                        </a>

                        </div>
                    </div>
                        <div class="col-md-12">
                        <div class="portlet-box portlet-gutter ui-buttons-col mb-30">

                        </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="portlet-box portlet-gutter ui-buttons-col mb-30">
                                <div class="portlet-header flex-row flex d-flex align-items-center b-b">
                                    <div class="flex d-flex flex-column">
                                        <h3>Repair History</h3> 
                                        <span class="portlet-subtitle">List of repair requests, latest first</span>
                                    </div>
                                </div>
                                <div class="portlet-body no-padding">

                                    <div class="table-responsive">
                                        <asp:Literal ID ="RepairList" runat="server"></asp:Literal>
                                    </div>
                                </div>
                            </div><!--portlet-->
                        </div>
                    </div>


        <script>

        </script>

    </asp:Content>

