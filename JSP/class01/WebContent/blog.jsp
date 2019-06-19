<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP blog</title>

<link href="/web/css/default.css" rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<div id="main_wrap">

		<!-- header시작 -->
		<%@ include file="folder/header.jsp"%>
		<!-- header끝-->

		<!-- nav시작 -->
		<%@ include file="../folder/nav.jsp"%>
		<!-- nav끝-->

		<!-- 계속 바뀌어야하는 내용들 -> 공통부분이 아니라 INCLUDE하지 않았음! -->
		<div id="contents">
			<div id="content">
				<article>
					<h1 class="title">안녕! 나는 순무!</h1>
					<span class="date">2019.06.05 14:55</span> <img class="img"
						src="/web/images/1.jpg">
					<p>순무와 함께 살고부터는 이런 생각을 더 많이 하게 된다. 순무와 가족이 되기 이전에 내게 고양이와 함께
						산다는 것은 로망으로 가득한 일상이었다. 특히 개냥이 같은 성격으로, 집에 손님들이 오면 예쁨 받는 ‘접대묘’에 대한
						로망이 가득했다. 동물을 무서워하던 나에게 가장 먼저 곁을 내어준 동물도 친구네 집의 넉살 좋던 고양이였기 때문이었다.</p>
					<p>순무는 접대는 커녕 고양이 중에서도 특히 소심하고 겁이 많은 성격을 가지고 있었다. 처음에는 사람도
						성장하면서 성격이 변하는데, 고양이도 그렇지 않을까 하고 기대했다. 그런데 이건 그저 나만 원하는 것일 뿐, 순무는
						결코 원하지 않을 거라는 생각이 들었다. 이 세상의 모든 만물이 같은 듯 다른 모양새를 가지고 있는 것처럼, 순무도
						내가 생각했던 고양이보다 아주 조금 겁이 많을 뿐이었다.</p>
				</article>

				<article>

					<span class="date">2019.06.03 04:55</span> <img class="img"
						src="/web/images/2.jpg">
					<p>순무는 겁이 많지만 결코 주저하지는 않는다. 삶을 향해 걸어가는 자신만의 방식과 속도가 있다. 처음 우리
						집에 왔을 때는 누구에게도 곁을 주지 않았던 것과 달리, 지금은 낯선 사람이 와도 소파 밑에서 고개를 빼꼼히 내밀고
						탐색하는 용기까지 생겼다. 이처럼 내가 원하는 대로 순무를 그 속도에 맞출 수 없다는 걸 순무와 많은 시간을 보내면
						보낼수록 깨닫는다. 순무와 함께하는 시간이 늘어나는 만큼 느끼는 것과 배우는 것도 더욱 늘어난다.</p>
					<p>세상에는 참 다양한 생명이 있다. 그 안에 사람이 있고, 고양이도 있다. 어느 순간부터 이 사회가 정해놓은
						잣대에 무언가를 자꾸 맞추려고 하는 나 자신을 발견할 때마다 순무를 바라본다. 어느 때는 느긋하게, 또 어느 때는
						스스로 용기를 내면서 애쓰는 모습을 보면서 내 삶에 기준은 오직 나만이 만들 수 있다고 깨닫는다.</p>
				</article>
			</div>

			<!-- aside시작 -->
			<%@ include file="folder/aside.jsp"%>
			<!-- aside끝-->

		</div>

		<!-- footer시작 -->
		<%@ include file="folder/footer.jsp"%>
		<!-- footer끝-->

	</div>
</body>
</html>