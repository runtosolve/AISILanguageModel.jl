
nonalpha = "(Ws\?)" # define a regular expression


#use this 
replace(nonalpha, ")" => "")

import Unicode: ispunct
filter(!ispunct, nonalpha)