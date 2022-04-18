<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>

<style>
    .uploadResult {
        width: 100%;
    }

    .uploadResult ul {
        display: flex;
        flex-flow: row;
        justify-content: center;
        align-items: center;
    }

    .uploadResult ul li {
        list-style: none;
        padding: 10px;
        align-content: center;
        text-align: center;
    }

    .uploadResult ul li img {
        width: 100px;
    }

    .bigPictureWrapper {
        position: absolute;
        display: none;
        justify-content: center;
        align-items: center;
        top: 0%;
        width: 100%;
        height: 100%;
        z-index: 100;
        background: rgba(255, 255, 255, 0.5);
    }

    .bigPicture {
        position: relative;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .bigPicture img {
        width: 600px;
    }

    #addReplyBtn:hover {
        color: black;
        background-color: antiquewhite;
        border-color: antiquewhite;
    }

</style>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Read</h1>
    </div>
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
                    <input class="form-control" name="bno" readonly="readonly" value='<c:out value="${board.bno}"/>'>
                </div>
                <div class="form-group">
                    <label>Title</label>
                    <input class="form-control" name="title" readonly="readonly"
                           value='<c:out value="${board.title}"/>'>
                </div>
                <div class="form-group">
                    <label>Writer</label>
                    <!-- 파라미터로 수집될 때의 이름을 지정해주는 것이 매우 중요 -->
                    <input class="form-control" name="writer" readonly="readonly"
                           value='<c:out value="${board.writer}"/>'>
                </div>
                <div class="form-group">
                    <label>ReadCount</label>
                    <!-- 파라미터로 수집될 때의 이름을 지정해주는 것이 매우 중요 -->
                    <input class="form-control" name="readCount" readonly="readonly"
                           value='<c:out value="${board.readCount}"/>'>
                </div>

                <!-- textarea는 input이랑은 다르게 내용을 직접 삽입한다. value로 따로 빼지 않아도 된다. -->
                <div class="form-group">
                    <label>Content</label>
                    <textarea class="form-control" rows="5" name="content" readonly="readonly"><c:out
                            value="${board.content}"/></textarea>
                </div>

                <form id='actionForm' action="/board/list" method='get'>
                    <input type='hidden' name='pageNum' value='${cri.pageNum}'>
                    <input type='hidden' name='amount' value='${cri.amount}'>
                    <input type='hidden' name='bno' value='${board.bno}'>
                </form>
            </div>
            <!-- /.panel-body -->
            <div class="panel panel-default">

                <div class="panel-heading">Files</div>
                <!-- /.panel-heading -->
                <div class="panel-body">

                    <div class='uploadResult'>
                        <ul>
                        </ul>
                    </div>
                </div>
                <!--  end panel-body -->
            </div>
            <div style="margin-top: 10px; margin-bottom: 10px; text-align: right;">
                <button type="button" class="btn btn-default modBtn">Modify</button>
                <button type="button" class="btn btn-info listBtn">List</button>
            </div>
        </div>
    </div>
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
</div>

<div class='bigPictureWrapper'>
    <div class='bigPicture'>
    </div>
</div>


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">&times;
                </button>
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
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
</div>

<script>
    let actionForm = $("#actionForm");

    $(".listBtn").click(function (e) {
        e.preventDefault();
        actionForm.find("input[name='bno']").remove();
        actionForm.submit();
    });

    $(".modBtn").click(function (e) {
        e.preventDefault();
        actionForm.attr("action", "/board/modify");
        actionForm.submit();
    });
</script>
<script type="text/javascript">
    $(document).ready(function () {

        let operForm = $("#operForm");
        console.log("ready")
        let bnoValue = '<c:out value="${board.bno}"/>';
        let replyUL = $(".chat");
        let bno = '<c:out value="${board.bno}"/>';
        console.log("hello")

        $.getJSON("/board/getAttachList", {bno: bno}, function (arr) {
            let str = "";

            $(arr).each(function (i, attach) {
                //image type
                if (attach.fileType) {
                    let fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName);

                    str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.fileType + "' ><div>";
                    str += "<span> " + attach.fileName + "</span><br/>";
                    str += "<img src='/display?fileName=" + fileCallPath + "'>";
                    str += "</div>";
                    str + "</li>";
                } else {

                    str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.fileType + "' ><div>";
                    str += "<span> " + attach.fileName + "</span><br/>";
                    str += "<img src='/resources/img/attach.png'></a>";
                    str += "</div>";
                    str + "</li>";
                }
            });

            $(".uploadResult ul").html(str);

            showList(1);

            function showList(page) {

                console.log("show list " + page);

                replyService.getList({bno: bnoValue, page: page || 1}, function (replyCnt, list) {

                    console.log("replyCnt: " + replyCnt);
                    console.log("list: " + list);
                    console.log(list);

                    if (page == -1) {
                        pageNum = Math.ceil(replyCnt / 10.0);
                        showList(pageNum);
                        return;
                    }

                    let str = "";

                    if (list == null || list.length == 0) {
                        return;
                    }

                    for (let i = 0, len = list.length || 0; i < len; i++) {
                        str += "<li class='left clearfix' data-rno='" + list[i].rno + "'>";
                        str += "  <div><div class='header'><strong class='primary-font'> Written By " + list[i].replyer + "</strong>";
                        str += "    <small class='pull-right text-muted'>"
                            + replyService.displayTime(list[i].replyDate) + "</small></div>";
                        str += "    <p>" + list[i].reply + "</p></div></li>";
                    }

                    replyUL.html(str);

                    showReplyPage(replyCnt);


                });//end function

            }//end showList

            let pageNum = 1;
            let replyPageFooter = $(".panel-footer");

            function showReplyPage(replyCnt) {

                let endNum = Math.ceil(pageNum / 10.0) * 10;
                let startNum = endNum - 9;

                let prev = startNum != 1;
                let next = false;

                if (endNum * 10 >= replyCnt) {
                    endNum = Math.ceil(replyCnt / 10.0);
                }

                if (endNum * 10 < replyCnt) {
                    next = true;
                }

                let str = "<ul class='pagination pull-right'>";

                if (prev) {
                    str += "<li class='page-item'><a class='page-link' href='" + (startNum - 1) + "'>Previous</a></li>";
                }

                for (let i = startNum; i <= endNum; i++) {

                    let active = pageNum == i ? "active" : "";

                    str += "<li class='page-item " + active + " '><a class='page-link' href='" + i + "'>" + i + "</a></li>";
                }

                if (next) {
                    str += "<li class='page-item'><a class='page-link' href='" + (endNum + 1) + "'>Next</a></li>";
                }

                str += "</ul></div>";

                console.log(str);

                replyPageFooter.html(str);
            }

            replyPageFooter.on("click", "li a", function (e) {
                e.preventDefault();
                console.log("page click");

                let targetPageNum = $(this).attr("href");

                console.log("targetPageNum: " + targetPageNum);

                pageNum = targetPageNum;

                showList(pageNum);
            });
            let modal = $(".modal");
            let modalInputReply = modal.find("input[name='reply']");
            let modalInputReplyer = modal.find("input[name='replyer']");
            let modalInputReplyDate = modal.find("input[name='replyDate']");

            let modalModBtn = $("#modalModBtn");
            let modalRemoveBtn = $("#modalRemoveBtn");
            let modalRegisterBtn = $("#modalRegisterBtn");

            $("#modalCloseBtn").on("click", function (e) {

                modal.modal('hide');
            });

            $("#addReplyBtn").click(function (e) {
                e.preventDefault();
                console.log("hi");
                modal.find("input").val("");
                modalInputReplyDate.closest("div").hide();
                modal.find("button[id !='modalCloseBtn']").hide();

                modalRegisterBtn.show();

                $(".modal").modal("show");

            });


            modalRegisterBtn.on("click", function (e) {
                console.log("hi");
                let reply = {
                    reply  : modalInputReply.val(),
                    replyer: modalInputReplyer.val(),
                    bno    : bnoValue
                };
                replyService.add(reply, function (result) {

                    alert(result);

                    modal.find("input").val("");
                    modal.modal("hide");

                    //showList(1);
                    showList(-1);

                });

            });


            //댓글 조회 클릭 이벤트 처리
            $(".chat").on("click", "li", function (e) {
                let rno = $(this).data("rno");

                replyService.get(rno, function (reply) {

                    modalInputReply.val(reply.reply);
                    modalInputReplyer.val(reply.replyer);
                    modalInputReplyDate.val(replyService.displayTime(reply.replyDate))
                        .attr("readonly", "readonly");
                    modal.data("rno", reply.rno);

                    modal.find("button[id !='modalCloseBtn']").hide();
                    modalModBtn.show();
                    modalRemoveBtn.show();

                    $(".modal").modal("show");

                });
            });

            modalModBtn.on("click", function (e) {

                let reply = {rno: modal.data("rno"), reply: modalInputReply.val()};

                replyService.update(reply, function (result) {

                    alert(result);
                    modal.modal("hide");
                    showList(pageNum);

                });

            });


            modalRemoveBtn.on("click", function (e) {

                let rno = modal.data("rno");

                replyService.remove(rno, function (result) {

                    alert(result);
                    modal.modal("hide");
                    showList(pageNum);

                });

            });


        });

        $("button[data-oper='modify']").on("click", function (e) {

            operForm.attr("action", "/board/modify").submit();

        });

        $("button[data-oper='list']").on("click", function (e) {

            operForm.find("#bno").remove();
            operForm.attr("action", "/board/list")
            operForm.submit();

        });

        $(".uploadResult").on("click", "li", function (e) {

            console.log("view image");

            let liObj = $(this);

            let path = encodeURIComponent(liObj.data("path") + "/" + liObj.data("uuid") + "_" + liObj.data("filename"));

            if (liObj.data("type")) {
                showImage(path.replace(new RegExp(/\\/g), "/"));
            } else {
                //download
                self.location = "/download?fileName=" + path
            }


        });

        function showImage(fileCallPath) {

            console.log(fileCallPath)

            $(".bigPictureWrapper").css("display", "flex").show();

            $(".bigPicture")
                .html("<img src='/display?fileName=" + fileCallPath + "' >")
                .animate({width: '100%', height: '100%'}, 1000);

        }

        $(".bigPictureWrapper").on("click", function (e) {
            $(".bigPicture").animate({width: '0%', height: '0%'}, 1000);
            setTimeout(function () {
                $('.bigPictureWrapper').hide();
            }, 1000);
        });
    });
</script>
<script>
    console.log("Reply Module........");

    let replyService = (function () {

        function add(reply, callback, error) {
            console.log("add reply...............");

            $.ajax({
                type       : 'post',
                url        : '/replies/new',
                data       : JSON.stringify(reply),
                contentType: "application/json; charset=utf-8",
                success    : function (result, status, xhr) {
                    if (callback) {
                        callback(result);
                    }
                },
                error      : function (xhr, status, er) {
                    if (error) {
                        error(er);
                    }
                }
            })
        }

//	function getList(param, callback, error) {
//
//		let bno = param.bno;
//		let page = param.page || 1;
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

            let bno = param.bno;
            let page = param.page || 1;

            $.getJSON("/replies/pages/" + bno + "/" + page + ".json",
                function (data) {

                    if (callback) {
                        //callback(data); // 댓글 목록만 가져오는 경우
                        callback(data.replyCnt, data.list); //댓글 숫자와 목록을 가져오는 경우
                    }
                }).fail(function (xhr, status, err) {
                if (error) {
                    error();
                }
            });
        }


        function remove(rno, callback, error) {
            $.ajax({
                type   : 'delete',
                url    : '/replies/' + rno,
                success: function (deleteResult, status, xhr) {
                    if (callback) {
                        callback(deleteResult);
                    }
                },
                error  : function (xhr, status, er) {
                    if (error) {
                        error(er);
                    }
                }
            });
        }

        function update(reply, callback, error) {

            console.log("RNO: " + reply.rno);

            $.ajax({
                type       : 'put',
                url        : '/replies/' + reply.rno,
                data       : JSON.stringify(reply),
                contentType: "application/json; charset=utf-8",
                success    : function (result, status, xhr) {
                    if (callback) {
                        callback(result);
                    }
                },
                error      : function (xhr, status, er) {
                    if (error) {
                        error(er);
                    }
                }
            });
        }

        function get(rno, callback, error) {

            $.get("/replies/" + rno + ".json", function (result) {

                if (callback) {
                    callback(result);
                }

            }).fail(function (xhr, status, err) {
                if (error) {
                    error();
                }
            });
        }

        function displayTime(timeValue) {

            let today = new Date();

            let gap = today.getTime() - timeValue;

            let dateObj = new Date(timeValue);
            let str = "";

            if (gap < (1000 * 60 * 60 * 24)) {

                let hh = dateObj.getHours();
                let mi = dateObj.getMinutes();
                let ss = dateObj.getSeconds();

                return [(hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
                    ':', (ss > 9 ? '' : '0') + ss].join('');

            } else {
                let yy = dateObj.getFullYear();
                let mm = dateObj.getMonth() + 1; // getMonth() is zero-based
                let dd = dateObj.getDate();

                return [yy, '/', (mm > 9 ? '' : '0') + mm, '/',
                    (dd > 9 ? '' : '0') + dd].join('');
            }
        }
        ;

        return {
            add        : add,
            get        : get,
            getList    : getList,
            remove     : remove,
            update     : update,
            displayTime: displayTime
        };

    })();
</script>