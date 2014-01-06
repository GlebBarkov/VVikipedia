<a href = "<?php echo $this->url(array(), 'default', true) ?>">Home</a>
<a href = "<?php echo $this->url(array('pageId' => 4),'pages'); ?>">Best Article's</a>
<a href = "<?php echo $this->url(array('pageId' => 5),'pages'); ?>">Find Article</a>

<?php
$auth = Zend_Auth::getInstance();
if(!$auth->hasIdentity()){
echo '<a href = "http://zend2.localhost/registration">Registration</a>';
echo '<a href = "http://zend2.localhost/user/loginform">Login</a>';
}
else { echo '<a href="http://zend2.localhost/user/article">Add Articles</a>';
echo '<a href="http://zend2.localhost/user/myarticle">My Articles</a>';
echo '<a href="http://zend2.localhost/user/loginform">Logout</a>'; }
?>
<form  action="" method="post" id="search-form">
    <input id="search" value="search" type="text">
    <button onclick="return location.href = 'http://zend2.localhost/search'" class="search" type="button">Find</button>
</form>

