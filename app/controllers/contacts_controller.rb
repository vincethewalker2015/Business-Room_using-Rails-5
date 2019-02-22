class ContactsController < ApplicationController
    
    def new
       @contact = Contact.new
    end
    
    def create
       @contact = Contact.new(contact_params)
       if @contact.save
           flash[:info] = "Message Sent"
           redirect_to contact_path(@contact)
       else
           flash.now[:danger] = "Error, Try again"
           render 'new'
       end
    end
    
    def show
        
    end
    
    private
    
    def contact_params
       params.require(:contact).permit(:name, :email, :comments) 
    end
    
end
