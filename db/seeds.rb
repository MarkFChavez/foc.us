work = Category.create(title: "work")
personal = Category.create(title: "personal")
tech = Category.create(title: "tech")
learning = Category.create(title: "learning")
other = Category.create(title: "other")

if Rails.env.development?
  mark = User.new(email: "mjfchavez@gmail.com")
  mark.password = "foobar123"
  mark.save!

  note = mark.notes.create(
    description: %Q(
      The Ideal Team Player: How to Recognize and
      Cultivate the Three Essential Virtues: A Leadership
      Fable
    )
  )
  note.item_categories.create(category: personal)

  note = mark.notes.create(
    description: %Q(
      Blockchain is a network of computers having an identical
      copy of the database and changing its state/records by a
      common agreement based on pure mathematics.
    )
  )
  note.item_categories.create(category: work)
  note.item_categories.create(category: personal)
end