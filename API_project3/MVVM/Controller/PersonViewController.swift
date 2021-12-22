

import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else {
                    print(error?.localizedDescription)
                    return
            }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
            }.resume()
    }
    
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

class PersonViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLB: UILabel!
    @IBOutlet weak var statusLB: UILabel!
    @IBOutlet weak var speciesLB: UILabel!
    @IBOutlet weak var genderLB: UILabel!
    
    var person:Result?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLB.text = person?.name
        statusLB.text = person?.status
        speciesLB.text = person?.species
        genderLB.text = person?.gender
        

        let urlString = "https://rickandmortyapi.com"+(person?.image)!
        let url = URL(string: urlString)
        
        imageView.downloaded(from: url!)
    }
}
