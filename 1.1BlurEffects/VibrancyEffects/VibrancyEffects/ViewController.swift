import UIKit

class ViewController: UIViewController {

    let compass: UIImageView = {
        let view = UIImageView(image: UIImage(named: "compass")!)
        view.contentMode = UIViewContentMode.ScaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)

    lazy var blur: UIVisualEffectView = { //lazy since it depends on the Blur Effect
        let blurView = UIVisualEffectView(effect: self.blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        return blurView
    }()

    lazy var vibrancy: UIVisualEffectView = { //lazy since it depends on the Blur Effect
        let vib =  UIVisualEffectView(effect:
            UIVibrancyEffect(forBlurEffect: self.blurEffect))
        vib.translatesAutoresizingMaskIntoConstraints = false
        return vib
    }()

    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Vibrant"
        return label
    }()

    //MARK: - View Lifecycle
    override func viewDidLoad() {

        view.backgroundColor = UIColor.greenColor()
        //center compass in view
        view.addSubview(compass)
        let top = compass.topAnchor.constraintEqualToAnchor(view.topAnchor)
        let left = compass.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor)
        let bottom = compass.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor)
        let right = compass.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor)
        NSLayoutConstraint.activateConstraints([top,left,bottom,right])

        //place blur over compass in center
        view.addSubview(blur)
        let b_top = blur.topAnchor.constraintEqualToAnchor(view.topAnchor, constant: 300)
        let b_left = blur.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor, constant: 50)
        let b_bottom = blur.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor, constant: -300)
        let b_right = blur.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor, constant: -50)
        NSLayoutConstraint.activateConstraints([b_top,b_left,b_bottom,b_right])

        //place vibrancy over blur
        blur.addSubview(vibrancy)
        let v_top = vibrancy.topAnchor.constraintEqualToAnchor(blur.topAnchor)
        let v_left = vibrancy.leadingAnchor.constraintEqualToAnchor(blur.leadingAnchor)
        let v_bottom = vibrancy.bottomAnchor.constraintEqualToAnchor(blur.bottomAnchor)
        let v_right = vibrancy.trailingAnchor.constraintEqualToAnchor(blur.trailingAnchor)
        NSLayoutConstraint.activateConstraints([v_top,v_left,v_bottom,v_right])

        vibrancy.contentView.addSubview(label)
        let centerX = label.centerXAnchor.constraintEqualToAnchor(vibrancy.contentView.centerXAnchor)
        let centerY = label.centerYAnchor.constraintEqualToAnchor(vibrancy.contentView.centerYAnchor)
        NSLayoutConstraint.activateConstraints([centerX, centerY])
    }
}