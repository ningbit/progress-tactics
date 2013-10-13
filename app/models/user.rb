class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name

  has_one :team
end
