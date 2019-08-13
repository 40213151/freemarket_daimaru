class SessionsController < Devise::SessionsController
  def user_info_keep
    session[:nickname] = params[:nickname]
    session[:email] = params[:email]
    session[:password] = params[:password]
    session[:password_confirmation] = params[:password_confirmation]
    redirect_to new_phone_entrypage_path
  end

  def phone_entrypage
  end

  def phone_info_keep
    session[:cell_phone] = params[:cell_phone]
    redirect_to new_address_entrypage_path
  end

  def address_entrypage
  end

  def address_info_keep
    session[:first_name] = params[:first_name]
    session[:last_name] = params[:last_name]
    session[:first_name_kana] = params[:first_name_kana]
    session[:last_name_kana] = params[:last_name_kana]
    session[:postal_code] = params[:postal_code]
    session[:prefecture] = params[:prefecture]
    session[:municipalities] = params[:municipalities]
    session[:address_number] = params[:address_number]
    session[:building] = params[:building]
    session[:phone_number] = params[:phone_number]
    User.create!(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      cell_phone: session[:cell_phone]
      )
    user = User.find_by(email: session[:email])
    Plofile.create(
      first_name: session[:first_name],
      last_name: session[:last_name],
      first_name_kana: session[:first_name_kana],
      last_name_kana: session[:last_name_kana],
      postal_code: session[:postal_code],
      prefecture: session[:prefecture],
      municipalities: session[:municipalities],
      address_number: session[:address_number],
      building: session[:building],
      phone_number: session[:phone_number],
      user_id: user.id
      )
      sign_in user
      redirect_to new_card_path
  end
end
