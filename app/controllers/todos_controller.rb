class TodosController < ApplicationController
    # we can use a before filter
    # We don't want to do this for all of our methods
    ## only for show, edit, update and destroy
    # so add only keyword with square brackets and inside of it specify which
    # methods you want to apply it to
    ## So.. what this says is before we do anything for these methods run the
    # the set to do method which sets the todo by running the line of code inside of it
    before_action :set_todo, only: [:edit, :update, :show, :destroy]
    
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
    end
    
    def edit
        # Grab the id from the param and find a todo to edit it
    end
    
    def index
        # grabs all todos from the database
        @todos = Todo.all
    end
    
    def destroy
        # first find the todo
        # Then call the destroy method
        @todo.destroy
        # once you destroy it give a flash notice
        flash[:notice] = "Todo was deleted successfully"
        redirect_to todos_path
    end
    
    def update
        # will look similar to the create action
        if @todo.update(todo_params)
            flash[:notice] = "Todo was successfully updated"
            redirect_to todo_path(@todo)
        else
            render 'edit'
        end
    end
    
    private 
    
    def set_todo
        @todo = Todo.find(params[:id])
    end
    
    def todo_params
        # Whitelist the name and description
        ## allowing what our application can receive 
        params.require(:todo).permit(:name, :description)
    end
        
end















