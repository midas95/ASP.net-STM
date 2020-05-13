<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="repair.aspx.cs" Inherits="repair" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <style>
            #divAssetImg{
                text-align:center;
            }
            #divAssetImg img{
                margin:10px 15px 10px 0;
                height: 123px;
                width: auto;
            }

            #divSubmit{
                text-align:center;
            }

        </style>
        <div class="page-subheader mb-30">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <div class="col-md-7">
                                <div class="list">
                                    <div class="list-item pl-0">
                                        <div class="list-body">
                                            <div class="list-title fs-2x">
                                                <h3>Repair Request</h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-5 d-flex justify-content-end">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb no-padding bg-trans mb-0">
                                        <li class="breadcrumb-item"><a href="home.aspx"><i class="icon-Home mr-2 fs14"></i></a></li>
                                        <%--<li class="breadcrumb-item">Ui Elements</li>--%>
                                        <li class="breadcrumb-item active">Repair Request </li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div><!-- page-sub-Header end-->
                <div class="page-content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="portlet-box portlet-gutter ui-buttons-col mb-30">
                                    <%--<div class="portlet-header flex-row flex d-flex align-items-center b-b">--%>
                                    <div class="portlet-header">
                                         <div class="row">
                                            <div class="col-md-5 ml-2">
                                                <h2>Search for your device</h2> 
                                            </div>
                                            <div class="col-md-4">
                                                <div class="input-group pt-10">
                                                    <input type="text" id="txtAssetTag" class="form-control" aria-label="Large" placeholder="ENTER YOUR ASSET TAG" aria-label="Asset Tag" aria-describedby="basic-addon2">
                                                    <div class="input-group-append">
                                                        <span class="input-group-text btnSearchAssets" id="basic-addon2"><i class="icon-Magnifi-Glass2"></i></span>
                                                    </div>
                                                </div>
                                            </div>
<%--                                        </div>
                                    </div>--%>
                                </div>
                            </div>
                        </div>
                        <div class="row deviceDisplay">
                            <div class="col-sm-12">
                            <div class="portlet-box portlet-gutter ui-buttons-col mb-30">
                                <div class="portlet-header flex-row flex d-flex align-items-center b-b ml-10">
                                    <div class="row">
                                        <div class="flex d-flex flex-column">
                                                <%--<h3>Your Device  <span id="spnAssetTag" style="font-weight:100;"></span> </h3>--%>
                                                <h3><span id="spnAssetTag" style="font-weight:100;">Your Device  </span> </h3>
                                            <span class="portlet-subtitle"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="portlet-body">
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div><b>Model:</b>
                                                    <span id="txtModel"></span></div>
                                                    <div><b>Serial Number:</b>
                                                    <span id="txtSerialNum"></span></div>
                                                    <div><b>Student ID:</b>
                                                    <span id="txtStudentID"></span></div>
                                                    <div><b>Student:</b>
                                                    <span id="txtStudent"></span></div>
                                                </div>
                                                <div class="col-sm-6">
                                                        <div class="flex d-flex flex-column mb-20">
                                                        <div id="divAssetImg"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div> <!-- row end -->
                            </div>
                        </div><!--portlet-->
                    </div>
                        </div>

                    </div>
                            <div id="divNoResults" style='margin-left:20px; font-size:20px; display:none;'>
                        <i class='far fa-frown'></i>
                        <span style='margin-left:3px;'>Your search did not return results. Please try again.</span>
                    </div>
                        </div>

                    </div>

        <script>
            $(document).ready(function () {
                $(".deviceDisplay").hide();
            });

            $(".btnSearchAssets").click(function () {
                $.ajax({
                     type: "POST",
                     url: "repair.aspx/SearchAssets",
                     data: JSON.stringify({ assetNum: $('#txtAssetTag').val() }),
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     success: function (response) {
                         if (response.d) {
                             var strResponse = JSON.stringify(response.d);
                             var strParse = JSON.parse(strResponse);
                             $("#divNoResults").hide();
                             $(".deviceDisplay").show();
                             $("#txtModel").text(strParse.model);
                             $("#txtStudent").text(strParse.userEmail);
                             $("#txtSerialNum").text(strParse.serialNum);
                             $("#spnAssetTag").html('&nbsp <span>Asset# ' +$('#txtAssetTag').val()+'</span>');
                             $("#divAssetImg").html('<img src="' + strParse.imgLink + '" />');
                             $("#txtAssetTag").val("");
                         } else {
                             $("#divNoResults").show();

                         }
                     },
                     error: function (XMLHttpRequest, textStatus, errorThrown) {
                         alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
                     }
                 });
            })
            
        </script>

    </asp:Content>

