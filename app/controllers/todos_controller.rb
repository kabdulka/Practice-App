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
    
    private 
    
    def todo_params
        # Whitelist the name and description
        ## allowing what our application can receive 
        params.require(:todo).permit(:name, :description)
    end
        
end















