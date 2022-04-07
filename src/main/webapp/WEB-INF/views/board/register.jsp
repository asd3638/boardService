<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Board Register</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

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
        background-color: gray;
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
        <div class="panel panel-default">

            <div class="panel-heading">Board Register</div>
            <!-- /.panel-heading -->
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


                    <button type="submit" class="btn btn-default">Submit
                        Button
                    </button>
                    <button type="reset" class="btn btn-default">Reset Button</button>
                </form>

            </div>
            <!--  end panel-body -->
        </div>
        <!--  end panel-body -->
    </div>
    <!-- end panel -->
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">

            <div class="panel-heading">File Attach</div>
            <!-- /.panel-heading -->
            <div class="uploadDiv">
                <input type="file" name="uploadFile" multiple="multiple">
            </div>
            <div class="uploadResult">
                <ul>

                </ul>
            </div>

            <button id="uploadBtn">Upload</button>
            <!--  end panel-body -->
        </div>
        <!--  end panel-body -->
    </div>
    <!-- end panel -->
</div>
<!-- /.row -->
<script>
$(document).ready(function (e) {
        let formObj = $("form[role='form']");
        $("button[type='submit']").on("click", function (e) {
            e.preventDefault();
            console.log("submit clicked");
            let str = "";
            $(".uploadResult ul li").each(function (i, obj) {
                let jobj = $(obj);
                console.dir(jobj);
                console.log("-------------------------");
                console.log(jobj.data("filename"));
                str += "<input type='hidden' name='attachList[" + i + "].fileName' value='" + jobj.data("filename") + "'>";
                str += "<input type='hidden' name='attachList[" + i + "].uuid' value='" + jobj.data("uuid") + "'>";
                str += "<input type='hidden' name='attachList[" + i + "].uploadPath' value='" + jobj.data("path") + "'>";
                str += "<input type='hidden' name='attachList[" + i + "].fileType' value='" + jobj.data("type") + "'>";
            });
            console.log(formObj);
            formObj.submit();
            //formObj.append(str).submit();
        });

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

        let cloneObj =$(".uploadDiv").clone();

        $("input[type='file']").change(function (e) {
            let formData = new FormData();
            let inputFile = $("input[name='uploadFile']");
            let files = inputFile[0].files;
            console.log(files);

            for(let i=0; i < files.length; i++) {
                //파일 종류 및 크기 체크
                if( !checkExtension(files[i].name, files[i].size ) ){
                    return false;
                }

                formData.append("uploadFile", files[i]);
            }

            $.ajax({
                url : 'uploadAjaxAction',
                processData: false,
                contentType: false,
                data : formData,
                type : 'POST',
                dataType : 'json',
                success:function(result) {
                    //alert("Uploaded");
                    console.log(result);
                    showUploadedFile(result);
                    $(".uploadDiv").html(cloneObj.html());
                }
            });

        });

    let uploadResult = $(".uploadResult ul");
    function showUploadedFile(uploadResultArr) {
        var str="";
        $(uploadResultArr).each(function (i,obj) {
            if( !obj.image){
                let fileCallpath= obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName;

                str += "<li><a href='${app}/download?fileName=" + fileCallpath + "'>"  +
                    "<img src='${app}/resources/img/attach.png'>" + obj.fileName+"</li>";
            }else{
                let fileCallpath=encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
                str += "<li><img src='/display?fileName=" + fileCallpath+
                    "'></li>";
            }
        });
        console.log(str);
        uploadResult.append(str);

    }

        $(".uploadResult").on("click", "button", function (e) {

            console.log("delete file");

            let targetFile = $(this).data("file");
            let type = $(this).data("type");

            let targetLi = $(this).closest("li");

            $.ajax({
                url: '/deleteFile',
                data: {fileName: targetFile, type: type},
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
                },

                dataType: 'text',
                type: 'POST',
                success: function (result) {
                    alert(result);

                    targetLi.remove();
                }
            }); //$.ajax
        });
    });
</script>
<%@include file="../includes/footer.jsp" %>
