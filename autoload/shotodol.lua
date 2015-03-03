
function onLoad() 
	OutputStream.write("Rehashing lua modules\n")
	return "goodluck/before"
end

function exten_goodluck_before(x) 
	local msg =  "Good luck from lua.\n"
	OutputStream.write(msg)
	return(msg)
end
