require "pry"

#testing alphabet for wraparound check.
test_Upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
test_lower = "abcdefghijklmnopqrstuvwxyz"

#defining new class methods so I can check case easier.
#code was obtained at https://stackoverflow.com/questions/12713251/ruby-how-to-tell-if-character-is-upper-lowercase
class String
    def is_upper?
      self == self.upcase
    end
  
    def is_lower?
      self == self.downcase
    end
end

#Currently has functionality to be used as a regular function with a quick require if need be. 
#Works with terminal input instead out of preference. 
def cypher(phrase = nil, offset = nil)
    if phrase == nil
        puts "What phrase would you like to code?"
        phrase = gets.chomp
    end
    if offset == nil 
        puts "How much would you like to offset it?"
        offset = gets.chomp.to_i
    end
    #Sets up a container for the new phrase and splits the previous one
    new_phrase = []
    phrase = phrase.split("")
    phrase.each do |letter|
        #checks if the current character is a letter. if not, it adds it to new_phrase without acting on it.
        if letter =~ /[A-Za-z]/
            #gets the ascii value of the letter then sets a new ascii value in offset_ascii for the cyphered letter.
            ascii = letter.ord
            offset_ascii = ascii + offset
            #This if statement takes the offset and checks to see if its outside the bounds of the upper or lowercase alphabet
            #it then corrects for the wraparound if necessary
            if letter.is_upper?
                if offset_ascii < 65
                    offset_ascii += 26
                elsif offset_ascii > 90
                    offset_ascii -= 26
                end
            elsif letter.is_lower?
                if offset_ascii < 97
                    offset_ascii += 26
                elsif offset_ascii > 122
                    offset_ascii -= 26
                end
            end
            #takes the ascii value and turns that into a letter, then pushes it to the new_phrase array
            new_letter = offset_ascii.chr
            new_phrase.push(new_letter)       
        else
            new_phrase.push(letter)
        end
    end
    #joins new_phrase into a string and both prints it to the terminal and returns it so it can retain functionality if used in another program
    puts new_phrase.join("")
    return new_phrase.join("")
end


cypher()
