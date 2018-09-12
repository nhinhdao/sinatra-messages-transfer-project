
a = User.create(username: "Hannah Lala", email: "hannah.lala@gmail.com", password: 'nhinh12345')
b = User.create(username: "Allan Candy", email: "allan.candy@gmail.com", password: 'nhinh12345')
c = User.create(username: "Susan Kan", email: "susan.kan@gmail.com", password: 'nhinh12345')
d = User.create(username: "Samuel Hope", email: "samwell@gmail.com", password: 'nhinh12345')
e = User.create(username: "Bruce Lynk", email: "bruklyn.nyc@gmail.com", password: 'nhinh12345')
f = User.create(username: "Virginia Daniels", email: "virginia.dan@gmail.com", password: 'nhinh12345')
g = User.create(username: "Joe Kath", email: "joe.new@gmail.com", password: 'nhinh12345')

a1 = "Make sure to bring some food for lunch"
a2 = "Let's go to Maine for some lobsters on Labor Day, Sam"
a3 = "Well, I hope Bruce will find himself a girl soon. He looks kinda bad lately. He needs to be hooked up"
a4 = "Damn it. It is raining from nowhere. I can't believe it."

Message.create(content: a1, user_id: a.id, friend_id: b.id)
Message.create(content: a2, user_id: c.id, friend_id: d.id)
Message.create(content: a3, user_id: e.id, friend_id: f.id)
Message.create(content: a4, user_id: b.id, friend_id: g.id)
