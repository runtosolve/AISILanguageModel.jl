# 1- read in text file:
# file = open("sample2")
# style = open("sample2") do f
#    read(f, String)
# end
# 2- replace non alphabet characters from text with a space:
nonalpha = "(Ws?)" # define a regular expression


#use this 
replace(nonalpha, ")" => "")


#maybe move on from this 
str = replace(nonalpha, nonalpha=> " ")
digits = r"(\d+)"
str = replace(str, digits=> " ")
# 3- split text in words:
word_list = split(data[1], " ")
println(word_list)
# 4- make a dictionary with the words and count their frequencies:
word_freq = Dict{String, Int64}()
for word in word_list
word = strip(word)
if isempty(word) continue end
haskey(word_freq, word) ?
word_freq[word] += 1 :
word_freq[word] = 1
end
# 5- sort the words (the keys) and print out the frequencies:
println("Word : frequency \n")
words = sort!(collect(keys(word_freq)))
for word in words
println("$word : $(word_freq[word])")
end