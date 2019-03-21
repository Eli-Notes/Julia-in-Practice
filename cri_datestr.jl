using Dates
"""
    datestr_julia(datenum::Int64, format::String == "yyyy-mm-dd")

This function change a date-num to a date-string, same as function 'datestr' in Matlab.
This function requires Julia pkg 'Dates' installed. In default, 'format' is "yyyy-mm-dd".

If input an array of datenum, please add '.' like this: `datestr_julia.(XXXX)`

# Arguments
- datenum: Int64 or its Array, the number of days of from (Jan,0,0000) in the proleptic ISO calendar, which is implemented by function 'datestr' in Matlab.
- format: the format of the string outputed; both uppercase and lowercase letters can be used; options inlude
    - "yyyy-mm-dd": "2018-01-21"
    - "y-m-d": "2018-1-21"
    - "yyyymmdd": "20180121"

# Examples
```julia-repl
julia> datestr_julia.([710000,720000],"y-m-d")
2-element Array{String,1}:
 "1943-11-30"
 "1971-4-17"

julia> datestr_julia.([710000,720000],"yyyymmdd")
2-element Array{String,1}:
 "19431130"
 "19710417"

julia> datestr_julia.([710000,720000],"yyyy-mm-dd")
2-element Array{String,1}:
 "1943-11-30"
 "1971-04-17"

julia> datestr_julia.([710000,720000])
2-element Array{String,1}:
 "1943-11-30"
 "1971-04-17"
```
"""
function datestr_julia(datenum::Union{Int64,Array{Int64}}, format::String = "yyyy-mm-dd")

# Precheck
format = lowercase(format)
preDefinedFormat = ["y-m-d", "yyyy-mm-dd", "yyyymmdd"]
!in(format, preDefinedFormat) && error("Wrong format of string")
!all(datenum .> 0)            && error("Wrong format of string")
# If not array, then convert to array
#isa(datenum, Int64) && (datenum = [datenum])

# Generate year, month, and day
adj_Matlab = Dates.value(Date.(1990,1,1) - Date.(Dates.UTD.(726834))) # 726834 is the number of days of from (Jan,0,0000) to (Jan,1,1990) in the proleptic ISO calendar, implemented by function 'datestr' in Matlab.
date_date  = Date.(Dates.UTD.(datenum .+ adj_Matlab))
date_year  = Dates.year. (date_date)
date_month = Dates.month.(date_date)
date_day   = Dates.day.  (date_date)

# convert to string
if format == "y-m-d"
    datestring = string.(date_year, '-', date_month, '-', date_day)
elseif format == "yyyymmdd"
    datestring = string.(date_year .* 10000 .+ date_month .* 100 .+ date_day)
elseif format == "yyyy-mm-dd"
    s_y = string.(date_year,  pad=4)
    s_m = string.(date_month, pad=2)
    s_d = string.(date_day,   pad=2)
    datestring = string.(s_y, "-", s_m, "-", s_d)
end

return datestring

end
