class UserSession < Authlogic::Session::Base
  find_by_login_method :find_by_email
  def to_key
    new_record? ? nil : [ self.send(self.class.primary_key) ]
  end

  def persisted?
    false
  end

  login_field :email
  password_field :password
end