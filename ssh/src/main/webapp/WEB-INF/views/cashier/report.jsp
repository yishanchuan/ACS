<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.web.entity.User"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>资金报表</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="../css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="../plugins/datatables/dataTables.bootstrap.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">
  
  <link rel="stylesheet" href="../plugins/datepicker/datepicker3.css">
  <link rel="stylesheet" href="../plugins/daterangepicker/daterangepicker.css">
  <link rel="stylesheet" href="../css/chosen.min.css"/>
  
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
	<jsp:include page="../../public/header.jsp"/>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="../dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>${user.userName}</p>
          <!-- <a href="#"><i class="fa fa-circle text-success"></i> Online</a> -->
        </div>
      </div>
      <!-- 搜索 -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="搜索...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <jsp:include page="../../public/navigation.jsp"></jsp:include>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  	<section class="content-header">
      <h1>资金报表</h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>主页</a></li>
        <li><a href="#">出纳</a></li>
        <li class="active">资金报表</li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content">
      <!-- box start -->
      <div class="row">
        <div class="col-xs-12 col-md-12">
        <div class="nav-tabs-custom">
        	<ul class="nav nav-tabs">
        		<li class="active"><a href="#tab_1" data-toggle="tab">收入</a></li>
        		<li><a href="#tab_2" data-toggle="tab">支出</a></li>
        	</ul>
        	<div class="tab-content">
        		<div class="tab-pane active" id="tab_1">
		        	<div class="box">
		        		<div class="box-header">
		        			<div class="col-xs-5">
		        				<form method="post" action="${pageContext.request.contextPath}/cashier/searchReportByDate?id=${user.id}">
		            				<div class="input-group">
		            				<div class="input-group-addon">
		                    			<i class="fa fa-calendar"></i>
		                			</div>
		                			<input type="text" class="form-control daterange" id="daterange" name="daterange" style="width:200px;border-right:16px;">
		              				<button type="submit" class="btn btn-primary btn-right" id="search">查询</button>
		              				</div>
		        				</form>
		        			</div>
		        			<div class="col-xs-4"></div>
		        			<div class="col-xs-3">
		        				<button type="button" class="btn btn-primary" onclick="window.print();">打印</button>
		        				<button type="button" class="btn btn-primary">导出</button>
		        			</div>
		        		</div>
		        		<div class="box-body">
		        			<table class="table table-bordered table-striped datatable" id="table1">
		        				<thead>
		        					<tr>
		        						<th>编码</th>
		        						<th>账户名称</th>
		        						<th>期初余额</th>
		        						<th>收入总额</th>
		        						<th>支出总额</th>
		        						<th>余额</th>
		        						<th>收入笔数</th>
		        						<th>支出笔数</th>
		        					</tr>
		        				</thead>
		        				<tbody>
		        					<c:if test="${!empty listCash}">
		        						<c:forEach items="${listCash}" var="cash" varStatus="cashStatus">
		        							<tr>
				        						<td>${cash.id}</td>
					        					<td>${cash.name}</td>
					        					<td class="cashBalance">${cash.balance}</td>
					        					<td class="cashIncome"><c:if test="${cashStat[cashStatus.index][0]!=0}">${cashStat[cashStatus.index][0]}</c:if></td>
					        					<td class="cashExpen"><c:if test="${cashStat[cashStatus.index][1]!=0}">${cashStat[cashStatus.index][1]}</c:if></td>
					        					<td class="cashReminder">${cashStat[cashStatus.index][2]}</td>
					        					<td class="cashIncomeNum">${cashIENum[cashStatus.index][0]}</td>
					        					<td class="cashExpenNum">${cashIENum[cashStatus.index][1]}</td>
				        					</tr>
		        						</c:forEach>
		        					</c:if>
		        				</tbody>
		        				<tfoot>
		        					<tr>
		        						<td></td>
		        						<td>现金合计</td>
		        						<td id="cashBalanceAll"></td>
		        						<td id="cashIncomeAll"></td>
		        						<td id="cashExpenAll"></td>
		        						<td id="cashReminderAll"></td>
		        						<td id="cashIncomeNumAll"></td>
		        						<td id="cashExpenNumAll"></td>
		        					</tr>
		        				</tfoot>
		        			</table>
		        			<table class="table table-bordered table-striped datatable" id="table2">
		        				<thead>
		        					<tr>
		        						<th>编码</th>
		        						<th>账户名称</th>
		        						<th>期初余额</th>
		        						<th>收入总额</th>
		        						<th>支出总额</th>
		        						<th>余额</th>
		        						<th>收入笔数</th>
		        						<th>支出笔数</th>
		        					</tr>
		        				</thead>
		        				<tbody>
		        					<c:if test="${!empty listBank}">
		        						<c:forEach items="${listBank}" var="bank" varStatus="bankStatus">
		        							<tr>
				        						<td>${bank.id}</td>
					        					<td>${bank.name}</td>
					        					<td class="bankBalance">${bank.balance}</td>
					        					<td class="bankIncome"><c:if test="${bankStat[bankStatus.index][0]!=0}">${bankStat[bankStatus.index][0]}</c:if></td>
					        					<td class="bankExpen"><c:if test="${bankStat[bankStatus.index][1]!=0}">${bankStat[bankStatus.index][1]}</c:if></td>
					        					<td class="bankReminder">${bankStat[bankStatus.index][2]}</td>
					        					<td class="bankIncomeNum">${bankIENum[bankStatus.index][0]}</td>
					        					<td class="bankExpenNum">${bankIENum[bankStatus.index][1]}</td>
				        					</tr>
		        						</c:forEach>
		        					</c:if>
		        				</tbody>
		        				<tfoot>
		        					<tr>
		        						<td></td>
		        						<td>银行存款合计</td>
		        						<td id="bankBalanceAll"></td>
		        						<td id="bankIncomeAll"></td>
		        						<td id="bankExpenAll"></td>
		        						<td id="bankReminderAll"></td>
		        						<td id="bankIncomeNumAll"></td>
		        						<td id="bankExpenNumAll"></td>
		        					</tr>
		        				</tfoot>
		        			</table>
		        		</div>
		        	</div>
        		</div>
        		<div class="tab-pane" id="tab_2">
        			<div class="box">
		        		<div class="box-header">
		        			<div class="col-xs-5">
		        				<form method="post" action="${pageContext.request.contextPath}/cashier/searchReportByDate?id=${user.id}">
		            				<div class="input-group">
			            				<div class="input-group-addon">
			                    			<i class="fa fa-calendar"></i>
			                			</div>
			                			<input type="text" class="form-control daterange" id="daterange" name="daterange" style="width:200px;border-right:16px;">
			              				<button type="submit" class="btn btn-primary btn-right" id="search">查询</button>
		              				</div>
		        				</form>
		        			</div>
		        			<div class="col-xs-4"></div>
		        			<div class="col-xs-3">
		        				<button type="button" class="btn btn-primary" onclick="window.print();">打印</button>
		        				<button type="button" class="btn btn-primary">导出</button>
		        			</div>
		        		</div>
		        		<div class="box-body">
		        			<table class="table table-bordered table-striped datatable" id="table3">
		        				<thead>
		        					<tr>
		        						<th>编码</th>
		        						<th>收支类别</th>
		        						<th>收入总额</th>
		        						<th>支出总额</th>
		        						<th>收入笔数</th>
		        						<th>支出笔数</th>
		        					</tr>
		        				</thead>
		        				<tbody>
		        					<c:if test="${!empty listIEType}">
		        						<c:forEach items="${listIEType}" var="ietype" varStatus="ietypeStatus">
		        							<tr>
				        						<td>${ietype.id}</td>
					        					<td>${ietype.name}</td>
					        					<td class="ietypeIncome"><c:if test="${ietypeStat[ietypeStatus.index][0]!=0}">${ietypeStat[ietypeStatus.index][0]}</c:if></td>
					        					<td class="ietypeExpen"><c:if test="${ietypeStat[ietypeStatus.index][1]!=0}">${ietypeStat[ietypeStatus.index][1]}</c:if></td>
					        					<td class="ietypeIncomeNum">${ietypeNum[ietypeStatus.index][0]}</td>
					        					<td class="ietypeExpenNum">${ietypeNum[ietypeStatus.index][1]}</td>
				        					</tr>
		        						</c:forEach>
		        					</c:if>
		        				</tbody>
		        				<tfoot>
		        					<tr>
		        						<td></td>
		        						<td>收支合计</td>
		        						<td id="ietypeIncomeAll"></td>
		        						<td id="ietypeExpenAll"></td>
		        						<td id="ietypeIncomeNumAll"></td>
		        						<td id="ietypeExpenNumAll"></td>
		        					</tr>
		        				</tfoot>
		        			</table>
		        		</div>
		        	</div>
        		</div>
        	</div>
      	</div>
      </div>
      </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 1.0
    </div>
    <strong>Copyright &copy; 2016-2017 <a href="#">yishanchuan</a>.</strong> All rights
    reserved.
  </footer>
</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="../bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="../plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="../dist/js/app.min.js"></script>
<!-- date -->
<script src="../js/moment.min.js"></script>
<script type="text/javascript" src="../plugins/daterangepicker/daterangepicker.js"></script>
<script type="text/javascript" src="../plugins/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="../js/foundation-datepicker.js"></script>
<script type="text/javascript" src="../js/locales/foundation-datepicker.zh-CN.js"></script>
<!-- page script -->
<script type="text/javascript" src="../js/chosen.jquery.js"></script>
<script type="text/javascript" src="../js/chosen.proto.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<script type="text/javascript" src="../js/messages_zh.min.js"></script>
<script>
$(document).ready(function(){
	//jquery chosenselect插件
    var config = {
      '.chosen-select'           : {},
      '.chosen-select-deselect'  : {allow_single_deselect:true},
      '.chosen-select-no-single' : {disable_search_threshold:10},
      '.chosen-select-no-results': {no_results_text:'未找到!'},
      '.chosen-select-width'     : {width:"95%"}
    };
    for (var selector in config) {
      $(selector).chosen(config[selector]);
    };
  //Date range picker
	var locale = {
		"format": 'YYYY-MM-DD',
		"separator": " 至 ",
		"applyLabel": "确定",
		"cancelLabel": "取消",
		"fromLabel": "起始时间",
		"toLabel": "结束时间'",
		"customRangeLabel": "自定义",
		"weekLabel": "W",
		"daysOfWeek": ["日", "一", "二", "三", "四", "五", "六"],
		"monthNames": ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
		"firstDay": 1
	};
    $('.daterange').daterangepicker({
    	"autoApply": true,
    	"locale":locale
    });
    //汇总计算
    var cashBalance=Number(0);
    var cashIncome=Number(0);
    var cashExpen=Number(0);
    var cashReminder=Number(0);
    var cashIncomeNum=Number(0);
    var cashExpenNum=Number(0);
    $('.cashBalance').each(function(){
    	cashBalance+=Number($(this).text());
    });
    $('.cashIncome').each(function(){
    	cashIncome+=Number($(this).text());
    });
    $('.cashExpen').each(function(){
    	cashExpen+=Number($(this).text());
    });
    $('.cashReminder').each(function(){
    	cashReminder+=Number($(this).text());
    });
    $('.cashIncomeNum').each(function(){
    	cashIncomeNum+=Number($(this).text());
    });
    $('.cashExpenNum').each(function(){
    	cashExpenNum+=Number($(this).text());
    });
    $('#cashBalanceAll').text(cashBalance);
    $('#cashIncomeAll').text(cashIncome);
    $('#cashExpenAll').text(cashExpen);
    $('#cashReminderAll').text(cashReminder);
    $('#cashIncomeNumAll').text(cashIncomeNum);
    $('#cashExpenNumAll').text(cashExpenNum);
    
    //bank
    var bankBalance=Number(0);
    var bankIncome=Number(0);
    var bankExpen=Number(0);
    var bankReminder=Number(0);
    var bankIncomeNum=Number(0);
    var bankExpenNum=Number(0);
    $('.bankBalance').each(function(){
    	bankBalance+=Number($(this).text());
    });
    $('.bankIncome').each(function(){
    	bankIncome+=Number($(this).text());
    });
    $('.bankExpen').each(function(){
    	bankExpen+=Number($(this).text());
    });
    $('.bankReminder').each(function(){
    	bankReminder+=Number($(this).text());
    });
    $('.bankIncomeNum').each(function(){
    	bankIncomeNum+=Number($(this).text());
    });
    $('.bankExpenNum').each(function(){
    	bankExpenNum+=Number($(this).text());
    });
    $('#bankBalanceAll').text(bankBalance);
    $('#bankIncomeAll').text(bankIncome);
    $('#bankExpenAll').text(bankExpen);
    $('#bankReminderAll').text(bankReminder);
    $('#bankIncomeNumAll').text(bankIncomeNum);
    $('#bankExpenNumAll').text(bankExpenNum);
    
    //income
    var ietypeBalance=Number(0);
    var ietypeIncome=Number(0);
    var ietypeExpen=Number(0);
    var ietypeReminder=Number(0);
    var ietypeIncomeNum=Number(0);
    var ietypeExpenNum=Number(0);
    $('.ietypeBalance').each(function(){
    	ietypeBalance+=Number($(this).text());
    });
    $('.ietypeIncome').each(function(){
    	ietypeIncome+=Number($(this).text());
    });
    $('.ietypeExpen').each(function(){
    	ietypeExpen+=Number($(this).text());
    });
    $('.ietypeReminder').each(function(){
    	ietypeReminder+=Number($(this).text());
    });
    $('.ietypeIncomeNum').each(function(){
    	ietypeIncomeNum+=Number($(this).text());
    });
    $('.ietypeExpenNum').each(function(){
    	ietypeExpenNum+=Number($(this).text());
    });
    $('#ietypeBalanceAll').text(ietypeBalance);
    $('#ietypeIncomeAll').text(ietypeIncome);
    $('#ietypeExpenAll').text(ietypeExpen);
    $('#ietypeReminderAll').text(ietypeReminder);
    $('#ietypeIncomeNumAll').text(ietypeIncomeNum);
    $('#ietypeExpenNumAll').text(ietypeExpenNum);
    $('table.datatable').DataTable({
    	language: {
            "sProcessing": "处理中...",
            "sLengthMenu": "显示 _MENU_ 项结果",
            "sZeroRecords": "没有匹配结果",
            "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
            "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
            "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
            "sInfoPostFix": "",
            "sSearch": "搜索:",
            "sUrl": "",
            "sEmptyTable": "表中数据为空",
            "sLoadingRecords": "载入中...",
            "sInfoThousands": ",",
            "oPaginate": {
                "sFirst": "首页",
                "sPrevious": "上页",
                "sNext": "下页",
                "sLast": "末页"
            },
            "oAria": {
                "sSortAscending": ": 以升序排列此列",
                "sSortDescending": ": 以降序排列此列"
            }
        },
        'bStateSave': true,
//         'scrollX':true
    });
});
</script>
</body>
</html>
    