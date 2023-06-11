shashwat = Array{Float64}(undef, (0,0))

a = ["cat", "duck"]
b = ["dog", "pig"]
c = [1, 3]

d = [a b c]

e = Array{Any}(undef, (0,3))

#when a = "cat"

e = Array{Any}(undef, 0)
f = Array{Any}(undef, 0)
g = Array{Any}(undef, 0)

e = push!(e, d[1,1])
f = push!(f, e[1,1])
g = push!(g, f[1,1])


