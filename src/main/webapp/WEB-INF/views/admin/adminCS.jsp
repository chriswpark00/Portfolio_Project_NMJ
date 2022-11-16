<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Customer Service</title>

<!-- Custom fonts for this template -->
  <link href="${pageContext.request.contextPath}/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template / Admin 페이지 전반적인 레이아웃 css -->
  <link href="${pageContext.request.contextPath}/admin/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page / 테이블에 관한 css-->
  <link href="${pageContext.request.contextPath}/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

<c:choose>
	<c:when test="${sessionScope.mb_uid == null || empty sessionScope.mb_uid || sessionScope.mb_type != 3}">
		<script>
			alert("로그인을 하지 않으셨거나 권한이 없는 사용자 또는 자동 로그아웃 되었습니다. 로그인 해주세요.");
			location.href = "${pageContext.request.contextPath}/member/main.nmj";
		</script>
	</c:when>
</c:choose>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<script>
$(window).load(function(){
	$("#dataTable_filter").hide();
});
</script>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sideㄴbar-brand d-flex align-items-center justify-content-center" href="user_user.html">
      
            <img src="img/logo2.png" style="width: 100px; margin-top: 30px;">
      </a>

      <!-- Nav Item -->
      <li class="nav-item">
        <a class="nav-link" href="adminMember.nmj"> 
          <i class="fas fa-fw fa-cog"></i>
          <span>일반회원관리</span></a>
      </li>

      <li class="nav-item">
        <a class="nav-link" href="adminStore.nmj"> 
          <i class="fas fa-fw fa-cog"></i>
          <span>매장회원관리</span></a>
      </li>

      <li class="nav-item">
        <a class="nav-link" href="adminCommunity.nmj"> 
          <i class="fas fa-fw fa-cog"></i>
          <span>커뮤니티관리</span></a>
      </li>

      <li class="nav-item">
        <a class="nav-link" href="adminCS.nmj"> 
          <i class="fas fa-fw fa-cog"></i>
          <span>Customer Service</span></a>
      </li>
      
       <li class="nav-item">
      	<a class="nav-link" href="${pageContext.request.contextPath}/member/main.nmj"> 
          <i class="fas fa-fw fa-cog"></i>
          <span>놀먹자 홈페이지</span></a>
		</li>
      
      <li class="nav-item">
      	<a class="nav-link" href="${pageContext.request.contextPath}/member/logout.nmj"> 
          <i class="fas fa-fw fa-cog"></i>
          <span>LogOut</span></a>
		</li>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->


    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800" style="margin-top: 30px; margin-bottom: 30px; font-size: 1.5em;">CS관리</h1>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">

            <div class="card-body">
            <div class="table-responsive">
                      
	<c:choose>
	<c:when test="${empty list || fn.length(list) == 0 }">
		데이터가 없습니다<br>
	</c:when>
	
	<c:otherwise>
      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">

      <thead>
          <tr>
            <th>no.</th>
            <th>유형</th>
            <th>해결여부</th>
            <th>링크</th>
          </tr>
		</thead>
		<tbody>
	<c:forEach var="dto" items="${list}">
		<tr>
			<td>${dto.request_uid }</td>
			<c:choose>
				<c:when test="${dto.request_type == 1 }">
					<td>가입요청</td>
				</c:when>
				<c:when test="${dto.request_type == 2 }">
					<td>수정요청</td>
				</c:when>
				<c:when test="${dto.request_type == 3 }">
					<td>게시글신고</td>
				</c:when>
				<c:otherwise>
					<td>댓글신고</td>
				</c:otherwise>
			</c:choose>
			<td>
			<c:choose>
				<c:when test="${dto.request_check== 0 }">승인대기</c:when>
				<c:when test="${dto.request_check== 1 }">해결완료</c:when>
				<c:when test="${dto.request_check== 2 }">거절완료</c:when>
				</c:choose>
			</td>
			<c:choose>
				<c:when test="${dto.request_check == 0 }">
					<c:choose>
						<c:when test="${dto.request_type == 1 }">
							<td><button class="btn btn-outline-secondary" onclick="location.href='adminStoreRQ.nmj?request_uid=${dto.request_uid }'">가입요청링크</button></td>
						</c:when>
						<c:when test="${dto.request_type == 2 }">
							<td><button class="btn btn-outline-secondary" onclick="location.href='adminStoreRQ2.nmj?request_uid=${dto.request_uid}'">수정요청링크</button></td>
						</c:when>
						<c:when test="${dto.request_type == 3 }">
							<td><button class="btn btn-outline-secondary" onclick="location.href='adminCommunityRQ.nmj?request_uid=${dto.request_uid}'">게시글신고링크</button></td>
						</c:when>
						<c:otherwise>
							<td><button class="btn btn-outline-secondary" onclick="location.href='adminReplyRQ.nmj?request_uid=${dto.request_uid}'">댓글신고링크</button></td>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<td>완료한 요청</td>
				</c:otherwise>
			</c:choose>
		</tr>					
	</c:forEach>
		</tbody>
      </table>
    </c:otherwise>
</c:choose>
	</div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Let's Play, Eat and Sleep 2020</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>


   <!-- Bootstrap core JavaScript-->
  <script src="${pageContext.request.contextPath}/admin/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${pageContext.request.contextPath}/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${pageContext.request.contextPath}/admin/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="${pageContext.request.contextPath}/admin/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="${pageContext.request.contextPath}/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="${pageContext.request.contextPath}/admin/js/demo/datatables-demo.js"></script>

</body>

</html>