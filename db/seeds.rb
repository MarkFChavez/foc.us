@user = User.new(email: "mjfchavez@gmail.com")
@user.password = "foobar123"
@user.save!

@user.notes.create!(description: "I love this note!")
@user.notes.create!(description: "NBA Live")

todo1 = @user.todos.create!(
  description: "Research about blockchain"
)
todo2 = @user.todos.create!(
  description: "Research about remittances in the Philippines"
)

todo1.action_items.create!(
  description: "What is Bitcoin?",
  done: false
)

todo1.action_items.create!(
  description: "What is Ethereum?",
  done: false
)

todo2.action_items.create!(
  description: "How it works?",
  done: false
)