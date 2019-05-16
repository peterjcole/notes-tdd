require 'notebook'

describe 'notebook' do
  let(:notebook) { Notebook.new }
  let(:note) { Note.new("Shopping list", "Bread, milk, avocados") }
  let(:second_note) { Note.new("Who am I?", "What is my purpose?") }
  let(:notebook_with_notes) do 
    notebook = Notebook.new 
    notebook.add(note)
    notebook.add(second_note)
    return notebook
  end
  let(:notebook_with_same_note_twice) do 
    notebook = Notebook.new 
    notebook.add(note)
    notebook.add(note)
    return notebook
  end
  context 'creating a notebook' do
    it 'can be created' do
      expect(notebook).to be_a(Notebook)
    end
  end

  context 'when adding notes to notebook' do
    it 'describes one note after adding a single note' do
      expect(notebook.add(note)).to eq('New note added to notebook. The notebook now contains 1 note')
    end
    it 'describes two notes after adding two notes' do
      notebook.add(note)
      expect(notebook.add(note)).to eq('New note added to notebook. The notebook now contains 2 notes')
    end 
  end

  context 'when listing notes' do
    it 'lists two stored notes as a string' do
      expect(notebook_with_notes.list).to eq("Here are your note titles:\nShopping list\nWho am I?")
    end
    it 'has a friendly message when there are no notes stored' do
      expect(notebook.list).to eq("Sorry, no notes here!")
    end
  end

  context 'when showing notes based on title' do
    it 'shows a requested note' do
      expect(notebook_with_notes.show("Shopping list")).to eq("Shopping list:\nBread, milk, avocados")
    end
    it 'shows a different requested note' do
      expect(notebook_with_notes.show("Who am I?")).to eq("Who am I?:\nWhat is my purpose?")
    end
    it 'shows both notes when there are two notes with the same title' do
      expect(notebook_with_same_note_twice.show("Shopping list"))
        .to eq("Shopping list:\nBread, milk, avocados\n\nShopping list:\nBread, milk, avocados")
    end
    it 'has a friendly message when there are no notes found' do
      expect(notebook_with_notes.show("This note title does not exist")).to eq("Sorry, no notes here!")
    end
  end

  context 'when removing notes based on title' do
    it 'returns a friendly message' do
      expect(notebook_with_notes.remove("Shopping list")).to eq("Shopping list deleted!")
    end

    it 'returns a friendly message when more than one note is deleted' do
      expect(notebook_with_same_note_twice.remove("Shopping list")).to eq("2 notes named 'Shopping list' deleted!")
    end

    it "doesn't show the deleted note" do
      notebook_with_notes.remove("Shopping list")
      expect(notebook_with_notes.list).to eq("Here are your note titles:\nWho am I?")
    end

    it 'returns a friendly message when no notes match title' do
      expect(notebook_with_notes.remove("This note title does not exist")).to eq("Sorry, no notes here!")
    end

    it 'returns a friendly message when there are no notes' do
      expect(notebook.remove("This note title does not exist")).to eq("Sorry, no notes here!")

    end
  end
end