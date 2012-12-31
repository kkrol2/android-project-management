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

  setProject: (data) =>

  setImages: (data) =>

  setSurveys: (data) =>

  setComments: (data) =>

