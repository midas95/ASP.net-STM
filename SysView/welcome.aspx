﻿<%@ Page Language="C#" MasterPageFile="~/MasterPagePublic.master" AutoEventWireup="true" CodeFile="welcome.aspx.cs" Inherits="welcome" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style>
        .page-aside{
            display:none !important;
        }
        .sidenav-btn{
            display:none !important;
        }

        .jumbotron{
            background-color: #262734;
        }

        p{
            color: white;
        }

        .jumbSysImg{
            width:30%;
            height:auto;
        }

        h2{
            color:#4996cd;
        }

        .homeTile{
            text-align:center;
            padding: 0 30px;
        }

        .rounded-circle{
            width:95px;
            height:auto;
        }

        .gradientImg:before {
            content: " ";
            width: 100%;
            height: 100%;
            position: absolute;
            z-index: -1;
            top: 0;
            left: 0;
            background: -webkit-radial-gradient(top center, ellipse cover, rgba(255,255,255,0.2) 0%,rgba(0,0,0,0.5) 100%);
            }
    </style>

<%--    <div class="sysHome container-fluid">                                                          


    </div>--%>

<div class="container">
  <div class="jumbotron">
    <%--<h1>Bootstrap Tutorial</h1>--%>   
      <img class="jumbSysImg" src="images/SysViewCloud_Final.png" />
    <p>SysView Cloud is a cloud-based asset management app designed to help you efficiently track your 
        organization's technology assets. Manage your one-to one deployments and repairs, and stay informed
        with customizable reports and alerts.</p>
  </div>    
</div>
<div class="container">
    <div class="row">
        <div class="homeTile col-lg-4">
                <img class="rounded-circle" src="images/sysview/repairs.png" alt="">
                <h2>Repair Tracking</h2>
                <p>Easily request repairs for your assets and track devices throughout the repair process. View repair history, parts replaced and associated costs.</p>
                <%--<p><a class="btn btn-secondary" href="#" role="button">View details »</a></p>--%>
          </div>
        <div class="homeTile col-lg-4">
                <img class="rounded-circle" src="images/sysview/cloud.png" alt="">
                <h2>Cloud-based</h2>
                <p>Our cloud-based system allows you to access your inventory from anywhere. No onsite server is needed, and you will avoid costly upgrades and maintenance.</p>
                <%--<p><a class="btn btn-secondary" href="#" role="button">View details »</a></p>--%>
          </div>
            <div class="homeTile col-lg-4">
                <img class="rounded-circle" src="images/sysview/users.png" alt="">
                <h2>Unlimited Users</h2>
                <p>Add as many users as you need, and customize their access levels. You may wish for administrative staff to have full access to the system, and to restrict other users to only submit repair requests.</p>
                <%--<p><a class="btn btn-secondary" href="#" role="button">View details »</a></p>--%>
          </div>
    </div>
</div>
<div class="jumbotron text-center hoverable p-4">

  <div class="row mb-30">
    <div class="col-md-4 offset-md-1 mx-3 my-3">
      <div class="gradientImg view overlay">
        <img src="images/repairPage.PNG" class="img-fluid" alt=""/>
        <a>
          <div class="mask rgba-white-slight"></div>
        </a>
      </div>
    </div>

    <div class="col-md-7 text-md-left ml-3 mt-3">
      <h2 class="mb-4">Empower Your Users</h2>
      <p class="font-weight-normal">Give your users the ability to see their asset data, and automate repair requests.
          SysView makes it easy for the user to submit a request, and also eliminates the need for 
          additional staff in order to manually log a repair request. The staff can directly act on requests, making 
          the process more efficient.
      </p>
      <a class="btn btn-success">Read more</a>
    </div>

  </div>
  <div class="row mb-30">

    <div class="col-md-7 text-md-left ml-3 mt-3">
      <h2 class="mb-4">A Powerful Admin Dashboard</h2>
      <p class="font-weight-normal">IT managers and technicians can access a dashboard that gives both a high-level
          view of asset status, but also detailed lists that can give the IT department specific asset details.
      </p>
      <a class="btn btn-success">Read more</a>
    </div>

    <div class="col-md-4 offset-md-1 mx-3 my-3">
      <div class="gradientImg view overlay">
        <img src="images/adminPage.PNG" class="img-fluid" alt=""/>
        <a>
          <div class="mask rgba-white-slight"></div>
        </a>
      </div>
    </div>

  </div>
</div>



    </asp:Content>

