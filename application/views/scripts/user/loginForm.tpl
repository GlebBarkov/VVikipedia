<form method='post' action=''>
	<ul>
		<li>
			<input class="username" name="username" value="Username">
		</li>
		<li>
			<input type="password" class="password" name="password" value="Password">
		</li>
	</ul>
</form>
<button onclick="sign()" class="buttonsignin">Sign In</button>
<script type="text/javascript">
	function sign(){
		var username = $(".username").val();
		var password = $(".password").val();
		$.ajax({
			type: 'POST',
			dataType: 'json',
			url: 'http://zend2.localhost/user/auth/username/'+username+'/password/'+password,
			success:
					function(data) {
					}
		});
		window.setTimeout('location.reload()', 2000);
	}
</script>