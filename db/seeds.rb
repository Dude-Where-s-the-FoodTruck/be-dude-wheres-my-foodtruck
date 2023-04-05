# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
FoodTruck.create({  name: "Burgers, Burgers, Burgers!",
                    cuisine_type: "Japanese",
                    web_link: "www.google.com",
                    image_link: "https://m.media-amazon.com/images/M/MV5BZGJiNmM1NDctNWUxYS00YzE4LWJjNTgtYTJhYzE0NjFmMTMwXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_.jpg"})

FoodTruck.first.events.create({ event_date: "2023-06-24",
                                latitude: 39.7516128,
                                longitude: -104.9901364,
                                start_time: "15:00",
                                end_time: "18:00",
                                description: "in parking lot near front entrance",
                                city: "Colorado Springs"})

FoodTruck.first.events.create({ event_date: "2023-06-26",
                                latitude: 39.7516128,
                                longitude: -104.9901364,
                                start_time: "15:00",
                                end_time: "18:00",
                                description: "first star to the right and straight on till morning",
                                city: "Englewood"})
                                
FoodTruck.first.events.create({ event_date: "2023-05-26",
                                latitude: 39.7516128,
                                longitude: -104.9901364,
                                start_time: "15:00",
                                end_time: "18:00",
                                description: "in the back of the wardrobe",
                                city: "Denver"})     
                                                      
FoodTruck.create({  name: "Normal FoodTruck",
                    cuisine_type: "American",
                    web_link: "https://bobs-burgers.fandom.com/wiki/Bob%27s_Burgers_Wiki",
                    image_link: "https://image.api.playstation.com/vulcan/img/rnd/202010/2621/H9v5o8vP6RKkQtR77LIGrGDE.png"})

FoodTruck.second.events.create({ event_date: "2023-05-24",
                                latitude: 39.7516128,
                                longitude: -104.9901364,
                                start_time: "15:00",
                                end_time: "18:00",
                                description: "This is a thing right here",
                                city: "Denver"})

FoodTruck.create({  name: "Tequila's Tacos",
                    cuisine_type: "American",
                    web_link: "https://bobs-burgers.fandom.com/wiki/Bob%27s_Burgers_Wiki",
                    image_link: "https://m.media-amazon.com/images/M/MV5BZGJiNmM1NDctNWUxYS00YzE4LWJjNTgtYTJhYzE0NjFmMTMwXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_.jpg"})

