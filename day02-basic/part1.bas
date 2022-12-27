
sub parse_row(row as String, res(any) as Integer)
	dim idx1 as Integer
	dim idx2 as Integer

	idx1 = InStr(row, "x")
	idx2 = InStrRev(row, "x")
	
	res(1) = valint(left(row, idx1 - 1))
	res(2) = valint(mid(row, idx1 + 1, idx2 - idx1 - 1))
	res(3) = valint(mid(row, idx2 + 1))	
end sub

sub sort(elems(any) as Integer)
	dim tmp as Integer
	for i as integer = lbound(elems) to ubound(elems)
		for j as integer = lbound(elems) to ubound(elems)
			if elems(i) < elems(j) then
				tmp = elems(i)
				elems(i) = elems(j)
				elems(j) = tmp
			end if
		next j
	next i
end sub

dim row as String
dim idx as Integer
dim surface as Integer
dim as Integer total_area = 0
dim as Integer dims(1 to 3)

start:
	input "", row

	if row = "" then
		goto halt
	end if

	parse_row(row, dims())
	sort(dims())

	surface = 2 * (dims(1) * dims(2) + dims(2) * dims(3) + dims(3) * dims(1))
	total_area = total_area + surface + dims(1) * dims(2)

	goto start
halt:
	print(total_area)
