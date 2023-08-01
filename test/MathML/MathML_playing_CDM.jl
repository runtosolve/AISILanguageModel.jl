using MathML, EzXML, Symbolics, AbstractTrees
xml = xml"""<math xmlns="http://www.w3.org/1998/Math/MathML">
   <apply>
      <times />
      <ci>compartment</ci>
      <ci>k1</ci>
      <ci>S1</ci>
   </apply>
</math>"""

num = parse_node(xml)
# 1-element Vector{Num}:
#  S1*compartment*k1

# to pretty print the tree use `print_tree`
print_tree(xml)
# math
# └─ apply
#    ├─ times
#    ├─ ci
#    ├─ ci
#    └─ ci

# you can also just go directly from EzXML.Document or String
str = "<apply><power/><ci>x</ci><cn>3</cn></apply>"
MathML.parse_str(str)
# x^3

# derivatives also work!
str = """
<apply><diff/>
  <bvar><ci>x</ci><degree><cn>2</cn></degree></bvar>
  <apply><power/><ci>x</ci><cn>4</cn></apply>
</apply>
"""
expand_derivatives(MathML.parse_str(str))
# 12(x^2)

# there is also a macro @MathML_str to directly call `parse_str`
ml = MathML"""
<apply><diff/>
  <bvar><ci>x</ci><degree><cn>2</cn></degree></bvar>
  <apply><power/><ci>x</ci><cn>4</cn></apply>
</apply>
"""
expand_derivatives(ml)
# 12(x^2)