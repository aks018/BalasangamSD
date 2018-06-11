
import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate{
    @IBOutlet weak var webview: WKWebView!
    
    
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webview = WKWebView(frame: .zero, configuration: webConfiguration)
        webview.uiDelegate = self
        view = webview
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://ashustockservice.azurewebsites.net/")
        let request = URLRequest(url: url!)
                
        webview.load(request)
    }
    
    func webView(_ webView: WKWebView!, createWebViewWith configuration: WKWebViewConfiguration!, for navigationAction: WKNavigationAction!, windowFeatures: WKWindowFeatures!) -> WKWebView! {
        if navigationAction.targetFrame == nil {
            UIApplication.shared.open(navigationAction.request.url!)
        }
        return nil
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    

    

}

