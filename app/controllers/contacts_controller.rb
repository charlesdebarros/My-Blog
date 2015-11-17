class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
      if @contact.deliver
        flash[:error] = nil
      else
        flash[:error] = 'Unable to send message'
        render :new
      end
  end
end
