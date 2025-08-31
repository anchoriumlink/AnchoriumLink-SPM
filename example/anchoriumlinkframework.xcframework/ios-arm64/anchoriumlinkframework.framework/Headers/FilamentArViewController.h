#import <UIKit/UIKit.h>
#import <ARKit/ARKit.h>
#import <ARCore/ARCore.h>
#import "ARSequence.h"
#import "ARPlot.h"
#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

extern NSErrorDomain const FilamentARErrorDomain;

@class FilamentArViewController;

// Completion type
typedef void (^FilamentInitCompletion)(FilamentArViewController * _Nullable vc,
                                       NSError * _Nullable error);

//@interface FilamentArViewController : UIViewController <ARSessionDelegate>
// Add public init methods
@interface FilamentArViewController : UIViewController

// Storyboard-compatible init
- (instancetype)initWithCoder:(NSCoder *)coder NS_DESIGNATED_INITIALIZER;

// Programmatic init (for SwiftUI)
- (instancetype)initWithFrame:(CGRect)frame NS_DESIGNATED_INITIALIZER;
@property(nonatomic, strong) GARSession *garSession;
@property (nonatomic) dispatch_queue_t renderQueue;
@property (nonatomic, assign) BOOL enableSpawn;
@property (nonatomic, readonly, strong) ARAnchor *lastTappedAnchor;

- (void)setModelFileName:(NSString *)fileName;
- (void)hostAnchor:(void (^)(NSString * _Nullable anchorId))completion;
- (void)runPlot:(NSString *)plotId;
- (void)setPlot:(ARPlot *)plot
     completion:(void (^)(NSString * _Nullable plotId, NSError * _Nullable error))completion;

/// Asynchronous SDK initialization. Calls your token API first, then builds GARSession,
/// then returns a ready FilamentArViewController. Nothing AR-related starts before this.
/// Swift will see this as:
///   FilamentArViewController.initialize(clientId:clientSecret:completion:)
+ (void)initializeWithClientId:(NSString *)clientId
                  clientSecret:(NSString *)clientSecret
                    completion:(FilamentInitCompletion)completion
NS_SWIFT_NAME(initialize(clientId:clientSecret:completion:));

+ (nullable NSString *)clientToken;

@end

NS_ASSUME_NONNULL_END
