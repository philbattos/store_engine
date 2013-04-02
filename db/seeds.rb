# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


### Product Categories ###
game_consoles = Category.create(name: "Game Consoles")
tvs           = Category.create(name: "TVs")
laptops       = Category.create(name: "Laptops")
tablets       = Category.create(name: "Tablets")
home          = Category.create(name: "Home")

### Products ###
nest  =  Product.create(title: "Nest Thermostat",
                        description: "The next generation Nest has a new, slimmer design, is enclosed by a solid stainless steel ring, and works with 95% of low voltage systems.",
                        price: 9999.0,
                        photo:  "https://s3.amazonaws.com/store_engine_product_photos/nest1.png",
                        retired: false
                       )
kindle = Product.create(title: "Kindle Fire HD Tablet",
                        description: "The next generation Nest has a new, slimmer design, is enclosed by a solid stainless steel ring, and works with 95% of low voltage systems.",
                        price: 12999.0,
                        photo: "https://s3.amazonaws.com/store_engine_product_photos/nest1.png",
                        retired: false
                       )
mac_pro = Product.create(title: "Apple MacBook Pro",
                         description: "MacBook Pro with Retina display, MagSafe 2 Power Adapter, AC wall plug, power cord, printed and electronic documentation.",
                         price: 110000.0,
                         photo: "https://s3.amazonaws.com/store_engine_product_photos/macbook1.png",
                         retired: false
                        )
apple_tv = Product.create(title: "Apple TV",
                          description: "1080p HD programming, including iTunes movies and TV shows, Netflix, Vimeo, photos and more in HD. Access your purchased movies, TV shows, and music with iTunes Match right from iCloud.",
                          price: 9999.0,
                          photo: "https://s3.amazonaws.com/store_engine_product_photos/Screen+Shot+2013-03-31+at+6.29.51+PM.png",
                          retired: false
                         )
xbox    = Product.create(title: "Xbox 360",
                         description: "Xbox 360 has blockbuster games, HD movies and controller.Built-in Wi-Fi for easy connection to Xbox LIVE. Super quiet with sleek new design plus matching controller. Ready for the controller-free fun of Kinect.",
                         price: 20000.0,
                         photo: "https://s3.amazonaws.com/store_engine_product_photos/xbox.png",
                         retired: false
                         )
bose    = Product.create(title: "Bose® TV Sound System",
                         description: "Love watching TV? Well, it’s about to get dramatically better. The Bose Solo TV sound system reveals much more of the depth and detail you’re meant to hear in your favorite programs. The kind of sound most flat panel TVs simply cannot reproduce from their internal speakers. The Bose Solo sound system fills a room with rich, detailed sound. And with just one speaker and one connection, it couldn’t be easier.",
                         price: 39900.0,
                         photo: "https://s3.amazonaws.com/store_engine_product_photos/bose.jpg",
                         retired: false
                         )


