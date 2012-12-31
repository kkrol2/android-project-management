

class @WebTodoApp
  constructor: (id) ->

    useCase = new CompleteTasksUseCase()
    window.useCase = useCase
    gui = new WebGui()
    storage = new MyStorage()
    glue = new WebGlue(useCase, gui, storage)
    useCase.fetchProjectDummy(id)




