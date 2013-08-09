class ApiKey < ActiveRecord::Base
  def self.token_exists?(token)
    where(token: token).count > 0
  end
end
