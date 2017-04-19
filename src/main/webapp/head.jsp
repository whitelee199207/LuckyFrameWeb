<%@ page language="java" contentType="text/html; charset=utf-8"%>
	<script src="/js/easyui/jquery.min.js"></script>
	<script src="/progressus/assets/js/bootstrap.min.js"></script>
	<script src="/progressus/assets/js/headroom.min.js"></script>
	<script src="/progressus/assets/js/jQuery.headroom.min.js"></script>
	<script src="/progressus/assets/js/template.js"></script>
	<script type="text/javascript" src="/js/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="/js/easyui/jquery.easyui.min.js"></script>
    <link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
	<link rel="stylesheet" href="/progressus/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="/progressus/assets/css/font-awesome.min.css">
	<!-- Custom styles for our template -->
	<link rel="stylesheet" href="/progressus/assets/css/bootstrap-theme.css" media="screen" >
	<link rel="stylesheet" href="/progressus/assets/css/main.css">
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="/progressus/assets/js/html5shiv.js"></script>
	<script src="/progressus/assets/js/respond.min.js"></script>
	<![endif]-->

	<div class="navbar navbar-inverse navbar-fixed-top headroom" style="background-color:rgba(51,204,255,0.5);font-size:20px;font-family:Helvetica Neue,Helvetica,Arial,sans-serif;">
		<div class="container">
			<div class="navbar-header">
				<!-- Button for smallest screens -->
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
				<a class="navbar-brand" href="/index.jsp"><img src="/progressus/assets/images/logo.png" alt="Progressus HTML5 template"></a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav pull-right">
					<li><a href="/">主页</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">UTP<b class="caret"></b></a>
						<ul class="dropdown-menu" style="background-color:rgba(51,204,255,0.6);">
							<li><a href="/testJobs/list.do">调度配置</a></li>
							<li><a href="/tastExecute/list.do">任务查询</a></li>
							<li><a href="/autoTestChar/chart.do">任务概况图表</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">质量管理<b class="caret"></b></a>
						<ul class="dropdown-menu" style="background-color:rgba(51,204,255,0.6);">
							<li><a href="/projectVersion/list.do">版本信息</a></li>
							<li><a href="/flowCheck/list.do">过程检查</a></li>
							<li><a href="/review/list.do">评审信息</a></li>
							<li><a href="/accident/list.do">生产故障</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">测试工具<b class="caret"></b></a>
						<ul class="dropdown-menu" style="background-color:rgba(51,204,255,0.6);">
							<li><a href="javascript:window.open('http://XXX.XX.XX.XX/testlink/login.php')">用例管理(TestLink)</a></li>
							<li><a href="javascript:window.open('http://XXX.XX.XX.XX:8080')">缺陷管理(JIRA)</a></li>
							<li><a href="javascript:window.open('http://XXX.XX.XX.XX/zentao/')">项目管理(ZenTao)</a></li>
							<li><a href="javascript:window.open('http://XXX.XX.XX.XX:18080/jenkins/')">持续集成(Jenkins)</a></li>
							<li><a href="javascript:window.open('http://XXX.XX.XX.XX/users/sign_in')">代码管理(GIT)</a></li>
							<li><a href="javascript:window.open('http://XXX.XX.XX.XX:9000/')">代码质量(Sonar)</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">测试环境<b class="caret"></b></a>
						<ul class="dropdown-menu" style="background-color:rgba(51,204,255,0.6);">
							<li><a href="javascript:window.open('http://XXX.XX.XX.XX:8080/test1/')">测试系统一</a></li>
                            <li><a href="javascript:window.open('http://XXX.XX.XX.XX:8080/tesst2/')">测试系统二</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">关于<b class="caret"></b></a>
						<ul class="dropdown-menu" style="background-color:rgba(51,204,255,0.6);">
						    <li><a href="/operationLog/list.do">平台日志</a></li>
							<li><a href="/progressus/contact.jsp">联系我们</a></li>
						</ul>
					</li>
					<li>
					<a id="logoutbt" class="btn" href="/progressus/signin.jsp">登录</a>
					<a id="loginbt" class="btn" onclick="logout()" style="display:none;">注销</a>
					</li>
					<li>
					<a id="loginmess" href="/userInfo/getlogininfo.do" style="display:none;"></a>
					</li>
				</ul>
			</div><!--/.nav-collapse -->
		</div>
	</div>
	<input type="hidden" id="loginstatus" name="loginstatus" value=""/>
	
	<script type="text/javascript">
jQuery(function loginboolean(){
	var url ="/userlogin/loginboolean.do";
	$.ajax({
		type:"GET",
		url:url,
		cache:false,
		dataType:"json",
		success:function (result){
	    	if(result.data[0]==null){
	    		document.getElementById("loginstatus").value = "false";
			    document.getElementById("logoutbt").style.display = "block"; 
				document.getElementById("loginbt").style.display = "none";
				document.getElementById("loginmess").style.display = "none";
				return false;
	    	}else if(result.data[0]=="login"){
	    		document.getElementById("loginstatus").value = "true";
	    		document.getElementById("loginmess").innerHTML = result.data[2]+"("+result.data[1]+")&nbsp;&nbsp;欢迎您！";
				 document.getElementById("logoutbt").style.display = "none"; 
				 document.getElementById("loginbt").style.display = "block";
				 document.getElementById("loginmess").style.display = "block";
				 return true;
			 }else{
				document.getElementById("loginstatus").value = "false";
			    document.getElementById("logoutbt").style.display = "block"; 
				document.getElementById("loginbt").style.display = "none";
				document.getElementById("loginmess").style.display = "none";
				return false;
			   }
		}
		});
});
	
function logout(){
	if(confirm('确定要注销吗？')==true){
		 document.getElementById("loginbt").innerHTML = "注销中...";
	     var url ="/userlogin/userlogout.do";
	     jQuery.getJSON(url,null,function call(result){
	  		   if(result.data[0]=="true"){
				 document.getElementById("logoutbt").style.display = "block"; 
			     document.getElementById("loginbt").style.display = "none";
			     document.getElementById("loginmess").style.display = "none";
			     document.getElementById("loginbt").innerHTML = "注销";
	  			 return true;
	  		   }else{
	  			alert("注销失败！");
	  			return false;
	  		   }
	      });
	}
}	

</script>