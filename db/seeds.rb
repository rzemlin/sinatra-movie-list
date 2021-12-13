#dummy data to ensure proper function of database


#two users:
ryan = User.create(name: "Ryan", email: "ryan@ryan.com", password: "password")
greg = User.create(name: "Greg", email: "greg@greg.com", password: "password")

#a few movie entires

MovieEntry.create(title: "Forrest Gump", content: "Life is like a box of chocolates...", user_id: ryan.id)
MovieEntry.create(title: "Talladega Nights", content: "Ricky Bobby", user_id: greg.id)