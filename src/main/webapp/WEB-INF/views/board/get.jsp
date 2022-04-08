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
            <%--댓글--%>
            <div class='row'>

                <div class="col-lg-12">

                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-comments fa-fw"></i> Reply
                            <button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button>
                        </div>


                        <!-- /.panel-heading -->
                        <div class="panel-body">

                            <ul class="chat">

                            </ul>
                            <!-- ./ end ul -->
                        </div>
                        <!-- /.panel .chat-panel -->

                        <div class="panel-footer"></div>


                    </div>
                </div>
                <!-- ./ end row -->
            </div>
            <!-- Modal -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
                 aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Reply</label>
                                <input class="form-control" name='reply' value='New Reply!!!!'>
                            </div>
                            <div class="form-group">
                                <label>Replyer</label>
                                <input class="form-control" name='replyer' value='replyer'>
                            </div>
                            <div class="form-group">
                                <label>Reply Date</label>
                                <input class="form-control" name='replyDate' value='2018-01-01 13:13'>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
                            <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
                            <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
                            <button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
                        </div>          </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->
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

                $(document).ready(function () {
                    console.log("ready")
                    var bnoValue = '<c:out value="${board.bno}"/>';
                    var replyUL = $(".chat");

                    showList(1);

                    function showList(page){

                        console.log("show list " + page);

                        replyService.getList({bno:bnoValue,page: page|| 1 }, function(replyCnt, list) {

                            console.log("replyCnt: "+ replyCnt );
                            console.log("list: " + list);
                            console.log(list);

                            if(page == -1){
                                pageNum = Math.ceil(replyCnt/10.0);
                                showList(pageNum);
                                return;
                            }

                            var str="";

                            if(list == null || list.length == 0){
                                return;
                            }

                            for (var i = 0, len = list.length || 0; i < len; i++) {
                                str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
                                str +="  <div><div class='header'><strong class='primary-font'>["
                                    +list[i].rno+"] "+list[i].replyer+"</strong>";
                                str +="    <small class='pull-right text-muted'>"
                                    +replyService.displayTime(list[i].replyDate)+"</small></div>";
                                str +="    <p>"+list[i].reply+"</p></div></li>";
                            }

                            replyUL.html(str);

                            showReplyPage(replyCnt);


                        });//end function

                    }//end showList

                    var pageNum = 1;
                    var replyPageFooter = $(".panel-footer");

                    function showReplyPage(replyCnt){

                        var endNum = Math.ceil(pageNum / 10.0) * 10;
                        var startNum = endNum - 9;

                        var prev = startNum != 1;
                        var next = false;

                        if(endNum * 10 >= replyCnt){
                            endNum = Math.ceil(replyCnt/10.0);
                        }

                        if(endNum * 10 < replyCnt){
                            next = true;
                        }

                        var str = "<ul class='pagination pull-right'>";

                        if(prev){
                            str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
                        }

                        for(var i = startNum ; i <= endNum; i++){

                            var active = pageNum == i? "active":"";

                            str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
                        }

                        if(next){
                            str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
                        }

                        str += "</ul></div>";

                        console.log(str);

                        replyPageFooter.html(str);
                    }

                    replyPageFooter.on("click","li a", function(e){
                        e.preventDefault();
                        console.log("page click");

                        var targetPageNum = $(this).attr("href");

                        console.log("targetPageNum: " + targetPageNum);

                        pageNum = targetPageNum;

                        showList(pageNum);
                    });
                    var modal = $(".modal");
                    var modalInputReply = modal.find("input[name='reply']");
                    var modalInputReplyer = modal.find("input[name='replyer']");
                    var modalInputReplyDate = modal.find("input[name='replyDate']");

                    var modalModBtn = $("#modalModBtn");
                    var modalRemoveBtn = $("#modalRemoveBtn");
                    var modalRegisterBtn = $("#modalRegisterBtn");

                    $("#modalCloseBtn").on("click", function(e){

                        modal.modal('hide');
                    });

                    $("#addReplyBtn").click(function(e){
                        e.preventDefault();
                        console.log("hi");
                        modal.find("input").val("");
                        modalInputReplyDate.closest("div").hide();
                        modal.find("button[id !='modalCloseBtn']").hide();

                        modalRegisterBtn.show();

                        $(".modal").modal("show");

                    });


                    modalRegisterBtn.on("click",function(e){
                        console.log("hi");
                        var reply = {
                            reply: modalInputReply.val(),
                            replyer:modalInputReplyer.val(),
                            bno:bnoValue
                        };
                        replyService.add(reply, function(result){

                            alert(result);

                            modal.find("input").val("");
                            modal.modal("hide");

                            //showList(1);
                            showList(-1);

                        });

                    });


                    //댓글 조회 클릭 이벤트 처리
                    $(".chat").on("click", "li", function(e){

                        var rno = $(this).data("rno");

                        replyService.get(rno, function(reply){

                            modalInputReply.val(reply.reply);
                            modalInputReplyer.val(reply.replyer);
                            modalInputReplyDate.val(replyService.displayTime( reply.replyDate))
                                .attr("readonly","readonly");
                            modal.data("rno", reply.rno);

                            modal.find("button[id !='modalCloseBtn']").hide();
                            modalModBtn.show();
                            modalRemoveBtn.show();

                            $(".modal").modal("show");

                        });
                    });


                    /*     modalModBtn.on("click", function(e){

                          var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};

                          replyService.update(reply, function(result){

                            alert(result);
                            modal.modal("hide");
                            showList(1);

                          });

                        });

                        modalRemoveBtn.on("click", function (e){

                            var rno = modal.data("rno");

                            replyService.remove(rno, function(result){

                                alert(result);
                                modal.modal("hide");
                                showList(1);

                            });

                          }); */

                    modalModBtn.on("click", function(e){

                        var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};

                        replyService.update(reply, function(result){

                            alert(result);
                            modal.modal("hide");
                            showList(pageNum);

                        });

                    });


                    modalRemoveBtn.on("click", function (e){

                        var rno = modal.data("rno");

                        replyService.remove(rno, function(result){

                            alert(result);
                            modal.modal("hide");
                            showList(pageNum);

                        });

                    });


                });
            </script>
            <script type="text/javascript">
                $(document).ready(function() {

                    var operForm = $("#operForm");

                    $("button[data-oper='modify']").on("click", function(e){

                        operForm.attr("action","/board/modify").submit();

                    });


                    $("button[data-oper='list']").on("click", function(e){

                        operForm.find("#bno").remove();
                        operForm.attr("action","/board/list")
                        operForm.submit();

                    });
                });
            </script>
<script>
    console.log("Reply Module........");

    var replyService = (function() {

        function add(reply, callback, error) {
            console.log("add reply...............");

            $.ajax({
                type : 'post',
                url : '/replies/new',
                data : JSON.stringify(reply),
                contentType : "application/json; charset=utf-8",
                success : function(result, status, xhr) {
                    if (callback) {
                        callback(result);
                    }
                },
                error : function(xhr, status, er) {
                    if (error) {
                        error(er);
                    }
                }
            })
        }

//	function getList(param, callback, error) {
//
//		var bno = param.bno;
//		var page = param.page || 1;
//
//		$.getJSON("/replies/pages/" + bno + "/" + page + ".json",
//				function(data) {
//					if (callback) {
//						callback(data);
//					}
//				}).fail(function(xhr, status, err) {
//			if (error) {
//				error();
//			}
//		});
//	}



        function getList(param, callback, error) {

            var bno = param.bno;
            var page = param.page || 1;

            $.getJSON("/replies/pages/" + bno + "/" + page + ".json",
                function(data) {

                    if (callback) {
                        //callback(data); // 댓글 목록만 가져오는 경우
                        callback(data.replyCnt, data.list); //댓글 숫자와 목록을 가져오는 경우
                    }
                }).fail(function(xhr, status, err) {
                if (error) {
                    error();
                }
            });
        }


        function remove(rno, callback, error) {
            $.ajax({
                type : 'delete',
                url : '/replies/' + rno,
                success : function(deleteResult, status, xhr) {
                    if (callback) {
                        callback(deleteResult);
                    }
                },
                error : function(xhr, status, er) {
                    if (error) {
                        error(er);
                    }
                }
            });
        }

        function update(reply, callback, error) {

            console.log("RNO: " + reply.rno);

            $.ajax({
                type : 'put',
                url : '/replies/' + reply.rno,
                data : JSON.stringify(reply),
                contentType : "application/json; charset=utf-8",
                success : function(result, status, xhr) {
                    if (callback) {
                        callback(result);
                    }
                },
                error : function(xhr, status, er) {
                    if (error) {
                        error(er);
                    }
                }
            });
        }

        function get(rno, callback, error) {

            $.get("/replies/" + rno + ".json", function(result) {

                if (callback) {
                    callback(result);
                }

            }).fail(function(xhr, status, err) {
                if (error) {
                    error();
                }
            });
        }

        function displayTime(timeValue) {

            var today = new Date();

            var gap = today.getTime() - timeValue;

            var dateObj = new Date(timeValue);
            var str = "";

            if (gap < (1000 * 60 * 60 * 24)) {

                var hh = dateObj.getHours();
                var mi = dateObj.getMinutes();
                var ss = dateObj.getSeconds();

                return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
                    ':', (ss > 9 ? '' : '0') + ss ].join('');

            } else {
                var yy = dateObj.getFullYear();
                var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
                var dd = dateObj.getDate();

                return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
                    (dd > 9 ? '' : '0') + dd ].join('');
            }
        }
        ;

        return {
            add : add,
            get : get,
            getList : getList,
            remove : remove,
            update : update,
            displayTime : displayTime
        };

    })();
</script>