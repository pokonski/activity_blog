class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    data = request.env["omniauth.auth"].extra.raw_info
    @user = User.where(email: data["email"]).first

    if @user
      @user.update_attributes(avatar_url: data.avatar_url, nickname: data.login)
    else
      @user = User.create nickname: data.nickname, email: data.email, password: Devise.friendly_token[0,20],
                          avatar_url: data.avatar_url, nickname: data.login
    end

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Github"
      sign_in_and_redirect @user, :event => :authentication
    else
      flash[:notice] = "Error while signing in with Github: #{@user.errors.to_a.join(",")}"

      redirect_to root_path
    end
  end
end