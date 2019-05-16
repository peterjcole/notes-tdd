class Notebook
  attr_reader :notes
  def initialize
    @notes = []
  end

  def add(note)
    @notes.push(note)
    return "New note added to notebook. The notebook now contains #{format_num_notes}"
  end

  def list
    if notes.any?
      return @notes.reduce("Here are your note titles:") { |memo, note| memo + "\n#{note.title}"}
    else
      return no_notes
    end
  end

  def show(title)
    filtered_notes = @notes.filter { |note| note.title == title }
    list = ""
    if filtered_notes.any?
      filtered_notes.each.with_index do |note, index| 
        list += format_note(note) 
        list += (index < filtered_notes.length - 1) ? "\n\n" : ''
      end
      return list
    else
      return no_notes
    end
  end

  def remove(title)
    num_deleted = 0
    @notes.delete_if do |note|
      if note.title == title
        num_deleted += 1
        true
      end
    end
    case num_deleted
    when 0
      return no_notes
    when 1
      return "#{title} deleted!"
    else
      return "#{num_deleted} notes named '#{title}' deleted!" 
    end
    if num_deleted == 1
      return "#{title} deleted!"
    else
      return "#{num_deleted} notes named '#{title}' deleted!"
    end
  end

  private
  
  def no_notes
    'Sorry, no notes here!'
  end

  def format_note(note)
    "#{note.title}:\n#{note.body}"
  end

  def format_num_notes
    "#{@notes.length} #{@notes.length == 1 ? "note" : "notes"}"
  end
  
end