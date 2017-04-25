<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>录入凭证</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="../plugins/datatables/dataTables.bootstrap.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
  <!--chinese calendar -->
  <link rel="stylesheet" href="../css/bootstrap-datetimepicker.min.css">
  <!-- jquery chosen select -->
  <link rel="stylesheet" href="../css/chosen.min.css"/>
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">
  
  <link rel="stylesheet" href="../css/cashier/oneself.css"/>
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <jsp:include page="../../public/header.jsp"></jsp:include>
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
      <h1>修改凭证</h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>主页</a></li>
        <li><a href="#">凭证管理</a></li>
        <li class="active">修改凭证</li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Start box) -->
      <div class="row">
        <div class="col-xs-12">
        <form method="post" action="${pageContext.request.contextPath}/voucher/updateVoucher?id=${user.id}&voucherid=${voucher.id}" id="form" name="form">
          <div class="box">
          	<div class="box-header">
              <h3 class="box-title" id="vgtitle"></h3><br>
              <button class="btn btn-primary" type="button" id="save">更新</button>
              <button class="btn btn-success" type="button" id="print">打印</button>
              <button class="btn btn-info" type="button" id="addrow">增加一行</button>
              <button class="btn btn-warning" type="button" id="delrow">删除一行</button>
              <br>
            </div>
            
            <div class="toline">
            	<span style="width:100px;float:left;margin-left:12px;">
            	<select id="selectVoucherGroup" class="chosen-select" name="voucherGroup" style="width:70px;">
            		<c:if test="${empty listvg}">
            			<option>请增加凭证字</option>
            		</c:if>
            		<c:if test="${!empty listvg}">
            			<option></option>
            			<c:forEach items="${listvg}" var="vg" varStatus="vgc">
            				<option title="${vg.title}" value="${vg.id}"
            					<c:if test="${vg.id==voucher.vouchergroup.id}">
            					selected
            					</c:if>
            				>${vg.name}</option>
            			</c:forEach>
            		</c:if>
            	</select>
            	</span>
            	<input type="text" value="${voucher.vchnum}" name="vchnum" id="vchnum" style="width:40px;margin-left:10px;float:left;">
            	<span class="lefttext" style="float:left;">号</span>
            	<!-- 日期控件 -->
            	<input type="text" name="datePicker" id="datePicker" value="${voucher.date}" style="float:right;width:170px;margin-right:10px;">
            	<span class="righttext" style="float:right;">日期:</span>
            	<div class="clear" style="clear:both;"></div>
            </div>
            
            <div class="box-body">
            	<input type="text" id="rownum" name="rownum" style="display:none;">
                <table id="voucher" class="table table-bordered table-striped" style="border:2px solid #f4f4f4">
                	<thead>
                		<tr>
                			<td>编号</td>
                			<td>摘要</td>
                			<td>会计科目</td>
                			<td>借方金额</td>
                			<td>贷方金额</td>
                		</tr>
                	</thead>
                	<tbody>
                		<c:forEach items="${voucher.listvc}" var="vc" varStatus="vcs">
                		<tr>
                			<td class="hidden"><input type="text" class="fulltd" id="id${vcs.count}" name="id${vcs.count}" value="${vc.id}" readonly="readonly"></td>
                			<td class="full"><input type="text" class="fulltd" id="summary${vcs.count}" name="summary${vcs.count}" value="${vc.summary}"></td>
                			<td class="full">
                				<select class="chosen-select fulltd" data-placeholder=" " style="width:200px;" name="accountingsubject${vcs.count}">
                					<option></option>
                					<c:if test="${!empty listas}">
                						<c:forEach items="${listas}" var="as">
                							<option
                								<c:if test="${vc.accountingSubject.id==as.id}"> selected</c:if>
                							>${as.id}&nbsp;${as.name}</option>
                						</c:forEach>
                					</c:if>
                				</select>
                			</td>
                			<td class="full"><input class="calculate1 fulltd" type="text" id="debits${vcs.count}" name="debits${vcs.count}" value="${vc.debits}"></td>
                			<td class="full"><input class="calculate2 fulltd" type="text" id="credits${vcs.count}" name="credits${vcs.count}" value="${vc.credits}"></td>
                		</tr>
                		</c:forEach>
                	</tbody>
                	<tfoot>
                		<tr>
                			<td><span>合计金额:</span></td>
                			<td><label id="remind"></label></td>
                			<td><input type="text" id="totaldebits" name="total" value="${voucher.total}" readonly></td>
                			<td><input type="text" id="totalcredits" name="total" value="${voucher.total}" readonly></td>
                		</tr>
                	</tfoot>
                </table>
            </div>
            <!-- /.box-body -->
            </div>
        </form>
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
    <strong>Copyright &copy; 2016-2017 <a href="#">yishanchuan</a>.</strong>
  </footer>
</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script type="text/javascript" src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script type="text/javascript" src="../plugins/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script type="text/javascript" src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script type="text/javascript" src="../plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script type="text/javascript" src="../dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script type="text/javascript" src="../dist/js/demo.js"></script>
<!-- page script -->
<script src="../js/bootstrap-datetimepicker.min.js"></script>
<script src="../js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript" src="../js/chosen.jquery.js"></script>
<script type="text/javascript" src="../js/chosen.proto.js"></script>
<script>
$(function(){
	//数据表格【】不注释的话，后面jquery、chosenselect等都无法初始化！！？
    //$('#voucher').DataTable();
	//日期插件
	$('#datePicker').datetimepicker({
		language:'zh-CN',  
        weekStart:1,  
        todayBtn:1,  
        autoclose:1,  
        todayHighlight:1,  
        startView:2,  
        forceParse:0,  
        showMeridian:1 ,
		format: 'yyyy-mm-dd hh:ii',
	});
	//jquery chosenselect插件
    var config = {
      '.chosen-select'           : {},
      '.chosen-select-deselect'  : {allow_single_deselect:true},
      '.chosen-select-no-single' : {disable_search_threshold:10},
      '.chosen-select-no-results': {no_results_text:'Oops, nothing found!'},
      '.chosen-select-width'     : {width:"95%"}
    };
    for (var selector in config) {
      $(selector).chosen(config[selector]);
    };
	//提交
	$('#save').click(function(){
		var debits,credits;
		debits=Number($('#totaldebits').val());
		credits=Number($('#totalcredits').val());
		if(debits!=credits){
			$('#remind').html('借贷不平衡').addClass('red');
		}else{
			var action=$('#form').attr('action');
			var rownum=$('tbody').find('tr').length-10;
			$('input#rownum').val(rownum);
			$('form').attr('action',action).submit();
		}
	});
	//打印
    $('#print').click(function(){
    	var msg=$('form').serialize();
    	var action=$('#form').attr('action');
    	var rownum=$('tbody').find('tr').length;
    	console.log(msg+"---------------"+action+"--rownum:"+rownum);
    });
	//用live而不是bind，这样append的内容才能响应
	//table末尾增加一行
    $('#addrow').on('click',function(){
    	//怎么会是12？
    	var rownum=$('tbody').find('tr').length-9;
    	var newrow="<tr><td><input type='text' name='summary"+rownum+"' id='summary"+rownum+"'></td><td><select class='chosen-select' data-placeholder=' ' name='accountingsubject"+rownum+"' id='accountingsubject"+rownum+"' style='width:200px;'><option></option><c:if test='${!empty listas}'><c:forEach items='${listas}' var='as'><option>${as.id}&nbsp;${as.name}</option></c:forEach></c:if></select></td><td><input class='calculate1' type='text' id='debits"+rownum+"' name='debits"+rownum+"'></td><td><input class='calculate2' type='text' id='credits"+rownum+"' name='credits"+rownum+"'></td></tr>";
    	$('#voucher').append(newrow);
    	for (var selector in config) {
    	      $(selector).chosen(config[selector]);
    	};
    });
	//table末尾删除一行
    $('#delrow').on('click',function(){
    	$('select:last').parent().parent().remove();
    	for (var selector in config) {
    	      $(selector).chosen(config[selector]);
    	    };
    });
	
	//借input失去焦点了计算总价
	$('#voucher').on('blur','.calculate1',function(){
		var totaldebits=0;
		var rownum=$('tbody').find('tr').length-10;
		var debits;
		for(var i=1;i<=rownum;i++){
			debits=$('#debits'+i).val();
			console.log(rownum+"--debits--"+debits);
			if($.isNumeric(debits)){
				totaldebits=Number(totaldebits)+Number(debits);
			}
		}
		
		$('#totaldebits').attr('value',totaldebits);
	});
	//贷input失去焦点了计算总价
	$('#voucher').on('blur','.calculate2',function(){
		var totalcredits=0;
		var rownum=$('tbody').find('tr').length-10;
		var credits;
		var ids;
		for(var i=1;i<=rownum;i++){
			ids='#credits'+i;
			credits=$(ids).val();
			if($.isNumeric(credits)){
				totalcredits=Number(totalcredits)+Number(credits);
			}
		}
		$('#totalcredits').attr('value',totalcredits);
	});
});
</script>
</body>
</html>