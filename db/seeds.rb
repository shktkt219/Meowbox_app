User.create!(first_name: "Sam", last_name: "Sams", email: "sam@rails.com", password: "samsams", password_confirmation: "samsams", subscription_id: 1)
User.create!(first_name: "John", last_name: "Johns", email: "john@rails.com", password: "johnjohn", password_confirmation: "johnjohn", subscription_id: 2)
User.create!(first_name: "Tom", last_name: "Toms", email: "tom@rails.com", password: "tomtoms", password_confirmation: "tomtoms", subscription_id: 3)


Subscription.create!(name: "basic", price: 10, description: "Basic plan. Casual boxes but your kitty will enjoy them.")
Subscription.create!(name: "standard", price: 30, description: "Standard plan. Standard boxes and your kitty will be satisfied them.")
Subscription.create!(name: "premium", price: 100, description: "Premium plan. Luxuary boxes and your kitty will be one of the most gorgeous kitties in the world!")


Box.create!(title: "Autumn Basic", month_year: "October 2016", subscription_id: 1)
Box.create!(title: "Fun Basic", month_year: "September 2016", subscription_id: 1)
Box.create!(title: "Cool Basic", month_year: "August 2016", subscription_id: 1)

Box.create!(title: "Autumn Standard", month_year: "October 2016", subscription_id: 2)
Box.create!(title: "Fun Standard", month_year: "September 2016", subscription_id: 2)
Box.create!(title: "Cool Standard", month_year: "August 2016", subscription_id: 2)

Box.create!(title: "Autumn Premium", month_year: "October 2016", subscription_id: 3)
Box.create!(title: "Fun Premium", month_year: "September 2016", subscription_id: 3)
Box.create!(title: "Cool Premium", month_year: "August 2016", subscription_id: 3)
