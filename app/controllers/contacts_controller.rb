class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      redirect_to root_path, notice: "Mail envoyé, nous revenons vers vous vite!"
    else
      render :new, alert: "Votre mail n'a pas été envoyé, merci de réessayer."
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end
end
