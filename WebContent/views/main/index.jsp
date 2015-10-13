<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/mysite/assets/css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">
		<jsp:include page="/views/include/header.jsp" flush ="false"></jsp:include>
		<div id="wrapper">
			<div id="content">
				<div id="site-introduction">
					<img id="profile" src="https://www.facebook.com/profile/pic.php?cuid=AYi5u43Zy7ZHlrDyCCd4KAKFjYl5naEiR421hGFQVBaOr6tc3NMVlF_WgvMIYiXJoI1DfwZBe6mLi0sLu6wBr0127nzZl1zeU7EjF_Os8ZEHCCNltV5aJ-gEjy_bgUdGVh2BP7Ho7qrnz9N0RBXgsp-XMfBDsLloJSFl8SUCA393e4Sl9GJM7Knu9ml0bSWoadpnODF7knapxELvYi6C7Sfv&size=square&usedef=1">
					<h2>안녕하세요. 안대혁의  mysite에 오신 것을 환영합니다.</h2>
					<p>
						이 사이트는  웹 프로그램밍 실습과제 예제 사이트입니다.<br>
						메뉴는  사이트 소개, 방명록, 게시판이 있구요. JAVA 수업 + 데이터베이스 수업 + 웹프로그래밍 수업 배운 거 있는거 없는 거 다 합쳐서
						만들어 놓은 사이트 입니다.<br><br>
						<a href="#">방명록</a>에 글 남기기<br>
					</p>
				</div>
			</div>
		</div>
		<jsp:include page="/views/include/navigation.jsp" flush ="false"></jsp:include>
		<jsp:include page="/views/include/footer.jsp" flush ="false"></jsp:include>
	</div>
</body>
</html>