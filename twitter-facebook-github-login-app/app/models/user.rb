class User < ActiveRecord::Base
  devise :omniauthable
  attr_accessible :email, :name
end
