using PDFIO

src = "/Users/crismoen/Library/CloudStorage/GoogleDrive-cdm@runtosolve.com/Shared drives/RunToSolve/Professional/AISI/task_groups/flowcharts_2022/S100_LLM/aisi s100-16  s100-16-c_e_s.pdf"

out = "/Users/crismoen/Library/CloudStorage/GoogleDrive-cdm@runtosolve.com/Shared drives/RunToSolve/Professional/AISI/task_groups/flowcharts_2022/S100_LLM/AISI_S100.txt"

     
# Extract text from the page and write it to the output file.
function getPDFText(src, out)
    doc = pdDocOpen(src)
    docinfo = pdDocGetInfo(doc)
    open(out, "w") do io
		npage = pdDocGetPageCount(doc)
        for i=1:npage
            page = pdDocGetPage(doc, i)
            pdPageExtractText(io, page)
        end
    end
    pdDocClose(doc)
    return docinfo
end


getPDFText(src, out)



function read_text_file(filename)

    file = open(filename,"r")

    #Read all the lines.
    lines = readlines(file)
    
    close(file)

    return lines

end

#getting each line from the pdf
lines = read_text_file(out)



#look at each line, and get all the words in that line, add those lines to a vector so it accummulates for the whole doc 
all_words = Vector{String}(undef, 0)
for i in eachindex(lines)

    if lstrip(lines[i]) != ""   #empty line

        all_words = [all_words; split(lstrip(lines[i]), " ")]

    end

end
  
#filter empty lines
index = findall(string->string!="", all_words)
all_words = all_words[index]

serialize("task_groups/flowcharts_2022/S100_LLM/all_words", all_words)

all_words = deserialize("task_groups/flowcharts_2022/S100_LLM/all_words")


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


