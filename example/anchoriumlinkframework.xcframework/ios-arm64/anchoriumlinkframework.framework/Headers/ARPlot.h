//
//  ARPlot.h
//  anchoriumlinkframework
//
//  Created by Syed M Ali kazmi on 26/08/2025.
//


#import <Foundation/Foundation.h>

@class ARSequence;

NS_ASSUME_NONNULL_BEGIN

@interface ARPlot : NSObject

@property (nonatomic, copy, nullable) NSString *anchorId;
@property (nonatomic, copy, nullable) NSArray<ARSequence *> *sequences;

/// Designated initializer
- (instancetype)initWith:(nullable NSString *)anchorId
               sequences:(nullable NSArray<ARSequence *> *)sequences;

/// Convert this object to JSON dictionary
- (NSDictionary *)toJson;

/// Create ARPlot from JSON dictionary
+ (instancetype)fromJson:(NSDictionary *)json;

@end

NS_ASSUME_NONNULL_END
