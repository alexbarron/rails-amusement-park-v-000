class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if user.tickets < attraction.tickets && user.height < attraction.min_height
      return "Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets
      return "Sorry. You do not have enough tickets the #{attraction.name}."
    elsif user.height < attraction.min_height
      return "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      rider = User.find_by(id: user_id)
      rider.tickets = rider.tickets - attraction.tickets
      rider.happiness = rider.happiness + attraction.happiness_rating
      rider.nausea = rider.nausea + attraction.nausea_rating
      rider.save
      return "Thanks for riding the #{attraction.name}!"
    end
      
      
  end

end
