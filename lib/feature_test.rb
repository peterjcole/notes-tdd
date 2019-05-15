require_relative 'note'
require_relative 'notebook'

note = Note.new

note.set("Shopping list", "Bread, milk, avocados")
# => New note created. Title: Shopping list. Body: Bread, milk, avocados
note.title
# => "Shopping list"
note.body
# => "Bread, milk, avocados"
note_two = Note.new("Who am I?", "What is my purpose?")
# => New note created. Title: Shopping list. Body: Bread, milk, avocados
notebook = Notebook.new
# => notebook created and returned
notebook.add(note)
# => "New note added to notebook. The notebook now contains 1 note"
notebook.add(note_two)
# => "New note added to notebook. The notebook now contains 2 notes"
notebook.list
# => "Here are your note titles:\nShopping list\nWho am I?"
notebook.show("Shopping list")
# => "Shopping list\nBread, milk, avocados"
