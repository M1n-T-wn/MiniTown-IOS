//
//  ProfileImagePickViewViewController.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/30.
//

import UIKit
import Alamofire

class ProfileImagePickViewViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let picker = UIImagePickerController()
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
    }
    
    @IBAction func selectButton(_ sender: Any) {
        let alert =  UIAlertController(title: "프로필 사진을 선택하새요", message: "선택한 화면으로 움직입니다.", preferredStyle: .actionSheet)
        
        let library =  UIAlertAction(title: "사진앨범", style: .default) { (action) in self.openLibrary()
        }
        
        let camera =  UIAlertAction(title: "카메라", style: .default) { (action) in
            self.openCamera()
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    @IBAction func okButton(_ sender: Any) {

        AF.upload(multipartFormData: { multipartFormData in
            if let image = self.imageView.image?.pngData() {
                multipartFormData.append(image, withName: "profile", fileName: "\(image).png", mimeType: "image/png")
            }
        }, to: baseURL + "/api/image/profile", usingThreshold: UInt64.init(), method: .post, headers: headers).response { response in
            
            guard let statusCode = response.response?.statusCode,
                  statusCode == 200 else { return }
            print(response.result)
        }
        
    }
    func openLibrary(){
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    func openCamera(){
        if(UIImagePickerController .isSourceTypeAvailable(.camera)){
            picker.sourceType = .camera
            present(picker, animated: true, completion: nil)
        }
        else{
            print("Camera not available")
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let originalImage:UIImage =  info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageView.image = originalImage
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

