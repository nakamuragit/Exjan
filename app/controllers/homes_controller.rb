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
    if @contact.save
      redirect_to homes_sign_up_path
    else 
      render homes_forcom_path
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :business, :reason, :other)
  end
end
