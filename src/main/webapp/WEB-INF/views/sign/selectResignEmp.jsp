<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.insertBtn {
	font-size: 18px;
	color: black;
	font-weight: bold;
	margin-left: 10px;
	border-right: 1px solid rgba(143, 143, 143, 0.547);
	padding-right: 15px;
}

.insertBtn:hover {
	color: gray;
	cursor: pointer;
}

.mainTitle {
	width: 800px;
	margin-top: 10px;
}

hr {
	opacity: 0.4;
	width: 100%;
}

h3 {
	margin: 0;
	margin-bottom: 10px;
	margin-left: 10px;
}

.dtpaperName {
	margin-left: 10px;
	line-height: 10px;
}

table {
	font-size: 16px;
	border-spacing: 0px;
	border: 0.5px solid rgba(143, 143, 143, 0.547);
	text-align: center;
}

tr {
	height: 30px;
}

a {
	color: blue
}

th {
	font-weight: 400;
}

th, td {
	border-right: 0.5px solid rgba(143, 143, 143, 0.547);
	vertical-align: middle;
}

.signSelect tr {
	text-align: center;
	width: 100%;
}

.signSelect th {
	background-color: #f1f1f1;
	width: 101px;
}

.signSelect td {
	width: 150px;
	border: 0;
}

.publicPaper tr {
	text-align: center;
	width: 100%;
}

.publicPaper th {
	background-color: #f1f1f1;
	width: 100px;
}

.publicPaper td {
	width: 664px;
	border: 0;
}

.titleSection th, td {
	border-bottom: 0.5px solid rgba(143, 143, 143, 0.547);
}

.plusVa {
	margin-left: 10px;
	font-size: 16px;
	height: 30px;
	border: none;
	box-shadow: 0px 0px 4px #878787;
}

.plusVa:hover {
	cursor: pointer;
	background-color: #8787874d;
}

.selectVa {
	margin: 10px;
	font-size: 16px;
}

input, select, textarea {
	border: 0.5px solid rgba(143, 143, 143, 0.547)
}

.otworkPaper input[type=text] {
	width: 97%;
	box-sizing: border-box;
	margin: auto;
	height: 100%;
	border: 0;
	font-size: 16px;
	vertical-align: middle;
	background-color: #ffffff48;
}

/* .otworkPaper input[type=date] {
            box-sizing: border-box;
            margin: auto;
            font-size: 16px;
            vertical-align: middle;
            height: 80%;
            margin-left: 5px;
            width: 35%;
        } */
.otworkPaper td {
	height: 30px;
}

.tableTitle {
	background-color: #f1f1f1;
}

.otworkPaper select {
	height: 25px;
	font-size: 16px;
}

.otworkPaper input[type=datetime-local] {
	text-align: center;
	width: 40%;
	vertical-align: middle;
}

input[type=file] {
	margin-bottom: 4px;
}

span {
	margin-left: 5px
}
</style>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<script src="https://uicdn.toast.com/tui-tree/latest/tui-tree.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://uicdn.toast.com/tui-tree/latest/tui-tree.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- <script>
        $(document).ready(function () {
            $("#today").change(function () {
                console.log("gd");
                if ($("#today").is(":checked")) {
                    $("#startTime").attr("disabled", false);
                    $("#endTime").attr("disabled", false);
                    $("#currentDate2").attr("disabled", true);
                } else {
                    $("#startTime").attr("disabled", true);
                    $("#endTime").attr("disabled", true);
                    $("#currentDate2").attr("disabled", false);
                }
            });
        });
    </script> -->

</head>

<body style="width: 800px; font-family: 'Noto Sans KR', sans-serif;">

	<br>
	<section>
		<div style="margin: auto; margin-top: 10px; width: 800px;">
			<table class="otworkPaper"
				style="border: 1px solid rgba(143, 143, 143, 0.547)" align="center">
				<tr>
					<td class="tableTitle" width="100">퇴직자</td>
					<td width="280" align="left"><span>김범진</span></td>
					<td class="tableTitle" width="100">부서</td>
					<td width="280" align="left" style="border-right: 0;"><span>영업부</span>
					</td>
				</tr>
				<tr>
					<td class="tableTitle">퇴직예정일자</td>
					<td align="left"><span>2022-01-01</span></td>
					<td class="tableTitle">업무인수자</td>
					<td align="left" style="border-right: 0;"><span>인수자</span></td>
				</tr>
				<tr>
					<td class="tableTitle">외부메일주소</td>
					<td align="left"><span>메일</span></td>
					<td class="tableTitle">면담자</td>
					<td style="border-right: 0;" align="left"><span>면담자</span></td>
				</tr>
				<tr>
					<td class="tableTitle">은행명</td>
					<td align="left"><span>국민은행</span></td>
					<td class="tableTitle">계좌번호</td>
					<td style="border-right: 0;" align="left"><span>계좌번호</span></td>
				</tr>
				<tr>
					<td class="tableTitle" style="border-bottom: 0;">퇴직사유</td>
					<td colspan="3" style="border-bottom: 0; border-right: 0;"
						align="left">
						<div style="margin-left: 5px;">
							<p>여기는 어쩌고 저쩌고</p>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</section>


	<script>
		document.getElementById('currentDate').value = new Date().toISOString()
				.substring(0, 10);
		document.getElementById('currentDate2').value = new Date()
				.toISOString().substring(0, 10);
	</script>

</body>
</html>