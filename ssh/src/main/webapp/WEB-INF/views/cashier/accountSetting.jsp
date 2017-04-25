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
  <title>账户设置</title>
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
      <h1>账户设置</h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>主页</a></li>
        <li><a href="#">出纳</a></li>
        <li class="active">账户设置</li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content">
      <!-- 选项卡 -->
      <div class="row">
        <div class="col-xs-12 col-md-12">
        	<div class="nav-tabs-custom">
        		<ul class="nav nav-tabs">
        			<li class="active"><a href="#tab_1" data-toggle="tab">现金</a></li>
        			<li><a href="#tab_2" data-toggle="tab">银行</a></li>
        		</ul>
        		<div class="tab-content">
        			<div class="tab-pane active" id="tab_1">
        				<div id="utils1" style="margin-bottom:16px;">
        					<label>输入编码或名称：</label>
        					<form method="post" action="${pageContext.request.contextPath}/cashier/searchCash?id=${user.id}">
        						<input type="text" id="cashSearch" name="codeOrName" style="width:160px;">
        						<button type="button" class="btn btn-primary" id="cashSearchButton" style="width:112px;overflow:hidden;">查询</button>
        						<a href="${pageContext.request.contextPath}/cashier/addCash?id=${user.id}"><button type="button" class="btn btn-primary" id="add" style="width:112px;float:right;">新增</button></a>
        					</form>
        				</div>
        				<div class="">
        					<table id="table1" class="table table-bordered table-striped table-hover">
        						<thead>
        							<tr>
        								<th>编码</th>
        								<th>账户名称</th>
        								<th>币别</th>
        								<th>会计科目</th>
        								<th>操作</th>
        							</tr>
        						</thead>
        						<tbody>
        							<c:if test="${!empty listCash}">
        							  <c:forEach items="${listCash}" var="cash" varStatus="cashStatus">
        							    <tr>
        							      <td>${cash.id}</td>
        							      <td>${cash.name}</td>
        							      <td>${cash.current.name}</td>
        							      <td>${cash.accountingSubject.id}&nbsp;&nbsp;${cash.accountingSubject.name}</td>
        							      <td>
        							        <a href="${pageContext.request.contextPath}/cashier/updateCash?id=${user.id}&cashId=${cash.id}">
        							          <i class="fa fa-pencil" aria-hidden="true" title="修改"></i>
        							        </a>
        							        &nbsp;&nbsp;
        							        <a href="${pageContext.request.contextPath}/cashier/deleteCash?id=${user.id}&cashId=${cash.id}">
        							          <i class="fa fa-trash" aria-hidden="true" title="删除"></i>
        							        </a>
        							      </td>
        							    </tr>
        							  </c:forEach>
        							</c:if>
        						</tbody>
        					</table>
        				</div>
        			</div>
        			<!-- 银行账户管理 -->
        			<div class="tab-pane" id="tab_2">
        				<div id="utils2" class="" style="margin-bottom:16px;">
        					<label>输入编码或名称：</label>
        					<form method="post" action="${pageContext.request.contextPath}/cashier/searchBank?id=${user.id}">
        						<input type="text" id="bankSearch" name="codeOrName" style="width:160px;">
        						<button type="button" class="btn btn-primary" id="bankSearchButton" style="width:112px;">查询</button>
        						<a href="${pageContext.request.contextPath}/cashier/addBank?id=${user.id}"><button type="button" class="btn btn-primary" id="add" style="width:112px;float:right;">新增</button></a>
        					</form>
        				</div>
        				<div class="">
        					<table id="table2" class="table table-bordered table-striped table-hover">
        						<thead>
        							<tr>
        								<th>编码</th>
        								<th>账户名称</th>
        								<th>银行账户</th>
        								<th>币别</th>
        								<th>会计科目</th>
        								<th>操作</th>
        							</tr>
        						</thead>
        						<tbody>
        							<c:if test="${!empty listBank}">
        							  <c:forEach items="${listBank}" var="bank" varStatus="bankStatus">
        							    <tr>
        							      <td>${bank.id}</td>
        							      <td>${bank.name}</td>
        							      <td>${bank.bankAccount}</td>
        							      <td>${bank.current.name}</td>
        							      <td>${bank.accountingSubject.id}&nbsp;&nbsp;${bank.accountingSubject.name}</td>
        							      <td>
        							        <a href="${pageContext.request.contextPath}/cashier/updateBank?id=${user.id}&bankId=${bank.id}">
        							          <i class="fa fa-pencil" aria-hidden="true" title="修改"></i>
        							        </a>
        							        &nbsp;&nbsp;
        							        <a href="${pageContext.request.contextPath}/cashier/deleteBank?id=${user.id}&bankId=${bank.id}">
        							          <i class="fa fa-trash" aria-hidden="true" title="删除"></i>
        							        </a>
        							      </td>
        							    </tr>
        							  </c:forEach>
        							</c:if>
        						</tbody>
        					</table>
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
$(function () {
	
	
	});
</script>
</body>
</html>
    