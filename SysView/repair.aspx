<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="repair.aspx.cs" Inherits="repair" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <style>
            #divAssetImg{
                text-align:center;
            }
            #divAssetImg img{
                margin:0 15px 10px 0;
                height: 155px;
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
                                        <li class="breadcrumb-item"><a href="index.html"><i class="icon-Home mr-2 fs14"></i></a></li>
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
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row deviceDisplay">
                            <div class="col-sm-6">
                                <div class="portlet-box portlet-gutter ui-buttons-col mb-30">
                                    <div class="portlet-header flex-row flex d-flex align-items-center b-b">
                                        <div class="flex d-flex flex-column">
                                            <h3>Problems</h3> 
                                            <span class="portlet-subtitle">Check all that apply</span>
                                        </div>
                                    </div>
                                    <div class="portlet-body">
                                        <div class="custom-control custom-checkbox mr-sm-2">
                                            <input type="checkbox" class="custom-control-input" id="chkWontTurnOn">
                                            <label class="custom-control-label" for="chkWontTurnOn">Won't turn on</label>
                                        </div>
                                         <div class="custom-control custom-checkbox mr-sm-2">
                                            <input type="checkbox" class="custom-control-input" id="chkScreenDamanged">
                                            <label class="custom-control-label" for="chkScreenDamanged">Screen damanged</label>
                                        </div>
                                         <div class="custom-control custom-checkbox mr-sm-2">
                                            <input type="checkbox" class="custom-control-input" id="chkMissingKeys">
                                            <label class="custom-control-label" for="chkMissingKeys">Keyboard missing keys</label>
                                        </div>
                                        <div class="custom-control custom-checkbox mr-sm-2">
                                            <input type="checkbox" class="custom-control-input" id="chkKeyNotWorking">
                                            <label class="custom-control-label" for="chkKeyNotWorking">Keyboard not working</label>
                                        </div>
                                        <div class="custom-control custom-checkbox mr-sm-2">
                                            <input type="checkbox" class="custom-control-input" id="chkTrackNotWorking">
                                            <label class="custom-control-label" for="chkTrackNotWorking">Trackpad not working</label>
                                        </div>
                                         <div class="custom-control custom-checkbox mr-sm-2">
                                            <input type="checkbox" class="custom-control-input" id="chkHingesDamaged">
                                            <label class="custom-control-label" for="chkHingesDamaged">Hinges damaged</label>
                                        </div>
                                         <div class="custom-control custom-checkbox mr-sm-2">
                                            <input type="checkbox" class="custom-control-input" id="chkAppsMissing">
                                            <label class="custom-control-label" for="chkAppsMissing">Apps missing</label>
                                        </div>
                                         <div class="custom-control custom-checkbox mr-sm-2">
                                            <input type="checkbox" class="custom-control-input" id="chkWifiNotWorking">
                                            <label class="custom-control-label" for="chkWifiNotWorking">WiFi not working</label>
                                        </div>
                                         <div class="custom-control custom-checkbox mr-sm-2">
                                            <input type="checkbox" class="custom-control-input" id="chkAdapterDamaged">
                                            <label class="custom-control-label" for="chkAdapterDamaged">Power adapter damaged</label>
                                        </div>
                                    <div id="divSubmit" class="row">
                                        <div class="col-sm-12">
                                        <a href="javascript:void(0)" class="btn btn-rounded btn-primary mr-1 mb-2 mt-10">Submit Repair Request</a>

                                        </div>
                                    </div>
                                </div>

                                </div><!--portlet-->
                                </div>
                                <div class="col-sm-6">
                                <div class="portlet-box portlet-gutter ui-buttons-col mb-30">
                                    <div class="portlet-header flex-row flex d-flex align-items-center b-b">
                                        <div class="flex d-flex flex-column">
                                            <h3>Your Device</h3> 
                                            <span class="portlet-subtitle"></span>
                                        </div>
                                    </div>
                                    <div class="portlet-body">
                                                    <div><b>Model:</b>
                                                    <span id="txtModel"></span></div>
                                                    <div><b>Student:</b>
                                                    <span id="txtStudent"></span></div>
                                                    <div><b>Serial Number:</b>
                                                    <span id="txtSerialNum"></span></div>
                                                    <div><b>Student ID:</b>
                                                    <span id="txtStudentID"></span></div>
                                    </div>
                                    <div class="flex d-flex flex-column">
                                        <div id="divAssetImg">

                                        </div>
                                    </div>
                                </div><!--portlet-->
                            </div>
                        </div>

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
                             $("#txtStudent").text(strParse.username);
                             $("#txtSerialNum").text(strParse.serialNum);
                             //$("#divAssetImg").text('sometext');
                             $("#divAssetImg").html('<img src="' + strParse.imgLink + '" />');
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

