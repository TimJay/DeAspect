-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  
-- DeAspect by Tim Jagenberg (tim@jagenberg.info)
-- is licensed under a Creative Commons Attribution-ShareAlike 3.0 Unported License.
-- http://creativecommons.org/licenses/by-sa/3.0/
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  
local LrApplication = import 'LrApplication'
local LrDialogs = import 'LrDialogs'
local LrTasks = import 'LrTasks'
local LrPathUtils = import 'LrPathUtils'
local LrProgressScope = import 'LrProgressScope'

local function getPhotos()
	local photo = LrApplication:activeCatalog():getTargetPhoto()
	if photo == nil then
		return nil
	else
		return LrApplication:activeCatalog():getTargetPhotos()
	end
end

local function processPhotos()
	local progress = LrProgressScope({title="DeAspect"})
	local photos = getPhotos()
	if photos == nil then
		LrDialogs.message("Nothing selected.")
		progress:done()
		return nil
	else
		local count = 0
		for i,v in ipairs(photos) do
			local photo = v
			local path = LrPathUtils.standardizePath(photo:getRawMetadata("path"))
			progress:setPortionComplete(count, # photos)
			progress:setCaption(LrPathUtils.leafName(path))
			local ext = LrPathUtils.extension(path)
			local newPath = LrPathUtils.replaceExtension(path, ".deaspect."..ext)
			LrTasks.execute("exiftool -AspectRatio=\"\" -AspectFrame=\"0 0 0 0\" -DefaultCropOrigin=\"\" -DefaultCropSize=\"\" -o \""..newPath.."\" \""..path.."\"")
			LrApplication:activeCatalog():withWriteAccessDo("DeAspect", function() LrApplication:activeCatalog():addPhoto(newPath, photo, "above") end)
			count = count +1
		end
		progress:done()
	end
end

LrTasks.startAsyncTask(processPhotos)