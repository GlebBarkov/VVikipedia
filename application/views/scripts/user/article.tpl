<h1>Add Article</h1>

<form  action="" method="post" id="addarticle-form">
    <input id="title" value="title" type="text">
    <textarea id="article">text</textarea>
    <button onclick="AddArticle()" class="article" type="button">Add</button>
</form>

<script type="text/javascript">
    function AddArticle(){

        var author_id  = 1;
        var title = $("#title").val();
        var text = $("#article").val();

        $.ajax({
            type: 'POST',
            url: 'http://zend2.localhost/user/addarticle/author_id/'+author_id+'/title/'+title+'/text/'+text,
            success:
                    function(data) {
                        console.log(data);
                    }

        });
		window.setTimeout('location.reload()', 2000);
    }
</script>