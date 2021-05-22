/**
 * 회원가입시 항목에 대한 유효성 확인처리
 */

var join = { 
	tag_status: function(tag){
		var data = tag.val();
		tag = tag.attr('m_name');
		if( tag == 'm_id' ) data = this.m_id_status(data);
		else if ( tag == 'm_pw' ) data = this.m_pw_status(data);
		else if ( tag == 'pw_check' ) data = this.pw_check_status(data);
		else if ( tag == 'm_email' ) data = this.m_email_status(data);
		return data;
	},
	
	m_email_status: function(m_email){
		var reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		if( m_email=='' ) return this.common.empty;
		else if( m_email.match(space) ) return this.common.space;
		else if( !reg.test(m_email) ) return this.m_email.invalid;
		else return this.m_email.valid;
	},
	
	
	m_email: {
		valid: { code:'valid', desc:'유효한 이메일입니다.' },
		invalid: { code:'invalid', desc:'이메일형식이 유효하지 않습니다.' },
	},
	
	pw_check_status: function(pw_check){
		if( pw_check=='' ) return this.common.empty;
		else if( pw_check == $('[name=m_pw]').val() ) return this.m_pw.equal;
		else return this.m_pw.notEqual;
	},
	
	m_pw_status: function(m_pw){
		var reg = /[^0-9a-zA-Z]/g;
		var upper = /[A-Z]/g, lower = /[a-z]/g, digit = /[0-9]/g;
		if( m_pw=='' ) return this.common.empty;
		else if( m_pw.match(space) ) return this.common.space;
		else if( reg.test(m_pw) ) return this.m_pw.invalid;
		else if( m_pw.length < 5 ) return this.common.min;
		else if( m_pw.length > 10 ) return this.common.max;
		else if( !upper.test(m_pw) || !lower.test(m_pw) 
					|| !digit.test(m_pw) ) return this.m_pw.lack;
		else return this.m_pw.valid;
	},
	
	m_pw: {
		equal: { code:'valid', desc:'비밀번호가 일치합니다' },
		notEqual: { code:'invalid', desc:'비밀번호가 일치하지 않습니다' },
		lack: { code:'invalid', desc:'영문 대/소문자,숫자를 모두 포함해야 합니다' },
		invalid: { code:'invalid', desc:'비밀번호는 영문대/소문자,숫자만 입력가능' },
		valid: { code:'valid', desc:'사용가능한 비밀번호입니다' }
	},
	
	common: {
		empty: { code:'invalid', desc:'입력하세요' },
		space: { code:'invalid', desc:'공백없이 입력하세요' },
		min: { code:'invalid', desc:'최소 5자이상 입력하세요' },
		max: { code:'invalid', desc:'최대 10자이하 입력하세요' },
	},
	
	m_id: {
		usable: { code:'valid', desc:'사용가능한 아이디입니다' },
		unUsable: { code:'invalid', desc:'이미 사용중인 아이디입니다' },
		valid: { code:'valid', desc:'아이디 중복확인하세요' },
		invalid: { code:'invalid', desc:'아이디는 영문소문자,숫자만 입력가능' }
	},
	
	m_id_status: function( m_id ){
		var reg = /[^0-9a-z]/g;
		if( m_id=='' ) return this.common.empty;
		else if ( m_id.match(space) ) return this.common.space;
		else if ( reg.test(m_id) ) return this.m_id.invalid;
		else if ( m_id.length < 5 ) return this.common.min; 
		else if ( m_id.length > 10 ) return this.common.max; 
		else return this.m_id.valid; 
	}
	
	
};

var space = /\s/g;

 
 