class PagesController < ApplicationController

    # Actions are methods/functions in rails
    # NOTE: Because we have pages_controller file in the controllers folder,
    # We need to have a pages folder under views
    def home
        # There is no code here but by convention because there is a home action
        # Rails knows that there is a pages controller there is a pages folder under
        # Views that has a home file within it
    end
    
    def about
        
    end
    
    def help
        
    end

end