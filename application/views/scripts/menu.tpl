<a href = "<?php echo $this->url(array(), 'default', true) ?>">Home</a>
<a href = "http://zend.local/addarticle">Add Article</a>
<a href = "<?php echo $this->url(array('pageId' => 4),'pages'); ?>">Best Article's</a>
<a href = "<?php echo $this->url(array('pageId' => 5),'pages'); ?>">Find Article</a>
<a href = "http://zend.local/registration">Registration</a>
<a href = "http://zend.local/login">Login</a>

<form  action="" method="post" id="search-form">
    <input id="search" value="search" type="text">
    <button onclick="return location.href = 'http://zend.local/search'" class="search" type="button">Find</button>


</form>

