<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>现金日记账</title>
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
  <link rel="stylesheet" href="../css/cashier/oneself.css">
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
      <h1>现金日记账</h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>主页</a></li>
        <li><a href="#">出纳</a></li>
        <li class="active">现金日记账</li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Start box) -->
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
            <form method="post" action="${pageContext.request.contextPath}/cashier/searchJournal?id=${user.id}">
            	<div class="col-xs-2">
            	<select class="chosen-select" id="cash" name="cash" style="width:120px;">
            		<option></option>
            		<c:forEach items="${listCash}" var="c" varStatus="cs">
            			<option value="${c.id}" 
            				<c:if test="${empty cash}&&${cs.count==1}">selected</c:if>
            				<c:if test="${!empty cash}">${c.id==cash.id?'selected':''}</c:if>
            			>${c.id}-${c.name}</option>
            		</c:forEach>
            	</select>
            	</div>
            	<div class="col-xs-5">
            	<div class="input-group">
            		<div class="input-group-addon">
                    	<i class="fa fa-calendar"></i>
                	</div>
                	<input type="text" class="form-control" id="daterange" name="daterange" style="width:200px;border-right:16px;">
              		<button type="submit" class="btn btn-primary btn-right" id="search">查询</button>
              	</div>
              	</div>
              	<div class="col-xs-5">
              		<button type="button" class="btn btn-primary" id="print" onclick="window.print()">打印</button>
              		<button type="button" class="btn btn-primary" id="print2">凭据打印</button>
              		<button type="button" class="btn btn-primary" id="import">导入</button>
              		<button type="button" class="btn btn-primary" id="export">导出</button>
            	</div>
            </form>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="journal" class="table table-bordered table-striped">
                <thead>
                	<tr>
                		<th>单据编号</th>
                		<th>日期</th>
                		<th>摘要</th>
                		<th>收支类别</th>
                		<th>收入（借方）</th>
                		<th>支出（贷方）</th>
                		<th>余额</th>
                		<th>操作</th>
                	</tr>
                </thead>
                <tbody>
					<tr>
						<td></td>
						<td></td>
						<td>初始化余额</td>
						<td></td>
						<td></td>
						<td></td>
						<td><input type="number" class="fulltd" id="initial" name="initial" value="${cash.balance}"></td>
						<td></td>
					</tr>
					<c:if test="${!empty listJournal}">
						<c:forEach items="${listJournal}" var="j" varStatus="js">
							<tr id="${j.id}">
								<td class="full"><input type="text" class="fulltd" id="id${j.id}" name="id" value="${j.id}" readOnly></td>
								<td class="full"><input type="text" class="date fulltd" id="date${j.id}" name="date" value="${j.date}"></td>
								<td class="full"><input id="description${j.id}" class="fulltd" name="description" value="${j.description}"></td>
								<td class="full">
									<select class="chosen-select fulltd" id="ietypeId${j.id}" name="ietypeId" style="width:120px;">
										<option></option>
										<c:if test="${!empty listIEType}">
											<c:forEach items="${listIEType}" var="ie" varStatus="ies">
												<option value="${ie.id}" ${ie.id==j.ietype.id?'selected':''}>${ie.ie=='0'?'支':'收'}-${ie.name}</option>
											</c:forEach>
										</c:if>
									</select>
								</td>
								<td class="full"><input type="number" class="calculate1 fulltd" id="income${j.id}" name="income" value="<c:if test='${j.income!=0}'>${j.income}</c:if>"></td>
								<td class="full"><input type="number" class="calculate2 fulltd" id="expenditure${j.id}" name="expenditure" value="<c:if test='${j.expenditure!=0}'>${j.expenditure}</c:if>"></td>
								<td class="full"><input type="number" class="balance fulltd" id="balance${j.id}" name="balance" readonly="readonly"></td>
								<td class="full">
									<a href="javascript:void(0)" onclick="save(${j.id})">
										<i class="fa fa-save" aria-hidden="true" title="保存"></i>
									</a>
									<a href="javascript:void(0)" onclick="del(${j.id})">
										<i class="fa fa-trash" aria-hidden="true" title="删除"></i>
									</a>
								</td>
							</tr>
						</c:forEach>
					</c:if>
					<tr id="${count}">
						<td class="full"><input type="text" class="fulltd" id="id${count}" name="id" value="${count}" readOnly></td>
						<td class="full"><input type="text" class="date fulltd" id="date${count}" name="date" ></td>
						<td class="full"><input type="text" class="fulltd" id="description${count}" name="description"></td>
						<td class="full">
							<select class="chosen-select fulltd" id="ietypeId${count}" name="ietypeId" style="width:120px;">
								<option></option>
								<c:if test="${!empty listIEType}">
									<c:forEach items="${listIEType}" var="ie" varStatus="ies">
										<option value="${ie.id}">${ie.ie=='0'?'支':'收'}-${ie.name}</option>
									</c:forEach>
								</c:if>
							</select>
						</td>
						<td class="full"><input type="number" class="calculate1 fulltd" id="income${count}"></td>
						<td class="full"><input type="number" class="calculate2 fulltd" id="expenditure${count}"></td>
						<td class="full"><input type="number" class="balance fulltd" id="balance${count}" readonly="readonly"></td>
						<td class="full">
						<div>
							<a href="javascript:void(0)" onclick="save(${count})">
								<i class="fa fa-save" aria-hidden="true" title="保存"></i>
							</a>
							<a href="javascript:void(0)" onclick="del(${count})">
								<i class="fa fa-trash" aria-hidden="true" title="删除"></i>
							</a>
						</div>
						</td>
					</tr>
                </tbody>
                <tfoot>
                	<tr>
						<td class="full"></td>
						<td class="full"></td>
						<td class="full">合计</td>
						<td class="full"></td>
						<td class="full"><input type="text" class="fulltd" id="incomeAll" readonly="readonly"></td>
						<td class="full"><input type="text" class="fulltd" id="expenditureAll" readonly="readonly"></td>
						<td class="full"><input type="text" class="fulltd" id="balanceAll" readonly="readonly"></td>
						<td class="full"></td>
					</tr> 
                </tfoot>
              </table>
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

<!-- jQuery 2.2.3 版本不能过高-->
 <script src="../plugins/jQuery/jquery-2.2.3.min.js"></script> 
<!--<script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>-->
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
<!-- date -->
<script src="../js/moment.min.js"></script>
<script type="text/javascript" src="../plugins/daterangepicker/daterangepicker.js"></script>
<script type="text/javascript" src="../plugins/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="../js/foundation-datepicker.js"></script>
<!-- page script -->
<script type="text/javascript" src="../js/chosen.jquery.js"></script>
<script type="text/javascript" src="../js/chosen.proto.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<script type="text/javascript" src="../js/messages_zh.min.js"></script>
<script>
$(document).ready(function () {
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
    $('#daterange').daterangepicker({
    	"autoApply": true,
    	"locale":locale
    });
    //datepicker
	$('.date').fdatepicker({
		language:'cn',
		format:'yyyy-mm-dd'
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
    $('#journal').DataTable({
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
    //初始化余额
    $('#journal').on('blur','#initial',function(){
    	var url='/ssh/cashier/updateInitial';
    	var balance=$('#initial').val();
    	var cashid=${cash.id};
    	var args={'balance':balance,'cashid':cashid};
    	$.get(url,args,function(data){
    		if(data==true){
    			$('.balance').blur();
    			alert("初始化成功");
    		}else{
    			alert(data);
    		}
    	});
    });
    //income收入合计+校验
    $('#journal').on('blur','.calculate1',function(){
    	var id=$(this).parent().parent().attr('id');
    	var text=$('#ietypeId'+id+' option:selected').text();
    	var ie=text.substring(0,1);
    	if(text==null){
    		$('#ietypeId'+id).focus();
    	}else{
    		if(ie=='收'){
        		if($(this).val()==null){
        			$(this).attr('placeholder','请填写收入');
        		}else{
        			$('#expenditure'+id).val('');
        		}
        	}else if(ie=='支'){
        		if($(this).val()==null){
        			
        		}else{
        			$(this).val('');
        		}
        	}
    	}
    	var incomeAll=0;
    	$('.calculate1').each(function(){
    		incomeAll+=Number($(this).val());
    	});
    	$('#incomeAll').val(incomeAll.toFixed(1));
    	$('.balance').blur();
    });
    //expenditure支出合计
	$('#journal').on('blur','.calculate2',function(){
		var id=$(this).parent().parent().attr('id');
    	var text=$('#ietypeId'+id+' option:selected').text();
    	var ie=text.substring(0,1);
    	if(text==null){
    		$('#ietypeId'+id).focus();
    	}else{
    		if(ie=='收'){
        		if($(this).val()==null){
        			
        		}else{
        			$(this).val('');
        		}
        	}else if(ie=='支'){
        		if($(this).val()==null){
        			$(this).attr('placeholder','请填写支出');
        		}else{
        			$('#income'+id).val('');
        		}
        	}
    	}
		var expenditureAll=0;
    	$('.calculate2').each(function(){
    		expenditureAll+=Number($(this).val());
    	});
    	$('#expenditureAll').val(expenditureAll.toFixed(1));
    	$('.balance').blur();
    });
    //balance余额合计
    $('#journal').on('blur','.balance',function(){
		var balanceAll=Number($('#initial').val());
    	$('.balance').each(function(){
    		var id=$(this).parent().parent().attr('id');
        	var text=$('#ietypeId'+id+' option:selected').text();
        	var ie=text.substring(0,1);
        	if(ie=='收'){
        		balanceAll=balanceAll+Number($('#income'+id).val());
        		$(this).val(Number(balanceAll).toFixed(1));
        	}else if(ie=='支'){
        		balanceAll-=Number($('#expenditure'+id).val());
        		$(this).val(Number(balanceAll).toFixed(1));
        	}
    	});
    	$('#balanceAll').val(Number(balanceAll).toFixed(1));
    });
    //预处理
    $('.calculate1').blur();
    $('.calculate2').blur();
    $('.balance').blur();
    
});
//save ： ajax方式保存一行数据到数据库
var count0=${count};
function save(trId){
	var userid=${user.id};
	var id=$('#id'+trId).val();
	var date=$('#date'+trId).val();
	var url='/ssh/cashier/saveJournal';
	var description=$('#description'+trId).val();
	var ietypeId=$('#ietypeId'+trId).val();
	var income=$('#income'+trId).val();
	var expenditure=$('#expenditure'+trId).val();
	var cashId=${cash.id};
	if(date==''){
		$('#date'+trId).focus();
		$('#date'+trId).attr('placeholder','不能为空');
		return false;
	}
	if(description==''){
		$('#description'+trId).focus();
		$('#description'+trId).attr('placeholder','不能为空');
		return false;
	}
	if(ietypeId==''){
		$('#ietypeId'+trId).focus();
		$('#ietypeId'+trId).attr('placeholder','不能为空');
		return false;
	}
	if(income==''&&expenditure==''){
		$('#income'+trId).focus();
		$('#income'+trId).attr('placeholder','不能为空');
		return false;
	}
	if(income==''){
		income=0;
	}else{
		income=Number(income);
	}
	if(expenditure==''){
		expenditure=0;
	}else{
		expenditure=Number(expenditure);
	}
	//需要存入cashId,balance不存入
	var args={
		'id':id,
		'date':date,
		'description':description,
		'ietypeId':ietypeId,
		'income':income,
		'expenditure':expenditure,
		'cashId':cashId
	};
	$.get(url,args,function(count){
		if(count!=count0){
			count0++;
			var newrow="<tr id='"+count+"'><td class='full'><input class='fulltd' type='text' id='id"+count+"' name='id' value='"+count+"' style='border:0;' readonly='readonly'></td><td class='full'><input type='text' class='date fulltd' id='date"+count+"' name='date' ></td><td class='full'><input class='fulltd' id='description"+count+"' name='description'></td><td class='full'><select class='chosen-select fulltd' id='ietypeId"+count+"' name='ietypeId' style='width:120px;'><option></option><c:if test='${!empty listIEType}'><c:forEach items='${listIEType}' var='ie' varStatus='ies'><option value='${ie.id}'>${ie.ie=='0'?'支-':'收-'}${ie.name}</option></c:forEach></c:if></select></td><td class='full'><input type='text' class='calculate1 fulltd' id='income"+count+"'></td><td class='full'><input type='text' class='calculate2 fulltd' id='expenditure"+count+"'></td><td class='full'><input type='text' class='fulltd balance' id='balance"+count+"' readonly='readonly'></td><td class='full'><div><a href='javascript:void(0)' onclick='save("+count+")'><i class='fa fa-save' aria-hidden='true' title='保存'></i></a>&nbsp;<a href='javascript:void(0)' onclick='del("+count+")'><i class='fa fa-trash' aria-hidden='true' title='删除'></i></a></div></td></tr>";
			$('#journal').append(newrow);
			 //datepicker
			$('.date').fdatepicker({
				language:'cn',
				format:'yyyy-mm-dd'
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
		}else{
			alert('保存成功');
		}
	});
}
//delete ：ajax方式删除一行数据
function del(trid){
	var journalId=trid;
	var table=$('#journal').DataTable;
	url='/ssh/cashier/deleteJournal';
	args={'journalId':journalId};
	$.get(url,args,function(boo){
		if(boo==true){
			alert('删除成功');
			$('#'+trid).remove();
		}else{
			alert('删除失败');
			$('#'+trid).remove();
		}
	});
}
</script>
</body>
</html>
    