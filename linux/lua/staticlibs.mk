

ifneq ("$(LUA_LIB)", "n")
PLATFORM_LUA_CSOURCES=$(wildcard $(SHOTODOL_SCRIPT_HOME)/$(PLATFORM)/lua/csrc/*.c)
PLATFORM_LUA_VSOURCE_BASE=$(basename $(notdir $(PLATFORM_LUA_CSOURCES)))
OBJECTS+=$(addprefix $(SHOTODOL_SCRIPT_HOME)$(OBJDIR_COMMON)/, $(addsuffix .o,$(PLATFORM_LUA_VSOURCE_BASE)))
LIBS+=-llua$(LUA_LIB)
endif
