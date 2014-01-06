<div class="download">
	<h1>Your Articles:</h1>
	<table style="width:100%;">
		<?php
				foreach($this->content as $article) {
		?>
		<tr>
			<td style="font-weight: bold; margin-top:10px; border-top: 1px solid #C7CFDE;">
				<?php echo $article->title; ?>
			</td>
		</tr>
		<tr>
			<td>
				<?php echo $article->text; ?>
			</td>
		</tr>
		<tr>
			<td>
				<?php echo $article->date; ?>
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