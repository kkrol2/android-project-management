class @MyStorage
  constructor: ->

  fetchProject: (id) =>
  	$.get '/projects/getProject', 'id='+id, @setProject, 'json'

  fetchImages: (id) =>
  	$.get '/projects/getImages', 'id='+id, @setImages, 'json'

  setProject: (data) =>

  setImages: (data) =>

