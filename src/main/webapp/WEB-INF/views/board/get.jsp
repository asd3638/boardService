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
                                        <!-- <div class="form-group">
                                            <label>Text Input with Placeholder</label>
                                            <input class="form-control" placeholder="Enter text">
                                        </div> -->
                                        <!-- <div class="form-group">
                                            <label>Static Control</label>
                                            <p class="form-control-static">email@example.com</p>
                                        </div> -->
                                        <!-- <div class="form-group">
                                            <label>File input</label>
                                            <input type="file">
                                        </div> -->
                                        <!-- textarea는 input이랑은 다르게 내용을 직접 삽입한다. value로 따로 빼지 않아도 된다. -->
                                        <div class="form-group">
                                            <label>Content</label>
                                            <textarea class="form-control" rows="5" name = "content" readonly="readonly"><c:out value="${board.content}"/></textarea>
                                        </div>
                                        <!-- <div class="form-group">
                                            <label>Checkboxes(사용 라이브러리)</label>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" value="">Checkbox 1
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" value="">Checkbox 2
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" value="">Checkbox 3
                                                </label>
                                            </div>
                                            <p class="help-block">Check your code library</p>
                                        </div> -->
                                        <!-- <div class="form-group">
                                            <label>Inline Checkboxes</label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox">1
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox">2
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox">3
                                            </label>
                                        </div> -->
                                        <!-- <div class="form-group">
                                            <label>Radio Buttons(사용 언어)</label>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>Radio 1
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">Radio 2
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="optionsRadios" id="optionsRadios3" value="option3">Radio 3
                                                </label>
                                            </div>
                                            <p class="help-block">Check your code language</p>
                                        </div> -->
                                        <!-- <div class="form-group">
                                            <label>Inline Radio Buttons</label>
                                            <label class="radio-inline">
                                                <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline1" value="option1" checked>1
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline2" value="option2">2
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline3" value="option3">3
                                            </label>
                                        </div> -->
                                        <!-- <div class="form-group">
                                            <label>Selects</label>
                                            <select class="form-control">
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Multiple Selects</label>
                                            <select multiple class="form-control">
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                            </select>
                                        </div> -->
                                        
                                        <form id='actionForm' action="/board/list" method='get'>
                            				<input type='hidden' name='pageNum' value='${cri.pageNum}'>
                            				<input type='hidden' name='amount' value='${cri.amount}'>
                            				<input type='hidden' name='bno' value='${board.bno}'>
                            			</form>
                            			<button type="button" class="btn btn-default modBtn">Modify</a></button>
                                        <button type="button" class="btn btn-default listBtn">List</a></button>
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