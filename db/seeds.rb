@user = User.new(email: "mjfchavez@gmail.com")
@user.password = "foobar123"
@user.save!

@user.notes.create!(description: "I love this note!")
@user.notes.create!(description: "NBA Live")
@user.notes.create!(description: "Indian Summer Travel Video")
@user.notes.create!(description: "Prep for tomorrow!")
@user.notes.create!(description: "Finish this Rails app!")
@user.notes.create!(description: "In addition to the standard responsive variations, text style utilties also come in hover: variations that apply the given text style on hover.")
@user.notes.create!(description: "If you don't plan to use the text style utilities in your project, you can disable them entirely by setting the textStyle property to false in the modules section of your config file:")

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