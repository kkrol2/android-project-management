class @WebGui
  constructor: ->
    $("#comments_button").click( => @showComments() )
    $("#home_button").click( => @showHome() )
    $("#surveys_button").click( => @showSurveys() )
  init: (project,images) =>
  	@initHeadline(project)
  	@initGallery(images)
  	@showContent(project)

  createElementFor: (data,templateId) =>
    source = $(templateId).html();
    template = Handlebars.compile(source)
    return template(data)

  initHeadline: (project) =>
  	$("#site_title").html(@createElementFor(project,"#header_template"))

  showContent: (project) =>
  	$("#content").html(@createElementFor(project,"#content_template"))

  initGallery: (images) =>

  	 for image in images
       $("#cs_slider").append(@createElementFor(image,"#image_template"))

  	 $('#gallery').ContentSlider({
                    width : '940px',
                    height : '240px',
                    speed : 400,
                    easing : 'easeOutSine'
                    });
  showComments: =>
    @unselectAllElements()
    $('#comments_button').toggleClass('current', true);

  fillComments: (comments) =>
    for comment in comments
      $("#content").append(@createElementFor(comment,"#comment_template")) 
    	

  unselectAllElements: =>
    $('#comments_button').toggleClass('current', false);
    $('#home_button').toggleClass('current', false);
    $('#surveys_button').toggleClass('current', false);

  showHome: =>
    @unselectAllElements()
    $('#home_button').toggleClass('current', true);

  showSurveys: =>
    @unselectAllElements()
    $('#surveys_button').toggleClass('current', true);

  refreshUi: =>
    $("#content").html("")