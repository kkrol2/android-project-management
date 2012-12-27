

class @WebTodoApp
  constructor: (id) ->

    useCase = new CompleteTasksUseCase(id)
    window.useCase = useCase
    gui = new WebGui()
    storage = new MyStorage()
    glue = new WebGlue(useCase, gui, storage)




