using Serialization

word_count = deserialize("/Users/crismoen/.julia/dev/AISILanguageModel/test/reading/word_count")

sorted_word_count = sort(word_count; byvalue=true, rev=true)
