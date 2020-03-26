# Add your code here

def help
  help_messages.each {|message| puts message}
end

def help_messages
  [
    "I accept the following commands:",
    "- help : displays this help message",
    "- list : displays a list of songs you can play",
    "- play : lets you choose a song to play",
    "- exit : exits this program"
    ]
end

def list(songs)
  songs.each_with_index do |song, index|
    puts "#{index + 1}. #{song}"
  end
end

def play(songs)
  puts "Please enter a song name or number:"
  input = gets.strip
  
  song = find_song(songs, input)
  
  puts playing_song(song)
end

def playing_song(song)
  if !song
    return "Invalid input, please try again"
  end
  "Playing #{song}"
end

def find_song(songs, input)
  if is_integer?(input)
    songs[Integer(input) - 1]
  else
    songs.find {|song| song == input}
  end
end

def is_integer?(input)
  Integer(input) rescue false
end

def exit_jukebox
  puts "Goodbye"
end

def run(songs)
  puts "Please enter a command:"
  command = gets.strip
  case command
  when "exit"
    exit_jukebox
  when "help"
    help
  when "list"
    list(songs)
  when "play"
    play(songs)
  end
end