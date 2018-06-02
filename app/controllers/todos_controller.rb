class TodosController < ApplicationController
    
    def new
        @todo = Todo.new
    end
    
    def create
        @todo = Todo.new(todo_params)
        if @todo.save 
            flash[:notice] = "Todo was creadted successfully!"
            # save to the database
            ## if it saves we want to redirect to a specific page
            redirect_to todo_path(@todo)
        else
            render 'new'
        end
    end
    
    def show
        @todo = Todo.find(params[:id])
    end
    
    def edit
        # Grab the id from the param and find a todo to edit it
        @todo = Todo.find(params[:id])
    end
    
    def index
        # grabs all todos from the database
        @todos = Todo.all
    end
    
    def destroy
        # first find the todo
        @todo = Todo.find(params[:id])
        # Then call the destroy method
        @todo.destroy
        # once you destroy it give a flash notice
        flash[:notice] = "Todo was deleted successfully"
        redirect_to todos_path
    end
    
    def update
        # will look similar to the create action
        @todo = Todo.find(params[:id])
        if @todo.update(todo_params)
            flash[:notice] = "Todo was successfully updated"
            redirect_to todo_path(@todo)
        else
            render 'edit'
        end
    end
    
    private 
    
    def todo_params
        # Whitelist the name and description
        ## allowing what our application can receive 
        params.require(:todo).permit(:name, :description)
    end
        
end















