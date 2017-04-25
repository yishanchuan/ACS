<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<ul class="sidebar-menu">
        <!-- <li class="header">MAIN NAVIGATION</li> -->
        <li>
          <a href="${pageContext.request.contextPath}/user/main?id=${user.id}">
            <i class="fa fa-th"></i> 
            <span>首页</span>
          </a>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-dashboard"></i> 
            <span>凭证管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="${pageContext.request.contextPath}/voucher/toAddVoucher?id=${user.id}"><i class="fa fa-circle-o"></i>增加凭证</a></li>
            <li><a href="${pageContext.request.contextPath}/voucher/selectVoucher?id=${user.id}"><i class="fa fa-circle-o"></i>查看凭证</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-table"></i> 
            <span>出纳</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="${pageContext.request.contextPath}/cashier/cashJournal?id=${user.id}"><i class="fa fa-circle-o"></i>现金日记账</a></li>
            <li><a href="${pageContext.request.contextPath}/cashier/bankJournal?id=${user.id}"><i class="fa fa-circle-o"></i>银行日记账</a></li>
            <li><a href="${pageContext.request.contextPath}/cashier/report?id=${user.id}"><i class="fa fa-circle-o"></i>资金报表</a></li>
            <li><a href="${pageContext.request.contextPath}/cashier/IEType?id=${user.id}"><i class="fa fa-circle-o"></i>收支类别</a></li>
            <li><a href="${pageContext.request.contextPath}/cashier/accountSetting?id=${user.id}"><i class="fa fa-circle-o"></i>账户设置</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-table"></i> 
            <span>固定资产</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#"><i class="fa fa-circle-o"></i>固定资产管理</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i>折旧明细</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i>固定资产汇总</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i>固定资产类别管理</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-laptop"></i>
            <span>期末结账</span>
          </a>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-files-o"></i>
            <span>账簿</span>
            <span class="pull-right-container">
            	<i class="fa fa-angle-left pull-right"></i>
              <!-- <span class="label label-primary pull-right">4</span> -->
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="${pageContext.request.contextPath}/account/subsidiary?id=${user.id}"><i class="fa fa-circle-o"></i>明细账</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i>总账</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i>科目帐</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i>多栏账</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-pie-chart"></i>
            <span>报表</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#"><i class="fa fa-circle-o"></i>资产负债表</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i>利润表</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i>现金流量表</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i>主要应交税金明细表</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-table"></i> 
            <span>设置</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
          	<li><a href="${pageContext.request.contextPath}/setting/accountSet?id=${user.id}"><i class="fa fa-circle-o"></i>账套</a></li>
            <li><a href="${pageContext.request.contextPath}/setting/toLog?id=${user.id}"><i class="fa fa-circle-o"></i>操作日志</a></li>
            <li><a href="${pageContext.request.contextPath}/setting/initialBalance?id=${user.id}"><i class="fa fa-circle-o"></i>期初设置</a></li>
            <li><a href="${pageContext.request.contextPath}/setting/accountingSubject?id=${user.id}"><i class="fa fa-circle-o"></i>会计科目</a></li>
            <li><a href="${pageContext.request.contextPath}/setting/voucherGroup?id=${user.id}"><i class="fa fa-circle-o"></i>凭证字</a></li>
            <li><a href="${pageContext.request.contextPath}/setting/current?id=${user.id}"><i class="fa fa-circle-o"></i>币别</a></li>
            <li><a href="${pageContext.request.contextPath}/setting/controlRole?id=${user.id}"><i class="fa fa-circle-o"></i>权限控制</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i>辅助核算</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i>备份和恢复</a></li>
          </ul>
        </li>
        <li>
        	<a href="#">
        		<i class="fa fa-book"></i> 
        		<span>新手指导</span>
        	</a>
        </li>
        <li class="header">扩展</li>
        <li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>扩展1</span></a></li>
        <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>扩展2</span></a></li>
        <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>扩展3</span></a></li>
      </ul>