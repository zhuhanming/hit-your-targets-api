class Message
  def self.not_found(record = "record")
    "Sorry, #{record} not found."
  end

  def self.invalid_credentials
    "Invalid credentials"
  end

  def self.invalid_token
    "Invalid token"
  end

  def self.missing_token
    "Missing token"
  end

  def self.unauthorized
    "Unauthorized request"
  end

  def self.account_created
    "Account created successfully"
  end

  def self.account_already_exists
    "Account already exists"
  end

  def self.account_not_created
    "Account could not be created"
  end

  def self.password_does_not_match
    "Old password does not match"
  end

  def self.password_changed
    "Password changed successfully"
  end

  def self.expired_token
    "Sorry, your token has expired. Please login to continue."
  end
end
