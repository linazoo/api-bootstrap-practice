require 'faker'

User.delete_all
Channel.delete_all
Subscription.delete_all

users = 100.times.map do
  User.create!( :first_name => faker::Name.first_name,
                :last_name  => faker::Name.last_name,
                :email      => faker::Internet.email,
                :password   => 'password' )
end

channels = ["Telemundo", "Unimas ", "Azteca 13", "Mexiquense",
 "ESPN", "Fox Sports", "NBC Sports", "Big Ten Network", "Nickelodeon"].map do |name|
  Channel.create!(:name            => name,
                  :callsign        => name[0..2].upcase,
                  :price_per_month => faker::Commerce.price)
end

users.each do |user|
  user_channels = channels.sample(rand(2..4))
  user_channels.each do |channel|
    Subscription.create!(user: user,
                         channel: channel)
  end
end