
import YandexMobileAds

class ViewController: UIViewController {
    private var adView: NativeAdView?
    
    var adLoader: YMANativeAdLoader!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        adView = NativeAdView.nib
        addAdView()
        adView?.isHidden = true
        
        // Replace demo R-M-DEMO-native-c with actual Block ID
        // Following demo Block IDs may be used for testing:
        // R-M-DEMO-native-c
        // R-M-DEMO-native-i
        // R-M-DEMO-native-video
        let configuration = YMANativeAdLoaderConfiguration(blockID: "R-M-DEMO-native-c",
                                                           loadImagesAutomatically: true)
        
        adLoader = YMANativeAdLoader(configuration: configuration)
        adLoader.delegate = self
        adLoader.loadAd(with: nil)
    }
    
    func addAdView() {
        guard let adView = adView else { return }

        adView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(adView)
        var layoutGuide = self.view.layoutMarginsGuide
        if #available(iOS 11.0, *) {
            layoutGuide = self.view.safeAreaLayoutGuide
        }
        let constraints = [
            adView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: 0),
            adView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: 0),
            adView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: 0),
            adView.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: 0)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}

// MARK: - YMANativeAdLoaderDelegate

extension ViewController: YMANativeAdLoaderDelegate {
    func nativeAdLoader(_ loader: YMANativeAdLoader, didLoad ad: YMANativeAd) {
        guard let adView = adView else { return }

        ad.delegate = self
        adView.isHidden = false
        do {
            try ad.bind(with: adView)
            adView.configureAssetViews()
        } catch {
            print("Binding error: \(error)")
        }
    }

    func nativeAdLoader(_ loader: YMANativeAdLoader, didFailLoadingWithError error: Error) {
        print("Native ad loading error: \(error)")
    }
}

// MARK: - YMANativeAdDelegate

extension ViewController: YMANativeAdDelegate {

    // Uncomment to open web links in in-app browser
//    func viewControllerForPresentingModalView() -> UIViewController? {
//        return self
//    }

    func nativeAdWillLeaveApplication(_ ad: YMANativeAd) {
        print("Will leave application")
    }

    func nativeAd(_ ad: YMANativeAd, willPresentScreen viewController: UIViewController?) {
        print("Will present screen")
    }

    func nativeAd(_ ad: YMANativeAd, didDismissScreen viewController: UIViewController?) {
        print("Did dismiss screen")
    }

    func close(_ ad: YMANativeAd) {
        adView?.isHidden = true
    }
}
