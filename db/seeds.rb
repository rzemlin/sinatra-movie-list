#dummy data to ensure proper function of database


#two users:
ryan = User.create(name: "Ryan", email: "ryan@ryan.com", password: "password")
greg = User.create(name: "Greg", email: "greg@greg.com", password: "password")

#a few movie entires

MovieEntry.create(content: "Forrest Gump", user_id: ryan.id)
MovieEntry.create(content: "Talladega Nights", user_id: greg.id)