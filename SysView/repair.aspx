<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="repair.aspx.cs" Inherits="repair" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                                                    <input type="text" class="form-control" aria-label="Large" placeholder="ENTER YOUR ASSET TAG" aria-label="Asset Tag" aria-describedby="basic-addon2">
                                                    <div class="input-group-append">
                                                        <span class="input-group-text" id="basic-addon2"><i class="icon-Magnifi-Glass2"></i></span>
                                                    </div>
                                                </div>
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
                                            <h3>Search for your device</h3> 
                                            <span class="portlet-subtitle">Enter your asset tag to start your repair request</span>
                                        </div>
                                    </div>
                                    <div class="portlet-body">
                                        <div class="form-group">
                                            <label>Text</label>
                                            <input type="text" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input type="email" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input type="password" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>Placeholder</label>
                                            <input type="text" class="form-control" placeholder="Placeholder">
                                        </div>
                                        <div class="form-group">
                                            <label for='txt1'>label for</label>
                                            <input id='txt1' type="text" class="form-control" placeholder="Placeholder">
                                        </div>
                                        <div class="form-group">
                                            <label>Disabled</label>
                                            <input type="text" class="form-control disabled" placeholder="Disabled">
                                        </div>
                                        <div class="form-group">
                                            <label>Readonly</label>
                                            <input type="text" readonly="" class="form-control" placeholder="Placeholder">
                                        </div>
                                        <div class="form-group">
                                            <label>Readonly Plain Text</label>
                                            <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="email@example.com">
                                        </div>
                                    </div>
                                </div><!--portlet-->
                                <div class="portlet-box portlet-gutter ui-buttons-col mb-30">
                                    <div class="portlet-header flex-row flex d-flex align-items-center b-b">
                                        <div class="flex d-flex flex-column">
                                            <h3>Input icons</h3> 
                                            <span class="portlet-subtitle">Bootstrap Default Form elements</span>
                                        </div>
                                    </div>
                                    <div class="portlet-body">
                                        <div class="input-icon-group">
                                            <div class='input-icon-append'>
                                                <i class="far fa-user"></i>
                                                <input placeholder="Icon left align" type="text" class="form-control">
                                            </div>
                                        </div>
                                        <div class="input-icon-group input-icon-right">
                                            <div class='input-icon-append'>
                                                <i class="far fa-user"></i>
                                                <input placeholder="Icon right align" type="text" class="form-control">
                                            </div>
                                        </div>
                                        <div class="input-icon-group input-icon-sm">
                                            <div class='input-icon-append'>
                                                <i class="far fa-user"></i>
                                                <input placeholder="Icon left align - Small" type="text" class="form-control">
                                            </div>
                                        </div>
                                        <div class="input-icon-group input-icon-sm input-icon-right">
                                            <div class='input-icon-append'>
                                                <i class="far fa-user"></i>
                                                <input placeholder="Icon right align - Small" type="text" class="form-control">
                                            </div>
                                        </div>
                                        <div class="input-icon-group input-icon-lg">
                                            <div class='input-icon-append'>
                                                <i class="far fa-user"></i>
                                                <input placeholder="Icon left align - Large" type="text" class="form-control">
                                            </div>
                                        </div>
                                        <div class="input-icon-group input-icon-lg input-icon-right">
                                            <div class='input-icon-append'>
                                                <i class="far fa-user"></i>
                                                <input placeholder="Icon right align - Large" type="text" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                </div><!--portlet-->
                                <div class="portlet-box portlet-gutter ui-buttons-col mb-30">
                                    <div class="portlet-header flex-row flex d-flex align-items-center b-b">
                                        <div class="flex d-flex flex-column">
                                            <h3>Checkboxes and Radios</h3> 
                                            <span class="portlet-subtitle">Bootstrap Default Form elements</span>
                                        </div>
                                    </div>
                                    <div class="portlet-body">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                                            <label class="form-check-label" for="defaultCheck1">
                                                Default checkbox
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="defaultCheck2" disabled>
                                            <label class="form-check-label" for="defaultCheck2">
                                                Disabled checkbox
                                            </label>
                                        </div>
                                        <br>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
                                            <label class="form-check-label" for="exampleRadios1">
                                                Default radio
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2">
                                            <label class="form-check-label" for="exampleRadios2">
                                                Second default radio
                                            </label>
                                        </div>
                                        <div class="form-check disabled">
                                            <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios3" value="option3" disabled>
                                            <label class="form-check-label" for="exampleRadios3">
                                                Disabled radio
                                            </label>
                                        </div>
                                        <div class="pt-30">
                                            <span class=" d-block pb-20 font600">Inline</span>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                                                <label class="form-check-label" for="inlineCheckbox1">1</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
                                                <label class="form-check-label" for="inlineCheckbox2">2</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3" disabled>
                                                <label class="form-check-label" for="inlineCheckbox3">3 (disabled)</label>
                                            </div><br><br>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                                                <label class="form-check-label" for="inlineRadio1">1</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                                                <label class="form-check-label" for="inlineRadio2">2</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3" disabled>
                                                <label class="form-check-label" for="inlineRadio3">3 (disabled)</label>
                                            </div>
                                            <div class="pt-30">
                                                <span class="font600 d-block mb-10">Without label</span>
                                                <div class="form-check">
                                                    <input class="form-check-input position-static" type="checkbox" id="blankCheckbox" value="option1" aria-label="...">
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input position-static" type="radio" name="blankRadio" id="blankRadio1" value="option1" aria-label="...">
                                                </div>
                                            </div>
                                            <div class="pt-30">
                                                <span class="font600 d-block mb-10">Custom checkbox</span>
                                                <div class="custom-control custom-checkbox mr-sm-2">
                                                    <input type="checkbox" class="custom-control-input" id="customControlAutosizing">
                                                    <label class="custom-control-label" for="customControlAutosizing">Remember my preference</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div><!--portlet-->
                            </div>
                            <div class="col-lg-6">
                                <div class="portlet-box portlet-gutter ui-buttons-col mb-30">
                                    <div class="portlet-header flex-row flex d-flex align-items-center b-b">
                                        <div class="flex d-flex flex-column">
                                            <h3>Input Sizes</h3> 
                                            <span class="portlet-subtitle">Bootstrap Default Form elements</span>
                                        </div>
                                    </div>
                                    <div class="portlet-body">
                                        <div class="form-group">
                                            <input type="text" placeholder='Small' class="form-control form-control-sm">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" placeholder='Default' class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" placeholder='Large' class="form-control form-control-lg">
                                        </div>
                                    </div>
                                </div><!--portlet-->
                                <div class="portlet-box portlet-gutter ui-buttons-col mb-30">
                                    <div class="portlet-header flex-row flex d-flex align-items-center b-b">
                                        <div class="flex d-flex flex-column">
                                            <h3>Input Groups</h3> 
                                            <span class="portlet-subtitle">Bootstrap Default Form elements</span>
                                        </div>
                                    </div>
                                    <div class="portlet-body">
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text" id="basic-addon1">@</span>
                                            </div>
                                            <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
                                        </div>


                                        <label for="basic-url">Your vanity URL</label>
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text" id="basic-addon3">https://example.com/users/</span>
                                            </div>
                                            <input type="text" class="form-control" id="basic-url" aria-describedby="basic-addon3">
                                        </div>

                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">$</span>
                                            </div>
                                            <input type="text" class="form-control" aria-label="Amount (to the nearest dollar)">
                                            <div class="input-group-append">
                                                <span class="input-group-text">.00</span>
                                            </div>
                                        </div>

                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">With textarea</span>
                                            </div>
                                            <textarea class="form-control" aria-label="With textarea"></textarea>
                                        </div>
                                        <div class='pt-30 pb-30 b-t mt-30'>
                                            <div class="input-group input-group-sm mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="inputGroup-sizing-sm">Small</span>
                                                </div>
                                                <input type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
                                            </div>

                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="inputGroup-sizing-default">Default</span>
                                                </div>
                                                <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default">
                                            </div>

                                            <div class="input-group input-group-lg">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="inputGroup-sizing-lg">Large</span>
                                                </div>
                                                <input type="text" class="form-control" aria-label="Large" aria-describedby="inputGroup-sizing-sm">
                                            </div>
                                        </div>
                                    </div>
                                </div><!--portlet-->
                                <div class="portlet-box portlet-gutter ui-buttons-col mb-30">
                                    <div class="portlet-header flex-row flex d-flex align-items-center b-b">
                                        <div class="flex d-flex flex-column">
                                            <h3>Select Input</h3> 
                                            <span class="portlet-subtitle">Bootstrap Default Form elements</span>
                                        </div>
                                    </div>
                                    <div class="portlet-body">
                                        <select class="form-control mb-20 form-control-lg">
                                            <option>Large select</option>
                                        </select>
                                        <select class="form-control mb-20">
                                            <option>Default select</option>
                                        </select>
                                        <select class="form-control form-control-sm">
                                            <option>Small select</option>
                                        </select>
                                    </div>
                                </div><!--portlet-->
                                <div class="portlet-box portlet-gutter ui-buttons-col mb-30">
                                    <div class="portlet-header flex-row flex d-flex align-items-center b-b">
                                        <div class="flex d-flex flex-column">
                                            <h3>Select File</h3> 
                                            <span class="portlet-subtitle">Bootstrap Default Form elements</span>
                                        </div>
                                    </div>
                                    <div class="portlet-body">
                                        <form>
                                            <div class="form-group">
                                                <label for="exampleFormControlFile1">Example file input</label>
                                                <input type="file" class="form-control-file" id="exampleFormControlFile1">
                                            </div>
                                        </form>
                                        <div class="custom-file">
  <input type="file" class="custom-file-input" id="customFile">
  <label class="custom-file-label" for="customFile">Choose file</label>
</div>
                                    </div>
                                </div><!--portlet-->
                            </div>
                        </div><!--row-->
                    </div>
                </div><!-- main end-->

    </asp:Content>

