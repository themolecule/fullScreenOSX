

This is a simple xcode project that creates a WebKit view and maximizes it on launch.  This is in response to Apple's "Spaces" system which seems to forbid one application spanning multiple monitors.

This was primarily made out of desperation, for interactive projects which want to run on OSX against multiple screens simultaneuosly in a web browser.



If run from a command line, it will accept and load a url.

If the Resources/url.txt file is edited, it will load a url from there.



There is no claim here that this is the best way, or even a good way, to work with the WebKit or Cocoa API.  Some other approaches are commented in the code, but none of them seemed to do it quite right aside from manually positioning a window against the union of all screen rects.

I've replaced WebView with WKWebView, which is significantly better and hardware accelerated!  Unfortunately, the Interface Builder doesn't allow direct creation, so it's created in code.


Please offer comments, suggestions, and revisions to this!

thanks!


KEYWORDS:  Fullscreen multi-monitor multi-screen OSX WebKit Safari Without Spaces Xcode Spanning mutiple

