Roadmap
========

#### Framework
- [x] Keep shotodol bare minimum. Move extra modules in other projects.
	- [x] Move lua scripting into separate shotodol_script package.
- [ ] Make it possible to get/set Replicable from the script. One possible way to do that is to write functions like x.set(fieldName,value), or x.get(fieldName,value) .

#### Language support
- [ ] Integrate python.
	- [ ] Study 'Battle of wesnoth' and see how it integrates python.
- [x] Add support for module writing in lua. 
	- [ ] Load lua library and load lua hooks by function. They can communicate with the program using message passing.
	- [ ] Add a module function to load script modules.
	- [ ] Load additional lua script with _source_ command and still keep the old definitions.

