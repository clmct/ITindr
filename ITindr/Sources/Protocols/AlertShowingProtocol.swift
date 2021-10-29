import UIKit

protocol AlertShowingProtocol {}

extension AlertShowingProtocol where Self: UINavigationController {
  func showImagePickerAlert(completion: @escaping (PhotoAlertState) -> Void) {
    let photoAlert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

    let cancelAction = UIAlertAction(title: R.string.localizable.cancel(), style: .cancel) { _ in
      DispatchQueue.main.async {
        completion(.cancel)
      }
    }
    photoAlert.addAction(cancelAction)

    let cameraAction = UIAlertAction(title: R.string.localizable.takePhoto(), style: .default) { _ in
      if UIImagePickerController.isSourceTypeAvailable(.camera) {
        DispatchQueue.main.async {
          completion(.camera)
        }
      } else {
        DispatchQueue.main.async {
          completion(.alertSimulator)
        }

      }
    }
    photoAlert.addAction(cameraAction)

    let libraryAction = UIAlertAction(title: R.string.localizable.choosePhoto(), style: .default) { _ in
      completion(.library)
    }
    photoAlert.addAction(libraryAction)
    present(photoAlert, animated: true, completion: nil)
  }
  
  func showErrorAlert() {
    let alert = UIAlertController(title: R.string.localizable.errorValidation(),
                                  message: nil,
                                  preferredStyle: .alert)
    
    let alertAction = UIAlertAction(title: R.string.localizable.ok(),
                                    style: .default,
                                    handler: nil)
    
    alert.addAction(alertAction)
    present(alert, animated: true, completion: nil)
  }
}
