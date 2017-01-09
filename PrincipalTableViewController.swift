//
//  PrincipalTableViewController.swift
//  ImageViewer
//
//  Created by cice on 9/1/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit

class PrincipalTableViewController: UITableViewController {
    
    var imagenes = [String]() //variable que nos va a coger los nombres de las imagenes
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Acceso archivos
        let fm = FileManager.default //variable FileManager (gestor de archivos)
        let path = Bundle.main.resourcePath! //busca todos los ficheros que hemos añadido, sin tener en cuenta las diferentes carpetas
        let items = try! fm.contentsOfDirectory(atPath: path) //accede a los archivos (Nombres) contenidos en atPath
        
        for item in items { // este bucle va añadiendo cada nombre de imagen al array imagenes
            if item.hasPrefix("nssl") {
                //Cargar imagen
                imagenes.append(item)
                
            }
        }
        
        print (imagenes)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return imagenes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...

        cell.textLabel?.text = imagenes[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetalleVC") as? DetalleViewController { // Inicia un controlador con el nombre que le ponemos (DetalleVC)
            vc.imagenSeleccionada = imagenes[indexPath.row]
            navigationController?.pushViewController(vc, animated: true) //Empuja a la siguiente vista
        }
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
