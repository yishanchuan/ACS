<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>期初</title>
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
      <h1>期初</h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>主页</a></li>
        <li><a href="#">设置</a></li>
        <li class="active">期初</li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Start box) -->
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <a href="#">
              	<button type="button" id="import" class="btn btn-info">导入</button>
              </a>
              <a href="#">
              	<button type="button" id="export" class="btn btn-info">导出</button>
              </a>
              <button type="button" id="calculate" class="btn btn-info">试算平衡</button>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="nav-tabs-custom">
        		<ul class="nav nav-tabs">
        			<li class="active"><a href="#tab_1" data-toggle="tab">资产</a></li>
        			<li><a href="#tab_2" data-toggle="tab">负债</a></li>
        			<li><a href="#tab_3" data-toggle="tab">权益</a></li>
        			<li><a href="#tab_4" data-toggle="tab">成本</a></li>
        			<li><a href="#tab_5" data-toggle="tab">损益</a></li>
        		</ul>
        		<div class="tab-content">
        		  <div class="tab-pane active" id="tab_1">
       		    	<table id="table" class="table table-bordered table-striped table-hover">
       		    		<thead>
       		    			<tr>
       		    				<th>科目编码</th>
       		    				<th>科目名称</th>
       		    				<th>方向</th>
       		    				<th>期初余额</th>
       		    			</tr>
       		    		</thead>
       		    		<tbody>
       		    			<c:forEach items="${listAccountingSubject}" var="as" varStatus="ass">
       		    				<c:if test="${as.type=='资产'}">
       		    					<tr>
	       		    					<td>${as.id}</td>
	       		    					<td>${as.name}</td>
	       		    					<td>${as.dc==false?'借':'贷'}</td>
	       		    					<td><input type="text" class="update" name="${as.id}" value="${as.balance=='0.00'?'':as.balance}"></td>
	       		    				</tr>
       		    				</c:if>
       		    			</c:forEach>
       		    		</tbody>
       		    	</table>
        		  </div>
        		  <div class="tab-pane" id="tab_2">
        		    <table id="table" class="table table-bordered table-striped table-hover">
       		    		<thead>
       		    			<tr>
       		    				<th>科目编码</th>
       		    				<th>科目名称</th>
       		    				<th>方向</th>
       		    				<th>期初余额</th>
       		    			</tr>
       		    		</thead>
       		    		<tbody>
       		    			<c:forEach items="${listAccountingSubject}" var="as" varStatus="ass">
       		    				<c:if test="${as.type=='负债'}">
       		    					<tr>
	       		    					<td>${as.id}</td>
	       		    					<td>${as.name}</td>
	       		    					<td>${as.dc==false?'借':'贷'}</td>
	       		    					<td><input type="text" class="update" name="${as.id}" value="${as.balance=='0.00'?'':as.balance}"></td>
	       		    				</tr>
       		    				</c:if>
       		    			</c:forEach>
       		    		</tbody>
       		    	</table>
        		  </div>
        		  <div class="tab-pane" id="tab_3">
        		    <table id="table" class="table table-bordered table-striped table-hover">
       		    		<thead>
       		    			<tr>
       		    				<th>科目编码</th>
       		    				<th>科目名称</th>
       		    				<th>方向</th>
       		    				<th>期初余额</th>
       		    			</tr>
       		    		</thead>
       		    		<tbody>
       		    			<c:forEach items="${listAccountingSubject}" var="as" varStatus="ass">
       		    				<c:if test="${as.type=='权益'}">
       		    					<tr>
	       		    					<td>${as.id}</td>
	       		    					<td>${as.name}</td>
	       		    					<td>${as.dc==false?'借':'贷'}</td>
	       		    					<td><input type="text" class="update" name="${as.id}" value="${as.balance=='0.00'?'':as.balance}"></td>
	       		    				</tr>
       		    				</c:if>
       		    			</c:forEach>
       		    		</tbody>
       		    	</table>
        		  </div>
        		  <div class="tab-pane" id="tab_4">
        		    <table id="table" class="table table-bordered table-striped table-hover">
       		    		<thead>
       		    			<tr>
       		    				<th>科目编码</th>
       		    				<th>科目名称</th>
       		    				<th>方向</th>
       		    				<th>期初余额</th>
       		    			</tr>
       		    		</thead>
       		    		<tbody>
       		    			<c:forEach items="${listAccountingSubject}" var="as" varStatus="ass">
       		    				<c:if test="${as.type=='成本'}">
       		    					<tr>
	       		    					<td>${as.id}</td>
	       		    					<td>${as.name}</td>
	       		    					<td>${as.dc==false?'借':'贷'}</td>
	       		    					<td><input type="text" class="update" name="${as.id}" value="${as.balance=='0.00'?'':as.balance}"></td>
	       		    				</tr>
       		    				</c:if>
       		    			</c:forEach>
       		    		</tbody>
       		    	</table>
        		  </div>
        		  <div class="tab-pane" id="tab_5">
        		    <table id="table" class="table table-bordered table-striped table-hover">
       		    		<thead>
       		    			<tr>
       		    				<th>科目编码</th>
       		    				<th>科目名称</th>
       		    				<th>方向</th>
       		    				<th>期初余额</th>
       		    			</tr>
       		    		</thead>
       		    		<tbody>
       		    			<c:forEach items="${listAccountingSubject}" var="as" varStatus="ass">
       		    				<c:if test="${as.type=='损益'}">
       		    					<tr>
	       		    					<td>${as.id}</td>
	       		    					<td>${as.name}</td>
	       		    					<td>${as.dc==false?'借':'贷'}</td>
	       		    					<td><input type="text" class="update" name="${as.id}" value="${as.balance=='0.00'?'':as.balance}"></td>
	       		    				</tr>
       		    				</c:if>
       		    			</c:forEach>
       		    		</tbody>
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
<!-- AdminLTE for demo purposes -->
<script src="../dist/js/demo.js"></script>
<!-- page script -->
<script>
$(document).ready(function() {
	$('.update').on('blur',function(){
		var url='/ssh/setting/updateBalance';
		var asid=$(this).attr('name');
		var balance=$(this).val();
		var $update=$(this);
		if(balance.length!=0){
			console.log(balance);
			balance=parseFloat(balance);
			if(isNaN(balance)){
				$update.val('请输入数字');
			}else{
				var args={'asid':asid,'balance':balance};
				$.get(url,args,function(data){
					if(data!=true){
						console.log(data);
						$update.val('更新失败');
					}else{
						console.log(6);
					}
				});
			}
		}
	});
	$('#calculate').on('click',function(){
		var url="/ssh/setting/calculate";
		$.get(url,'',function(data){
			var d=data[0];
			var c=data[1];
			var bool=data[2];
			
		});
	});
    $('.table').DataTable({
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
    });
});
</script>
</body>
</html>
    