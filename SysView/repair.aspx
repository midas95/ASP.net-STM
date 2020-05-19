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
            .repair-req-btn{
                font-size:17px !important;
                float:right;
                margin-top: -20px;
            }
            .repair-req-btn:hover{
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
                                            <input type="text" id="txtAssetTag" class="form-control" aria-label="Large" placeholder="ENTER YOUR ASSET TAG" aria-label="Asset Tag" aria-describedby="basic-addon2"/>
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
                    <div class="col-sm-12">
                    <div class="portlet-box portlet-gutter ui-buttons-col mb-30">
                        <div class="portlet-header flex-row flex align-items-center b-b ml-10">
                            <div class="flex d-flex flex-column">
                                <h3>Your Device  <span id="spnAssetTag" style="font-weight:100;"></span> </h3>
                                <span class="portlet-subtitle"></span>
                            </div>
                            <span class="badge text-danger-light badge-danger badge-text anibadge repair-req-btn">Repair Request</span>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="portlet-body">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <input type="hidden" id="invkey" />
                                            <div><b>Model:</b><span id="txtModel"></span></div>
                                            <div><b>Serial Number:</b><span id="txtSerialNum"></span></div>
                                            <div><b>Student ID:</b><span id="txtStudentID"></span></div>
                                            <div><b>Student:</b><span id="txtStudent"></span></div>
                                            <div>
                                                <b>Problems:</b>
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
        <script>
            $(document).ready(function () {
                $(".deviceDisplay").hide();
            });
            function init() {
                $("#txtModel, #txtSerialNum, #txtStudentID, #txtStudent").text("");
                $("#txtAssetTag").val("");
                $(".custom-checkbox input").each(function () {
                    if ($(this).attr("class") == "checked") $(this).trigger("click");
                });
            }
            $(".btnSearchAssets").click(function () {
                $("#loader-wrapper").show();

                $.ajax({
                     type: "POST",
                     url: "repair.aspx/SearchAssets",
                     data: JSON.stringify({ assetNum: $('#txtAssetTag').val() }),
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     success: function (response) {
                         if (response.d) {
                             console.log(response.d);
                             var strResponse = JSON.stringify(response.d);
                             var strParse = JSON.parse(strResponse);
                             $("#divNoResults").hide();
                             $(".deviceDisplay").show();
                             $("#invkey").val(strParse.inventoryKey);
                             $("#txtModel").text(strParse.model);
                             $("#txtStudent").text(strParse.userEmail);
                             $("#txtSerialNum").text(strParse.serialNum);
                             $("#spnAssetTag").html('&nbsp <span>Asset# ' +$('#txtAssetTag').val()+'</span>');
                             $("#divAssetImg").html('<img src="' + strParse.imgLink + '" />');
                             //$("#txtAssetTag").val("");
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
            })

            $(".other-issue input").click(function () {
                $(".other-issue-content").slideToggle();
            });
            $(".normal-issue input, .other-issue input").click(function () {
                $(this).toggleClass("checked");
            });
            $(".repair-req-btn").click(function () {
               
                var invkey = $("#invkey").val();
                var problem_arr = [];
                var problemNotes = "";
                $(".normal-issue").each(function () {
                    if ($(this).children("input").attr("class") == "checked") problem_arr.push($(this).children("span:first-child").text());
                });
                var problems = (problem_arr.length > 0) ? problem_arr.join(",") : "";
                if ($(".other-issue input").attr("class") == "checked") problemNotes = $(".other-issue-content").val();

                if (problems == "" && problemNotes == "") {
                    toastr.warning("Please select reason to be repaired");
                } else {
                    $("#loader-wrapper").show();
                    $.ajax({
                        type: "POST",
                        url: "repair.aspx/InsertRepairs",
                        data: JSON.stringify({ invkey: invkey, problems: problems, problemNotes: problemNotes }),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            console.log(response.d);
                            if (response.d) {
                                toastr.success("Request was sent successfully");
                                init();
                            } else {
                                toastr.warning("Something went wrong during repair request");
                            }

                            $("#loader-wrapper").hide();

                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            toastr.danger("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
                            $("#loader-wrapper").hide();
                        }
                    });
                }

            });

        </script>

    </asp:Content>

