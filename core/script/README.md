Script module
==============

This module loads lua scripts and registers hook extensions. It is easy to write script module. It has a goal that the 'best API is no API'. Scripts can be used here as metaprogramming tool too.

### Writing a hook extension

To write a hook it only needs a lua function prefixed with "exten\_". For example, the following code wishes good luck when swarm is invoked on "goodluck/before" .

```lua
function onLoad() 
	OutputStream.write("Rehashing lua modules\n")
	return "goodluck/before"
end

function exten_goodluck_before(x) 
	local msg =  "Good luck from lua.\n"
	OutputStream.write(msg)
	return(msg)
end
```
And the hook can be executed using plugin command like the following,

```
plugin -x goodluck/before -act
Executing:plugin -x goodluck/before -act
<          plugin> -----------------------------------------------------------------
Good luck from lua.
There are 0 extensions in goodluck/before directory
<      Successful> -----------------------------------------------------------------
```

Again the shotodol module has good\_luck module. This module can be loaded and the `goodluck` command there executes the `goodluck/before` while showing greetings. The lua extension can be accessed in that way too.




