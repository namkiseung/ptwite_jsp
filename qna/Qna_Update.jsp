<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<title>글 수정</title>
			<link rel="stylesheet" type="text/css" href="../main.css">

			</head>

			<script>
				function update_move() {
				//res_name, res_day, res_email, res_attach, res_title, res_content, res_num
				var params = new Object();
				//params.username = document.getElementById("__name").value;
				params.day = document.getElementById("__day").value;
				params.num = document.getElementById("__num").value;
				//params.email = document.getElementById("__email").value;
				params.attach = document.getElementById("__file").value;
				params.title = document.getElementById("__title").value;
				params.content = document.getElementById("__content").value;
				params.pw = document.getElementById("__pw").value;

				//작성자, 이메일, 첨부파일, 제목, 내용, 시간, 비밀번호	
				method = "post";

				var form = document.createElement("form");
				form.setAttribute("method", method);
				form.setAttribute("action", "Qna_Update_action.jsp");
				form.setAttribute("accept-charset", "utf-8");

				for(var key in params) {
				var hiddenField = document.createElement("input");
				hiddenField.setAttribute("type", "hidden");
				hiddenField.setAttribute("name", key);
				hiddenField.setAttribute("value", params[key]);
				//alert(JSON.stringify(key)+" : "+params[key]);
				form.appendChild(hiddenField);
				}
				document.BoardUpdateForm.appendChild(form);

				form.submit();
				}

			</script>

			<body>
				<%
						request.setCharacterEncoding("UTF-8");
						String req_username = request.getParameter("username"); 
						String req_day = request.getParameter("day"); 
						String req_email = request.getParameter("email"); 
						String req_attach = request.getParameter("attach"); 
						String req_title = request.getParameter("title"); 
						String req_content = request.getParameter("content");
						String req_num = request.getParameter("num");
						%>
						<div id="container">
							<div id="header">
								<span class="style1">
									<%@ include file="../login.jsp"%>
									</span>
								</div>
								<%@ include file="../left.jsp"%>
									<!--<div id="sidebar">right area</div>-->
									<div id="content">
										<table summary="글수정 전체 테이블">
											<form name="BoardUpdateForm" method="post" action="Qna_Update_action.jsp">

												<colgroup>
													<col width="35%">
														<col width="65%">
														</colgroup>

														<table summary="테이블 구성" >
															<caption>
																<h1>글 수정하기</h1>
															</caption>	
															<tr>
																<td>작성자</td>
																<td>
																	<%=req_username %>
																	</td>
																	<!--<input id="__name" type="hidden" name="username" value="" />-->
																		<input id="__day" type="hidden" name="day" value="<%=req_day %>" />
																			<input id="__num" type="hidden" name="num" value="<%=req_num %>" />
																			</tr>
																			<tr>
																				<td>E-Mail</td>
																				<td>
																					<%=req_email %>
																					</td>
																					<!--<input id="__email" type="hidden" name="email" value="" />-->
																					</tr>
																					<tr>
																						<td>첨부파일</td>
																						<td>
																							<%=req_attach %>
																							</td>
																							<input id="__file" type="hidden" name="attach" value="<%=req_attach %>" />
																							</tr>
																							<tr>
																								<td>제 목</td>
																								<td>
																									<input id="__title" type="text" name="title" value="<%=req_title %>" />
																									</td>
																								</tr>
																								<tr>
																									<td>내 용</td>
																									<td>
																										<textarea id="__content" name="content" rows ="10" cols="100">
																											<%=req_content %>
																											</textarea>
																										</td>
																									</tr>
																									<tr>
																										<td>비밀번호</td> 
																										<td>	<input id="__pw" type="password" name="password" value="" size="15" maxlength="15">
																										
																											
																											<tr>
																												<td colspan=2>
																													<hr size=1>
																													</td>
																												</tr>
																												<tr>
																													<td colspan="2">
																														<div align="center">
																															<input type="submit" value="수정 완료" onclick="update_move();"> &nbsp;&nbsp;
																																<input type=reset value="다시 수정"> 
																																	<input type="button" value="뒤로" onclick="javascript:location.href='Qna_List.jsp';">
																																	</div>
																																</td>
																															</tr> 
																														</table>
																													</form> 
																												</table>
																											</div>
																										</body>
																									</html>