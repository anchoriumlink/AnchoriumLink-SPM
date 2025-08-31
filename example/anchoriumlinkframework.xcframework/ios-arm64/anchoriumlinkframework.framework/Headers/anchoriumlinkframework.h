
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>



//! Project version number for anchoriumlinkframework.
FOUNDATION_EXPORT double anchoriumlinkframeworkVersionNumber;

//! Project version string for anchoriumlinkframework.
FOUNDATION_EXPORT const unsigned char anchoriumlinkframeworkVersionString[];


//#import <anchoriumlinkframework/AudioPlayerUtil.h>
#import <anchoriumlinkframework/AudioPlayerFacade.h>
#import <anchoriumlinkframework/FilamentArViewController.h>
#import <anchoriumlinkframework/ARSequence.h>
#import <anchoriumlinkframework/ARPlot.h>

//xcodebuild archive \
//  -workspace AnchoriumLinkFramework.xcworkspace \
//  -scheme    anchoriumlinkframework \
//  -configuration Release \
//  -destination "generic/platform=iOS" \
//  -archivePath "./archives/anchoriumlinkframework-iOS" \
//  SKIP_INSTALL=NO \
//  BUILD_LIBRARY_FOR_DISTRIBUTION=YES


//xcodebuild -create-xcframework \
//  -framework "./archives/anchoriumlinkframework-iOS.xcarchive/Products/Library/Frameworks/anchoriumlinkframework.framework" \
//  -output "./anchoriumlinkframework.xcframework"
