using aroop;
using shotodol;

/** \addtogroup script
 *  @{
 */
public class shotodol.ScriptModule : DynamicModule {
	ScriptModule() {
		extring nm = extring.set_string(core.sourceModuleName());
		extring ver = extring.set_static_string("0.0.0");
		base(&nm,&ver);
	}
	public override int init() {
#if LUA_LIB
		CompositeExtension ext = new CompositeExtension(this);
		extring command = extring.set_static_string("command");
		PluginManager.register(&command, new M100Extension(new ScriptCommand(ext, this), this));
		extring rehash = extring.set_static_string("rehash");
		PluginManager.register(&rehash, new HookExtension(onRehash, this));
		extring composite = extring.set_static_string("extension/composite");
		PluginManager.register(&composite, ext);
#endif
		return 0;
	}
#if LUA_LIB
	int onRehash(extring*msg, extring*output) {
#if false
		extring cmd = extring.set_static_string("script -f ./autoload/shotodol.lua -t rehash\n");
		CommandModule.server.cmds.act_on(&cmd, new StandardOutputStream(), null);
#else
		extring tgt = extring.set_static_string("command/server");
		//extring callstr = extring.set_static_string("script(./shotodol.lua,rehash)");
		extring callstr = extring.set_static_string("script -f ./autoload/shotodol.lua -t rehash\n");
		PluginManager.swarm(&tgt, &callstr, null);
#endif
		return 0;
	}
#endif
	public override int deinit() {
		base.deinit();
		return 0;
	}
	[CCode (cname="get_module_instance")]
	public static Module get_module_instance() {
		return new ScriptModule();
	}
}
/* @} */

