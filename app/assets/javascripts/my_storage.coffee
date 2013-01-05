class @MyStorage
  constructor: ->

  fetchProject: (id) =>
  	$.get '/projects/getProject', 'id='+id, @setProject, 'json'

  fetchImages: (id) =>
  	$.get '/projects/getImages', 'id='+id, @setImages, 'json'

  fetchComments: (id) =>
    $.get '/projects/getComments', 'id='+id, @setComments, 'json'

  fetchSurveys: (id) =>
    $.get '/projects/getSurveys', 'id='+id, @setSurveys, 'json'

  fetchIssues: (id) =>
    $.get '/projects/getBugs', 'id='+id, @setIssues, 'json'

  setProject: (data) =>

  setImages: (data) =>

  setSurveys: (data) =>

  setComments: (data) =>

  setIssues: (data) =>
    
  addIssue: (issue, project) =>
    $.get '/projects/addIssue', 'name='+issue.name+'&description='+issue.description+'&id='+project.id, @status, 'json'

  addComment: (comment, project) =>
    $.get '/projects/addComment', 'nick_name='+comment.nick_name+'&content='+comment.content+'&id='+project.id, @status, 'json'

  status: (data) =>
    alert data
    

