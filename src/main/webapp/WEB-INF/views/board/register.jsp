<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>

<style>
    .uploadResult {
        width: 100%;
        background-color: transparent;
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
    }

    .bigPicture {
        position: relative;
        display: flex;
        justify-content: center;
        align-items: center;
    }
</style>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Board Register</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->


<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">

            <div class="panel-heading">Board Register</div>
            <div class="panel-body">
                <form role="form" action="/board/register" method="post">

                    <div class="form-group">
                        <label>Title</label> <input class="form-control" name='title'>
                    </div>

                    <div class="form-group">
                        <label>Text area</label>
                        <textarea class="form-control" rows="3" name='content'></textarea>
                    </div>

                    <div class="form-group">
                        <label>Writer</label> <input class="form-control" name='writer'>
                    </div>

                    <div class="panel panel-default">

                        <div class="panel-heading">File Attach</div>
                        <!-- /.panel-heading -->
                        <div class="btn btn-default">
                            <input type="file" name="uploadFile" multiple="multiple">
                            <div id="uploadBtn">Upload</div>
                        </div>
                        <div class="uploadResult">
                            <ul>

                            </ul>
                        </div>
                    </div>

                    <div style="padding-top: 10px; text-align: right">
                        <button type="submit" class="btn btn-default">Submit
                            Button
                        </button>
                        <button type="reset" class="btn btn-danger">Reset Button</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class='bigPictureWrapper'>
    <div class='bigPicture'>
    </div>
</div>

<script>
    $(document).ready(function (e) {
        let formObj = $("form[role='form']");
        let regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
        let maxSize = 5242880; //5MB

        function checkExtension(fileName, fileSize) {
            if (fileSize >= maxSize) {
                alert("파일 사이즈 초과");
                return false;
            }
            if (regex.test(fileName)) {
                alert("해당 종류의 파일은 업로드할 수 없습니다.");
                return false;
            }
            return true;
        }

        function showUploadResult(uploadResultArr) {

            if (!uploadResultArr || uploadResultArr.length == 0) {
                return;
            }

            let uploadUL = $(".uploadResult ul");

            let str = "";

            $(uploadResultArr).each(function (i, obj) {

                if (obj.image) {
                    let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
                    str += "<li data-path='" + obj.uploadPath + "'";
                    str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='true'"
                    str + " ><div>";
                    str += "<span> " + obj.fileName + "</span>";
                    str += "<button type='button' class='btn-close' aria-label='Close' data-file=\'" + fileCallPath + "\' "
                    str += "data-type='image' ><i class='fa fa-times'></i></button><br>";
                    str += "<img src='/display?fileName=" + fileCallPath + "'>";
                    str += "</div>";
                    str + "</li>";
                } else {
                    let fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);

                    str += "<li "
                    str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='false' ><div>";
                    str += "<span> " + obj.fileName + "</span>";
                    str += "<button type='button' class='btn-close' aria-label='Close' data-file=\'" + fileCallPath + "\' data-type='file'"
                    str += "><i class='fa fa-times'></i></button><br>";
                    str += "<img src='/resources/img/attach.png'></a>";
                    str += "</div>";
                    str + "</li>";
                }
            });
            uploadUL.append(str);
        }

        $("button[type='submit']").on("click", function (e) {
            e.preventDefault();
            console.log("submit clicked");
            let str = "";
            $(".uploadResult ul li").each(function (i, obj) {
                let jobj = $(obj);
                jobj.data()
                console.log(jobj);
                console.log("-------------------------");
                console.log(jobj.data("fileName"));
                str += "<input type='hidden' name='attachList[" + i + "].fileName' value='" + jobj.data("filename") + "'>";
                str += "<input type='hidden' name='attachList[" + i + "].uuid' value='" + jobj.data("uuid") + "'>";
                str += "<input type='hidden' name='attachList[" + i + "].uploadPath' value='" + jobj.data("path") + "'>";
                str += "<input type='hidden' name='attachList[" + i + "].fileType' value='" + jobj.data("type") + "'>";
            });
            formObj.append(str);
            formObj.submit();
        });

        $("#uploadBtn").on("click", function (e) {
            console.log("file changed")
            let formData = new FormData();
            let inputFile = $("input[name='uploadFile']");
            let files = inputFile[0].files;
            console.log(files);

            for (let i = 0; i < files.length; i++) {
                //파일 종류 및 크기 체크
                if (!checkExtension(files[i].name, files[i].size)) {
                    return false;
                }

                formData.append("uploadFile", files[i]);
            }

            $.ajax({
                url        : 'http://localhost:8080/uploadAjaxAction',
                processData: false,
                contentType: false,
                data       : formData,
                type       : 'POST',
                dataType   : 'json',
                success    : function (result) {
                    showUploadResult(result);
                }
            });

        });

        $(".uploadResult").on("click", "button", function (e) {
            let targetFile = $(this).data("file");
            let type = $(this).data("type");
            let targetLi = $(this).closest("li");

            $.ajax({
                url     : '/deleteFile',
                data    : {fileName: targetFile, type: type},
                dataType: 'text',
                type    : 'POST',
                success : function (result) {
                    alert(result);
                    targetLi.remove();
                }
            });
        });

        $(".bigPictureWrapper").on("click", function (e) {
            $(".bigPicture").animate({width: '0%', height: '0%'}, 1000);
            setTimeout(function () {
                $('.bigPictureWrapper').hide();
            }, 1000);
        });
    });
</script>
