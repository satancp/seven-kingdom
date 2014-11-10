x = 1
y = []
#for x in 1..5 do
ax = Info.where(:infotype_id => x).count
y<<ax
#x = x + 1
#end
y.sort
