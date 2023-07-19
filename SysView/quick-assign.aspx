<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="quick-assign.aspx.cs" Inherits="QuickAssign" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <style>
            .studentRow:hover {
                cursor:pointer;
            }
            .selectedRow {
                background: #7a7c93 !important;
                color: white;
            }
        </style>
         <div class="container-fluid">
            <div class="row align-items-center mb-30 pt-30">
                <div class="col-md-12 mr-auto ml-auto">
                    <div class="mb-0">
                        <button class='float-right btn btn-info btn-quick-assign'>
                            Assign
                        </button>
                        <h4>Quick Assign</h4>
                        <p>To assign a device to a student, select a student from the list, then select a device, then click the "Assign" button</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <label>Teacher
            <select id="Teacherlist" runat="server" onchange="handleSelectChange()">                
            </select>
                </label>

        </div>
        <div class="container-fluid">
            <div class="bg-white table-responsive rounded shadow-sm pt-3 pb-3 mb-30">
                <h6 class="pl-3 pr-3 text-capitalize font400 mb-20">Student list</h6>
               
                
                <table id="data-table" class="mb-0 table-striped" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Email</th>
                            <th>Grade</th>
                            <th>Teacher</th>
                            <th>UserStatus</th>
                        </tr>
                    </thead>
                    <tbody id="Studentlist" runat="server">
                    </tbody>
                </table>
            </div>
        </div>
        <div class="container-fluid">
            <div class="bg-white table-responsive rounded shadow-sm pt-3 pb-3 mb-30">
                <h6 class="pl-3 pr-3 text-capitalize font400 mb-20">Device list</h6>
                  <table id="data-table-device" class="mb-0 table-striped" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>Model</th>
                            <th>Serial</th>
                            <th>Last User</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody id="Devicelist" runat="server">
                    </tbody>
                </table>
            </div>
        </div>

        
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">Select Device</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
        <div class="row justify-content-center">         
        <input id="search" class="form-control mr-sm-2" type="search" placeholder="Input the Serial" aria-label="Search"/>       
         <table id="data-table-device-modal" class="mb-0 table-striped" cellspacing="0" width="100%" style="display:none;">
                    <thead>
                        <tr>
                            <th>Model</th>
                            <th>Serial</th>                            
                            <th>Status</th>
                            <th>Assign</th>
                        </tr>
                    </thead>
                    <tbody id="DeviceModal" runat="server">
                    </tbody>
                </table>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      
      </div>
    </div>
  </div>
</div>
        <script type="text/javascript" src="lib/data-tables/jquery.dataTables.min.js"></script> 
        <script type="text/javascript" src="lib/data-tables/dataTables.bootstrap4.min.js"></script> 
        <script type="text/javascript" src="lib/data-tables/dataTables.responsive.min.js"></script> 
        <script type="text/javascript" src="lib/data-tables/responsive.bootstrap4.min.js"></script> 
        <script src="js/plugins-custom/datatables-custom.js"></script>
         <script>
            //const { select } = require("d3-selection");
             var myInput = document.getElementById("search");
             var keysPressed = [];

             myInput.addEventListener("keydown", function (event) {
                 keysPressed.push(event.key);
                 keystring = keysPressed.join("");
                // console.log("Keys pressed:", keysPressed);
                 //console.log(keystring);
                 var modal_table = document.getElementById("data-table-device-modal");
                 modal_table.style.display = "table";
                 var table = $('#data-table-device-modal').DataTable();                 
                 table.search(this.value).draw();
                

             });
        
            $(document).ready(function () {
                 $('#data-table-device').DataTable({});
                 $('#myModal').on('shown.bs.modal', function () {
                    $('#search').val('');
                     $('#search').focus();
                 });
                 $('#myModal').on('hidden.bs.modal', function () {
                     var modal_table = document.getElementById("data-table-device-modal");
                     modal_table.style.display = "none";
                     
                    
                 });

             });
            var studentKey = "";
             var inventoryKey = "";

            $(".student").addClass("active");
            $(".studentRow").click(function () {
                $(".studentRow").removeClass("selectedRow");
                $(this).addClass("selectedRow");
                $('#myModal').modal('show');
                console.log(inventoryKey);                  
                  $(this).off('click');
                  $(this).css('background-color', 'green');
                studentKey = $(this).data("studentkey");
                
            });
           
             $(".invRow").click(function () {
                $(".invRow").removeClass("selectedRow");
                $(this).addClass("selectedRow");
                 inventoryKey = $(this).data("inventorykey");
                 
              
             });
             $(".btn-quick-assign-modal").click(function () {
                 $(".invRow").removeClass("selectedRow");
                 $(".invRow").addClass("selectedRow");
                 inventoryKey = $(".invRow").data("inventorykey");
                 var valid = true;
                 if (studentKey == "" && inventoryKey != "") {
                     alert("Please select one student.");
                     valid = false;
                 }
                 if (studentKey != "" && inventoryKey == "") {
                     alert("Please select one device.");
                     valid = false;
                 }
                 if (studentKey == "" && inventoryKey == "") {
                     valid = false;
                     alert("Please select one student and one device.");
                 }

                 if (valid) {
                     $(".btn-quick-assign").attr("disabled", "disabled");
                     $(".btn-quick-assign").text("Updating...");
                     $.ajax({
                         type: "POST",
                         url: "quick-assign.aspx/quick_assign",
                         data: JSON.stringify({
                             studentKey: studentKey,
                             inventoryKey: inventoryKey
                         }),
                         contentType: "application/json; charset=utf-8",
                         dataType: "json",
                         success: function (response) {
                             $(".btn-quick-assign").removeAttr("disabled");
                             $(".btn-quick-assign").text("Assign");
                             studentKey = "";
                             inventoryKey = "";
                             $(".selectedRow").removeClass("selectedRow");
                             toastr.success("That student and device are assigned successfully");
                         },
                         error: function (XMLHttpRequest, textStatus, errorThrown) {
                             console.log(errorThrown);
                             toastr.error("Something wrong");
                         }

                     });
                 }

             })
            $(".btn-quick-assign").click(function () {
                var valid = true;
                if (studentKey == "" && inventoryKey != "") {
                    alert("Please select one student.");
                    valid = false;
                }
                if (studentKey != "" && inventoryKey == "") {
                    alert("Please select one device.");
                    valid = false;
                }
                if (studentKey == "" && inventoryKey == "") {
                    valid = false;
                    alert("Please select one student and one device.");
                }

                if (valid) {
                    $(".btn-quick-assign").attr("disabled", "disabled");
                    $(".btn-quick-assign").text("Updating...");
                    $.ajax({
                        type: "POST",
                        url: "quick-assign.aspx/quick_assign",
                        data: JSON.stringify({
                            studentKey: studentKey,
                            inventoryKey: inventoryKey
                        }),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            $(".btn-quick-assign").removeAttr("disabled");
                            $(".btn-quick-assign").text("Assign");
                            studentKey = "";
                            inventoryKey = "";
                            $(".selectedRow").removeClass("selectedRow");
                            toastr.success("That student and device are assigned successfully");
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            console.log(errorThrown);
                            toastr.error("Something wrong");
                        }

                    });
                }

            });

             function handleSelectChange() {
                 var table = $('#data-table').DataTable();
                 table.page.len(50).draw();

                 var selectedValue = document.getElementById("ContentPlaceHolder1_Teacherlist").value;
                 console.log(selectedValue);
                 table.column(4).search(selectedValue).draw();
                 // Do something with the selected value
                 // For example, display it in an alert box
             }
         </script>
    </asp:Content>

