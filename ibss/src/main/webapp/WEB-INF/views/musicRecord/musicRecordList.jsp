<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/include/common.jsp"%>
	<head>
		<title>点歌记录</title>
	</head>

	<body>
		<!-- loading图片开始-->
		<div class="loading"><img src="${ctx}/static/img/loading.gif" alt="loading-img" /></div>
		<!--  loading图片结束 -->

		<!-- 头部开始 -->
		<%@ include file="/WEB-INF/include/userNavbar.jsp"%>
		<!--头部结束 -->

		<!-- 左侧边栏开始 -->
		<%@ include file="/WEB-INF/include/userLeft.jsp"%>
		<!-- 左侧边栏结束 -->

		<!-- 内容开始 -->
		<div class="content">
			<div class="page-header">
				<h1 class="title">点歌记录</h1>
			</div>
			<div class="container-padding">
				<div class="row">
					<form class="form-horizontal" id="searchForm" action="${ctx}/musicRecord/list" method="post">
						<div class="col-md-12">
								<div class="panel panel-default">
									<div class="panel-title">
										<label>查询条件</label>
									</div>
									<div class="form-group">
										<label class="col-lg-2 col-xs-2 control-label form-label">音乐名称：</label>
										<div class="col-lg-3 col-xs-3 ">
											<input type="text" class="form-control"  name="search_musicName" value="${param.search_musicName}">
										</div>
										<label class="col-lg-2 col-xs-2 control-label form-label">点歌日期：</label>
										<div class="col-lg-3 col-xs-3 ">
											<div class="input-prepend input-group">
												<span class="add-on input-group-addon"><i class="fa fa-calendar"></i></span>
												<input type="text" id="recordDate" class="form-control" name="search_recordDate" value="${param.search_recordDate}"/>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-10 col-xs-10 control-label form-label"></label>
										<div class="col-lg-1 col-xs-1">
											<button class="btn btn-light "type="submit"  ><i class="fa  fa-search"></i>查询</button>
										</div>
									</div>
								</div>
						</div>
						<div class="col-md-12">
							<div class="panel panel-default">
								<div class="panel-title">
									<label>查询结果</label>
								</div>
								
								<div class="panel-body table-responsive layui-form">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>序号</th>
												<c:if test="${userType eq '1'}">
												<th>用户名</th>
												</c:if>
												<c:if test="${userType eq '1'}">
												<th>姓名</th>
												</c:if>
												<th>音乐名称</th>	
												<th>点歌时间</th>										
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${musicRecordList.content }" var="musicRecordList" varStatus="status">
												<tr>
													<td>${status.count }</td>
													<c:if test="${userType eq '1'}">												
													<td>${musicRecordList.userName}</td>
													</c:if>
													<c:if test="${userType eq '1'}">
													<td>${musicRecordList.name}</td>
													</c:if>
													<td>
														<a href="${ctx}/music/detail/${musicRecordList.musicKey}">${musicRecordList.musicName }</a>
													</td>
													<td>${musicRecordList.recordDate}</td>													
												</tr>
											</c:forEach>
										</tbody>
									</table>
									
									<!-- 分页组件开始 -->
									<tags:pagination page="${musicRecordList}"/>
									<!-- 分页组件开始 -->
									
								</div>
							</div>
						</div>								
					</form>		
				</div>
			</div>
		</div>
			<!-- 内容结束 -->
			
			<!--底开始-->
			<%@ include file="/WEB-INF/include/userFooter.jsp"%>
			<!-- 底结束 -->
	</body>
	<script type="text/javascript">
	$(document).ready(function() {
		$('#recordDate').daterangepicker({ 
			singleDatePicker : true,
			format : 'YYYY-MM-DD'
		});
	});
	</script>