<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="main-header">
    <!-- Logo -->
    <a href="#" class="logo">
      <span class="logo-mini">财务管理</span>
      <span class="logo-lg"><b>中小企业</b>财务管理系统</span>
    </a>
    <nav class="navbar navbar-static-top">
      <!-- <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">切换导航</span>
      </a>&nbsp;&nbsp; -->
		<!-- 用户下拉列表 -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="../dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs">${user.userName}</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="../dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                <p>
                  ${user.userName} - Web开发人员
                  <small>2017.1.1入职</small>
                </p>
              </li>
              <!-- Menu Body -->
              <li class="user-body">
                <div class="row">
                  <div class="col-xs-6 text-center">
                    <a href="#">
                    	<c:if test="${!empty accountSet}">
                    		当前账套：${accountSet.name}
                    	</c:if>
                    </a>
                  </div>
                  <div class="col-xs-6 text-center">
                    <a href="#">
                    	<c:if test="${!empty accountSet}">
                    		<b>${accountSet.period}</b>
                    	</c:if>
                    </a>
                  </div>
                </div>
                <!-- /.row -->
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="${pageContext.request.contextPath}/setting/toLog?id=${user.id}" class="btn btn-default btn-flat">操作日志</a>
                </div>
                <div class="pull-right">
                  <a href="${pageContext.request.contextPath}/user/toLogin" class="btn btn-default btn-flat">退出登录</a>
                </div>
              </li>
            </ul>
          </li>
          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>
        </ul>
      </div>
    </nav>
  </header>