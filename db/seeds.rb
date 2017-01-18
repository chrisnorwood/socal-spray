User.create!([
  {name: "Chris Norwood", email: "cnorwood92@gmail.com", password: "foobar", password_confirmation: "foobar" },
  {name: "kimber", email: "kimbo@mailinator.com", password: "foobar", password_confirmation: "foobar"},
  {name: "Chris Goblin", email: "cwncool@gmail.com", password: "foobar", password_confirmation: "foobar"},
  {name: "Meenie Miney", email: "henny@henny.net", password: "foobar", password_confirmation: "foobar"},
  {name: "Zuci", email: "x@bimble.net", password: "foobar", password_confirmation: "foobar"},
])

Area.create!([
  {name: "World", description: "Top level tree category", location: "Universe", parent_id: nil, user_id: nil},
  {name: "California", description: "The best state around baby", location: "USA", parent_id: 1, user_id: 1},
  {name: "Colorado", description: "Don't mess with the south side", location: "USA", parent_id: 1, user_id: 1},
  {name: "San Diego County", description: "SD county desc", location: "San Diego, CA", parent_id: 2, user_id: 1},
  {name: "Valley Center", description: "Classic collection", location: "Valley Center, CA", parent_id: 3, user_id: 1},
  {name: "Idyllwild", description: "place of da rocks baby", location: "Riverside County, CA", parent_id: 2, user_id: 1}
])

Climb.create!([
  { name: "Wacky Trabbacky", grade: "5.7", fa: "Howard Ballou", description: "To be heard from Howard, the man himself", location: nil, user_id: 3, area_id: 5 },
  { name: "Unnamed 10a Face Climb", grade: "5.10a", fa: "Unknown", description: "125 feet of beautiful, featured granite!", location: nil, user_id: 1, area_id: 5 },
])

Comment.create!([
  { body: "This really is a classic route, brotha!!", user_id: 4, commentable_type: "Climb", commentable_id: 1 },
  { body: "Yes, I agree!!", user_id: 2, commentable_type: "Climb", commentable_id: 1 },
  { body: "Great contribution to the area.", user_id: 2, commentable_type: "Climb", commentable_id: 2 },
])

Rating.create!([
  { stars: 5, user_id: 1, rateable_type: "Climb", rateable_id: 1 },
  { stars: 4, user_id: 2, rateable_type: "Climb", rateable_id: 1 },
  { stars: 5, user_id: 3, rateable_type: "Climb", rateable_id: 1 },
  { stars: 5, user_id: 3, rateable_type: "Climb", rateable_id: 2 },
])