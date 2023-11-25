//
//  ViewController.swift
//  Sem08
//
//  Created by krlos90 on 25/11/23.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        leerServicio3()
    }
    
    private func leerServicio3() {
        let url = "https://jsonplaceholder.typicode.com/users/1"
        AF.request(url).responseJSON { rpta in
            
            switch rpta.result {
            case .failure(let error):
                print("Error!", error)
                break
            case .success(let rptaE):
                if let rptaDic = rptaE as? [String : Any] {
                    let email = rptaDic["email"] as? String ?? ""
                    let direccion = rptaDic["address"] as! [String : Any]
                    let calle = direccion["street"] as! String
                    print(email, calle)
                }
            }
        }
    }
    
    private func leerServicio2() {
        let url = "https://jsonplaceholder.typicode.com/posts"
    
        AF.request(url).responseJSON { rpta in
            switch rpta.result {
            case .failure(let error):
                print("Error", error)
                break
            case .success(let rptaE):
                if let aRptaDic = rptaE as? [[String : Any]] { //Ahora devuelve un arreglo de diccionario
                    for rptaDic in aRptaDic {
                        let idUsuario = rptaDic["userId"] as? Int ?? 0
                        let titulo = rptaDic["title"] as? String ?? ""
                        print(idUsuario, titulo)
                    }
                }
            }
        }
    }

    private func leerServicio() {
        let url = "https://jsonplaceholder.typicode.com/posts/1"
        
        AF.request(url).responseJSON { rpta in
            
            switch rpta.result {
            case .failure(let error):
                print("Error", error)
                break
                
            case .success(let rptaE)://Para de tener un objeto de rpta a rptaE(acà se pasa el valor de la respuesta en forma json)
                //print("Exito", rptaE)
                if let rptaDic = rptaE as? [String : Any] {
                    let titulo = rptaDic["title"] as? String ?? "" //as? Significa tratar de transformarlo, en cambio as! indica que si o si va tener un valor, con el as? indicamos que puede ser nuevo
                    let idUsuario = rptaDic["userId"] as? Int ?? 0
                    print(idUsuario, titulo)
                }//[string: Any] ES un diccionario donde el string es la llave y el valor es de tipo Any(entero, string, etc)
                break
            }
        }
    }
}

