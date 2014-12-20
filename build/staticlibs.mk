
PROJECT_OBJDIR=$(PROJECT_HOME)/build/.objects/
ifneq ("$(LUA_LIB)", "n")
include $(SHOTODOL_SCRIPT_HOME)/linux/lua/staticlibs.mk
endif
