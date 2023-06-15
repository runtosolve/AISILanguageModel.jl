#F8june23 update 14june23

using Pkg
Pkg.add("StatsBase")
using StatsBase
as1=["apple","ball", "cat", "dog","ball", "cat", "dog","ball","ball", "cat","elephant", "ball", "cat", "dog","ball","cat","elephant","cat","elephant","cat","elephant","cat","Balloon","cat","Balloon","cat","Balloon","cat","Balloon","ball","basket","ball","basket","ball","basket","ball","basket","ball","basket"]
n=length(as1)

a1=Array{String,1}(); # Initializing Empty Array
s2=Set([]);
x1=Array{String,1}();
y1=Array{String,1}();
z1=Array{Int64,1}();
mat2=Array{Any}(undef, 0);# Initializing Empty Array
mat3=Array{Any}(undef, 0);
mat4=Array{String,1}();# Initializing Empty Array
# This is jsut creating a pair of a word and consecutive word
for i in 1:n-1
    t=as1[i]*" "*as1[i+1]
    push!(a1,t)
end

a1
hcat(a1,a1)
Dict1=countmap(a1)

#creating set of similar word pairs
for i in 1:length(a1)   
    for j in i+1:length(a1)
        if a1[i]==a1[j]
            push!(s2,a1[i])
        end
    end
end

s2
a2=collect(s2) # Converting set to ordered array


for i in 1:length(a2)
    x,y=split(a2[i], " ")
    println(y," succeds ", x, " ", Dict1[a2[i]]," times ")
    push!(x1,x)
    push!(y1,y)
    push!(z1, Dict1[a2[i]])
end


mat=hcat(x1,y1,z1)

# Searches the input word in the column > copies that row in a new matrix> and output the next word according to the highest occurance of frequency
function likelynextto(word="Patron")
    for i in eachindex(x1)
        if x1[i]==word
            
            push!(mat2, x1[i])
            push!(mat2, y1[i])
            push!(mat2, z1[i])
            push!(mat3, z1[i])

        end
    end
    q=reshape(mat2,3,:)

    m=maximum(mat3)
    for i in 1:size(q,2)
        if q[3,i]==m 
         push!(mat4,q[2,i]) 
        end
     end
    return mat4
end


#give the word(s) most likely next to
likelynextto("cat")