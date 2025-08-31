// AudioPlayerFacade.h
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// Initialize and play a bundled audio file.
/// @param fileName  Name of the file, with or without extension (defaults to “mp3” if omitted).
FOUNDATION_EXPORT void initialize(NSString *fileName);

NS_ASSUME_NONNULL_END


