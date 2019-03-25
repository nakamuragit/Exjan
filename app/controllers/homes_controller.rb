class HomesController < ApplicationController
  def home
  end

  def sign_up 
  end

  def forcom
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.save
    redirect_to homes_sign_up_path
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :business, :reason, :other)
  end
end
