-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  
-- DeAspect by Tim Jagenberg (tim@jagenberg.info)
-- is licensed under a Creative Commons Attribution-ShareAlike 3.0 Unported License.
-- http://creativecommons.org/licenses/by-sa/3.0/
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  
return {
	
	LrSdkVersion = 3.0,
	LrSdkMinimumVersion = 1.3, -- minimum SDK version required by this plug-in

	LrToolkitIdentifier = 'info.jagenberg.tim.lr.deaspect',

	LrPluginName = LOC "$$$/DeAspect/PluginName=DeAspect",
	
	LrLibraryMenuItems = {
	    {
		    title = LOC "$$$/DeAspect/Execute=DeAspect current selection",
		    file = "DeAspect.lua",
		},
	},
	VERSION = {major=0, minor=1, revision=2, build=0, },
	LrPluginInfoUrl="http://tim.jagenberg.info/projects/deaspect/"
	
}
