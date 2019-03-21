# julia1.0 solutions for 'ismember' in Matlab

* [Flag, ~] = ismember(b,c)

```julia-repl
julia> a = ['a', 'b', 'c', 'b', 'd', 'a'];
julia> b = ['a', 'b', 'c'];
julia> Flag = in.(a,[b])
6-element BitArray{1}:
  true
  true
  true
  true
 false
  true
```

* [~, Location] = ismember(b,c)

```julia-repl
julia> a = ['a', 'b', 'c', 'b', 'd', 'a'];
julia> b = ['a', 'b', 'c'];
julia> Location =indexin(a, b)
6-element Array{Union{Nothing, Int64},1}:
 1
 2
 3
 2
  nothing
 1
```

* [Flag, Location] = ismember(b,c)
```julia-repl
julia> a = ['a', 'b', 'c', 'b', 'd', 'a'];
julia> b = ['a', 'b', 'c'];
julia> Location =indexin(a, b)
6-element Array{Union{Nothing, Int64},1}:
 1
 2
 3
 2
  nothing
 1
julia> Flag = Location .!= nothing
6-element BitArray{1}:
  true
  true
  true
  true
 false
  true
```
