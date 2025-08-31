// ARSequence.h
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, TurnDirection) {
    TurnDirectionNone,
    TurnDirectionLeft,
    TurnDirectionRight,
    TurnDirectionFaceCamera
};

@interface ARSequence : NSObject

@property (nonatomic, strong, nullable) NSNumber *animationIndex;    // e.g. 0,1,2
@property (nonatomic, strong, nullable) NSNumber *rotationDegrees;   // e.g. 90, 180
@property (nonatomic, assign) TurnDirection turnDirection;           // enum as string in JSON
@property (nonatomic, strong, nullable) NSNumber *walkMeters;        // may be fractional (e.g. 1.3)
@property (nonatomic, copy, nullable) NSString *audioAssetPath;

/// Designated initializer
- (instancetype)initWith:(nullable NSNumber*)animIdx
          rotationDegrees:(nullable NSNumber*)deg
            turnDirection:(TurnDirection)dir
               walkMeters:(nullable NSNumber*)meters
           audioAssetPath:(nullable NSString*)path;

/// JSON conversion
- (NSDictionary *)toJson;                 // excludes nil/empty and zero values
+ (instancetype)fromJson:(NSDictionary *)json;

/// Enum helpers (optional to expose; useful if others need them)
+ (nullable NSString *)stringForTurnDirection:(TurnDirection)dir;
+ (TurnDirection)turnDirectionFromString:(nullable NSString *)str;

@end

NS_ASSUME_NONNULL_END
