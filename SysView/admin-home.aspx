<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="admin-home.aspx.cs" Inherits="AdminHome" %>

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
            <div class="row">
                <div class="col-lg-3 mb-6 col-md-6 mb-30">
                    <div class="list border1 rounded overflow-hidden">
                        <div class="list-item">
                            <div class="list-thumb bg-primary text-primary-light avatar rounded-circle avatar60 shadow-sm">
                                <%--<i class="icon-Add-Basket"></i>--%>
                                <i class="fas fa-laptop"></i>
                            </div>
                            <div class="list-body text-right">
                                <span class="list-title fs-2x"><%= TotalAssets %></span>
                                <span class="list-content fs14">Total Devices</span>

                            </div>
                        </div>
                    </div>
                </div><!--col-->
                <div class="col-lg-3 mb-6 col-md-6 mb-30">
                    <div class="list border1 rounded overflow-hidden">
                        <div class="list-item">
                            <div class="list-thumb bg-danger-active text-danger-light avatar rounded-circle avatar60 shadow-sm">
                                <%--<i class="icon-Truck"></i>--%>
                                <%--<i class="fas fa-medkit"></i>--%>
                                <img src="images/sysview/repairs_mono.png" />
                            </div>
                            <div class="list-body text-right">
                                <span class="list-title fs-2x"><%= TotalRepairs %></span>
                                <span class="list-content  fs14">Repair Status</span>

                            </div>
                        </div>
                    </div>
                </div><!--col-->
                <div class="col-lg-3 mb-6 col-md-6  mb-30">
                    <div class="list border1 rounded overflow-hidden">
                        <div class="list-item">
                            <div class="list-thumb bg-warning-active text-warning-light avatar rounded-circle avatar60 shadow-sm">
                                <i class="fas fa-question-circle"></i>
                            </div>
                            <div class="list-body text-right">
                                <span class="list-title fs-2x"><%= TotalLost %></span>
                                <span class="list-content fs14">Lost/Stolen</span>

                            </div>
                        </div>
                    </div>
                </div><!--col-->
                <div class="col-lg-3 mb-6 col-md-6  mb-30">
                    <div class="list border1 rounded overflow-hidden">
                        <div class="list-item">
                            <div class="list-thumb bg-success-active text-success-light avatar rounded-circle avatar60 shadow-sm">
                                <%--<i class="icon-Money-Bag"></i>--%>
                                <%--<i class="fas fa-home"></i>--%>
                                <i class="fa fa-cubes" aria-hidden="true"></i>
                            </div>
                            <div class="list-body text-right">
                                <span class="list-title fs-2x"><%= TotalDecom %></span>
                                <span class="list-content fs14">Unassigned/Decom</span>

                            </div>
                        </div>
                    </div>
                </div><!--col-->
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <div class="portlet-box portlet-fullHeight mb-30">
                        <div class="portlet-header bg-light flex-row flex d-flex align-items-center">
                            <div class="flex d-flex flex-column">
                                <h3>Inventory List</h3> 
                            </div>
                            <div class="portlet-tools">
                                <ul class="nav">

                                    <li class="nav-item">
                                        <select class="custom-select bg-light hidden-search" data-placeholder="Filter Orders">
                                            <option value="1" selected>Sort By...</option>
                                            <option value="2">Pending Orders</option>
                                            <option value="3">Canceled Orders</option>
                                            <option value="4">Return Orders</option>
                                        </select>
                                    </li>
                                    <li class="nav-item pl-3">
                                        <a href="#" class="btn btn-link">
                                            View all devices
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="portlet-body no-padding">

                            <div class="table-responsive">
                                <asp:Literal ID ="InventoryList" runat="server"></asp:Literal>
                            </div>
                        </div>
                    </div><!--portlet-->
                </div><!--col-->
            </div>
        </div>
    
        <script>
            $(".invRow").click(function () {
                var invKey = $(this).attr("id");
                window.location.href = '/admin-assetdetail.aspx?inventorykey=' + invKey;
            })

            $(".dash").addClass("active");

        </script>
    </asp:Content>

