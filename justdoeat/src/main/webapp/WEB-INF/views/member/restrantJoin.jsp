<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	table {
		border-collapse: collapse;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>${vo. m_nikname }님의 가게 등록하기</h3>
<form  method="post"  enctype="multipart/form-data" action="rinsert.ad" >
<input type="hidden" name= "m_uq" value="${vo.m_uq }">

	<table border="1" style="margin: 0 auto; text-align: center;">
		<tr ><th>*가게명</th>
			<td class="wpx300 left"><input type="text" name="restaurant" required="required"/></td>
		</tr>
	
		
		<tr><th>주소</th>
		<td class='wpx300 left'><a class='btn-fill' onclick='daum_post()'>우편번호찾기</a>
			<input type='text' name='post' class='wpx60' readonly /><br/>
			<input type='text' name='r_address' readonly />
		</td>
		</tr>
		<tr><th>*전화번호</th>
			<td><input type="text" name="r_tel" required="required" class="wpx300"/></td>
		</tr>
		<tr><th>*대표메뉴</th>
			<td><input type="text" name="r_menu" required="required" class="wpx300"/></td>
		</tr>
		<tr><th>메뉴</th>
			<td><input type="text" name="r_menu" class="wpx300"/></td>
		</tr>

		<tr><th>*사진첨부</th>
		<td class='left wpx300'>
			<label><input  type="file" name="imgpath" id="attach-file" accept="image/*"/>
			<img src="imgs/select.png" class='file-img'/>
			</label>
			<span id="file-name"></span>
			<span id='delete-file' style="margin-left: 3px; margin-right: 3px;"><i class='fas fa-times' style='color:red'></i></span>
			</td>
	</tr>
	</table>
</form>	
	<div class="ad_btnSet">
		<a class='btn-fill' onclick="if(confirm('등록하시겠습니까?')){$('form').submit()}">신청</a>
		<a class='btn-fill' href='/web'>취소</a>
	</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

function daum_post(){
	new daum.Postcode({
		oncomplete: function( data ){
			$('[name=post]').val( data.zonecode );
			//도로명주소R/지번주소J
			var address = data.userSelectedType == 'R' 
				? data.roadAddress : data.jibunAddress;
			if( data.buildingName!='' ) address += ' ('+data.buildingName+')';
			$('[name=r_address]').eq(0).val( address );
		}
	}).open();
}

	//첨부된 파일이 이미지 파일인 경우 미리보기하여 보여지게
function isImage(filename){
	//kaka.jpg, png, gif, bmp, jpeg
	var ext = filename.substring( filename.lastIndexOf('.')+1 ).toLowerCase();
	var imgs = ['jpg', 'png', 'gif', 'bmp', 'jpeg'];
	if( imgs.indexOf(ext) > -1 ) return true;
	else return false;
	
		
}
	
$('#delete-file').on('click', function(){
	$('#file-name').html('');	
	$('#attach-file').html('');	
	$('#delete-file').css('display','none');
});

$('#attach-file').on('change', function(){
	var attach = this.files[0];
	//alert(attach.name);
	if( attach ){
		if( isImage(attach.name) ){
			
			$("#file-name").html(attach.name);
			$("#delete-file").css("display", "inline-block");
			
			/* var img = '<img id="preview-img" src="" class="file-img" />'
			$('#preview').html(img);
			
			var reader = new FileReader();
			reader.onload = function(e){
				$("#preview-img").attr('src', e.target.result);
				$("#file-name").html(attach.name);
			}  */
			} else {
				alert("파일첨부는 사진만 가능합니다. \n (jpg, png, gif, bmp, jpeg, 파일만 사용 가능)");
				return false;
			
			//reader.readAsDataURL(attach);
		}	
	}
});

//e.target.result == 타겟이 읽어온 정보래!
</script>
</body>
</html>