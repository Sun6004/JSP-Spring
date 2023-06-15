package kr.or.ddit.controller;

public class SecurityController {
/*
 * 18장. 스프링 시큐리티
 * 
 * 1. 스프링 시큐리티 소개
 * - 애플리케이션에서 보안 기능을 구현하는데 사용되는 프레임 워크입니다.
 * 스프링 시큐리티는 필터 기반으로 동작하기 때문에 스프링 MVC와 분리되어 동작한다.
 * 
 * 		기본 보안 기능
 * 		- 인증(Authentication)
 * 			> 애플리케이션 사용자의 정당성을 확인한다.
 * 		- 인가(Authorization)
 * 			> 애플리케이션의 리소스나 처리에 대한 접근을 제어한다.
 * 
 * 		시큐리티 제공 기능
 * 		- 세션 관리
 * 		- 로그인 처리
 * 		- CSRF 토큰 처리
 * 		- 암호화 처리
 * 		- 자동 로그인
 * 
 * 			** CSRF 용어 설명
 * 			- 크로스 사이트 요청 위조는 웹 사이트 취약점 공격의 하나로 , 사용자가 자신의 의지와는 무관하게 공격자가
 * 			의도한 행위(수정, 삭제, 등록 등)를 특정 웹 사이트에 요청하게 하는 공격을 말한다.
 * 
 * 2. 스프링 시큐리티 설정
 * 
 * 		환경 설정
 * 		- 의존 라이브러리 설정
 * 			> 스프링 시큐리티가 제공하는 라이브러리를 추가한다. (pom.xml)
 * 
 * 			- spring-security-web
 * 			- spring-security-config
 * 			- spring-security-core
 * 			- spring-security-taglibs
 * 
 * 		- 웹 컨테이너 설정
 * 			> 스프링 시큐리티가 제공하는 서블릿 필터 클래스를 서블릿 컨테이너에 등록한다. (web.xml)
 * 			> 스프링 시큐리티는 필터 기반이므로 시큐리티 필터체인을 등록한다.
 * 				- param 추가(/WEB-INF/spring/security-context.xml)
 * 				- filter 추가 (web.xml)
 * 
 * 		- 스프링 시큐리티 설정
 * 			> 스프링 시큐리티 컴포넌트를 빈으로 정의한다.
 * 			> spring/security-context.xml 설정
 * 
 * 		스프링 시큐리티 기본 테스트 정책(웹 화면 접근 정책) ::: 테스트를 위한 정책이므로 스프링 시큐리티 정책과는 무관
 * 			> 웹 화면 접근 정책을 말한다. (테스트용)
 * 
 * 			대상		|	화면		|	접근정책
 * 		────────────────────────────────────────────
 * 		일반 게시판	|	목록화면	|	모두가 접근 가능합니다.
 * 					|	등록화면	|	로그인한 회원만 접근 가능합니다.
 * 		────────────────────────────────────────────
 * 		공지 게시판	|	목록화면	|	모두가 접근 가능합니다.
 * 					|	등록화면	|	로그인한 관리자만 접근 가능합니다.
 * 		────────────────────────────────────────────
 * 		
 * 		화면 설명
 * 		- 컨트롤러
 * 			> security.SecurityBoardController
 * 			> security.SecurityNoticeController
 * 		- 화면 페이지
 * 			> security/board/list		
 * 			> security/board/register		
 * 			> security/notice/list		
 * 			> security/notice/register
 * 
 * 			** 화면에 맞는 컨트롤러와 페이지를 작성합니다.
 * 
 * 		화면 요청
 * 			> localhost/security/board/list
 * 			> localhost/security/board/register
 * 			> localhost/security/notice/list
 * 			> localhost/security/notice/register
 * 
 * 3. 접근 제한 설정
 * 	- 시큐리티 설정을 통해서 특정 URI에 대한 접근을 제한할 수 있다.
 * 
 * 		환경설정
 * 		- 스프링 시큐리티 설정
 * 			> URI 패턴으로 접근 제한을 설정한다.
 * 			> security-context.xml 설정
 * 				: <security:intercept-url pattern="/board/list" access="permitAll" />
 * 				: <security:intercept-url pattern="/board/register" access="hasRole('ROLE_MEMBER')" /> .. 등으로 설정
 * 
 * 		화면 설명
 * 		- 일반 게시판 목록 화면(모두 접근 가능하도록 되어 있습니다 : permitAll)
 * 		- 일반 게시판 등록 화면(회원 권한을 가진 사용자만 접근 가능 : hasRole('ROLE_MEMBER'))
 * 			> 접근 제한에 걸려 스프링 시큐리티가 기본적으로 제공하는 로그인 페이지로 이동합니다.
 * 		- 공지사항 게시판 목록 화면(모두 접근 가능하도록 되어 있습니다 : permitAll)
 * 		- 공지사항 게시판 등록 화면(회원 권한을 가진 사용자만 접근 가능 : hasRole('ROLE_ADMIN'))
 * 			> 접근 제한에 걸려 스프링 시큐리티가 기본적으로 제공하는 로그인 페이지로 이동합니다.
 * 
 * 4. 로그인 처리
 * 	- 메모리상에 아이디와 패스워드를 지정하고 로그인을 처리합니다.
 * 	스프링 시큐리티 5버전 이상부터는 패스워드 암호화 처리기를 반드시 이용하도록 변경이 됩니다.
 * 	암호화 처리기를 사용하지 않도록 {noop}문자열을 비밀번호 앞에 사용합니다.
 * 
 * 		환경설정
 * 		- 스프링 시큐리티 설정
 * 			> security-context.xml 설정
 * 			  : <security:authentication-manager>
 *					<security:authentication-provider>
 *						<security:user-service>
 *							<security:user name="member" password="{noop}1234" authorities="ROLE_MEMBER"/>
 *							<security:user name="admin" password="{noop}1234" authorities="ROLE_MEMBER, ROLE_ADMIN"/>
 *						</security:user-service>
 *					</security:authentication-provider>
 *				</security:authentication-manager>
 *		
 *		화면 설명
 *		- 일반 게시판 등록 화면
 *			> 접근 제한이 결려 스프링 시큐리티가 기본적으로 제공하는 로그인 페이지가 연결되고,
 *				일반회원 등급인 ROLE_MEMBER 권한을 가진 member 계정으로 로그인 후 해당 페이지로 접근 가능
 *			> 관리자 등급인 admin계정은 ROLE_MEMBER 권한도 가지고 있는 계정이므로 해당 페이지로 접근 가능
 *		- 공지사항 게시판 등록 화면
 *			> 접근 제한이 걸려 스프링 시큐리티가 기본적으로 제공하는 로그인 페이지가 연결되고, 
 *				관리자 등급인 ROLE_ADMIN 권한을 가진 admin 계정으로 로그인 후 해당 페이지로 접근 가능
 *
 * 5. 접근 거부 처리
 * 	접근 거부가 발생한 상황을 처리하는 접근 거부 처리자의 URI를 지정할 수 있다.
 * 	
 * 		환경 설정
 * 		- 스프링 웹 설정
 * 			> servlet-context.xml
 * 				: <context:component-scan base-package="kr.or.ddit.security" />
 * 
 * 				** 우리는 현재 kr.or.ddit를 기준으로 base 패키지로 설정되어 있지 때문에 위와 같은 설정을 하지는 않는다.
 * 					프로젝트를 만들고 설정하는 과정에서 base-package를 나눠야 하는 상황일 때는 위와 같은 설정이 필요할 수 있다.
 * 					왜냐하면 security 패키지 아래에 있는 해당 컨트롤러들을 빈으로 등록해야할 필요가 있기 때문이다.
 * 
 * 		- 스프링 시큐리티 설정
 * 			> security-context.xml 설정
 * 				- 접근 거부 처리자의 URI 지정
 * 				- <security:access-denied-handler error-page="/accessError" />
 * 
 * 		접근 거부 처리
 * 		- 접근 거부 처리 컨트롤러 작성
 * 			> security/CommonController
 * 
 * 		화면 설정(회원 권한으로 접근을 가정한다.)
 * 		- 일반 게시판 등록 페이지
 * 			> 접근 제한에 걸려 스프링 시큐리티가 제공하는 로그인 페이지가 나타나고,
 * 			회원 권한을 가진 계정으로 접근 시 접근 가능
 * 		- 공지사항 게시판 등록 페이지
 * 			> 접근 제한에 걸려 스프링 시큐리티가 제공하는 로그인 페이지가 나타나고,
 * 			회원 권한을 가진 계정으로 접근 시, 공지사항 게시판 등록 페이지는 관리자 권한만 접근 가능하므로
 * 			접근이 거부된다. 이때, access-denied-handler로 설정되어 있는 URI로 이동하고
 * 			해당 페이지에서 접근이 거부되었을 때 보여질 페이지의 정보가 나타난다.
 * 
 * 6. 사용자 정의 접근 거부 처리자
 * 	- 접근 거부가 발생한 상황에 단순 메시지 처리 이상의 다양한 처리를 하고 싶다면 AccessDeniedHandler를 직접 구현하여야 한다.
 * 
 * 		환경 설정
 * 		- 스프링 시큐리티 설정
 * 			> security_context.xml 설정
 * 				- id가 customAccessDenied를 가지고 있는 빈을 등록한다.
 * 					: 빈 등록에 사용되는 클래스는 security 패키지 아래에 있는 CustomAccessDeniedHandler클래스
 * 		
 * 		접근 거부 처리자 클래스 정의
 * 		- 사용자가 정의한 접근 거부 처리자
 * 			> CustomAccessDeniedHandler 클래스 정의
 * 				- AccessDeniedHandler 인터페이스를 참조받아서 handle 메소드를 재정의하고 사용합니다.
 * 				: 우리는 접근이 거부되었을때 빈으로 등록해둔 CustomAccessDeniedHandler 클래스가 발동해
 * 				해당 메소드가 실행되고 response 내장객체를 활용하여 /accessError URI로 이동하여 접근 거부시
 * 				보여질 페이지로 이동하지만 이곳에서 더 많은 로직을 처리하길 원하면 request, response 내장객체를 이용하여
 * 				다양한 처리가 가능하다.
 * 
 * 		화면 설정(회원 권한으로 접근을 가정한다.)
 * 		- 일반 게시판 등록 페이지
 * 			> 접근 제한에 걸려 스프링 시큐리티가 제공하는 로그인 페이지가 나타나고,
 * 			회원 권한을 가진 계정으로 접근 시 접근 가능
 * 		- 공지사항 게시판 등록 페이지
 * 			> 접근 제한에 걸려 스프링 시큐리티가 제공하는 로그인 페이지가 나타나고,
 * 			회원 권한을 가진 계정으로 접근 시, 공지사항 게시판 등록 페이지는 관리자 권한만 접근 가능하므로
 * 			접근이 거부된다. 이때, access-denied-handler로 설정되어 있는 ref 속성에 부여된 클래스 메소드로 이동하고
 * 			해당 페이지에서 접근이 거부되었을때 보여질 페이지의 정보가 나타난다.
 *
 *	7. 사용자 정의 로그인 페이지
 *	 - 기본 로그인 페이지가 아닌 사용자가 직접 정의한 로그인 페이지를 사용한다.
 *
 *		환경설정
 *		- 스프링 시큐리티 설정
 *		> security-context.xml 설정
 *			- <security:form-login/>삭제 (기본 로그인 페이지로 사용하는게 아니기 때문에 주석처리)
 *			- <security:form-login login-page="/login /> 설정
 *				: 사용자가 직접 만든 로그인 페이지로 이동할 '/login' URI를 가지고 있는 컨트롤러 메서드를 정의합니다.
 *
 *		로그인 페이지 정의
 *		- 사용자가 정의한 로그인 컨트롤러
 *			> controller패키지 안에 LoginController 메서드 생성
 *		- 사용자가 정의한 로그인 뷰
 *			> views/loginForm.jsp
 *
 *		**  시큐리티에서 제공하는 기본 로그인 페이지로 이동하지 않고,
 *			사용자가 정의한 로그인 페이지의 URI를 요청하여 해당 페이지에서 권한을 체크하도록 한다.
 *			인증이 완료되면 최초의 요청된 target URI로 이동한다. 그렇지 않은 경우 사용자가 만들어놓은 
 *			접근 거부 페이지로 이동한다.
 *
 *	8. 로그인 성공 처리
 *	- 로그인을 성공한 후에 로그인 이력 로그를 기록하는 등의 동작을 하고 싶은 경우가 있다
 *		이런 경우에 AuthenticationSuccessHandle 라는 인터페이스를 구현해서 로그인 성공 처리자로 지정할 수 있습니다.
 *
 *	환경설정
 *	- 스프링 시큐리티 설정
 *		> securityu-context.xml 설정
 *			- customLoginSuccess 빈 등록
 *			- <security:form-login login-page="/login" authentication-success-handler-ref="customLoginSuccess+/> 추가
 *
 *	로그인 성공 처리자 클래스 정의
 *		- 로그인 성공 처리자
 *		> SavedRequestAwareAuthenticationSuccessHandler는 AuthenticationSuccessHandler의 구현 클래스이다.
 *			인증 전에 접근을 시도한 URL로 리다이렉트하는 기능을 가지고 있으며 스프링 시큐리티에서 기본적으로 사용되는 구현 클래스이다.
 *
 *	화면 설명
 *	- 일반 게시판 등록 화면
 *		> 사용자가 정의한 로그인 페이지에서 회원 권한에 해당하는 계정으로 로그인 시, 성공했다면 성공 처리자인 CustomLoginSuccess 클래스로 넘어가
 *			넘겨받은 파라미터들 중 authentication안에 pricipal로 User 정보를 받아서 username과 password를 출력한다.
 *			( 출력 정보는 로그인 성공 시 인증된 회원정보)
 *
 *	9. 로그아웃 처리
 *	로그아웃을 위한 URI를 지정하고, 로그아웃 처리 후에 별도의 작업을 하기 위해서 사용자가 직접 구현한 처리자를 등록할 수 있다.
 *
 *		환경설정
 *		- 스프링 시큐리티 설정
 *		> security-context.xml설정
 *		> <security:logoit logout-url="/logout" invalidate-session="true"/>
 *
 *		** logout 결로는 스프링에서 제공하는 /logout 경로로 설정한다
 *		logout 처리 페이지에서도 action경로는 /logout으로 설정한다.
 *
 *	10. JDBC를 이용한 인증/인가 처리
 *	- 지정한 형식으로 테이블을 생성하면 JDBC를 이용해서 인증/인가를 처리할 수 있다.
 *	생성할 테이블은 사용자를 관리하는 테이블(users)과 권한을 관리하는 테이블 2개로 구성되어 있다.
 *
 *		데이터베이스 테이블 준비
 *		- users, authorities 테이블 준비
 *
 *		환경설정
 *		- 의존 라이브러리 설정
 *		> 데이터베이스 관련 라이브러리를 추가한다.
 *		> 기존 데이터베이스 연결을 위한 라이브러리가 추가되어 있다. (SecurityTest 프로젝트 안에는 없기 때문에 새롭게 등록)
 *
 *		스프링 설정
 *		- root-context.xml설정
 *		> 데이터 소스 설정
 *
 *		스프링 시큐리티 설정
 *		- security-context.xml설정
 *		> customPasswordEncoder 빈 등록
 *		>  <security:authentication-managet> 태그 내에 설정
 *
 *		비밀번호 암호화 처리기 클래스 정의
 *		- 비밀번호 암호화 처리기
 *		> 스프링 시큐리티 5 버전 부터는 기본적으로 PasswordEncoder를 지정해야 하는데,
 *		 제대로 하려면 생성한 데이터는 암호화를 처리하지 않고 로그인 하면 당연히 로그인 에러가 발생한다.(암호화된 비밀번호가 아니라서)
 *		 그래서 암호화를 하지 않는 PasswordEncoder를 직접 구현하여 지정하면 로그인 시 암호화를 고려하지 않으므로 로그인이 정상적으로 이루어짐
 *		- security/CustomNoOpPasswordEncoder 클래스 구현
 *
 *	11. 사용자 테이블을 이용한 인증/인가 처리
 *	스프링 시큐리티가 기본적으로 이용하는 테이블 구조를 그대로 생성해서 사용해도 되지만,
 *	기존에 구축된 회원 테이블이 있다면 약간의 작업으로 기존 테이블을 활용할 수 있다.
 *
 *		db테이블 준비
 *		- member, member_auth 테이블 준비
 *
 *		환경설정
 *		- 스프링 시큐리티 설정
 *		- security-context.xml설정
 *		> bcryptPasswordEncoder 빈 등록 진행
 *		> <security:jdbc-user-service> 태그 설정
 *		> <security:password-encoder> 태그 설정
 *
 *		쿼리 정의
 *		- 인증할 때 사용할 쿼리
 *		> select user_id, user_pw, enabled from member where user_id=?
 *		- 권한을 확인할 때 사용할 쿼리
 *		> select m.user_id, ma.auth from member_auth ma, member m where ma.user_no = m.user_no and m.user_id =?
 *
 *		** BCryptPasswordEncoder 클래스를 이용하여 직접 encode된 비밀번호를 찾아 데이터베이스에 세팅한다.
 *		> 12번에 해당하는 내용에서 자세한 내용으로 확인
 *	
 *			BCryptPasswordEncoder 클래스를 활용한 단방향 비밀번호 암호화
 *			- encode() 메서드를 통해서 SHA-2 방식의 8바이트 Hash암호를 매번 랜덤하게 생성한다.
 *			- 똑같은 비밀번호를 입력하더라도 암호화되는 문자열은 매번 다른 문자열을 반환한다.
 *
 *		> 비밀번호를 입력하면 암호화된 비밀번호로 인코딩되는데, 암호화된 비밀번호와 디비 테이블에 있는 암호화된 비밀번호가 일치한지를 파안한 후,
 *		  일치하면 로그인 성공으로 다음 스탭을 진행한다.
 *			- BCryptPasswordEncoderm 클래스의 encode() 메서드를 통해 만들어지는 암호화된 해쉬 다이제스트들은 입력한 비밀번호 문자에 해당하는
 *			   수십억개의 다이제스트들 중에서 일치하는 다이제스트가 존재할 경우 비밀번호의 일치를 보고 인증을 성공시켜준다.
 *
 *	12. UserDetailsService 재정의
 *		스프링 시큐리티의 UserDetailService를 구현하여 사용자 상세 정보를 얻어오는 메서드를 재정의한다.
 *
 *		데이터베이스 테이블
 *		- board 테이블 사용
 *
 *		환경 설정
 *		- 의존 라이브러리 설정(pom.xml)
 *		> 데이터베이스 관련 라이브러리
 *
 *		스프링 시큐리티 설정
 *		- security-context.xml 설정
 *		> customUserDetailsService 빈 등록
 *		> <security:authentication-provider> 태그 설정
 *
 *		클래스 재정의
 *		- UserDetailsService 재정의
 *		> common.security.CustomUserDetailsService
 *		> 기존 memberMapper에서 사용중인 read를 기반으로 한 readById를 새롭게 재정의하여 사용하겠음
 *		> CustomUserDetailsService 클래스 내 loadUserByUsername 메서드에서 인코딩된 비밀번호를 확인해보고 암호화된 비밀번호가 어떻게
 *			일치하여 인증이 되는지를 같이 알아보도록 한다. 
 *
 *	13. 스프링 시큐리티의 표현식
 *	- 스프링 시큐리티 표현식을 이용하면 인증 및 권한 정보에 따라 화면을 동적으로 구성할 수 있고 로그인 한 사용자 정보를 보여줄 수도 있다.
 *
 *		공동 표현식
 *		- hasRole([role])
 *			> 해당 롤이 있으면 true
 *		- hasAnyRole([role1, role2])
 *			> 여러 롤 중 하나라도 해당하는 롤이 있으면 true
 *		- principal
 *			> 안증된 사용자의 사용자 정보(UserDetails 인터페이스를 구현한 클래스의 객체)를 의미
 *		- authentiction
 *			> 인증된 사용자의 인증 정보(Authentication 인터페이스를 구현한 클래스의 객체)를 의미
 *		- permitAll
 *			> 모든 사용자에게 허용
 *		- denyAll
 *			> 모든 사용자에게 거부
 *		- isAnonymous()
 *			> 익명의 사용자의 경우(로그인하지 않은 경우도 포함)
 *		- isAuthenticated()
 *			> 인증된 사용자면 true
 *		- ifFullyAuthenticated()
 *			> Remember-me로 인증된 것이 아닌 일반적인 방법으로 인증된 사용자인 경우 true
 *
 *		표현식 사용
 *		- 표현식을 이용하여 동적 화면 구성
 *		> home.jsp를 수정한다.
 *			- 표현식을 이용한 내용을 추가합니다.
 *		
 *		- 로그인 한 사용자 정보 보여주기
 *			> views/board/register.jsp 수정
 *			> views/notice/register.jsp 수정
 */
}
