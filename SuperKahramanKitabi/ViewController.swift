//
//  ViewController.swift
//  SuperKahramanKitabi
//
//  Created by Furkan Eruçar on 30.03.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource { // Bir class'a iki tane superclass'a inherit edemeyiz, buradaki delegate ve datasource protokol'dür. Ama UIViewController yanına Project1'deki gibi UITableViewController ekleyemeyiz. Eğer UITableViewController'u yazarsak, aşağıda yazdığımız numberOfRowsInSection ve cellForRowAt indexPath: fonksiyonlarını override etmemiz gerekiyor.
    
    
    
    @IBOutlet var tableView: UITableView!
    
    var superKahramanIsimleri = [String]() // Boş bir array oluşturdum ve içine superKahraman isimlerini append edicez (ekleyeceğiz).
    var superKahramanGorselIsimleri = [String]()
    var secilenIsim = "" // Bu ikisini aşağıdaki fonksiyonda görebilmek class altına boş string olarak tanımladık.
    var secilenGorsel = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // tableView'un; Delegate'ının ve DataSource'unun içinde bulunduğumuz viewController class'ında olduğunu belirtmemiz gerekiyor.
        tableView.delegate = self // tableView.delegate = ViewController aslında fakat biz ViewController içinde olduğumuz için self yazıcaz.
        tableView.dataSource = self // aynı şekilde tableView.dataSource = ViewController yerine, zaten ViewController içinde olduğumuz için self olacak.
        
        // Şimdi assetslere attığımız verileri tanımlamamız gerekiyor, görsellerini, görsel isimlerini, ve bunları bir diziye koymamız gerekiyor. TableView'la çalışmamız için bunların bir dizide olması gerekiyor. Aynı zamanda ileride internetten veri çekeceğimiz zaman veri miktarı fazla olacaktır.
        
        superKahramanIsimleri.append("Batman")
        superKahramanIsimleri.append("Superman")
        superKahramanIsimleri.append("Iron Man")
        superKahramanIsimleri.append("Spiderman")
        superKahramanIsimleri.append("Captain America")
        
        //İsimleri tanımladık şimdi bir de görselleri tanımlamamız lazım. Bunun için iki yol var. Biri verimli biri verimsiz. İkisini de yapıcaz
        
        // 1)
        // var superKahramanGorselleri = [UIImage]() //görseller için bi değişken oluşturup bir array oluşturduk ve bu array, UIImage tutacak.
        // superKahramanGorselleri.append(UIImage(named: "batman")!) // append dedikten sonra bizden bi UIImage isteyecek. named: ise assets'e eklediğimiz görselin ismi olacak.
        
        // 2)
        superKahramanGorselIsimleri.append("batman") // Buraya görsellerin kayıtlı oldukları isimleri yazacağız fakat assets'deki sırada nasılsa öyle yazmamız gerekiyor.
        superKahramanGorselIsimleri.append("superman") // Çünkü sonrasında yukarıda yazdığımız süper kahraman isimleriyle görsel isimlerini eşleştireceğiz.
        superKahramanGorselIsimleri.append("ironman") // Aksi halde mesela batman yazılı olarak superman fotoğrafı gözükür.
        superKahramanGorselIsimleri.append("spiderman")
        superKahramanGorselIsimleri.append("captainamerica")
    }
    
    
    // numberOfRowsInSection: Bir bölümde kaç tane row() olacağını belirler.
    // cellForRow atIndexPath: hücrenin içerisinde neler gösterilecek
    // Fakat bu iki fonksiyonu direk UIViewController superclassı altında kullanamıyoruz.
    // class'ımıza UITableViewDelegate, UITableViewDataSource'ları ekledikten sonra üstteki iki fonksiyon artık işlevsel olacak fakat üstteki iki fonksiyonu kullanmazsak class kısmında hata verecek

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // Bir Int döndürmemiz gerekiyor, bu Int kaç tane row(sıra) olacağını göstericek.
        return superKahramanIsimleri.count // Kaç tane veri göstericeksek onu yazıcaz.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // Rowların içerisinde bir cell göstericez. UITableViewCell; tableView içerisindeki her bir sıranın içindeki görünüm. Buradaki IndePath; tableviewların da bir index mantığına sahip olduğunu gösteriyor.
        let cell = UITableViewCell()
        cell.textLabel?.text = superKahramanIsimleri[indexPath.row] // "cell"lerin içinde ne yazacağını gösteriyor. Burada indexPath komutu, hangi array'i seçtiysek içindeki index'leri ( [0], [1] ... ) sırayla çağırıcak, row ise her satıra bi index gelecek şekilde düzenleyecek.
        return cell // Rowların içerisinde "cell" göstericez
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) { // bu kod bulunduğumuz satırı sola kaydırınca silme işlemi gibi işlemleri göstermeye yarayacak.
        if editingStyle == .delete { // Yukardaki koda baktığımızda, UITableViewCell.EditingStyle kısmından dolayı parametre ismini bir şeye eşitlediğimizde UITableViewCell'den olması gerek. Ayrıca ".EditingStyle"'da bize .birşey'i seçmemiz gerektiğini söylüyor. Ama "." yazmadan önce UITableViewCell yazmamıza gerek yok, o yüzden direk .delete yazdık.
            superKahramanGorselIsimleri.remove(at: indexPath.row) // Kullanıcının seçtiği sıra hangisiyse onu silecek. Biz burda indexPath.row seçtik çünkü kullanıcının neyi sileceğini bilmiyoruz, herhangi bir şeyi silebileceği için genel olarak yazdık.
            superKahramanIsimleri.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)  // Son olarak TableView'un kendisini de güncellememiz gerekiyor. // with: UITableView.RowAnimation bu kısım animasyon gösterilsin mi diye soruyor
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { // Bir row seçildiğinde ne olacağını gösteriyor. Bir tableView hücresine tıklandığı takdirde aşağıdaki değişkenlerin değerini alacak.
        
        secilenIsim = superKahramanIsimleri[indexPath.row] // Yani seçilen süper kahraman ismi neyse onu alabiliriz.
        secilenGorsel = superKahramanGorselIsimleri[indexPath.row] // Seçilen fotoğrafların ismi neyse onları alabiliriz.
        
        
        performSegue(withIdentifier: "toDetailVc", sender: nil) // Seguemizi bağlıyoruz burda. withIdentifier kısmına da segue'yi hangi isimde kaydettiysek onu yazıyoruz.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // Yukardaki kodda oluşturduğumuz değişkenleri, diğer ViewController'daki değişkenlere eşitlemeyi sağlayacak.
        if segue.identifier == "toDetailVc"  { //Yapılan segue'nin identifier'ı benim kontrol etmek istediğim identifierla aynı mı
            let destinationVc = segue.destination as! DetailsViewController // Gidilecek ViewControl'ı yazalım. Eğer as! DetailsViewController kısmını yazmazsak bize normal bi viewcontroller vericek ama biz özellikle Yeni oluşturduğumuz class'a gitmek istiyoruz.
            destinationVc.secilenKahramanIsmi = secilenIsim // Burda da kahraman ismi ve kahraman görselini diğer vc için güncellemiş oluyoruz.
            destinationVc.secilenKahramanGorselIsmi = secilenGorsel // Böylece diğer vc'deki değişkenleri istediğimiz gibi değiştirebiliriz.
            }
        
    }

}
