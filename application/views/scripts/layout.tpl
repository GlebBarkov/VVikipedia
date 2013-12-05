<?php echo $this->doctype(Zend_View_Helper_Doctype::XHTML1_TRANSITIONAL); ?>
<html>
 <head>
  <?php echo $this->headTitle('VVikipedia'); ?>
  <?php echo $this->headMeta()->appendHttpEquiv('Content-Type', 'text/html; charset=UTF-8'); ?>
  <?php echo $this->headLink()->appendStylesheet($this->baseUrl . 'design/css/style.css'); ?>
  <?php echo $this->headScript(); ?>
 </head>
<body>
    <div id="menu">
        <?php echo $this->partial('menu.tpl'); ?>
    </div>
    <div id="main">
        <div id="left">
            <div style = "margin:5px;">Best Articles:</div>
            <?php echo $this->action('index', 'articles'); ?>
            <div id = "copy">(c) St54509. </div>
        </div>
        <div id="content"><?php echo $this->layout()->content; ?></div>
    </div>
</body>
</html>