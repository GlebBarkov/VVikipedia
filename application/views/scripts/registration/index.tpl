<h1>Registration</h1>

<form  action="" method="post" id="login-form">
	<input class="name" value="Login" type="text">
	<input class="email" value="E-mail" type="text">
	<input class="real_name" value="First Name, Last Name" type="text">
	<input class="pass" value="password" type="password">
	<button onclick="register()" class="register" type="button">Register</button>
</form>

<script type="text/javascript">
	function register(){
		var name = jQuery(".name").val();
		var real_name = jQuery(".real_name").val();
		var pass = jQuery(".pass").val();
		var email = jQuery(".email").val();
		jQuery.ajax({
			type: 'POST',
			dataType: 'json',
			url: 'http://zend.local/registration/save/name/'+name+'/real_name/'+real_name+'/pass/'+pass+'/email/'+email,
			success:
					function(data) {
						
					}
		});
	}
</script>