class User < ApplicationRecord
  # Remember to create a migration!
  has_many :subscriptions 
  has_many :channels, through: :subscriptions
  # Every user has an email
  # Every user's email is unique
  validates :email, presence: true 
  validates_uniqueness_of :email 
  # Every user has a password
  validates :password, presence: true 


  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def authenticate(password)
    self.password == password
  end

  def total_prices
    total = 0
    self.channels.each do |channel| 
      total += channel.price_per_month
    end 
    return total
  end 
  
end
