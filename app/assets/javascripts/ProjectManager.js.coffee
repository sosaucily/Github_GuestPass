#@ Symbol makes the var global
class @ProjectManager
	constructor: () ->
	runProgressBar: () ->
		@progress_bar = setInterval ()->
			$bar = $('div#project-progress-bar div.bar')

			if $bar.width() < 200
				$bar.width $bar.width()+50
			else if	$bar.width() < 247
				$bar.width $bar.width()+47
			else #Does this ever run?
				clearInterval(@progress_bar)
				$('.progress').removeClass('active')
			if $bar.width() > 247
				$bar.text("100%")
			else
				$bar.text(Math.round(($bar.width()*100)/247) + "%")
		, 50
	getProjectsOnLoad: () ->
		pbar = this.runProgressBar()
		$.ajax '/get_projects',
			type: 'GET'
			dataType: 'html'
			error: (jqXHR, textStatus, errorThrown) ->
				$('div.projects').append "<div class='alert alert-info'>
				  <a class='close' data-dismiss='alert' href='#'>×</a>
				  <p>
				    Error loading projects #{textStatus}
				  </p>
				</div>";
				bar = $('div#project-progress-bar div.bar')
				bar.width 247
				bar.text "100%"
				$('.progress').removeClass('active')
				$('div#project-progress-bar').fadeOut(2000)
			success: (data, textStatus, jqXHR) ->
				$('div.projects').append data
				$('div.projects div.alert').fadeOut(2000);
				clearInterval(pbar)
				$bar = $('div#project-progress-bar div.bar')
				$bar.width 247
				$bar.text "100%" 
				$('.progress').removeClass('active')
				$('div#project-progress-bar').fadeOut(2000)
