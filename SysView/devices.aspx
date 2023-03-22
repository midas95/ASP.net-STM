<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="devices.aspx.cs" Inherits="devices" %>

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
            .btnRepairReq{
                font-size:17px !important;
                float:right;
                margin-top: -25px;
            }
            .btnRepairReq:hover{
                cursor:pointer;
            }
            #basic-addon2{
                cursor:pointer;
                font-size:18px;
            }
            #basic-addon2:hover{
                color:#fa625e;
            }
            .portlet-body b{
                font-size:18px;
            }
            .portlet-body div > span{
                font-size:16px;
                margin-left:5px;
            }
            .custom-checkbox {
              position: relative;
              padding-left: 40px;
              margin-bottom: 12px;
              cursor: pointer;
              font-size: 16px;
              margin-left:90px;
              -webkit-user-select: none;
              -moz-user-select: none;
              -ms-user-select: none;
              user-select: none;
              display: block;
            }

            /* Hide the browser's default checkbox */
            .custom-checkbox input {
              position: absolute;
              opacity: 0;
              cursor: pointer;
              height: 0;
              width: 0;
            }
            .checkmark {
              position: absolute;
              top: 0;
              left: 0;
              height: 30px;
              width: 30px;
              border: 1px solid grey;
            }

            /* On mouse-over, add a grey background color */
            .custom-checkbox:hover input ~ .checkmark {
              border: 1px solid #2196F3;
            }

            /* When the checkbox is checked, add a blue background */
            .custom-checkbox input:checked ~ .checkmark {
              background-color: #2196F3;
              border:none;
            }

            /* Create the checkmark/indicator (hidden when not checked) */
            .checkmark:after {
              content: "";
              position: absolute;
              display: none;
            }

            /* Show the checkmark when checked */
            .custom-checkbox input:checked ~ .checkmark:after {
              display: block;
            }

            /* Style the checkmark/indicator */
            .custom-checkbox .checkmark:after {
              left: 11px;
              top: 5px;
              width: 9px;
              height: 15px;
              border: solid white;
              border-width: 0 3px 3px 0;
              -webkit-transform: rotate(45deg);
              -ms-transform: rotate(45deg);
              transform: rotate(45deg);
            }
            textarea{
                height: 100px;
                margin-left: 90px;
                width: 100%;
                display:none;
            }

            .btnGroup{
                padding: 5px 0 0 90px;
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
                                <li class="breadcrumb-item active">Device Search </li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div><!-- page-sub-Header end-->
        <div class="page-content">
            <div class="container-fluid">
<%--                <div class="row">
                    <div class="col-lg-12">
                        <div class="portlet-box portlet-gutter ui-buttons-col mb-30">
                            <div class="portlet-header">
                                    <div class="row">
                                    <div class="col-md-5 ml-2">
                                        <h2>Search for your device</h2> 
                                    </div>
                                    <div class="col-md-4">
                                        <div class="input-group pt-10">
                                            <input type="text" id="txtAssetTag" class="form-control" aria-label="Large" placeholder="ENTER YOUR ASSET TAG" aria-describedby="basic-addon2"/>
                                            <div class="input-group-append">
                                                <span class="input-group-text btnSearchAssets" id="basic-addon2"><i class="icon-Magnifi-Glass2"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row deviceDisplay">
                            <div class="col-sm-12">
                                <div class="portlet-box portlet-gutter ui-buttons-col mb-30">
                                    <div class="portlet-header flex-row flex align-items-center b-b ml-10">
                                        <div class="flex d-flex flex-column">
                                            <h3>Your Device  <span id="spnAssetTag" style="font-weight:100;"></span> </h3>
                                            <span class="portlet-subtitle"></span>
                                        </div>
                                        <button class="btn btn-danger mr-1 btnRepairReq">Submit Repair Request</button>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="portlet-body">
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <input type="hidden" id="invkey" />
                                                        <div class="divProbs">
                                                            <b>Check all that apply:</b>
                                                            <p></p>
                                                            <label class="custom-checkbox normal-issue">
                                                                <span>Screen Damaged</span>
                                                                <input type="checkbox"/>
                                                                <span class="checkmark"></span>
                                                            </label>
                                                            <label class="custom-checkbox normal-issue">
                                                                <span>Keyboard Not Working</span>
                                                                <input type="checkbox"/>
                                                                <span class="checkmark"></span>
                                                            </label>
                                                            <label class="custom-checkbox normal-issue">
                                                                <span>Keyboard Missing Key(s)</span>
                                                                <input type="checkbox"/>
                                                                <span class="checkmark"></span>
                                                            </label>
                                                            <label class="custom-checkbox normal-issue">
                                                                <span>Trackpad Not Working</span>
                                                                <input type="checkbox"/>
                                                                <span class="checkmark"></span>
                                                            </label>
                                                            <label class="custom-checkbox normal-issue">
                                                                <span>Hinges Damaged</span>
                                                                <input type="checkbox"/>
                                                                <span class="checkmark"></span>
                                                            </label>
                                                            <label class="custom-checkbox normal-issue">
                                                                <span>Apps Missing</span>
                                                                <input type="checkbox"/>
                                                                <span class="checkmark"></span>
                                                            </label>
                                                            <label class="custom-checkbox normal-issue">
                                                                <span>WiFi Not Working</span>
                                                                <input type="checkbox"/>
                                                                <span class="checkmark"></span>
                                                            </label>
                                                            <label class="custom-checkbox normal-issue">
                                                                <span>Power Adapter Damaged</span>
                                                                <input type="checkbox"/>
                                                                <span class="checkmark"></span>
                                                            </label>
                                                            <label class="custom-checkbox other-issue">Other
                                                                <input type="checkbox"/>
                                                                <span class="checkmark"></span>
                                                            </label>
                                                            <textarea class="other-issue-content"></textarea>
                                                        </div>
                                                        <div class="btnGroup">
                                                            <button class="btn btn-primary mr-1 mb-2 repair-req-btn">Submit</button>
                                                            <button onclick="javascript:searchAssets();" type="button" class="btn btn-danger mr-1 mb-2">Cancel</button>
                                                        </div>
                                                        <div class="assetInfo">
                                                            <div><b>Model:</b><span id="txtModel"></span></div>
                                                            <div><b>Serial Number:</b><span id="txtSerialNum"></span></div>
                                                            <div><b>Student ID:</b><span id="txtStudentID"></span></div>
                                                            <div><b>Student:</b><span id="txtStudent"></span></div>
                                                            <div><b>Status:</b><span id="txtStatus"></span></div>
                                                        </div>
                                                        <div class="msgSubmitted"><h1>Your repair request has been submitted</h1></div>
                                                    </div>

                                                    <div class="col-sm-6">
                                                        <div class="flex d-flex flex-column mb-20">
                                                            <div class="divAssetInfo2">
                                                                <div><b>Model:</b><span class="txtModel"></span></div>
                                                                <div><b>Serial Number:</b><span class="txtSerialNum"></span></div>
                                                                <div><b>Student:</b><span class="txtStudent"></span></div>

                                                            </div>
                                                            <div class="divImg">
                                                                <div id="divAssetImg"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>
                <div class="bg-white table-responsive rounded shadow-sm pt-3 pb-3 mb-30">
                    <h6 class="pl-3 pr-3 text-capitalize font400 mb-20">Search for your device, or scan</h6>
                    <table id="data-table" class="table-compact mb-0 table-striped" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th>Model</th>
                                <th>Serail Num</th>
                                <th>MAC</th>
                                <th>Student</th>
                                <th>AssetTag</th>
                                <th>Status</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody id="Inventorylist" runat="server">
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div id="divNoResults" style='margin-left:20px; font-size:20px; display:none;'>
            <i class='far fa-frown'></i>
            <span style='margin-left:3px;'>Your search did not return results. Please try again.</span>
        </div>
        <script type="text/javascript" src="lib/data-tables/jquery.dataTables.min.js"></script> 
        <script type="text/javascript" src="lib/data-tables/dataTables.bootstrap4.min.js"></script> 
        <script type="text/javascript" src="lib/data-tables/dataTables.responsive.min.js"></script> 
        <script type="text/javascript" src="lib/data-tables/responsive.bootstrap4.min.js"></script> 
        <script src="js/plugins-custom/datatables-custom.js"></script>
        <script>
            $(document).ready(function () {
                $(".deviceDisplay").hide();
                $(".divProbs").hide();
                $(".divAssetInfo2").hide();
                $(".btnGroup").hide();
                $(".msgSubmitted").hide();

                $(".devices").addClass("active");

                $('input[type="search"').focus();

            });
            function init() {
                $("#txtModel, #txtSerialNum, #txtStudentID, #txtStudent").text("");
                $("#txtAssetTag").val("");
                $(".custom-checkbox input").each(function () {
                    if ($(this).attr("class") == "checked") $(this).trigger("click");
                });
            }
            $(".btnSearchAssets").click(function () {
                searchAssets();
            });

            function searchAssets() {
                $("#loader-wrapper").show();

                $.ajax({
                    type: "POST",
                    url: "devices.aspx/SearchAssets",
                    data: JSON.stringify({ assetNum: $('#txtAssetTag').val() }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d) {
                            console.log(response.d);
                            var strResponse = JSON.stringify(response.d);
                            var strParse = JSON.parse(strResponse);
                            $("#divNoResults").hide();
                            if ($(".deviceDisplay").is(":hidden")) {
                                $(".deviceDisplay").slideToggle();
                            }
                            $("#invkey").val(strParse.inventoryKey);
                            $("#txtStatus").text(strParse.invStatus);
                            var deviceStatus = strParse.invStatus;
                            $("#txtModel").text(strParse.model);
                            $("#txtStudent").text(strParse.userEmail);
                            $("#txtStudentID").text(strParse.studentID);
                            $("#txtSerialNum").text(strParse.serialNum);
                            $(".txtModel").text(strParse.model);
                            $(".txtStudent").text(strParse.userEmail);
                            $(".txtSerialNum").text(strParse.serialNum);
                            $("#spnAssetTag").html('&nbsp <span>Asset# ' + $('#txtAssetTag').val() + '</span>');
                            $("#divAssetImg").html('<img src="' + strParse.imgLink + '" />');
                            $("#txtAssetTag").val("");
                            $(".custom-checkbox input").each(function () {
                                if ($(this).attr("class") == "checked") $(this).trigger("click");
                            });

                            $(".assetInfo").show();
                            $(".divAssetInfo2").hide();

                            $(".divImg").show();
                            $(".divProbs").hide();
                            $(".btnGroup").hide();
                            if (deviceStatus == 'Submitted For Repair') {
                                $(".btnRepairReq").hide();
                            } else {
                                $(".btnRepairReq").show();
                            }
                            $(".msgSubmitted").hide();


                        } else {
                            $("#divNoResults").show();
                            console.log(response.d);
                        }
                        $("#loader-wrapper").hide();

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
                        $("#loader-wrapper").hide();

                    }
                });
            }

            $(".btn-RepairReq").click(function () {

                var devStat = $(this).attr("deviceStatus");
                var invKey = $(this).attr("id");

                if (devStat == "Submitted For Repair" || devStat == "Repair In Progress" || devStat == "Repair Complete" || devStat == "Lost/Stolen") {
                    //toastr.danger("You cannot submit a repair request with device in this status");
                    toastr["error"]("Repair request unavailable for device in this status", "Error");
                } else {
                    window.location.href = '/repair.aspx?inventorykey='+ invKey;
                }
            });

            $(".other-issue input").click(function () {
                $(".other-issue-content").slideToggle();
            });

            $(".normal-issue input, .other-issue input").click(function () {
                $(this).toggleClass("checked");
            });

        </script>

    </asp:Content>

