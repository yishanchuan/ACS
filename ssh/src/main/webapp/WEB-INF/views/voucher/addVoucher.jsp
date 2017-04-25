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
  <link rel="stylesheet" href="../css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="../css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="../plugins/iCheck/flat/blue.css">
  <!-- Morris chart -->
  <link rel="stylesheet" href="../plugins/morris/morris.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="../plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <!-- Date Picker -->
  <link rel="stylesheet" href="../plugins/datepicker/datepicker3.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="../plugins/daterangepicker/daterangepicker.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="../plugins/datatables/dataTables.bootstrap.css">
  <!--chinese calendar -->
  <link rel="stylesheet" href="../css/bootstrap-datetimepicker.min.css">
  <!-- jquery chosen select -->
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
      <h1>增加凭证</h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>主页</a></li>
        <li><a href="#">凭证管理</a></li>
        <li class="active">增加凭证</li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Start box) -->
      <div class="row">
        <div class="col-xs-12">
        <form method="post" action="${pageContext.request.contextPath}/voucher/addVoucher?id=${user.id}" id="form" name="form">
          <div class="box">
          	<div class="box-header">
              <input class="btn btn-primary" type="button" id="save" value="保存">
              <input class="btn btn-success" type="button" id="print" value="打印">
              <input class="btn btn-info" type="button" id="addrow" value="增加一行">
              <input class="btn btn-warning" type="button" id="delrow" value="删除一行">
              <br><br>
              <span style="width:100px;float:left;margin-left:12px;">
            	<select id="selectVoucherGroup" class="chosen-select" name="voucherGroup" style="width:70px;">
            		<c:if test="${empty listvg}">
            			<option>请增加凭证字</option>
            		</c:if>
            		<c:if test="${!empty listvg}">
            			<option></option>
            			<c:forEach items="${listvg}" var="vg" varStatus="vgc">
            				<option title="${vg.title}" value="${vg.id}" ${vg.isdefault ==true ? 'selected':''}>${vg.name}</option>
            			</c:forEach>
            		</c:if>
            	</select>
            	</span>
            	<input type="text" value="${vchnum+1}" name="vchnum" id="vchnum"  style="width:40px;margin-left:10px;float:left;">
            	<span class="lefttext" style="float:left;">号</span>
            	<!-- 日期控件 -->
            	<input type="text" name="datePicker" id="datePicker" style="float:right;width:170px;margin-right:10px;">
            	<span class="righttext" style="float:right;">日期:</span>
            	<div class="clear" style="clear:both;"></div>
            </div>
            <div class="box-body">
                <table id="voucher" class="table table-bordered table-striped">
                	<thead>
                		<tr>
                			<th>摘要</th>
                			<th>会计科目</th>
                			<th>借方金额</th>
                			<th>贷方金额</th>
                		</tr>
                	</thead>
                	<tbody>
                		<tr>
                			<td style="display:none;"><input type="text" id="rownum" name="rownum"></td>
                			<td><input type="text" id="summary" name="summary1"></td>
                			<td>
                				<select class="chosen-select" data-placeholder=" " style="width:200px;" name="accountingsubject1">
                					<option></option>
                					<c:if test="${!empty listas}">
                						<c:forEach items="${listas}" var="as">
                							<option>${as.id}&nbsp;${as.name}</option>
                						</c:forEach>
                					</c:if>
                				</select>
                			</td>
                			<td><input class="calculate1" type="text" id="debits1" name="debits1"></td>
                			<td><input class="calculate2" type="text" id="credits1" name="credits1"></td>
                		</tr>
                		<tr>
                			<td><input type="text" id="summary2" name="summary2"></td>
                			<td>
                				<select class="chosen-select" data-placeholder=" " style="width:200px;" name="accountingsubject2">
                					<option></option>
                					<c:if test="${!empty listas}">
                						<c:forEach items="${listas}" var="as">
                							<option>${as.id}&nbsp;${as.name}</option>
                						</c:forEach>
                					</c:if>
                				</select>
                			</td>
                			<td><input class="calculate1" type="text" id="debits2" name="debits2"></td>
                			<td><input class="calculate2" type="text" id="credits2" name="credits2"></td>
                		</tr>
                	</tbody>
                	<tfoot>
                		<tr>
                			<td><span>合计金额:</span></td>
                			<td><label id="remind"></label></td>
                			<td><input type="text" id="totaldebits" name="total" readonly="readonly" style="border:0;"></td>
                			<td><input type="text" id="totalcredits" name="total" readonly="readonly" style="border:0;"></td>
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
<script src="../js/bootstrap-datetimepicker.min.js"></script>
<script src="../js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script src="../js/chosen.jquery.js"></script>
<script src="../js/chosen.proto.js"></script>
<script>
$(document).ready(function(){
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
      '.chosen-select-no-results': {no_results_text:'未找到!'},
      '.chosen-select-width'     : {width:"95%"}
    };
    for (var selector in config) {
      $(selector).chosen(config[selector]);
    };
    
    /* $('#voucher').DataTable({
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
    }); */
	//提交
	$('#save').click(function(){
		var debits,credits;
		debits=$('#totaldebits').val();
		credits=$('#totalcredits').val();
		if(debits!=credits){
			$('#remind').html('借贷不平衡').addClass('red');
		}else{
			var action=$('#form').attr('action');
			var rownum=$('tbody').find('tr').length-10;
			$('input#rownum').attr('value',rownum);
			$('form').attr('action',action).submit();
		}
		
	});
	//打印
    $('#print').click(function(){
    	var msg=$('form').serialize();
    	var action=$('#form').attr('action');
    	console.log(msg+"||action||"+action);
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
		var ids;
		if($.isNumeric($(this).val())){
			row=$(this).prop('id').substring(6,7);
			console.log('row:'+row);
			$('#credits'+row).prop('value','');
			$('#credits'+row).blur();
		}
		else if($(this).prop('value')!=null&&$(this).prop('value')!=undefined&&$(this).prop('value')!=''){
			$(this).prop('value','请输入数字');
		}
		for(var i=1;i<=rownum;i++){
			ids='#debits'+i;
			debits=$(ids).val();
			if($.isNumeric(debits)){
				totaldebits=Number(totaldebits)+Number(debits);
			}
		}
		$('#totaldebits').prop('value',totaldebits);
	});
	//贷input失去焦点了计算总价
	$('#voucher').on('blur','.calculate2',function(){
		var totalcredits=0;
		var rownum=$('tbody').find('tr').length-10;
		var credits,ids,row;
		if($.isNumeric($(this).val())){
			row=$(this).prop('id').substring(7,8);
			console.log('row:'+row);
			$('#debits'+row).prop('value','');
			$('#debits'+row).blur();
		}
		else if($(this).prop('value')!=null&&$(this).prop('value')!=undefined&&$(this).prop('value')!=''){
			$(this).prop('value','请输入数字');
		}
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