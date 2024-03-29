class @CompleteTasksUseCase
  constructor: ->

  fetchProjectDummy: (id) =>

  setProject: (data) =>
  	@project = data
  	if @images != null and @images != undefined
  	  @initGuiDummy()

  setImages: (data) =>
  	@images = data
  	if @project !=null and @project != undefined
  		@initGuiDummy()

  setComments: (data) =>
    @comments = data

  setIssues: (data) =>
    @issues = data

  initGuiDummy: =>

  getProject: =>
  	return @project

  getImages: =>
  	return @images

  getComments: =>
  	return @comments

  getIssues: =>
    return @issues

  getSurveys: =>
  	return @surveys

  addComment: (comment) =>
    @comments.push(comment)

  addIssue: (issue) =>
    @issues.push(issue)

  setSurveys: (surveys) =>
    for survey in surveys
      survey = new Survey(survey)
    @surveys = surveys

  @forceTwoDigits: (val) =>
    if val < 10
      return "0"+val
    return val

  @formatDate: (date) =>
    m = @forceTwoDigits(date.getMonth() + 1)
    y = date.getFullYear()
    d = @forceTwoDigits(date.getDate())
    return y+'-'+m+'-'+d

  voteSurvey: (survey_id,option_id) =>
    survey = (@surveys.filter (survey) -> survey.id == parseInt(survey_id,10))[0]
    survey.voted = true
    @voteSurveyDummy(survey)
    for option in survey.options
      if option.id == parseInt(option_id,10)
        option.votes_number += 1
        @updateOptionDummy(option)

  updateOptionDummy: (option) =>

  voteSurveyDummy: (survey) =>



class @Comment
  constructor: (content,nick_name) ->
    @content = content
    @nick_name = nick_name
    @created_at = CompleteTasksUseCase.formatDate(new Date)

class @Issue
  constructor: (name,description) ->
    @name = name
    @description = description
    @updated_at = CompleteTasksUseCase.formatDate(new Date)
    @state = "Unconfirmed"

class @Survey
  constructor: (survey) ->
    @name = survey.name
    @description = survey.description
    @id = survey.id
    @options = survey.options
    @voted = false


  


