class User < ActiveRecord::Base
    # e.g., User.authenticate('josh@codedivision.com', 'apples123')

  def self.authenticate(username, password)
    # if email and password correspond to a valid user, return that user
    # otherwise, return nil

    theguy = User.find_by_name(username)
    if theguy.password == password
      true
    else
      false
    end

  end
end