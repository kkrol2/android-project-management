class @WebGlue
  constructor: (@useCase, @gui, @storage)->
    AutoBind(@gui, @useCase)
    Before(@useCase, 'fetchProjectDummy', (id) => @storage.fetchProject(id))
    After(@storage, 'fetchProject', (id) => @storage.fetchImages(id))
    After(@storage, 'setProject', (data) => @useCase.setProject(data))
    After(@storage, 'setImages', (data) => @useCase.setImages(data))
    After(@useCase, 'initGuiDummy',  => @gui.init(@useCase.getProject(),@useCase.getImages()))
    LogAll(@useCase)
    LogAll(@storage)