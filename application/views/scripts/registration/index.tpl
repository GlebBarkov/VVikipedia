<h1>Registration</h1>

<form  action="" method="post" id="login-form">
	<input class="username" value="Login" type="text">
	<input class="email" value="E-mail" type="text">
	<input class="real_name" value="First Name, Last Name" type="text">
	<input class="password" value="password" type="password">
	<button onclick="register()" class="register" type="button">Register</button>
</form>

<script type="text/javascript">
	function register(){
		var username = jQuery(".username").val();
		var real_name = jQuery(".real_name").val();
		var password = jQuery(".password").val();
		var email = jQuery(".email").val();
		jQuery.ajax({
			type: 'POST',
			dataType: 'json',
			url: 'http://zend2.localhost/registration/save/username/'+username+'/real_name/'+real_name+'/password/'+password+'/email/'+email,
			success:
					function(data) {


					}
		});
	}
</script>