using WordCloud, Serialization


# word_count = deserialize("/Users/crismoen/.julia/dev/AISILanguageModel/test/reading/word_count")

# words = collect(keys(word_count))

# weights = collect(values(word_count))


#make WordCloud for just equation numbers 

all_words = deserialize("/Users/crismoen/.julia/dev/AISILanguageModel/test/reading/all_words")

#this is where Eq. occurs
equation_indices = findall(bool->bool==1, [occursin("Eq.", all_words[i]) for i in eachindex(all_words)])

#this is the actual equation number 
equation_numbers = all_words[equation_indices .+ 1]

#filter out ) and :
equation_numbers = [replace(equation_numbers[i], ")" => "") for i in eachindex(equation_numbers)]
equation_numbers = [replace(equation_numbers[i], ":" => "") for i in eachindex(equation_numbers)]


#unique equation numbers
unique_equation_numbers = unique(equation_numbers)

#now count instances 
word_count = [count(eq_num->eq_num==unique_equation_numbers[i], equation_numbers) for i in eachindex(unique_equation_numbers)]

wc = wordcloud(unique_equation_numbers, word_count)

using Random
words = [randstring(rand(1:8)) for i in 1:300]
weights = randexp(length(words))

generate!(wc)
paint(wc, "random.png")