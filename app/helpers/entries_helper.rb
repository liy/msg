module EntriesHelper
	class HTMLPygments < Redcarpet::Render::HTML
		# override the redcapet's method to provide extra syntax highlight
		def block_code(code, language)
			Pygments.highlight(code, lexer: language)
		end
	end

	def markdown(text)
		renderer = HTMLPygments.new(hard_wrap: true, filter_html: true)
		options = {
			autolink: true,
			no_intra_emphasis: true,
			fenced_code_blocks: true,
			lax_html_blocks: true,
			strikethrough: true,
			superscript: true
		}

		Redcarpet::Markdown.new(renderer, options).render(text).html_safe
	end

	def clippy(text, bgcolor='#FFFFFF')
		html = <<-EOF
		<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" width="14" height="14" id="clip" align="middle">
				<param name="movie" value="/clip.swf" />
				<param name="quality" value="high" />
				<param name="bgcolor" value="#ffffff" />
				<param name="play" value="true" />
				<param name="loop" value="true" />
				<param name="wmode" value="window" />
				<param name="scale" value="showall" />
				<param name="menu" value="true" />
				<param name="devicefont" value="false" />
				<param name="salign" value="" />
				<param name="allowScriptAccess" value="always" />
				<param name="FlashVars" value="copyText=#{text}">
				<!--[if !IE]>-->
				<object type="application/x-shockwave-flash" data="/clip.swf" width="14" height="14">
					<param name="movie" value="/clip.swf" />
					<param name="quality" value="high" />
					<param name="bgcolor" value="#ffffff" />
					<param name="play" value="true" />
					<param name="loop" value="true" />
					<param name="wmode" value="window" />
					<param name="scale" value="showall" />
					<param name="menu" value="true" />
					<param name="devicefont" value="false" />
					<param name="salign" value="" />
					<param name="FlashVars" value="copyText=#{text}">
					<param name="allowScriptAccess" value="always" />
				<!--<![endif]-->
					<a href="http://www.adobe.com/go/getflash">
						<img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash player" />
					</a>
				<!--[if !IE]>-->
				</object>
				<!--<![endif]-->
			</object>
		EOF
	end
end
