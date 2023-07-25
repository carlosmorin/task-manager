#user = User.create! name: "usuario", email: "usuario@gmail.com", password: "123456"
# puts "Usuario: #{user.email} Contraseña: 123456"

feature = Category.create!(name: "Feature", description: "Category to identify feature tasks")
upgrade = Category.create!(name: "Upgrade", description: "Category to identify upgrade tasks")
hotfix = Category.create!(name: "Hot fix", description: "Category to identify hotfixes")

description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"
# Feature category
Task.create!(name: "Add new field in the contact model", description: description, due_date: Time.now + 2.days, category: feature)
Task.create!(name: "Return new field in the end point", description: description, due_date: Time.now + 3.days, category: feature)

# Upgrade catgory
Task.create!(name: "Change the label from contact module", description: description, due_date: Time.now + 2.days, category: upgrade)

# Hotfix category
Task.create!(name: "Fix end point that returns code 404", description: description, due_date: Time.now + 2.days, category: hotfix)
Task.create!(name: "Fix login end point", description: description, due_date: Time.now + 2.days, category: hotfix)