<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Upload with Ajax</h1>
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
		}
		
		.uploadResult ul li img {
			width: 100px;
		}
</style>
	<div class="uploadDiv">
		<input type='file' name='uploadFile' multiple>
	</div>
	<button id='uploadBtn'>Upload</button>
	
	<div class='uploadResult'>
		<ul>
		
		</ul>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
		
		
	<script>

/* 	function showImage(fileCallPath){
	  
	  //alert(fileCallPath);
	
	  $(".bigPictureWrapper").css("display","flex").show();
	  
	  $(".bigPicture")
	  .html("<img src='/display?fileName="+fileCallPath+"'>")
	  .animate({width:'100%', height: '100%'}, 1000);

	}
	
	$(".bigPictureWrapper").on("click", function(e){
	  $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
	  setTimeout(() => {
	    $(this).hide();
	  }, 1000);
	}); */

	
	$(".uploadResult").on("click","span", function(e){
	   
	  let targetFile = $(this).data("file");
	  let type = $(this).data("type");
	  console.log(targetFile);
	  
	  $.ajax({
	    url: '/deleteFile',
	    data: {fileName: targetFile, type:type},
	    dataType:'text',
	    type: 'POST',
	      success: function(result){
	         alert(result);
	       }
	  }); //$.ajax
	  
	});



		/* $(document).ready(function(){
		
		 $("#uploadBtn").on("click", function(e){

		 let formData = new FormData();
		
		 let inputFile = $("input[name='uploadFile']");
		
		 let files = inputFile[0].files;
		
		 console.log(files);
		
		 //add filedate to formdata
		 for(let i = 0; i < files.length; i++){
		
		 formData.append("uploadFile", files[i]);
		
		 }

		
		 $.ajax({
		 url: '/uploadAjaxAction',
		 processData: false,
		 contentType: false,
		 data: formData,
		 type: 'POST',
		 success: function(result){
		 alert("Uploaded");
		 }
		 }); //$.ajax
		
		 });  
		 }); */

		let regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		let maxSize = 5242880; //5MB

		function checkExtension(fileName, fileSize) {

			if (fileSize >= maxSize) {
				alert("?????? ????????? ??????");
				return false;
			}

			if (regex.test(fileName)) {
				alert("?????? ????????? ????????? ???????????? ??? ????????????.");
				return false;
			}
			return true;
		}

		let cloneObj = $(".uploadDiv").clone();

		$("#uploadBtn").on("click", function(e) {

			let formData = new FormData();

			let inputFile = $("input[name='uploadFile']");

			let files = inputFile[0].files;

			console.log(files);

			for (let i = 0; i < files.length; i++) {

				if (!checkExtension(files[i].name, files[i].size)) {
					return false;
				}

				formData.append("uploadFile", files[i]);

			}

			/*   $.ajax({
			 url: '/uploadAjaxAction',
			 processData: false, 
			 contentType: false,
			 data: formData,
			 type: 'POST',
			 success: function(result){
			 alert("Uploaded");
			 }
			 }); //$.ajax */

			$.ajax({
				url : '/uploadAjaxAction',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				dataType : 'json',
				success : function(result) {

					console.log(result);

					showUploadedFile(result);

					$(".uploadDiv").html(cloneObj.html());

				}
			});

		});

		let uploadResult = $(".uploadResult ul");
 

		 function showUploadedFile(uploadResultArr){
		 
		   let str = "";
		   
		   $(uploadResultArr).each(function(i, obj){
		     
		     if(!obj.image){
		       
		       let fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);
		       
		       let fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
		       
		       str += "<li><div><a href='/download?fileName="+fileCallPath+"'>"+
		           "<img src='/resources/img/attach.png'>"+obj.fileName+"</a>"+
		           "<span data-file=\'"+fileCallPath+"\' data-type='file'> x </span>"+
		           "<div></li>"
		           
		     }else{
		       
		       let fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
		       
		       let originPath = obj.uploadPath+ "/"+obj.uuid +"_"+obj.fileName;
		       
		       originPath = originPath.replace(new RegExp(/\\/g),"/");
		       
		       str += "<li><a href=\"javascript:showImage(\'"+originPath+"\')\">"+
		              "<img src='display?fileName="+fileCallPath+"'></a>"+
		              "<span data-file=\'"+fileCallPath+"\' data-type='image'> x </span>"+
		              "<li>";
		     }
		   });
		   
		   uploadResult.append(str);
		 }

	</script>
	</body>
</html>