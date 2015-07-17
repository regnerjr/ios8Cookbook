import UIKit

enum Images: String {
    case compass
}
extension UIImage {
    class func imageNamed(name: Images) -> UIImage{
        return UIImage(named: name.rawValue)!
    }
}

class ViewController: UIViewController {

    var image: UIImageView = UIImageView()
    var blur = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Dark))

    override func viewDidLoad() {
        super.viewDidLoad()

        image.image = UIImage.imageNamed(Images.compass)
        image.contentMode = UIViewContentMode.ScaleAspectFit
        view.addSubview(image)
        addImageConstraints()
        view.addSubview(blur)
        addBlurConstraints()
    }

    func addImageConstraints(){
        image.translatesAutoresizingMaskIntoConstraints = false
        let v = image
        let top = v.topAnchor.constraintEqualToAnchor(view.topAnchor)
        let lead = v.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor)
        let trail = v.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor)
        let bot = v.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor)
        NSLayoutConstraint.activateConstraints([top, lead, trail, bot])
    }
    func addBlurConstraints(){
        blur.translatesAutoresizingMaskIntoConstraints = false
        let v = blur
        let cX = v.centerXAnchor.constraintEqualToAnchor(image.centerXAnchor)
        let cY = v.centerYAnchor.constraintEqualToAnchor(image.centerYAnchor)

        let w = v.widthAnchor.constraintEqualToAnchor(image.widthAnchor, multiplier: 0.5)
        let h = v.heightAnchor.constraintEqualToAnchor(v.widthAnchor)
//        let h = v.heightAnchor.constraintEqualToAnchor(image.heightAnchor, multiplier: 0.5)

        NSLayoutConstraint.activateConstraints([cX, cY, w, h ])

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

