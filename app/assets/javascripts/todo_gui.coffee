class @WebGui
  constructor: ->
    $("#comments_button").click( => @showComments() )
    $("#home_button").click( => @showHome() )
    $("#surveys_button").click( => @showSurveys() )
    $("#issues_button").click( => @showIssues() )
  
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
    $('#comments_button').toggleClass('current', true)

  fillComments: (comments) =>
    comments.reverse()
    $("#content").html(@createElementFor(comments,"#comment_container_template")) 
    $("#comments").html("")
    for comment in comments
      $("#comments").append(@createElementFor(comment,"#comment_template"))
    $("#submit").click( => @addComment() ) 
    comments.reverse()
    	

  fillIssues: (issues) =>
    issues.reverse()
    $("#content").html(@createElementFor(issues,"#issue_container_template"))
    $("#add_issue").click( => @showAddIssueForm() )
    $("#issues").html("")
    for issue in issues
      $("#issues").append(@createElementFor(issue,"#issue_template"))
    issues.reverse()


  addComment: =>
    comment = new Comment($("#text").val(),$("#author").val() )
    @addCommentToDatabaseDummy(comment)

  addCommentToDatabaseDummy: (comment) =>


  unselectAllElements: =>
    $('#comments_button').toggleClass('current', false)
    $('#home_button').toggleClass('current', false)
    $('#surveys_button').toggleClass('current', false)
    $('#issues_button').toggleClass('current', false)

  showHome: =>
    @unselectAllElements()
    $('#home_button').toggleClass('current', true);

  showSurveys: =>
    @unselectAllElements()
    $('#surveys_button').toggleClass('current', true)

  showIssues: =>
    @unselectAllElements()
    $('#issues_button').toggleClass('current', true)

  refreshUi: =>
    $("#content").html("")

  showAddIssueForm: =>
    $("#issue_container").show()
    $("#issue_add_form_helper").hide()
    $("#issues").hide()
    $("#submit_issue").click( => @submitIssue() )

  submitIssue: =>
    issue = new Issue($("#issue_name").val(),$("#issue_description").val())
    @addIssueToDatabaseDummy(issue)
    $("#issues").show()

  addIssueToDatabaseDummy: (issue) =>
