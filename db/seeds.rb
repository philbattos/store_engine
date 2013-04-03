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
home.products << nest

kindle = Product.create(title: "Kindle Fire HD Tablet",
                        description: "The next generation Nest has a new, slimmer design, is enclosed by a solid stainless steel ring, and works with 95% of low voltage systems.",
                        price: 12999.0,
                        photo: "https://s3.amazonaws.com/store_engine_product_photos/kindle1.png",
                        retired: false
                       )
tablets.products << kindle

mac_pro = Product.create(title: "Apple MacBook Pro",
                         description: "MacBook Pro with Retina display, MagSafe 2 Power Adapter, AC wall plug, power cord, printed and electronic documentation.",
                         price: 110000.0,
                         photo: "https://s3.amazonaws.com/store_engine_product_photos/macbook1.png",
                         retired: false
                        )
laptops.products << mac_pro

apple_tv = Product.create(title: "Apple TV",
                          description: "1080p HD programming, including iTunes movies and TV shows, Netflix, Vimeo, photos and more in HD. Access your purchased movies, TV shows, and music with iTunes Match right from iCloud.",
                          price: 9999.0,
                          photo: "https://s3.amazonaws.com/store_engine_product_photos/Screen+Shot+2013-03-31+at+6.29.51+PM.png",
                          retired: false
                         )
tvs.products << apple_tv

xbox    = Product.create(title: "Xbox 360",
                         description: "Xbox 360 has blockbuster games, HD movies and controller.Built-in Wi-Fi for easy connection to Xbox LIVE. Super quiet with sleek new design plus matching controller. Ready for the controller-free fun of Kinect.",
                         price: 20000.0,
                         photo: "https://s3.amazonaws.com/store_engine_product_photos/xbox.png",
                         retired: false
                         )
game_consoles.products << xbox
home.products << xbox

bose    = Product.create(title: "Bose Sound System",
                         description: "Love watching TV? Well, it’s about to get dramatically better. The Bose Solo TV sound system reveals much more of the depth and detail you’re meant to hear in your favorite programs. The kind of sound most flat panel TVs simply cannot reproduce from their internal speakers. The Bose Solo sound system fills a room with rich, detailed sound. And with just one speaker and one connection, it couldn’t be easier.",
                         price: 39900.0,
                         photo: "https://s3.amazonaws.com/store_engine_product_photos/bose.jpg",
                         retired: false
                         )
home.products << bose

sonos   = Product.create(title: "Sonos Music Player",
                         description: "Wirelessly stream all the music on earth. Enjoy a universe of music in every room- your iTunes library, your favorite music services, and more than 100,000 free Internet radio stations, podcasts and shows.",
                         price: 39900.0,
                         photo: "https://s3.amazonaws.com/store_engine_product_photos/sonos.jpg",
                         retired: false
                         )
home.products << sonos

sony_play = Product.create(title: "Sony Play",
                           description: "Wirelessly play your favorite online music services, 100,000+ free Internet radio stations, podcasts and shows, plus your entire iTunes library. Play iTunes music stored on your iPhone, iPad and iPod touch wirelessly in any room of your home. Easily create a playlist of music from multiple iOS devices at once.",
                           price: 29900.0,
                           photo: "https://s3.amazonaws.com/store_engine_product_photos/sonyplay.jpg",
                           retired: false
                           )
home.products << sony_play

wii     = Product.create(title: "Nintendo Wii",
                         description: "Netflix instant streaming functionality allows for thousands of movies, TV shows, cartoons and more right on your TV. Bundle contents including Wii Sports Resort and the Wii MotionPlus accessory. Intuitive controller system highlighted by the included motion controlled Wii Remote and Nunchuk (white). A wealth of games at your fingertips including those on disc as well as backwards compatibility to all Nintendo GameCube games and most peripherals. Built-in Wi-Fi access for easy connection to Nintendo Wi-Fi Connection gaming services Wii.",
                         price: 18999.0,
                         photo: "https://s3.amazonaws.com/store_engine_product_photos/wii.jpg",
                         retired: false
                         )
game_consoles.products << wii
home.products << wii

ps3     = Product.create(title: "Play Station 3",
                         description: "250GB PS3 System, PlayStation All-Stars Battle Royale, the Ratchet and Clank Collection and Media/Blue-Ray Disc Remote Control. The Ratchet and Clank Collection Includes: Ratchet and Clank, Ratchet and Clank: Going Commando, Ratchet and Clank: Up Your Arsenal. The Ratchet and Clank Collection includes two vouchers: good for 10th Anniversary Ratchet and Clank Avatar and good for early access to the Sly Cooper: Thieves in Time Demo. Register your PlayStation 3 with AIV to start watching over 120,000 movies and TV episodes, available to rent or purchase.",
                         price: 24999.0,
                         photo: "https://s3.amazonaws.com/store_engine_product_photos/ps3.jpg",
                         retired: false
                         )
game_consoles.products << ps3
home.products << ps3

ipad    = Product.create(title: "Apple iPad 2",
                         description: "Apple iPad XX1LL/A Tablet (16GB, Wifi, Black) NEWEST MODEL. Connection: Ports: 1x Docking, Audio: 1x 1/8-Inch (3.5 mm) Headphone, 1x Integrated Speaker and 1x Integrated Microphone. What is in the box: Apple 16GB iPad 2 with Wi-Fi (Black), Dock Connector to USB Cable, 10W Power Adapter, Documentation and 1-Year Limited Warranty.",
                         price: 40999.0,
                         photo: "https://s3.amazonaws.com/store_engine_product_photos/ipad.jpg",
                         retired: false
                         )
tablets.products << ipad

samsung = Product.create(title: "Samsung Galaxy",
                         description: "Keep yourself entertained at home and on the road and enjoy big performance with the Samsung Galaxy Tab 2 (10.1). Weighing 21 ounces and sporting a vibrant 10.1-inch touchscreen display, the Galaxy Tab 2 runs the Android 4.0 ('Ice Cream Sandwich') operating system and is powered by a 1.0 GHz dual-core processor to help you achieve maximum usage across various demanding applications.",
                         price: 29900.0,
                         photo: "https://s3.amazonaws.com/store_engine_product_photos/samsung.jpg",
                         retired: false
                         )
tablets.products << samsung

asus  = Product.create(title: "ASUS ViVoBook",
                       description: "Touch. The World at Your Fingertips The ASUS VivoBook S500 gets even more hands on, thanks to a responsive 15.6' HD touchscreen that lets you tap, swipe and pinch to zoom just like a tablet. Designed with users in mind, the VivoBook offers an incredible mobile computing experience with a stylish and easy-to-carry slim design. ASUS VivoBook S500 and You. Incredible Together.",
                       price: 69700.0,
                       photo: "https://s3.amazonaws.com/store_engine_product_photos/asus.jpg",
                       retired: false
                       )
laptops.products << asus
tablets.products << asus

toshiba = Product.create(title: "Toshiba Satellite",
                         description: "The Toshiba Satellite C855 offers power, performance, and portability at the perfect price. Equipped with a sizeable 15.6-inch TruBrite widescreen display, you get tried, true and tested Toshiba innovation now made even faster and more fun with the speed and fluidity of the Windows 8 interactive tiles interface. The Satellite C855 (model C855-S5343) proves you don't have to spend a fortune to enjoy a wealth of essential features for web browsing, socializing, emailing, entertainment, and multitasking.",
                         price: 42999.0,
                         photo: "https://s3.amazonaws.com/store_engine_product_photos/toshiba.jpg",
                         retired: false
                         )
laptops.products << toshiba

samsungtv = Product.create(title: "Samsung HDTV",
                           description: "With LED technology, the energy-efficient, Samsung Series 4 TV produces a brilliant, clear picture. The Dolby Digital Plus/Dolby Pulse is an advanced surround sound feature that optimizes the TV’s audio from connected devices. The Wide Color Enhancer Plus features lets you see picture with vibrant, natural-looking images.",
                           price: 59999.0,
                           photo: "https://s3.amazonaws.com/store_engine_product_photos/samsung.jpg",
                           retired: false
                          )
tvs.products << samsungtv

smart    = Product.create(title: "Samsung Smart",
                         description: "With this Smart HDTV, Smart Content provides new ways to explore and locate your favorite shows, movies, games, and more. A full web browser with WiFi built-in and innovative apps made for TV, along with Signature Services, enhances your enjoyment. AllShare Play allows you to stream content from other devices and enjoy it on the big screen. The Wide Color Enhancer Plus provides vibrant natural-looking images and it’s all in a sleek ultra slim design.",
                         price: 89999.0,
                         photo: "https://s3.amazonaws.com/store_engine_product_photos/smart.jpg",
                         retired: false
                        )
tvs.products << smart

camera   = Product.create(title: "Outdoor Camera",
                          description: "Now you can deter robbery, theft, and vandalism without the high cost of a real security camera. When placed in your home or business, even the most sophisticated criminals will think the premise is guarded by a high-tech surveillance system and go in search of an easier target. In fact, this is an actual surveillance camera that has been modified into a 'dummy' or fake security camera. This unit does contain a flashing light. The camera features authentic video cable and a fully adjustable mounting bracket that will let you install the camera quickly and easily using the included stainless steel screws. Dimensions of the camera are 5 one half inches x 3 inches x 2 and one half inches (without rain shield). With the rain shield the dimensions increase to 7 x 3 x 3 inches. The camera requires 2 AA batteries that are not included.",
                          price: 5999.0,
                          photo: "https://s3.amazonaws.com/store_engine_product_photos/camera.jpg",
                          retired: false
                          )
home.products << camera

apc     = Product.create(title: "APC Backup",
                         description: "The Back-UPS Pro provides abundant battery backup power, so you can work through medium length power outages. It safeguards your equipment against damaging surges and spikes that travel along utility and data lines. The Back-UPS Pro also features automatic voltage regulation (AVR), which instantly adjusts high and low voltages to safe levels, so you can work indefinitely during brownouts and overvoltages.",
                         price: 18960.0,
                         photo: "https://s3.amazonaws.com/store_engine_product_photos/apc.jpg",
                         retired: false
                        )
home.products << apc

facein  = Product.create(title: "Lathem FaceIN",
                         description: "The FR650 is a complete solution with the standard benefits of FR700 but without a proximity badge reader or access control capability. Like the FaceIN FR700, the FR650 uses face recognition technology as a foolproof and touch-free time and attendance system.",
                         price: 45989.0,
                         photo: "https://s3.amazonaws.com/store_engine_product_photos/facein.jpg",
                         retired: false
                        )
home.products << facein

camcorder = Product.create(title: "Sony HDR-CX260V",
                           description: "Create stunningly beautiful 1920x1080p Full HD video with the Sony Handycam HDR-CX260V camcorder. Take the shake out of your movies with Optical SteadyShot image stabilization with Active Mode. Back-illuminated Exmor CMOS sensor provides excellent low light capabilities while the wide angle G lens lets you get more in your shot.",
                           price: 34995.0,
                           photo: "https://s3.amazonaws.com/store_engine_product_photos/camcorder.jpg",
                           retired: false
                          )
home.products << camcorder


### Users ###

frank = User.create(email: "demoXXfranklin@jumpstartlab.com",
                   first_name: "franklin", last_name: "webber", password: "password")

jeff = User.create(user_name: "j3", email: "demoXXjeff@jumpstartlab.com",
                   first_name: "Jeff", password: "password")

steve = User.create(user_name: "SkrilleX", email: "demoXXsteve@jumpstartlab.com",
                   first_name: "Steve", last_name: "Klabnik", password: "password", admin: true)


### Orders ###

order1  = Order.create(status: "pending")
order2  = Order.create(status: "pending")
order3  = Order.create(status: "paid")
order4  = Order.create(status: "paid")
order5  = Order.create(status: "shipped")
order6  = Order.create(status: "shipped")
order7  = Order.create(status: "canceled")
order8  = Order.create(status: "canceled")
order9  = Order.create(status: "returned")
order10 = Order.create(status: "returned")

### Line Items ###
order1.line_items.create(product_id: camcorder.id, unit_price: camcorder.price,
                         quantity: 2)
order2.line_items.create(product_id: facein.id, unit_price: facein.price,
                         quantity: 2)
order2.line_items.create(product_id: camcorder.id, unit_price: camcorder.price,
                         quantity: 2)
order3.line_items.create(product_id: ps3.id, unit_price: ps3.price,
                         quantity: 2)
order4.line_items.create(product_id: apc.id, unit_price: apc.price,
                         quantity: 2)
order5.line_items.create(product_id: camcorder.id, unit_price: camcorder.price,
                         quantity: 2)
order6.line_items.create(product_id: smart.id, unit_price: smart.price,
                         quantity: 2)
order7.line_items.create(product_id: toshiba.id, unit_price: toshiba.price,
                         quantity: 2)
order8.line_items.create(product_id: ipad.id, unit_price: ipad.price,
                         quantity: 2)
order9.line_items.create(product_id: wii.id, unit_price: wii.price,
                         quantity: 2)
order10.line_items.create(product_id: camcorder.id, unit_price: camcorder.price,
                         quantity: 2)
order10.line_items.create(product_id: wii.id, unit_price: wii.price,
                         quantity: 2)

