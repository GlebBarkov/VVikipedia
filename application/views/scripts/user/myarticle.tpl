<div class="download" xmlns="http://www.w3.org/1999/html"
	 xmlns="http://www.w3.org/1999/html">
	<h1>Your Articles:</h1>
	<table style="width:100%;">
		<?php
				foreach($this->content as $article) {
		?>
		<tr>
			<td style="font-weight: bold; margin-top:10px; border-top: 1px solid #C7CFDE;">
				<div class="articleview-<?php echo $article->id; ?>"><?php echo $article->title; ?></div>
				<div style="display: none;width:300px;" class="articleinput-<?php echo $article->id; ?>"><input class="title" name="title" value="<?php echo $article->title; ?>"></div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="articleview-<?php echo $article->id; ?>"><?php echo $article->text; ?></div>
				<div style="display: none;" class="articleinput-<?php echo $article->id; ?>"><textarea style="width:680px;height:240px;" rows="" cols=""><?php echo $article->text;?></textarea></div>
			</td>
		</tr>
		<tr>
			<td>
				<div><?php echo $article->date; ?></div>
			</td>
		</tr>
		<tr>
			<td>
				<button style="display: none" class="save-<?php echo $article->id; ?>" onclick="saveatricle($(this).attr('articleid'))" articleid="<?php echo $article->id; ?>">Save</button>
				<button class="edit-<?php echo $article->id; ?>" onclick="editatricle($(this).attr('articleid'))" articleid="<?php echo $article->id; ?>">Edit</button>
				<button onclick="delatricle($(this).attr('articleid'))" articleid="<?php echo $article->id; ?>">Delete</button>
			</td>
		</tr>
		<tr>
			<td>
			</td>
		</tr>
		<?php } ?>

	</table>
	<?php if (count($this->content) == 0) {echo "<p>You have no articles.</p>"; } ?>
</div>
<script type="text/javascript">
	function delatricle(articleid){
		$.ajax({
			type: 'POST',
			dataType: 'json',
			url: 'http://zend2.localhost/user/del/id/'+articleid,
			success:
					function(data) {
						console.log(data)
					}
		});
		window.setTimeout('location.reload()', 2000);
	}

	function editatricle(articleid){
		$(".articleview-"+articleid).css('display','none');
		$(".articleinput-"+articleid).css('display','block');
		$(".edit-"+articleid).css('display','none');
		$(".save-"+articleid).css('display','block');
	}

	function saveatricle(articleid){
		$(".articleview-"+articleid).css('display','block');
		$(".articleinput-"+articleid).css('display','none');
		var title = $(".articleinput-"+articleid+' .title').val();
		var text = $(".articleinput-"+articleid+' textarea').val();
		$(".edit-"+articleid).css('display','none');
		$(".save-"+articleid).css('display','block');

		$.ajax({
			type: 'POST',
			dataType: 'json',
			url: 'http://zend2.localhost/user/save/text/'+text+'/title/'+title+'/id/'+articleid,
			success:
					function(data) {
						console.log(data)
					}
		});
		window.setTimeout('location.reload()', 2000);
	}
</script>