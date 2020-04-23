﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="Home" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
 <div class="container-fluid">
                        <div class="row align-items-center mb-30 pt-30">
                            <div class="col-md-12 mr-auto ml-auto">
                                <div class="mb-0">
                                    <a href='#' class='float-right btn btn-sm btn-info btn-icon'><i class="fa fa-cog mr-2"></i>View Settings</a>
                                    <h4>Welcome back, Sarah</h4>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3 mb-6 col-md-6 mb-30">
                                <div class="list border1 rounded overflow-hidden">
                                    <div class="list-item">
                                        <div class="list-thumb bg-primary text-primary-light avatar rounded-circle avatar60 shadow-sm">
                                            <i class="icon-Add-Basket"></i>
                                        </div>
                                        <div class="list-body text-right">
                                            <span class="list-title fs-2x">4598</span>
                                            <span class="list-content fs14">New Orders</span>

                                        </div>
                                    </div>
                                </div>
                            </div><!--col-->
                            <div class="col-lg-3 mb-6 col-md-6 mb-30">
                                <div class="list border1 rounded overflow-hidden">
                                    <div class="list-item">
                                        <div class="list-thumb bg-warning-active text-warning-light avatar rounded-circle avatar60 shadow-sm">
                                            <i class="icon-Truck"></i>
                                        </div>
                                        <div class="list-body text-right">
                                            <span class="list-title fs-2x">753</span>
                                            <span class="list-content  fs14">Pending Orders</span>

                                        </div>
                                    </div>
                                </div>
                            </div><!--col-->
                            <div class="col-lg-3 mb-6 col-md-6 mb-30">
                                <div class="list border1 rounded overflow-hidden">
                                    <div class="list-item">
                                        <div class="list-thumb bg-danger-active text-danger-light avatar rounded-circle avatar60 shadow-sm">
                                            <i class="icon-Remove-Basket"></i>
                                        </div>
                                        <div class="list-body text-right">
                                            <span class="list-title fs-2x">78</span>
                                            <span class="list-content  fs14">Order Canceled</span>

                                        </div>
                                    </div>
                                </div>
                            </div><!--col-->
                            <div class="col-lg-3 mb-6 col-md-6  mb-30">
                                <div class="list border1 rounded overflow-hidden">
                                    <div class="list-item">
                                        <div class="list-thumb bg-success-active text-success-light avatar rounded-circle avatar60 shadow-sm">
                                            <i class="icon-Money-Bag"></i>
                                        </div>
                                        <div class="list-body text-right">
                                            <span class="list-title fs-2x">6830</span>
                                            <span class="list-content fs14">Earnings</span>

                                        </div>
                                    </div>
                                </div>
                            </div><!--col-->
                        </div>
                        <div class="row">
                            <div class="col-lg-8">
                                <div class="portlet-box bg-trans  mb-30">
                                    <div class="portlet-header bg-light flex-row b-b flex d-flex align-items-center">
                                        <div class="flex d-flex flex-column">
                                            <h3>Recent Earnings</h3> 
                                        </div>
                                        <div class="portlet-tools">
                                            <ul class="nav">

                                                <li class="nav-item">
                                                    <a href="#" class="nav-link"><i class="fa fa-sync"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div><!--header-->
                                    <div class="portlet-body">
                                         <div class="nav pb-3">
                                             <span class="pr-2 pt-2"><i class="fa fa-filter mr-2 text-muted"></i>Filter Earnings</span>
                                                <div class="nav-item p-1">
                                                    <input placeholder="From" type="text" class="form-control" id="date_timepicker_start">
                                                </div>
                                                <div class="nav-item p-1">
                                                    <input placeholder="To" type="text" class="form-control" id="date_timepicker_end">
                                                </div>
                                            </div>
                                        <div class='chartist'>
                                    <div style="height: 300px;" class="ct-chart"></div>
                                </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 mb-30">
                                <div class=" p-3  flex full-height rounded border1">
                                    <span class="b-b fs-1x font500 mb-3 d-block pb-3">Recent Activities</span>
                                <ul class="timeline-alt list-unstyled">
                                    <li class="clearfix d-flex flex">
                                        <div class="tl-thumb bg-primary text-primary-light fs10 font600 rounded-circle">
                                            <i class="fa fa-comments"></i>
                                        </div>
                                        <div class="tl-content">
                                            <span class="text-muted float-right fs12 d-inline-block">12 Min ago</span>
                                            <a href="#">
                                                <span>New Message</span>
                                            </a> 
                                            <p>
                                                Sent you friend request
                                            </p>
                                        </div>

                                    </li><!-- timeline item-->
                                    <li class="clearfix d-flex flex">
                                        <div class="tl-thumb rounded-circle">
                                            <img src="images/avatar2.jpg" alt="" class="img-fluid rounded-circle">
                                        </div>
                                        <div class="tl-content">
  <span class="text-muted float-right fs12 d-inline-block">12 Min ago</span>
                                            <a href="#">
                                                <span>Replace these images with current home slider </span>
                                            </a> 
                                        </div>
                                    </li><!-- timeline item-->
                                    <li class="clearfix d-flex flex">
                                        <div class="tl-thumb si-colored-facebook rounded-circle">
                                            <i class="fab fa-facebook-f fs10"></i>
                                        </div>
                                        <div class="tl-content">
                                            <span class="text-muted float-right fs12 d-inline-block">12 Min ago</span>
                                            <a href="#">
                                                <span>New Friend Request</span>
                                            </a> 
                                            <p class="mb-0">
                                                Sent you friend request
                                            </p>
                                        </div>

                                    </li><!-- timeline item-->
                                    <li class='clearfix d-flex flex text-right'>
                                        <a href='#' class='btn btn-sm btn-primary'>View All</a>
                                    </li>
                                </ul>
                                    </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="portlet-box portlet-fullHeight mb-30">
                                    <div class="portlet-header bg-light flex-row flex d-flex align-items-center">
                                        <div class="flex d-flex flex-column">
                                            <h3>Recent item sales</h3> 
                                        </div>
                                        <div class="portlet-tools">
                                            <ul class="nav">

                                                <li class="nav-item">
                                                    <select class="custom-select bg-light hidden-search" data-placeholder="Filter Orders">
                                                        <option value="1" selected>Recent Orders</option>
                                                        <option value="2">Pending Orders</option>
                                                        <option value="3">Canceled Orders</option>
                                                        <option value="4">Return Orders</option>
                                                    </select>
                                                </li>
                                                <li class="nav-item pl-3">
                                                    <a href="#" class="btn btn-link">
                                                        View all orders
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="portlet-body no-padding">

                                        <div class="table-responsive">
                                            <table class="table mb-0">
                                                <thead>
                                                    <tr>
                                                        <th>Order Id</th>
                                                        <th>Product</th>
                                                        <th></th>
                                                        <th>Rate</th>
                                                        <th>States</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>3949IN40</td>
                                                        <td>
                                                            <a href="#"> 
                                                                <img src="images/img1.jpg" alt="" class="img-fluid avatar32 rounded-circle mr-2">
                                                                <span>App Mackbook Air</span>
                                                            </a>
                                                        </td>
                                                        <td></td>
                                                        <td>$1299.00</td>
                                                        <td>
                                                            <span class="badge badge-warning badge-text"><i class="fa fa-truck mr-1"></i> Pending</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>3949IN39</td>
                                                        <td>
                                                            <a href="#"> 
                                                                <img src="images/img2.jpg" alt="" class="img-fluid avatar32 rounded-circle mr-2">
                                                                <span>Mens Sunglasses</span>
                                                            </a>
                                                        </td>
                                                        <td></td>
                                                        <td>$19.00</td>
                                                        <td>
                                                            <span class="badge badge-success badge-text"><i class="fa fa-check mr-1"></i> Delivered</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>4939IN29</td>
                                                        <td>
                                                            <a href="#"> 
                                                                <img src="images/img3.jpg" alt="" class="img-fluid avatar32 rounded-circle mr-2">
                                                                <span>App Mackbook Air</span>
                                                            </a>
                                                        </td>
                                                        <td></td>
                                                        <td>$1299.00</td>
                                                        <td>
                                                            <span class="badge badge-warning badge-text"><i class="fa fa-truck mr-1"></i> pending</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>0038IN39</td>
                                                        <td>
                                                            <a href="#"> 
                                                                <img src="images/img4.jpg" alt="" class="img-fluid avatar32 rounded-circle mr-2">
                                                                <span>Apple Ipad Air</span>
                                                            </a>
                                                        </td>
                                                        <td></td>
                                                        <td>$699.00</td>
                                                        <td>
                                                            <span class="badge badge-danger badge-text"><i class="fa fa-times mr-1"></i> Canceled</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>9038IN49</td>
                                                        <td>
                                                            <a href="#"> 
                                                                <img src="images/img5.jpg" alt="" class="img-fluid avatar32 rounded-circle mr-2">
                                                                <span>Just another product</span>
                                                            </a>
                                                        </td>
                                                        <td></td>
                                                        <td>$179.00</td>
                                                        <td>
                                                            <span class="badge badge-warning badge-text"><i class="fa fa-truck mr-1"></i> Pending</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>5330IN39</td>
                                                        <td>
                                                            <a href="#"> 
                                                                <img src="images/img6.jpg" alt="" class="img-fluid avatar32 rounded-circle mr-2">
                                                                <span>Lorem ipsum dolor</span>
                                                            </a>
                                                        </td>
                                                        <td></td>
                                                        <td>$156.00</td>
                                                        <td>
                                                            <span class="badge badge-dark badge-text"><i class="fa fa-sync mr-1"></i> Return</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>3032IN39</td>
                                                        <td>
                                                            <a href="#"> 
                                                                <img src="images/img3.jpg" alt="" class="img-fluid avatar32 rounded-circle mr-2">
                                                                <span>Toy Train</span>
                                                            </a>
                                                        </td>
                                                        <td></td>
                                                        <td>$99.00</td>
                                                        <td>
                                                            <span class="badge badge-success badge-text"><i class="fa fa-times mr-1"></i> Delivered</span>
                                                        </td>
                                                    </tr>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div><!--portlet-->
                            </div><!--col-->
                        </div>
                    </div>
    </asp:Content>

