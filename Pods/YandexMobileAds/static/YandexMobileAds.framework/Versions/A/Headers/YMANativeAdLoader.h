/*
 * Version for iOS © 2015–2021 YANDEX
 *
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at https://yandex.com/legal/mobileads_sdk_agreement/
 */

#import <Foundation/Foundation.h>

@protocol YMANativeAd;
@protocol YMANativeAdLoaderDelegate;
@class YMANativeAdLoaderConfiguration;
@class YMAAdRequest;

NS_ASSUME_NONNULL_BEGIN

/**
 This class is responsible for loading native ads.
 */
@interface YMANativeAdLoader : NSObject

/**
 The Block ID is a unique identifier in the R-M-XXXXXX-Y format, which is assigned in the Partner interface.
 */
@property (nonatomic, strong, readonly) NSString *blockID;

/**
 Configuration for loading native ads.
 */
@property (nonatomic, strong, readonly) YMANativeAdLoaderConfiguration *configuration;

/**
 Monitors the process of loading native ads.
 */
@property (nonatomic, weak, nullable) id<YMANativeAdLoaderDelegate> delegate;

- (instancetype)init __attribute__((unavailable("Use initWithConfiguration: instead")));

+ (instancetype)new __attribute__((unavailable("Use initWithConfiguration: instead")));

/**
 Initializes a new object of the YMANativeAdLoader class.
 @param configuration Configuration for loading native ads.
 @return An object of the YMANativeAdLoader class.
 */
- (instancetype)initWithConfiguration:(YMANativeAdLoaderConfiguration *)configuration;

/**
 Loads an ad with the specified targeting data.
 @param request Data for targeting.
 */
- (void)loadAdWithRequest:(nullable YMAAdRequest *)request;

@end

/**
 The protocol defines the methods of a delegate that monitors the ad loading process.
 @discussion The methods are invoked by an object of the YMANativeAdLoader class.
 */
@protocol YMANativeAdLoaderDelegate <NSObject>

@optional

/**
 Notifies that a `Content` ad is loaded.
 @param loader The loader that sends the message.
 @param ad Notifies that a native ad is loaded and ready to be displayed.
 */
- (void)nativeAdLoader:(YMANativeAdLoader *)loader didLoadAd:(id<YMANativeAd>)ad;

/**
 Notifies that the ad failed to load.
 @param loader The loader that sends the message.
 @param error Information about the error (for details, see YMAAdErrorCode).
 */
- (void)nativeAdLoader:(YMANativeAdLoader *)loader didFailLoadingWithError:(NSError *)error;

@end

NS_ASSUME_NONNULL_END
