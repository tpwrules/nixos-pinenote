# Stock PineNote Impressions (2022-01-02)

I've been using the PineNote as an e-reader and e-ink tablet for about a week or so now, as it turns out the stock Android image is pretty capable, though unpolished. The Android image I've been using calls itself `PineNote_R_1.0.4_20211019`.

There are some quirks and foibles that I think are worth documenting here both for those who want to know what the experience is really like, and as inspiration for Linux efforts.

I will not speak to rooting or otherwise modifying the stock image as I know nothing about Android and plan to ditch it for Linux ASAP. Some information on rooting is available in [DorianRudolph's pinenotes](https://github.com/DorianRudolph/pinenotes).

### The Device
The PineNote itself is reasonably solid and well put together, though obviously it does not feel like an Apple product.

* It's a very nice size, and is thin and light. It doesn't look amazing, but the important part, the screen, is beautiful.

* The battery life seems reasonably good. I get about 20 hours of screen on time with the WiFi off and both lights at about 25% brightness when viewing PDFs.

* The cover feels perfectly nice. I have heard complaints that it "doesn't feel good in the hand", but I like it and think it's a good material. It uses some sort of adhesive to stick onto the body of the PineNote, but it was forgiving and not too hard to take back off and put back on until I got it lined up nicely. There is a sensor so that the device goes into standby when the cover is closed and comes back out when it is opened again.

* It's possible to open by prying the sides off with one's thumbs and without using any tools, but care must be taken around the USB port. For the privacy conscious, it's easy to unplug the four microphones, but this also disables the power switch so it's a bit impractical. The cover sensor still works though.

* There is a plug on the board and room in the chassis for a 4G cell modem, so I'm hoping a future revision comes with one (and that previous versions can be user-upgraded).

* It's worth mentioning that it's very similar to the [Bigme B1 Pro Plus](https://goodereaderstore.com/products/bigme-b1-pro-plus-10-3-inch-e-ink-kaleido-plus-color-e-note?variant=40922813104324). It seems PINE64 did substantial development work on the electronics, which the Plus version of the Bigme has inherited, and the PineNote does not have the (breathtakingly expensive) color filter of the Bigme. But, the mechanical design, case, pen, and default Android image are more or less identical judging by the photos.

### The Screen
The screen looks beautiful, especially with the light on. However, I have some concerns about mapping it to a standard Linux DRM driver.

* It has both a cold (moon) and warm (sun) light, which the stock image gives independent sliders for. It would be nice to instead have brightness and temperature sliders. The light can be set ludicrously bright to the point of being visible in direct sunlight, though this really just wastes battery. It would be cool for a future revision of the hardware to have an ambient brightness and color temperature sensor to adjust the backlight accordingly.

* Maybe color temperature will have to be dedicated to a specific app which knows how to invoke the right ioctl as I don't think any existing Linux backlight solutions expect to be able to control two parameters. At the very least, both lights should run at the same percentage, as one or the other only is much too harsh.

* It has three refresh settings: HD, Normal, and Speed. It looks like HD and Normal operate similarly, but HD has more gray levels. Speed, on the other hand, dithers the screen and seems to have a severely reduced level count, though I don't think it's quite black and white.

* It would be cool to have a hybrid HD + dithering mode, as images still look splotchy in HD, but dithering of solid colors in Speed mode looks pretty ugly. Maybe an intelligent driver could only apply dithering to photographic-looking areas of the screen. Dithering also gives this weird slight pseudo-3D effect, presumably because of how the ink particles are moved around.

### The Pen
The pen feels okay, certainly more paper-like than my old Surface Pro 1. It is also quite responsive. But it has some problems:

* The nib seems like it wears down pretty fast and I don't think the two spares that shipped with the pen will last me all that long, though I am a hard writer. Apparently the reMarkable ones are compatible.

* The pen has three buttons: one to erase or turn back a page, one to turn forward a page, and one to go home or turn the PineNote on or off. The functions can also be changed in the settings.

* The buttons are Bluetooth and require the pen to be charged and paired to operate, though writing doesn't. The device ignores button inputs when the nib is within writing range, which is super annoying for the erase function, as it gets stuck and confused if the button is pressed when the pen is close to the screen.

* The red coating underneath the end cap, and the USB port itself, are insanely fragile! I am a compulsive fiddler and have nearly completely worn off the coating just moving the cap around and taking it off and putting it back on. I also broke the USB port off the circuit board inside trying to charge it and had a devil of a time gluing and soldering it back together, though it is possible. I don't think these are really "me" problems, so how these problems will manifest for other users worries me. Maybe the factory needs to apply more glue.

* It's possible to disassemble by taking off the end cap, pulling the red USB port cover out, then sliding out the chassis. Putting the buttons back in is slightly annoying though. It appears the USB port is not quite compliant, as it uses the plug chassis for ground and the negative terminal is completely unconnected to the circuit.

* It feels kind of heavy and unbalanced in my considered opinion, as the magnets and battery are in the end far from the tip. I prefer my older Surface Pro 1 pen as it's thinner and lighter, though entirely passive.

* Other Wacom EMR pens, like that Surface Pro 1 pen, are compatible to some degree. So maybe there is a better overall choice. For the SP1 in particular, the nib is considerably slipperier and the button doesn't work (though maybe Linux can fix this), but the built in eraser on the other side DOES work, which is quite nice. It doesn't quite line up right though and the calibration function doesn't seem to do anything.

### Notes
The "Notes" app lets you write notes using the pen. It works decently. For Linux, I plan to use Xournal++ to do the same stuff.

* The pen is fluid and responsive, with almost no lag. I am told it's not quite as good as the reMarkable 2, but it seems pretty great to me. It supports the pen's pressure sensitivity, but appears to be purely raster-based. All strokes are rasterized, and there's no way to select, erase, or manipulate individual strokes. There is undo, redo, and PNG or PDF export, though the PDF just has bitmaps.

* You can change the pen stroke texture and thickness. It's possible to erase either in "track" mode where whatever you draw on gets erased (i.e. a white marker), or "range" mode, where you draw a lasso and whatever it encloses is erased. The current erase mode can be activated by holding the button on the pen closest to the tip, so long as it is not too close to the screen!

* You can also add images, text, etc. though I haven't really tried those functions. It's also possible to set a background template (like a grid or lines), but these are not per-page.

* There's no way to zoom, though multiple pages are supported per note. 

### E-reader
The "Offline books" app lets you import PDFs on the device (using the "Local import" button, e.g. ones that you have downloaded using the browser), read them, and annotate them. It works nicely for reading, but not so well for writing. Not sure what a good linux E-reader app is, though Xournal++ can also annotate PDFs.

* It may work for other e-book-type formats. I haven't figured out how to export annotated documents from it yet.

* You can change pages by touching the left or right of the screen, or bring up options by touching the middle. There's no good way to zoom or pan. There are options for it, but touch gestures don't work and using the options puts up a "Loading" dialog, making them extremely unresponsive.

* Flipping pages does not require a full screen refresh, though one does happen automatically every 30 (by default) flips to clean up ghosting. Ghosting is pretty minimal though, at least for pure text.

* Pen support is much more limited. It's still as responsive as the Notes app, but pen pressure is ignored and the functions to change the thickness don't work. On the other hand, it is vector-based. Sometimes there is ghosting of previous pen input on page transitions, though this is the software's fault and unrelated to the e-ink refresh.

* Erasing only works in a limited version of "range" mode. You can draw an arbitrary lasso, but any strokes which intersect the bounding box of the lasso are erased. This means that writing significantly outside the erased area can be deleted by accident.

* The "WPS Office Lite" program allows smooth zooming and panning of PDFs, but annotation is extremely laggy, and it seems to ask for advertising IDs and other personal information.


### Browser
The "Browser" lets you look at webpages, though it is extremely limited.

* There is no concept of tabs, windows, history, bookmarks, etc. You can go backward and forward, but the browser frequently forgets which page you were on when you close it and goes to a random one in the history when you open it again.

* Any URL you type in is automatically prefixed with `http://` when you hit the button to load it, even if it's already in there. You can't use the URL input as a search box.

* Scrolling and panning work well with touch gestures, and are rather smooth in "Speed" refresh mode. Once scrolling/panning input stops, the browser performs a full refresh of the display to clean up ghosting. It would be nice to have a hybrid mode where scroll/pan is done in "Speed", but the final refresh is HD. Scrolling and panning is not very smooth and somewhat flickery in Normal and HD modes.

* There is no pagination or "reader mode", which would eliminate the need for scrolling and panning, thus making the e-ink display a much more pleasant experience. An adblocker would also be essential to clean up random animated garbage.

* There is no support for pen input, except that the nib can be used to pan. Annotation is not possible.

* You can download files, though not in all cases (e.g. if the site uses a data URI). Downloading files from Dropbox does not work for this reason.
