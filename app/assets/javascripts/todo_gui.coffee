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

  fillSurveys: (surveys) =>
    surveys.reverse()
    $("#content").html(@createElementFor(surveys,"#survey_container_template"))
    for survey in surveys
      if survey.voted
        template = @createElementFor(survey,"#survey_template")
        $('#surveys').append(template)
        @showChart("survey"+survey.id,survey)
      else
        $('#surveys').append(@createElementFor(survey,"#surveys_vote_template"))
    surveys.reverse()
    $(".submit_btn").click((e) => @voteSurvey($(e.currentTarget).attr('id'),$(e.currentTarget).closest('div').parent()))


  addComment: =>
    comment = new Comment($("#text").val(),$("#author").val() )
    @addCommentToDatabaseDummy(comment)
    @showNotificationSuccess("Your comment has been added successfully.")
    $("html, body").animate({ scrollTop: 0 }, "slow")

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
    @showNotificationSuccess("Issue has been submitted successfully.")
    $("html, body").animate({ scrollTop: 0 }, "slow")

  addIssueToDatabaseDummy: (issue) =>

  showNotificationSuccess: (message) =>
    noty({text: message, layout: 'topRight', "timeout":3000, type: 'success'})

  showNotificationFailure: (message) =>
    noty({text: message, layout: 'topRight', "timeout":3000, type: 'failure'})

  showChart: (id,survey) =>
    jQuery.jqplot.config.enablePlugins = true
    options = [[]]
    for option in survey.options
      options[0].push([option.name,option.votes_number])
    plot7 = jQuery.jqplot(id, options, 
    {
      title: survey.description, 
      seriesDefaults: {shadow: true, renderer: jQuery.jqplot.PieRenderer, rendererOptions: { showDataLabels: true } }, 
      legend: { show:true },
      grid: {
        drawGridLines: true,
        gridLineColor: '#cccccc',
        background: '#404442',
        borderColor: '#999999',
        borderWidth: 2.0,
        shadow: true,
        shadowAngle: 45,
        shadowOffset: 1.5,
        shadowWidth: 3,
        shadowDepth: 3
        },
    })
  voteSurvey: (survey_id, parent_div) =>
    checkedRadios = $(parent_div).find('input:radio:checked');
    if checkedRadios.length == 0
      @showNotificationFailure('Sorry, You have to select one of the options')
      return
    @voteSurveyDummy(survey_id,$(checkedRadios[0]).attr('id'))

  voteSurveyDummy: (survey_id,option_id) =>
  


