
import YandexMobileAds

class NativeAdView: YMANativeAdView {

    override var callToActionButton: UIButton? {
        didSet {
            callToActionButton?.layer.borderWidth = 1
            callToActionButton?.layer.cornerRadius = 8
            callToActionButton?.titleLabel?.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
    
    static var nib: NativeAdView? {
        return Bundle.main.loadNibNamed("NativeAdView",
                                        owner: nil,
                                        options: nil)?.first as? NativeAdView
    }

    func configureAssetViews() {
        guard let adAssets = ad?.adAssets() else { return }
        
        print("--------- LOGS ---------")
        print("age " + (adAssets.age ?? "-") + "\n")
        print("title " + (adAssets.title ?? "-") + "\n")
        print("body " + (adAssets.body ?? "-") + "\n")
        print("domain " + (adAssets.domain ?? "-") + "\n")
        print("price " + (adAssets.price ?? "-") + "\n")
        print("warning " + (adAssets.warning ?? "-") + "\n")
        print("sponsored " + (adAssets.sponsored ?? "-") + "\n")
        
        print("------ LOGS (images) ------")
        print("image" + (adAssets.image?.description ?? "-")  + "\n")
        print("icon" + (adAssets.icon?.description ?? "-")  + "\n")
        print("favicon" + (adAssets.favicon?.description ?? "-")  + "\n")
        print("media" + (adAssets.media?.description ?? "-")  + "\n")

        iconImageView?.isHidden = adAssets.icon == nil;
    }
}
