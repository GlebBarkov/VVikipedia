<a href = "<?php echo $this->url(array(), 'default', true) ?>">Home</a>
<?php
$auth = Zend_Auth::getInstance();
if($auth->hasIdentity()){
echo '<a href = "http://zend.local/addarticle">Add Article</a>';
}
else echo '<a href = "http://zend.local/user/loginform">Add Article</a>';
?>

<a href = "<?php echo $this->url(array('pageId' => 4),'pages'); ?>">Best Article's</a>
<a href = "<?php echo $this->url(array('pageId' => 5),'pages'); ?>">Find Article</a>

<?php
$auth = Zend_Auth::getInstance();
if(!$auth->hasIdentity()){
echo '<a href = "http://zend.local/registration">Registration</a>';
echo '<a href = "http://zend.local/user/loginform">Login</a>';
}
else echo '<a href="http://zend.local/user/loginform">Logout</a>';
?>
<?
<form  action="" method="post" id="search-form">
    <input id="search" value="search" type="text">
    <button onclick="return location.href = 'http://zend.local/search'" class="search" type="button">Find</button>


</form>

