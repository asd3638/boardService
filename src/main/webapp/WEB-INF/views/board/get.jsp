<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

    
<!-- 부트스트랩 코드 그대로 긁어 와서 쓰고 싶으면 jsp파일의 선언부만 빼고 복붙하면 된다. -->

<%@include file = "../includes/header.jsp" %>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Read</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Read
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        <!-- 값을 저장하기 위해 지정해준다(쿠키등으로 대체 가능) -->
                        <input type='hidden' name='pageNum' value='${cri.pageNum}'>
                        <input type='hidden' name='amount' value='${cri.amount}'>
                        				<div class="form-group">
                                            <label>Bno</label>
                                            <input class="form-control" name = "bno" readonly="readonly" value = '<c:out value="${board.bno}"/>'>
                                        </div>
                                        <div class="form-group">
                                            <label>Title</label>
                                            <input class="form-control" name = "title" readonly="readonly" value = '<c:out value="${board.title}"/>'>
                                        </div>
                                        <div class="form-group">
                                            <label>Writer</label>
                                            <!-- 파라미터로 수집될 때의 이름을 지정해주는 것이 매우 중요 -->
                                            <input class="form-control" name = "writer" readonly="readonly" value = '<c:out value="${board.writer}"/>'>
                                        </div>
                                        <div class="form-group">
                                            <label>ReadCount</label>
                                            <!-- 파라미터로 수집될 때의 이름을 지정해주는 것이 매우 중요 -->
                                            <input class="form-control" name = "readCount" readonly="readonly" value = '<c:out value="${board.readCount}"/>'>
                                        </div>

                                        <!-- textarea는 input이랑은 다르게 내용을 직접 삽입한다. value로 따로 빼지 않아도 된다. -->
                                        <div class="form-group">
                                            <label>Content</label>
                                            <textarea class="form-control" rows="5" name = "content" readonly="readonly"><c:out value="${board.content}"/></textarea>
                                        </div>
                                        
                                        <form id='actionForm' action="/board/list" method='get'>
                            				<input type='hidden' name='pageNum' value='${cri.pageNum}'>
                            				<input type='hidden' name='amount' value='${cri.amount}'>
                            				<input type='hidden' name='bno' value='${board.bno}'>
                            			</form>
                            			<button type="button" class="btn btn-default modBtn">Modify</button>
                                        <button type="button" class="btn btn-default listBtn">List</button>
                        	</form>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <div class = "row">
            	<div class="col-lg-12">
            		<div class="panel panel-default">
            			<div class="panel-heading">
            				Files
            			</div>
            			<div class="panel-body">
            				<div class="uploadResult">
            					<ul>
            					</ul>
            				</div>
            			</div>
            		</div>
            	</div>
            </div>
            <script>
            	var actionForm = $("#actionForm");
            
            	$(".listBtn").click(function(e) {
            		e.preventDefault();
            		actionForm.find("input[name='bno']").remove();
       				actionForm.submit();
            	});
            	
            	$(".modBtn").click(function(e) {
            		e.preventDefault();
            		actionForm.attr("action", "/board/modify");
       				actionForm.submit();
            	});
            	
            	$(document).ready(function() {
            		(function(){
            			var bno = '<c:out value="${board.bno}"/>';
            			$.getJSON("/board/getAttachList", {bno: bno}, function(arr){
            		        
            			       console.log(arr);
            			       
            			       var str = "";
            			       
            			       $(arr).each(function(i, attach){
            			       
            			         //image type
            			         if(attach.fileType){
            			           var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
            			           
            			           str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
            			           str += "<img src='/display?fileName="+fileCallPath+"'>";
            			           str += "</div>";
            			           str +"</li>";
            			         }else{
            			             
            			           str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
            			           str += "<span> "+ attach.fileName+"</span><br/>";
            			           str += "<img src='/resources/img/attach.png'></a>";
            			           str += "</div>";
            			           str +"</li>";
            			         }
            			       });
            			       
            			       $(".uploadResult ul").html(str);
            			       
            			       
            			     });
            		})();
            	});
            </script>
       
            
            
            <%@include file = "../includes/footer.jsp" %>