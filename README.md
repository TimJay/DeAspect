# DeAspect

Quite correctly, Lightroom 4 reads the AspectFrame metadata of raw files and crops the photo accordingly on import. The only drawback of this approach is, that it is not possible to change this later on in Lightroom.

As a reaction to this, I sat down and got into Lua, in order to write a little plugin automating the exiftool workflow proposed in some user forums.

The workflow looks as follows:

1. A new menu entry "DeAspect current selection" is added in the Library menu.
2. If the entry is called without a selection, nothing happens.
3. If the entry is called with a selection, the selected photos will be passed to `exiftool -AspectRatio="" -AspectFrame="0 0 0 0″ -DefaultCropOrigin="" -DefaultCropSize="" -CroppedImageWidth="WIDTH" -CroppedImageHeight="HEIGHT" -o "NEW" "ORIG"`
4. The newly created file NEW is then imported and stacked on top of the original photo.
5. As a manual step, the previews should be re-rendered for the new files.

## Installation

Extract the DeAspect.lrplugin folder and install it using the Lightroom Plugin-Manager.

`exiftool` needs to be installed and available on your `PATH` system variable.

## Usage

Select the photos you want to create de-aspected copies from and choose 'DeAspect current selection' from the Library menu.

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## History

2012-08-16: DeAspect_0-1-3.lrplugin.zip

Reading WIDTH and HEIGHT from exiftool -ImageWidth -ImageHeight  
New exiftool call "exiftool -AspectRatio="" -AspectFrame="0 0 0 0″ -DefaultCropOrigin="" -DefaultCropSize="" -CroppedImageWidth="WIDTH" -CroppedImageHeight="HEIGHT" -o "NEW" "ORIG""  
Works with DNG, ORF and CR2.


2012-05-15: DeAspect_0-1-2.lrplugin.zip

Changed call from "exiftool.exe" to "exiftool" for cross platform compatibility  
New exiftool call "exiftool -AspectRatio="" -AspectFrame="0 0 0 0″ -DefaultCropOrigin="" -DefaultCropSize="" -o "NEW" "ORIG"  
Works with DNG and ORF.

2012-05-13: [DeAspect_0-1-1.lrplugin.zip](http://tim.jagenberg.info/files/2012/05/DeAspect_0-1-1.lrplugin.zip)

Initial public release


## License

Creative Commons Attribution-ShareAlike 3.0 Unported [CC BY-SA 3.0](http://creativecommons.org/licenses/by-sa/3.0/)
