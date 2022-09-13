<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/addressCss/address2.css">
<style>
#empMenu, #empSubMenu{ list-style-type: none; margin: 0; padding:0;}

#empSubMenu>li{padding-left: 20px; margin: 0px;}

#empSubMenu>li:hover{cursor:pointer; background: rgb(233, 244, 248);}
#empMenu>li:hover{cursor:pointer; background: rgb(233, 244, 248);} 

</style>

</head>
<body>
	
	<jsp:include page="../common/menubar.jsp"/>
	
    <div style="height: 20px;"></div>
    <div class="adOuter">

    
        <div class="adContainer">

            <!-- 조직도 및 업체연락처 그룹영역 -->
            <div class="addMenu1">
                <button type="button" class="btn btn-primary centerBtn" data-toggle="modal" data-target="#addressAdd">새 연락처</button>   
                <hr width="80%">             
            </div>

            <!--  별표연락처 & 조직도 -->
            <div class="addMenu2_1">
            
                <!-- 별표연락처 -->
                <!-- 로그한 유저의 사번 넘기자 -->              
                <div class="starAdd" onclick="selectStarAdd();">
                    <span class='starYellow'>★</span><span style="font-size: 16px;" onclick=""><b>별표연락처</b></span>
                </div>

                <hr width="80%">
                <!-- 조직도 -->
               	 <ul id="empMenu">
                    <li>
                        <div class="rowInline">
                            <span class="fontsize16" ><b>조직도</b></span> &nbsp;&nbsp;&nbsp;                            
                        </div>
                    </li>
                    <ul id="empSubMenu">                

                    </ul>
                </ul>
                            
            </div>
            
            
            <!-- 내연락처 -->
            <div class="addMenu2_2">
                <hr width="80%">
                <ul id="mainAddMenu">
                    <li>
                        <div class="rowInline">
                            <span class="fontsize16"><b>내 연락처</b></span> &nbsp;&nbsp;&nbsp;
                            <span  data-toggle="modal" data-target="#addGp">
                             +
                            </span>
                        </div>
                    </li>
                    <ul id="subAddMenu">                   
                         
                    </ul>
                </ul>
                    
            </div>            
           
            
            <div class="addMenu3"></div>

            <!-- 검색영역(시간남으면) -->
            <div class="addSearch">
                <table class="centerBtn">
                    <tr>
                        <td id="addTitle" width="120px"><h4><b>주소록</b></h4></td>
                       <!--  <td><input type="text" class="form-control" placeholder="부서 또는 이름 입력하세요" name="searchText" id="searchText"  maxlength="30" style="height: 31px; width:300px"></td>
                        <td><button type="button" id="searchBtn" class="btn btn-sm btn-primary" onclick="">검색</button></td> -->                       
                    </tr>
                </table>
                <hr width="96%">
            </div>
            
            

            <!-- 주소록 테이블 영역-->
            <div class="addMain">

                <!-- 메일보내기 및 삭제 다중선택-->
                <br>
                <div>
                    &nbsp;
                    <input type="checkbox" name="" id="cbx_chkAll" onclick=""> &nbsp;

                    <!-- 내연락처일때만 삭제기능 -->
                    <!-- 삭제 > 모달 > 기능 정보넘기는거 어렵다면 그냥 모달창 띄우지말고 바로 삭제처리 -->
                    <span id="deleteAddArea">
	                  
                    </span>

                    <a class="btn btn-sm btn-primary">메일보내기</a>
                </div>
                
                <br>
				
				<div id="tableArea">	
						
				</div>
				
                <!-- 1. 조직도 테이블 --> 
                <!-- 2. 내 연락처 테이블 -->
                <!-- 3. 별표연락처 -->              

            
            </div>

            <!-- <script> ajax라서... 어떻게 넘길지 모르겠음
                                
                $(function(){
                   
                    $(".emailTitle").click(function(){
                        location.href = 'detail.ne?no=' + $(this).siblings(".no").text();
                                                        // 해당 emailTitle의 동위요소  중 클래스가 no인
                    })        		
        

                    $("#dataCompanyTable>tbody>tr").click(function(){
                        location.href = 'detailCompany.ad?no=' + $(this).children(".no").text();
                                                        // 해당 tr요소의 자식요소 중 클래스가 no인
                    })   
                    
                    $("#dataAddTable>tbody>tr").click(function(){
                        location.href = 'detailMyAdd.ad?no=' + $(this).children(".no").text();
                                                        // 해당 tr요소의 자식요소 중 클래스가 no인
                    })   

                    $("#dataStarAddTable>tbody>tr").click(function(){
                        location.href = 'detailStarAdd.ad?no=' + $(this).children(".no").text();
                                                        // 해당 tr요소의 자식요소 중 클래스가 no인
                    }) 
                })            	
                
            </script> -->

            <!-- 특정 멤버의 주소록 상세창영역-->
            <div class="detailAdd">           
                <br>
                <!-- 내연락처에만 있는 삭제/ 편집기능-->
                <div style="margin-left: 30px;" align="left">
                    <button type="button" class="btn btn-sm btn-warning" data-toggle="modal" data-target="#addressEdit">편집</button>
                    <button type="button" class="btn btn-sm btn-secondary" onclick="deleteAdd();">삭제</button>      
                </div> 

                <div class="addBoxShadow">
                    <br>
                    <table>	
                        
                        <!--목록클릭 전-->
                        <!-- <br>
                        <p>
                            연락처 상세정보를 보려면 목록을 <br>
                            클릭하세요
                        </p> -->

                        <!-- 주소록 상세보기 -->
                        <thead>
                            <tr>
                                <th>
                                    <img id="profileImg" src="">
                                </th>
                                <th align="left"><h5><b>감나라</b></h5></th>
                                <th class="fontSmallSize" style="width: 50px;">Maria</th>
                                <th  align="right">
                                    <a class="material-symbols-outlined aHover" style="text-decoration: none;" href="selectEmail.em">
                                        mail
                                    </a>
                                </th>
                                <th>
                                    <button type="button" class="material-symbols-outlined aHover btn-text" data-toggle="modal" data-target="#addressChat">
                                        chat
                                    </button>
                                </th>
                            </tr>                       
                        </thead>
                        <tbody>               
                            <tr>
                                <td class="fontSmallSize">부서</td>
                                <td colspan="4" class="fontMiddleAdd">&nbsp; 영업부1팀</td>
                            </tr>
                            <tr>
                                <td class="fontSmallSize">직급</td>
                                <td colspan="4" class="fontMiddleAdd">&nbsp; 주임</td>
                            </tr>
            
                            <tr>
                                <td colspan="5"> <hr style="width: 100%;"> </td>
                            </tr>
            
                            <tr>
                                <td class="fontSmallSize">이메일</td>
                                <td colspan="4" class="fontMiddleAdd">&nbsp; wkdfgjkdl@naver.com</td>
                            </tr>
                            <tr>
                                <td class="fontSmallSize">내선번호</td>
                                <td colspan="4" class="fontMiddleAdd">&nbsp;  073-1234-5689</td>
                            </tr>
                            <tr>
                                <td class="fontSmallSize">휴대전화</td>
                                <td colspan="4" class="fontMiddleAdd">&nbsp; 010-1234-5689</td>
                            </tr>                        
            
                            <tr>
                                <td colspan="5"> <hr style="width: 97%;"> </td>
                            </tr>
            
                            <tr>
                                <td class="fontSmallSize">입사일</td>
                                <td colspan="4" class="fontMiddleAdd">&nbsp;  2018.07.02</td>
                            </tr>                             
                        </tbody> 

                        <!-- 별표연락처 & 내 연락처 상세보기 -->
                        <!-- <thead>
                            <tr>
                                <th class="Addstar">
                                    <input type="checkbox" name="addStar" value="" id="rate2">
                                    <label for="rate2">★</label>                                  
                                </th>
                                <th align="left"><h2>감나라</h2></th>
                                <th class="fontSmallSize" style="width: 70px;">Maria</th>
                                <th align="right">
                                    <a class="material-symbols-outlined aHover" style="text-decoration: none;" href="selectEmail.em">
                                        mail
                                    </a>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="fontSmallSize">회사</td>
                                <td colspan="3" class="fontMiddleAdd">&nbsp; 제일디자인</td>
                            </tr>
                            <tr>
                                <td class="fontSmallSize">부서</td>
                                <td colspan="3" class="fontMiddleAdd">&nbsp; 영업부1팀</td>
                            </tr>
                            <tr>
                                <td class="fontSmallSize">직급</td>
                                <td colspan="3" class="fontMiddleAdd">&nbsp; 주임</td>
                            </tr>
            
                            <tr>
                                <td colspan="4"> <hr style="width: 97%;"> </td>
                            </tr>
            
                            <tr>
                                <td class="fontSmallSize">이메일</td>
                                <td colspan="3" class="fontMiddleAdd">&nbsp; wkdfgjkdl@naver.com</td>
                            </tr>
                            <tr>
                                <td class="fontSmallSize">내선번호</td>
                                <td colspan="3" class="fontMiddleAdd">&nbsp;  073-1234-5689</td>
                            </tr>
                            <tr>
                                <td class="fontSmallSize">휴대전화</td>
                                <td colspan="3" class="fontMiddleAdd">&nbsp; 010-1234-5689</td>
                            </tr>
            
                            <tr>
                                <td class="fontSmallSize">FAX</td>
                                <td colspan="3" class="fontMiddleAdd">&nbsp; 02-561-4635</td>
                            </tr>              
            
                            <tr>
                                <td colspan="4"> <hr style="width: 97%;"> </td>
                            </tr>
            
                            <tr>
                                <td class="fontSmallSize">메모</td>
                                <td colspan="3" class="fontMiddleAdd">&nbsp; 시간약속에 철저한 편</td>
                            </tr>                             
                        </tbody>   -->


            
                    </table> 
                    <br>
                </div>
        
            </div>
                
            <!-- 페이징 영역-->
            <div class="pasingAdd" align="center" style="display:inline">
                 
            </div>

            <!--==================================== 삭제용 script ======================================= -->


            <script>

                // 그룹삭제                 
                function deleteAddGp(){
                    if(confirm("그룹과 연락처 모두 삭제됩니다. 삭제하시겠습니까?")){

                    }else{
                        //$("").focus();
                    }
                }

                //내연락처 상세보기 삭제 
                function deleteAdd(){
                    if(confirm("삭제하시겠습니까?")){

                    }else{
                        //$("").focus();
                    }
                }

                // 내연락처 다중선택 삭제
                function deleteAdds(){
                    if(confirm("4개 모두 삭제하시겠습니까?")){

                    }else{
                        //$("").focus();
                    }
                }

            </script>

            <!--==================================== Modal ======================================= -->

            <!-- 새연락처 Modal -->
            <div class="modal fade" id="addressAdd" tabindex="-1" aria-labelledby="addressAddModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <!-- <div class="modal-header">
                            <h5 class="modal-title" id="addressAddModalLabel">새 연락처</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div> -->
                        <div class="modal-body">                          
                            <form action="">
                                <table align="center">   
                                        <tr>
                                            <th class="Addstar3" colspan="2">
                                                <input type="checkbox" name="addStar" value="Y" id="rate3">
                                                <label for="rate3">★</label>                                  
                                            </th>                                    
                                        </tr>                             
                                    <tr>
                                            <th>이름</th>  &nbsp;                                                                       
                                            <td><input class="formInput"  type="text" id="addName" name="addName" required></td>                                       
                                    </tr>
                                    <tr>
                                            <th>닉네임</th>  &nbsp;
                                            <td><input class="formInput" type="text" name="addNick"></td>
                                    </tr>
                                    <tr>
                                            <th>회사</th> &nbsp;
                                            <td><input class="formInput" type="text" name="addCompany" required></td>                                       
                                    </tr>        
                                    <tr>
                                            <th>부서</th>  &nbsp;                                    
                                            <td><input class="formInput" type="text" name="addDepartment" required></td>                                        
                                        </tr>    
                                        <tr>
                                            <th>직급</th>   &nbsp;                                   
                                            <td><input class="formInput" type="text" name="addPosition" required></td>
                                        </tr>                            
                                        <tr>
                                            <th>이메일</th> &nbsp;
                                            <td><input class="formInput" type="email" name="addEmail" required></td>
                                        </tr>
                                        <tr>
                                            <th>휴대전화</th> &nbsp;
                                            <td ><input class="formInput" type="text" name="addTel" placeholder=" -도 함께 입력해주세요." maxlength="13"></td>
                                        </tr>
                                        <tr>
                                            <th>사내번호</th> &nbsp;
                                            <td><input class="formInput" type="text" name="addExtensionNo"></td>
                                        </tr>
                                        <tr>
                                            <th>FAX</th> &nbsp; 
                                            <td><input class="formInput" type="text" name="addFax"></td>
                                        </tr>
                                        <tr>
                                            <th>메모</th> &nbsp;
                                            <td><textarea style="resize: none;" maxlength="19" name="addMemo" id="addMemo1" cols="30" class="formInput"></textarea></td>                                        
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="end">
                                                <span id="addMemoContentcount1">0</span>
                                                <span class="blueColor">/20</span> 
                                            </td>
                                            <script>
                                                $(function(){
                                                    $("#addMemo1").keyup(function(){
                                                        $("#addMemoContentcount1").text($(this).val().length); 
                                                    })
                                                })
                                            </script>
                                        </tr>
                                        <tr>
                                            <th>그룹</th>
                                            <td>
                                                <select name="groupNo" class="formInput">
                                                    <option value="">구디쓰주식회사</option>
                                                    <option value="">제일디자인</option>
                                                    <option value="">그룹미지정</option>
                                                </select>
                                            </td>
                                        </tr>
                                    
                                </table>
                                <br><br>
                                <div align="center">
                                    <button type="submit" class="btn btn-sm btn-primary">수정</button>
                                    <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                                </div>
                                
                            </form>
                            <br>
                        </div>                    
                    </div>
                </div>
            </div>

            <!-- 내연락처 다중선택 삭제 Modal -->
            <!-- <div class="modal fade" id="addressDelete" tabindex="-1" aria-labelledby="addressDeleteModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addressDeleteModalLabel">내 연락처삭제</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            4개를 내 연락처에서 삭제하시겠습니까?
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-sm btn-danger">연락처삭제</button>
                            <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                        </div>
                    </div>
                </div>
            </div> -->
                     
            <!-- 내연락처 편집 Modal -->
            <div class="modal fade" id="addressEdit" tabindex="-1" aria-labelledby="addressEditModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <!-- <div class="modal-header">
                            <h5 class="modal-title" id="addressEditModalLabel">연락처 편집</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div> -->
                        <div class="modal-body">                          
                            <form action="">
                                <table align="center">  
                                    <tr>
                                        <th class="Addstar3" colspan="2">
                                            <input type="checkbox" name="addStar" value="Y" id="rate4">
                                            <label for="rate4">★</label>                                  
                                        </th>                                    
                                    </tr>                               
                                    <tr>
                                            <th >이름</th>  &nbsp;                                                                       
                                            <td ><input class="formInput"  type="text" id="addName" name="addName" value="감나라" required></td>                                                                             
                                    </tr>
                                    <tr>
                                            <th>닉네임</th>  &nbsp;
                                            <td><input class="formInput" type="text" name="addNick" value="Maria"></td>
                                    </tr>
                                    <tr>
                                            <th>회사</th> &nbsp;
                                            <td><input class="formInput" type="text" name="addCompany" required value="구디쓰주식회사"></td>                                       
                                    </tr>        
                                    <tr>
                                            <th>부서</th>  &nbsp;                                    
                                            <td><input class="formInput" type="text" name="addDepartment" required></td>                                        
                                        </tr>    
                                        <tr>
                                            <th>직급</th>   &nbsp;                                   
                                            <td><input class="formInput" type="text" name="addPosition" required></td>
                                        </tr>                            
                                        <tr>
                                            <th>이메일</th> &nbsp;
                                            <td><input class="formInput" type="email" name="addEmail" required></td>
                                        </tr>
                                        <tr>
                                            <th>휴대전화</th> &nbsp;
                                            <td ><input class="formInput" type="text" name="addTel" placeholder=" -도 함께 입력해주세요." maxlength="13"></td>
                                        </tr>
                                        <tr>
                                            <th>사내번호</th> &nbsp;
                                            <td><input class="formInput" type="text" name="addExtensionNo"></td>
                                        </tr>
                                        <tr>
                                            <th>FAX</th> &nbsp; 
                                            <td><input class="formInput" type="text" name="addFax"></td>
                                        </tr>
                                        <tr>
                                            <th>메모</th> &nbsp;
                                            <td><textarea style="resize: none;" maxlength="19" name="addMemo" id="addMemo" cols="30" class="formInput"></textarea></td>                                        
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="end">
                                                <span id="addMemoContentcount">0</span>
                                                <span class="blueColor">/20</span> 
                                            </td>
                                            <script>
                                                $(function(){
                                                    $("#addMemo").keyup(function(){
                                                        $("#addMemoContentcount").text($(this).val().length); 
                                                    })
                                                })
                                            </script>
                                        </tr>
                                        <tr>
                                            <th>그룹</th>
                                            <td>
                                                <select name="groupNo" class="formInput">
                                                    <option value="">구디쓰주식회사</option>
                                                    <option value="">제일디자인</option>
                                                    <option value="">그룹미지정</option>
                                                </select>
                                            </td>
                                        </tr>
                                    
                                </table>
                                <br>
                                <div align="center">
                                    <button type="submit" class="btn btn-sm btn-primary">수정</button>
                                    <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                                </div>
                                
                            </form>
                        </div>
                        
                    </div>
                </div>
            </div>

            
            <!-- 내연락처 그룹추가 Modal -->
            <div class="modal fade" id="addGp" tabindex="-1" aria-labelledby="addGpModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addGpModalLabel">그룹추가</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form align="center" class="inputStyle">
                                <input type="hidden" name="empNo" value="">
                                <table align="center">
                                    <tr>
                                        <td><input type="text" name="groupName" placeholder="그룹명을 입력해주세요" required></td>
                                        <td><button type="submit" class="btn btn-sm btn-primary">등록</button></td>
                                        <td><button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button></td>
                                    </tr>
                                </table>                               
                            </form>
                        </div>
                        <div class="modal-footer">                      
                        
                        </div>
                    </div>
                </div>
            </div>

            <!-- 내연락처 그룹수정 Modal -->
            <div class="modal fade" id="editGp" tabindex="-1" aria-labelledby="editGpModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header" >   
                            <h5 class="modal-title" id="addGpModalLabel">그룹수정</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>                     
                        </div>
                        <div class="modal-body">
                            <form  class="inputStyle">
                                <input type="hidden" name="empNo" value="">
                                <input type="hidden" name="groupNo" value="">
                                <table align="center">
                                    <tr>
                                        <td>
                                            <input type="text" name="groupName"  value="구디물산" required>
                                        </td>
                                        <td><button type="submit" class="btn btn-sm btn-primary">수정</button></td>
                                        <td><button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button></td>
                                    </tr>
                                </table>                              
                            </form>
                        </div>
                        <div class="modal-footer">                        
                        </div>
                    </div>
                </div>
            </div>
           
            <!-- 쪽지보내기 Modal -->
            <div class="modal fade" id="addressChat" tabindex="-1" aria-labelledby="addressChatModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                <div class="modal-content"> 
                    <div class="modal-header">
                        <h5 class="modal-title" id="addressChatModalLabel">쪽지보내기</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>               
                    <div class="modal-body" align="center">                       
                        <form action="" method="post">
                            <input type="hidden" name="empSendNo" value="">
                            <table>
                                <tr>
                                    <th>제목</th>
                                    <th><input class="formInput" name="noteTitle" placeholder="제목을 입력해주세요" required></th>
                                </tr>
                                <tr>
                                    <!--보이는건 받는사람 이름 / 넘기는건 hidden으로 no-->
                                    <th>받는사람</th>
                                    <td>
                                        <input class="formInput" value="김나라" readonly>
                                        <input id="empNo" type="hidden" name="empNo" value="">
                                    </td>
                                </tr>
                                <tr>
                                    <th>종류</th>
                                    <th>
                                        <select name="noteCategory" class="formInput">
                                            <option>회의</option>
                                            <option>업무</option>
                                            <option>행사</option>
                                            <option>기타</option>
                                        </select>
                                    </th>
                                </tr>
                                <tr>
                                    <th>요청</th>
                                    <th>
                                        <select name="noteRequest" class="formInput">
                                            <option>긴급</option>
                                            <option>답장필요</option>
                                            <option>답장불필요</option>
                                        </select>
                                    </th>
                                </tr>
                                <tr>
                                    <th>내용</th>
                                    <th><textarea maxlength="100" rows="8" cols="40" style="resize: none;" required class="formInput"></textarea></th>
                                </tr>
                            </table>
                            <div align="center">
                                <button type="submit" class="btn btn-sm btn-primary">보내기</button>
                                <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                            </div>
                        </form>
                    </div>               
                </div>
                </div>
            </div>
            
            <script>
                $(document).ready(function() {
                    $("#cbx_chkAll").click(function() {
                        if($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
                        else $("input[name=chk]").prop("checked", false);
                    });

                    $("input[name=chk]").click(function() {
                        var total = $("input[name=chk]").length;
                        var checked = $("input[name=chk]:checked").length;

                        if(total != checked) $("#cbx_chkAll").prop("checked", false);
                        else $("#cbx_chkAll").prop("checked", true); 
                    });
                }); 
            </script>

        </div>
        
    </div>
    
     <script>
            	$(function(){
            		selectDepList();
            		selectGpList();   
            		selectdepTbCategory();
            		selectGpCategory(); 
            		selectStarAdd();
            	})
            	
            	// 부서별 목록 ajax
            	function selectDepList(){
            		
            		$.ajax({
            			
            			url: "depList.ad",
            			success:function(list){
            				//console.log(list);
            				let value = "";
            				
            				for(let i=0; i<list.length; i++){
            					value += '<li>'
                            		   +	 '<div class="btn-group dropright btnPadding">'
                                	   + 	 	'<button type="button" class="btn btn-text">'
                                       +	    	'<span style="font-size: 15px;">' + list[i].departmentName + '</span>'
                                       +			'<input type="hidden" class="depCd" value="' + list[i].departmentCode + '">'
                                	   +	     '</button>'
                                	   +      '</div>'
                                	   +  '</li>';
                                	   
                                $("#empSubMenu").html(value);	   
                                	   
            				}
            			},
            			error:function(){
            				console.log("부서리스트 ajax통신 실패");
            			}
            			
            		})            		
            	}
            	
            	// 내 연락처 그룹별 목록
            	function selectGpList(){
            		$.ajax({
            			url: "gpList.ad",
            			data: {
            				employeeNo: 5  // loginUser.empNo            				
            			},
            			success:function(list){            				
            				let value = "";
            				
            				for(let i=0; i<list.length; i++){
            					  value += '<li>'
                           				 +	  '<div class="btn-group dropright btnPadding">'
                                		 + 		  '<button type="button" class="btn btn-text">'
                                         + 				'<span style="font-size: 15px;">'+ list[i].groupName +'</span>'
                                         +				'<input type="hidden" class="groupNo" value="' + list[i].groupNo + '">'
                                		 +    	  '</button> &nbsp; &nbsp;';
                                		 
                              		 if(list[i].groupNo != 1 ){
                              			 value += '<button type="button" class="btn btn-text dropdown-toggle-split" data-toggle="dropdown" aria-expanded="false" style="padding: 0;">'
                                          	 +	    	 '፧'
                                      		 +   	   '</button>'
                                     		 +         '<div class="dropdown-menu">'                                
                                          	 +        	 	'<button type="button" class="dropdown-item fontsize13" data-toggle="modal" data-target="#editGp">그룹수정</button>'
                                          	 +         		'<button type="button" class="dropdown-item fontsize13" onclick="deleteAddGp()">그룹삭제</button>' 
                                     		 +       	'</div>';
                                		 }
                              		 
                                	value +=  	'</div>'
                        				  + '</li>';
                        				 
                        		$("#subAddMenu").html(value);		 
            				}
            				 
            			},
            			error:function(){
            				console.log("내연락처 목록용 ajax실패");
            			}
            			
            		})
            	}
            	
            	// 조직도목록 클릭시 상세 테이블 조회용 ajax
            	//let depCategory= 0; 전역변수 보단            	
            	function selectdepTbCategory(){
            		$("#empSubMenu").on("click", "li", function(){            			
            			selectdepTbList($(this).find(".depCd").val());
            			// 이렇게 바로 전달 *children().children() 이런식으로 내려가는것보단 find!
            		})            		
            	}
            	
            	function selectdepTbList(selectDepCd, cpage){            		
            		$.ajax({
            			type: "post",
            			url : "depTb.ad",
            			data : { 
            				depCd: selectDepCd,
            				cpage: cpage
            			},            			
            			success : function(result){
            				
            				let value;
            					 value += '<table class="table" id="dataCompanyTable">'
    	                               +	'<thead>'
    	                               +         '<tr>'
    	                               + 				'<th style="width: 15px;"></th>'
                                       + 				'<th>사번</th>'
                                	   + 				'<th>이름</th>'
                                	   +				'<th>부서</th>'
                                	   +                '<th>직위</th>'
                                	   +  				'<th>이메일</th>'
                                	   + 				'<th>내선번호</th>'
                                	   +          '</tr>'                        
                                	   +    '</thead>'
                                	   +  '<tbody>'   ;                 						   
            					
            				let pageValue = "";
            				
            				let list = result.list;
            				let pi = result.pi; 
            				
            				if(list.length == 0){
            					value += "<tr>"
            							+	"<td colspan='7'>등록된 직원이 없습니다.</td>"            						
            							+"</tr>";
            				}else{
            					for(let i=0; i<list.length; i++){
            						value += 		'<tr>'
                                        	+ 			'<td><input type="checkbox" name="chk"></td>'
                                        	+ 			'<td class="no">'+ list[i].empNo +'</td>'
                                            +   		'<td>'+ list[i].empName +'</td>'
                                        	+   		'<td>'+ list[i].depCd +'</td>'
                                        	+  			'<td>'+ list[i].posCd +'</td>'
                                        	+   		'<td>'+ list[i].empEmail + '</td>';
                                        	
                                        	if(list[i].empExtension != null){
                                        		 value   +=   '<td>'+ list[i].empExtension +'</td>';
                                        	}else{
                                        		 value   +=  '<td>'+ '' +'</td>'; 
                                        	}                                        	
                                    value   +=  '</tr>'	;                                        	
            					}
            					
            					 if(pi.currentPage != 1){
                        			pageValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectdepTbList("+ selectDepCd + ", "  + (pi.currentPage - 1) + ")'>&lt;</button>"	
                        		}
                        		
                        		for(let p=pi.startPage; p<=pi.endPage; p++) { 
                				   
                		   			if(p == pi.currentPage) { 
                				   			pageValue += "<button class='btn btn-sm btn-outline-primary' disabled>"  + p  + "</button>"
                				   	}else {
                				   			pageValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectdepTbList("+ selectDepCd + ", "  + p +")'>" + p + "</button>"
                		           	} 
                		         }     
                         
                		         if(pi.currentPage != pi.maxPage) {
                		        	  pageValue +=	"<button class='btn btn-sm btn-outline-primary' onclick='selectdepTbList(" + selectDepCd + ", " + (pi.currentPage + 1) + ")'>&gt;</button>"
                		         }  
            				}
            				
            				value   +=	'</tbody>'
                        			+ '</table>';
            				
            				$("#tableArea").html(value);
            				 $(".pasingAdd").html(pageValue); 
            				            				            				
            				$("#addTitle").html("<h4><b>"+ list[0].depCd +"</b></h4>");
            				$("#deleteAddArea").html("");        	
            				
            				
            				
            			},
            			error:function(){
            				console.log("조직도 주소록 테이블 조회용 ajax실패");
            			}
            			
            		
            		})
            	}
            	
            	// 내 연락처 목록클릭 시 조회테이블
            	function selectGpCategory(){
            		$("#subAddMenu").on("click", "li", function(){            			
            			selectAddTbList($(this).find(".groupNo").val());               			
            		})            		
            	}
            	
            	function selectAddTbList(groupNo, cpage){
            		
            		$.ajax({
            			type: "post",
            			url : "myAdTb.ad",
            			data : { 
            				groupNo: groupNo,
            				cpage: cpage
            			},            			
            			success : function(result){
            				
            				let value;
            					 value += '<table class="table" id="dataAddTable">'
    	                               +	'<thead>'
    	                               +         '<tr>'
    	                               +				'<th style="width:10px"></th>'
    	                               +				'<th style="width: 10px;"></th>'
    	                               +				'<th>번호</th>'
    	                               +				'<th>이름</th>'
    	                               +				'<th>회사</th>'
    	                               +				'<th>부서</th>'
    	                               +				'<th>직위</th>'                
    	                               +				'<th>휴대전화</th>'      
                                	   +          '</tr>'                        
                                	   +    '</thead>'
                                	   +  '<tbody>'   ;                 						   
            					
            				let pageValue = "";
            				
            				let list = result.list;
            				let pi = result.pi;   
            				
            				if(list.length == 0){
            					value += "<tr>"
            							+	"<td colspan='8'>등록된 연락처가 없습니다.</td>"            						
            							+"</tr>";
            				}else{
            					for(let i=0; i<list.length; i++){
            						value += 		'<tr>'
                                        	+ 			'<td><input type="checkbox" name="chk"></td>'
                                        	+			'<td>'
                                            +				'<span class="';
                                    if(list[i].addressStar == 'Y'){
                                    		value +=  'starYellow';
                                    }else{
                                    	value += 'starWhite';
                                    }     
                                            
                                     value  +=                '">★</span>'                           
                                        	+			'</td>'
                                        	+			'<td class="no">'+ list[i].addressNo +'</td>'
                                        	+			'<td>'+ list[i].addressCompany +'</td>'
                                        	+			'<td>'+ list[i].addressDepartment +'</td>'
                                        	+			'<td>'+ list[i].addressPosition +'</td>'
                                        	+			'<td>'+ list[i].addressTel +'</td>';        
                                        	
                                        	if(list[i].addressTel != null){
                                        		 value   +=   '<td>'+ list[i].addressTel +'</td>';
                                        	}else{
                                        		 value   +=  '<td>'+ '' +'</td>'; 
                                        	}                                        	
                                    value   +=  '</tr>'	;                                        	
            					}
            					
            					 if(pi.currentPage != 1){
                        			pageValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectAddTbList("+ groupNo + ", "  + (pi.currentPage - 1) + ")'>&lt;</button>"	
                        		}
                        		
                        		for(let p=pi.startPage; p<=pi.endPage; p++) { 
                				   
                		   			if(p == pi.currentPage) { 
                				   			pageValue += "<button class='btn btn-sm btn-outline-primary' disabled>"  + p  + "</button>"
                				   	}else {
                				   			pageValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectAddTbList("+ groupNo + ", "  + p +")'>" + p + "</button>"
                		           	} 
                		         }     
                         
                		         if(pi.currentPage != pi.maxPage) {
                		        	  pageValue +=	"<button class='btn btn-sm btn-outline-primary' onclick='selectAddTbList(" + groupNo + ", " + (pi.currentPage + 1) + ")'>&gt;</button>"
                		         }  
            				}
            				
            				value   +=	'</tbody>'
                        			+ '</table>';
            				
                        			console.log(value);
            				$("#tableArea").html(value);
            				 $(".pasingAdd").html(pageValue); 
            				            				            				
            				$("#addTitle").html("<h4><b>내 연락처</b></h4>"); 
            				$("#deleteAddArea").html(' <button type="button" class="btn btn-sm btn-secondary" onclick="deleteAdds();">삭제</button>');        	
            				
            			},
            			error:function(){
            				console.log("내연락처 주소록 테이블 조회용 ajax실패");
            			}       		
            		})
            	} 
            	
            	function selectStarAdd(cpage){
            		$.ajax({
            			url: "starList.ad",
            			type: "post",
            			data: {
            				empNo:'5',
            				cpage:cpage
            			},
            			success:function(result){
            				console.log(result);
            			}, 
            			error:function(){
            				console.log("별표연락터 조회용 ajax실패")
            			}
            		
            				
            		})
            	}
            	
            	
            	
            </script>
		
</body>
</html>