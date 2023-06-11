using Serialization

all_words = deserialize("/Users/crismoen/.julia/dev/AISILanguageModel/test/reading/all_words")

#find all equations 
equation_indices = findall(bool->bool==1, [occursin("Eq.", all_words[i]) for i in eachindex(all_words)])

unique_words = unique(all_words)


for i in eachindex(all_words)

    all_words[i] = replace(all_words[i], ")" => "")
    all_words[i] = replace(all_words[i], "(" => "")
    all_words[i] = replace(all_words[i], "," => "")

end

#clean the rest of the punctuation 

#find unique words
unique_words = unique(all_words)

num_words = Vector{Int}(undef, length(unique_words))

for i in eachindex(unique_words)

    num_words[i] = length(findall(string->string==unique_words[i], all_words))

end

word_count = Dict(unique_words .=> num_words)

using Serialization
serialize("word_count", word_count)

word_count = deserialize("task_groups/flowcharts_2022/S100_LLM/word_count")


#try WordCloud.jl
#sort the Dict by values, highest occurance to lowest
#https://discourse.julialang.org/t/how-do-i-sort-a-dictionary-by-its-keys/37848
# correlation of words to other words... 



words = keys(word_count)
values(word_count)



#Greek symbols and equations?  how to handle reading those from a pdf?
#Unicode characters?

#go through each line
#split the line
#have all the words (word data) 
#use WordCloud.jl to show word frequency 
#provide statistics on word frequency 

#Eq. shows up alot 

#we collect every single word 
#figure out how to make a model from those words (LLM)
#mingpt
#OpenAI has an API?
#for designing a column, how do we define a model from our word data that is interactive 


