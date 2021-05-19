/**
 * 파일첨부 관련된 함수
 */
// 첨부된 파일이 이미지파일인 경우 미리보기하여 보여지게
function isImage(filename){
	//0004914318.jpg, png, gif, bmp, jpeg, PNG, JPG
	var ext = filename.substring( filename.lastIndexOf('.')+1 ).toLowerCase();
	var imgs = [ 'jpg', 'png', 'gif', 'bmp', 'jpeg' ];
	if( imgs.indexOf(ext) > -1 ) return true;
	else return false;
} 
$('#attach-file').on('change', function(){
	//선택한 파일명을 file-name 태그에 보이게한다
	if( this.files[0] ) $('#file-name').text( this.files[0].name );
	$('#delete-file').css('display', 'inline');
	
	//미리보기태그가 있는 경우만 처리
	if( $('#preview').length>0 ){
		var attach = this.files[0];
		if( attach ){
			if( isImage(attach.name)  ){
				var img = '<img id="preview-img" src="" class="file-img" />'
				$('#preview').html(img);
				
				var reader = new FileReader();
				reader.onload = function(e){
					$('#preview-img').attr('src', e.target.result);
				}
				reader.readAsDataURL(attach);
			}else
				$('#preview').html('');
		}		
	}
});
$('#delete-file').on('click', function(){
	$('#file-name').text(''); 
	$('#delete-file').css('display', 'none');
	$('#attach-file').val(''); //실제 선택한 파일정보 없애기
	
	//미리보기태그가 있는 경우만 처리
	if( $('#preview').length>0 ) $('#preview').html('');
}); 







