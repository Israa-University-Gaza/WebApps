﻿<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="datepicaer.aspx.cs" Inherits="APP_HRM_Emp_Vacation_Exit_AddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
        <link href="../assets/datepicker/clockface.css" rel="stylesheet" />
    <link href="../assets/datepicker/datepicker3.css" rel="stylesheet" />
    <link href="../assets/datepicker/daterangepicker-bs3.css" rel="stylesheet" />
    <link href="../assets/datepicker/datetimepicker.css" rel="stylesheet" />


<script type="text/javascript" src="../assets/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="../assets/datepicker/bootstrap-timepicker.min.js"></script>
<script type="text/javascript" src="../assets/datepicker/clockface.js"></script>
<script type="text/javascript" src="../assets/datepicker/moment.min.js"></script>
<script type="text/javascript" src="../assets/datepicker/daterangepicker.js"></script>
<script type="text/javascript" src="../assets/datepicker/bootstrap-colorpicker.js"></script>
<script type="text/javascript" src="../assets/datepicker/bootstrap-datetimepicker.min.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="../assets/datepicker/metronic.js" type="text/javascript"></script>

<script src="../assets/datepicker/quick-sidebar.js" type="text/javascript"></script>
<script src="../assets/datepicker/demo.js" type="text/javascript"></script>
<script src="../assets/datepicker/components-pickers.js"></script>
   <script>
    jQuery(document).ready(function () {
       
        QuickSidebar.init(); // init quick sidebar
        Demo.init(); // init demo features
        ComponentsPickers.init();
        
    });
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="index.html" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">نشاطات عامة</a></li>
    </ul>
   
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
   <%--<div id="success1" class="alert alert-success" runat="server">
        <asp:Label ID="msg" runat="server" Text=""></asp:Label>
    </div>--%>
     	<div class="row">
				<div class="col-md-12">
					<!-- BEGIN PORTLET-->
					<div class="portlet box blue">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-gift"></i>Date Pickers
							</div>
							<div class="tools">
								<a href="javascript:;" class="collapse">
								</a>
								<a href="#portlet-config" data-toggle="modal" class="config">
								</a>
								<a href="javascript:;" class="reload">
								</a>
								<a href="javascript:;" class="remove">
								</a>
							</div>
						</div>
						<div class="portlet-body form">
							<!-- BEGIN FORM-->
							<div class="form-horizontal form-bordered">
								<div class="form-body">
									<div class="form-group">
										<label class="control-label col-md-3">Default Datepicker</label>
										<div class="col-md-3">
											<input class="form-control form-control-inline input-medium date-picker" size="16" type="text" value=""/>
											<span class="help-block">
											Select date </span>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">Disable Past Dates</label>
										<div class="col-md-3">
											<div class="input-group input-medium date date-picker" data-date-format="dd-mm-yyyy" data-date-start-date="+0d">
												<input type="text" class="form-control" readonly>
												<span class="input-group-btn">
												<button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
												</span>
											</div>
											<!-- /input-group -->
											<span class="help-block">
											Select date </span>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">Start With Years</label>
										<div class="col-md-3">
											<div class="input-group input-medium date date-picker" data-date="12-02-2012" data-date-format="dd-mm-yyyy" data-date-viewmode="years">
												<input type="text" class="form-control" readonly>
												<span class="input-group-btn">
												<button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
												</span>
											</div>
											<!-- /input-group -->
											<span class="help-block">
											Select date </span>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">Months Only</label>
										<div class="col-md-3">
											<div class="input-group input-medium date date-picker" data-date="10/2012" data-date-format="mm/yyyy" data-date-viewmode="years" data-date-minviewmode="months">
												<input type="text" class="form-control" readonly>
												<span class="input-group-btn">
												<button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
												</span>
											</div>
											<!-- /input-group -->
											<span class="help-block">
											Select month only </span>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">Date Range</label>
										<div class="col-md-4">
											<div class="input-group input-large date-picker input-daterange" data-date="10/11/2012" data-date-format="mm/dd/yyyy">
												<input type="text" class="form-control" name="from">
												<span class="input-group-addon">
												to </span>
												<input type="text" class="form-control" name="to">
											</div>
											<!-- /input-group -->
											<span class="help-block">
											Select date range </span>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">Inline</label>
										<div class="col-md-3">
											<div class="date-picker" data-date-format="mm/dd/yyyy">
											</div>
										</div>
									</div>
									<div class="form-group last">
										<label class="control-label col-md-3"></label>
										<div class="col-md-3">
											<a class="btn yellow" href="#form_modal2" data-toggle="modal">
											View Datepicker in modal <i class="fa fa-share"></i>
											</a>
										</div>
									</div>
								</div>
							</div>
							<div id="form_modal2" class="modal fade" role="dialog" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
											<h4 class="modal-title">Datepickers In Modal</h4>
										</div>
										<div class="modal-body">
											<div class="form-horizontal">
												<div class="form-group">
													<label class="control-label col-md-4">Default Datepicker</label>
													<div class="col-md-8">
														<input class="form-control input-medium date-picker" size="16" type="text" value=""/>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-4">Disable Past Dates</label>
													<div class="col-md-8">
														<div class="input-group input-medium date date-picker" data-date-format="dd-mm-yyyy" data-date-start-date="+0d">
															<input type="text" class="form-control" readonly>
															<span class="input-group-btn">
															<button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
															</span>
														</div>
														<!-- /input-group -->
														<span class="help-block">
														Select date </span>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-4">Start With Years</label>
													<div class="col-md-8">
														<div class="input-group input-medium date date-picker" data-date="12-02-2012" data-date-format="dd-mm-yyyy" data-date-viewmode="years">
															<input type="text" class="form-control" readonly>
															<span class="input-group-btn">
															<button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
															</span>
														</div>
														<!-- /input-group -->
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-4">Months Only</label>
													<div class="col-md-8">
														<div class="input-group input-medium date date-picker" data-date="10/2012" data-date-format="mm/yyyy" data-date-viewmode="years" data-date-minviewmode="months">
															<input type="text" class="form-control" readonly>
															<span class="input-group-btn">
															<button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
															</span>
														</div>
														<!-- /input-group -->
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-4">Date Range</label>
													<div class="col-md-8">
														<div class="input-group input-medium date-picker input-daterange" data-date="10/11/2012" data-date-format="mm/dd/yyyy">
															<input type="text" class="form-control" name="from">
															<span class="input-group-addon">
															to </span>
															<input type="text" class="form-control" name="to">
														</div>
														<!-- /input-group -->
													</div>
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
											<button class="btn green" data-dismiss="modal">Save changes</button>
										</div>
									</div>
								</div>
							</div>
							<!-- END FORM-->
						</div>
					</div>
					<!-- END PORTLET-->
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN PORTLET-->
					<div class="portlet box green-meadow">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-gift"></i>Datetime Pickers
							</div>
							<div class="tools">
								<a href="javascript:;" class="collapse">
								</a>
								<a href="#portlet-config" data-toggle="modal" class="config">
								</a>
								<a href="javascript:;" class="reload">
								</a>
								<a href="javascript:;" class="remove">
								</a>
							</div>
						</div>
						<div class="portlet-body form">
							<!-- BEGIN FORM-->
							<div  class="form-horizontal form-bordered">
								<div class="form-body">
									<div class="form-group">
										<label class="control-label col-md-3">Default Datetimepicker</label>
										<div class="col-md-4">
											<div class="input-group date form_datetime">
												<input type="text" size="16" readonly class="form-control">
												<span class="input-group-btn">
												<button class="btn default date-set" type="button"><i class="fa fa-calendar"></i></button>
												</span>
											</div>
											<!-- /input-group -->
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">Advance Datetimepicker</label>
										<div class="col-md-4">
											<div class="input-group date form_datetime" data-date="2012-12-21T15:25:00Z">
												<input type="text" size="16" readonly class="form-control">
												<span class="input-group-btn">
												<button class="btn default date-reset" type="button"><i class="fa fa-times"></i></button>
												</span>
												<span class="input-group-btn">
												<button class="btn default date-set" type="button"><i class="fa fa-calendar"></i></button>
												</span>
											</div>
											<!-- /input-group -->
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">Meridian Format</label>
										<div class="col-md-4">
											<div class="input-group date form_meridian_datetime" data-date="2012-12-21T15:25:00Z">
												<input type="text" size="16" readonly class="form-control">
												<span class="input-group-btn">
												<button class="btn default date-reset" type="button"><i class="fa fa-times"></i></button>
												</span>
												<span class="input-group-btn">
												<button class="btn default date-set" type="button"><i class="fa fa-calendar"></i></button>
												</span>
											</div>
											<!-- /input-group -->
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">Inline</label>
										<div class="col-md-4">
											<div class="form_datetime" data-date="2012-12-21T15:25:00Z">
											</div>
											<!-- /input-group -->
										</div>
									</div>
									<div class="form-group last">
										<label class="control-label col-md-3"></label>
										<div class="col-md-4">
											<a class="btn yellow" href="#form_modal1" data-toggle="modal">
											View Datetimepicker in modal <i class="fa fa-share"></i>
											</a>
										</div>
									</div>
								</div>
								<div class="form-actions">
									<div class="row">
										<div class="col-md-offset-3 col-md-9">
											<button type="submit" class="btn purple"><i class="fa fa-check"></i> Submit</button>
											<button type="button" class="btn default">Cancel</button>
										</div>
									</div>
								</div>
							</div>
							<div id="form_modal1" class="modal fade" role="dialog" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
											<h4 class="modal-title">Datetimepicker in Modal</h4>
										</div>
										<div class="modal-body">
											<div class="form-horizontal">
												<div class="form-group">
													<label class="control-label col-md-4">Default Datetimepicker</label>
													<div class="col-md-8">
														<div class="input-group date form_datetime input-medium">
															<input type="text" size="16" readonly class="form-control">
															<span class="input-group-btn">
															<button class="btn default date-set" type="button"><i class="fa fa-calendar"></i></button>
															</span>
														</div>
														<!-- /input-group -->
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-4">Advance Datetimepicker</label>
													<div class="col-md-8">
														<div class="input-group date form_datetime input-large" data-date="2012-12-21T15:25:00Z">
															<input type="text" size="16" readonly class="form-control">
															<span class="input-group-btn">
															<button class="btn default date-reset" type="button"><i class="fa fa-times"></i></button>
															</span>
															<span class="input-group-btn">
															<button class="btn default date-set" type="button"><i class="fa fa-calendar"></i></button>
															</span>
														</div>
														<!-- /input-group -->
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-4">Meridian Format</label>
													<div class="col-md-8">
														<div class="input-group date form_meridian_datetime input-large" data-date="2012-12-21T15:25:00Z">
															<input type="text" size="16" readonly class="form-control">
															<span class="input-group-btn">
															<button class="btn default date-reset" type="button"><i class="fa fa-times"></i></button>
															</span>
															<span class="input-group-btn">
															<button class="btn default date-set" type="button"><i class="fa fa-calendar"></i></button>
															</span>
														</div>
														<!-- /input-group -->
													</div>
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
											<button class="btn green btn-primary" data-dismiss="modal">Save changes</button>
										</div>
									</div>
								</div>
							</div>
							<!-- END FORM-->
						</div>
					</div>
					<!-- END PORTLET-->
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN PORTLET-->
					<div class="portlet box red-sunglo">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-gift"></i>Time Pickers
							</div>
							<div class="tools">
								<a href="javascript:;" class="collapse">
								</a>
								<a href="#portlet-config" data-toggle="modal" class="config">
								</a>
								<a href="javascript:;" class="reload">
								</a>
								<a href="javascript:;" class="remove">
								</a>
							</div>
						</div>
						<div class="portlet-body form">
							<!-- BEGIN FORM-->
							<div  class="form-horizontal form-bordered">
								<div class="form-body form">
									<div class="form-group">
										<label class="control-label col-md-3">Default Timepicker</label>
										<div class="col-md-3">
											<div class="input-icon">
												<i class="fa fa-clock-o"></i>
												<input type="text" class="form-control timepicker timepicker-default">
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">Without Seconds</label>
										<div class="col-md-3">
											<div class="input-group">
												<input type="text" class="form-control timepicker timepicker-no-seconds">
												<span class="input-group-btn">
												<button class="btn default" type="button"><i class="fa fa-clock-o"></i></button>
												</span>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">24hr Timepicker</label>
										<div class="col-md-3">
											<div class="input-group">
												<input type="text" class="form-control timepicker timepicker-24">
												<span class="input-group-btn">
												<button class="btn default" type="button"><i class="fa fa-clock-o"></i></button>
												</span>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3"></label>
										<div class="col-md-3">
											<a class="btn yellow" href="#form_modal4" data-toggle="modal">
											View Timepicker in modal <i class="fa fa-share"></i>
											</a>
										</div>
									</div>
								</div>
							</div>
							<div id="form_modal4" class="modal fade" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
											<h4 class="modal-title">Timepickers In Modal</h4>
										</div>
										<div class="modal-body">
											<div  class="form-horizontal">
												<div class="form-group">
													<label class="control-label col-md-4">Default Timepicker</label>
													<div class="col-md-5">
														<div class="input-icon">
															<i class="fa fa-clock-o"></i>
															<input type="text" class="form-control timepicker timepicker-default">
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-4">Without Seconds</label>
													<div class="col-md-5">
														<div class="input-group">
															<input type="text" class="form-control timepicker timepicker-no-seconds">
															<span class="input-group-btn">
															<button class="btn default" type="button"><i class="fa fa-clock-o"></i></button>
															</span>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-4">24hr Timepicker</label>
													<div class="col-md-5">
														<div class="input-group">
															<input type="text" class="form-control timepicker timepicker-24">
															<span class="input-group-btn">
															<button class="btn default" type="button"><i class="fa fa-clock-o"></i></button>
															</span>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
											<button class="btn green btn-primary" data-dismiss="modal">Save changes</button>
										</div>
									</div>
								</div>
							</div>
							<!-- END FORM-->
						</div>
					</div>
					<!-- END PORTLET-->
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN PORTLET-->
					<div class="portlet box blue-steel">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-gift"></i>
								Clockface Time Pickers
							</div>
							<div class="tools">
								<a href="javascript:;" class="collapse">
								</a>
								<a href="#portlet-config" data-toggle="modal" class="config">
								</a>
							</div>
						</div>
						<div class="portlet-body form">
							<form action="#" class="form-horizontal form-bordered">
								<div class="form-body">
									<div class="form-group">
										<label class="control-label col-md-3">Input</label>
										<div class="col-md-3">
											<input type="text" value="2:30 PM" data-format="hh:mm A" class="form-control clockface_1"/>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">Button</label>
										<div class="col-md-3">
											<div class="input-group">
												<input type="text" id="clockface_2" value="14:30" class="form-control" readonly=""/>
												<span class="input-group-btn">
												<button class="btn default" type="button" id="clockface_2_toggle"><i class="fa fa-clock-o"></i></button>
												</span>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">Inline</label>
										<div class="col-md-4">
											<div class="well clockface_3" style="padding: 0; width: 162px;">
											</div>
										</div>
									</div>
									<div class="form-group last">
										<label class="control-label col-md-3"></label>
										<div class="col-md-3">
											<a class="btn yellow" href="#form_modal5" data-toggle="modal">
											View Clockface Time Pickers in modal <i class="fa fa-share"></i>
											</a>
										</div>
									</div>
								</div>
							</form>
							<div id="form_modal5" class="modal fade" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
											<h4 class="modal-title">Clockface In Modal</h4>
										</div>
										<div class="modal-body">
											<div class="form-horizontal">
												<div class="form-group">
													<label class="control-label col-md-3">Input</label>
													<div class="col-md-4">
														<input type="text" value="2:30 PM" data-format="hh:mm A" class="form-control clockface_1"/>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3">Button</label>
													<div class="col-md-4">
														<div class="input-group">
															<input type="text" id="clockface_2_modal" value="14:30" class="form-control" readonly=""/>
															<span class="input-group-btn">
															<button class="btn default" type="button" id="clockface_2_modal_toggle"><i class="fa fa-clock-o"></i></button>
															</span>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3">Inline</label>
													<div class="col-md-4">
														<div class="well clockface_3" style="padding: 0; width: 162px;">
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<button class="btn default" data-dismiss="modal" aria-hidden="true">Close</button>
											<button class="btn green" data-dismiss="modal">Save changes</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN PORTLET-->
					<div class="portlet box yellow-crusta">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-gift"></i>Daterangepickers
							</div>
							<div class="tools">
								<a href="javascript:;" class="collapse">
								</a>
								<a href="#portlet-config" data-toggle="modal" class="config">
								</a>
								<a href="javascript:;" class="reload">
								</a>
								<a href="javascript:;" class="remove">
								</a>
							</div>
						</div>
						<div class="portlet-body form">
							<!-- BEGIN FORM-->
							<div class="form-horizontal form-bordered">
								<div class="form-body">
									<div class="form-group">
										<label class="control-label col-md-3">Default Date Ranges</label>
										<div class="col-md-4">
											<div class="input-group" id="defaultrange">
												<input type="text" class="form-control">
												<span class="input-group-btn">
												<button class="btn default date-range-toggle" type="button"><i class="fa fa-calendar"></i></button>
												</span>
											</div>
										</div>
									</div>
									<div class="form-group ">
										<label class="control-label col-md-3">Advance Date Ranges</label>
										<div class="col-md-4">
											<div id="reportrange" class="btn default">
												<i class="fa fa-calendar"></i>
												&nbsp; <span>
												</span>
												<b class="fa fa-angle-down"></b>
											</div>
										</div>
									</div>
									<div class="form-group last">
										<label class="control-label col-md-3"></label>
										<div class="col-md-4">
											<a class="btn yellow" href="#daterangepicker_modal" data-toggle="modal">
											View Daterange Picker in modal <i class="fa fa-share"></i>
											</a>
										</div>
									</div>
								</div>
								<div class="form-actions">
									<div class="row">
										<div class="col-md-offset-3 col-md-9">
											<button type="submit" class="btn green"><i class="fa fa-check"></i> Submit</button>
											<button type="button" class="btn default">Cancel</button>
										</div>
									</div>
								</div>
							</div>
							<div id="daterangepicker_modal" class="modal fade" role="dialog" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
											<h4 class="modal-title">Daterange Picker in Modal</h4>
										</div>
										<div class="modal-body">
											<div class="form-horizontal">
												<div class="form-group">
													<label class="control-label col-md-4">Default Date Ranges</label>
													<div class="col-md-8">
														<div class="input-group input-large" id="defaultrange_modal">
															<input type="text" class="form-control">
															<span class="input-group-btn">
															<button class="btn default date-range-toggle" type="button"><i class="fa fa-calendar"></i></button>
															</span>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
											<button class="btn green btn-primary" data-dismiss="modal">Save changes</button>
										</div>
									</div>
								</div>
							</div>
							<!-- END FORM-->
						</div>
					</div>
					<!-- END PORTLET-->
				</div>
			</div>

			<!-- END PAGE CONTENT-->
	
</asp:Content>
