//
//  PickerList.swift
//  SomeWorkTest
//
//  Created by Ragaie alfy on 7/11/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

// viewcontroller that contain this view
extension UIResponder {
    func owningViewController() -> UIViewController? {
        var nextResponser = self
        while let next = nextResponser.next {
            nextResponser = next
            if let vc = nextResponser as? UIViewController {
                return vc
            }
        }
        return nil
    }
}

protocol DatePickerDelegate {
    
    
    func DatePicker(_ datepicker: DatePicker, didSelectDate date: Date)
    
    
}



@IBDesignable class DatePicker: UIView {

    
    @IBOutlet weak var DismissButton: UIButton!
    
    @IBOutlet weak var DoneButton: UIButton!
    @IBOutlet weak var headerLabel: UILabel!
  
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var selectItem : Int! = 0
   private  var showFlage :Bool! = false
    var delegate : DatePickerDelegate!
    
     var ID : String! = "pickerlist"
  
    //MARK: Initializers
    override init(frame : CGRect) {
        super.init(frame : frame)
      initSubviews()
    }
    
  
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
        initActionAndDelegete()
        
        
        // change size and location after init it to not apper in view 
        self.frame = CGRect.init(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 200)
    }
    
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //setButtons()
        
    }
    
    
    
    
    @IBInspectable var RestorationId : String!{
        didSet {
            
            ID = RestorationId
            
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            DoneButton.layer.cornerRadius = cornerRadius
            DoneButton.clipsToBounds = true
            
            
            DismissButton.layer.cornerRadius = cornerRadius
            DismissButton.clipsToBounds = true
            
        }
    }
    @IBInspectable var headerColor: UIColor = UIColor.blue {
        didSet {
            
            headerLabel.backgroundColor = headerColor
        }
    }
    @IBInspectable var textColor: UIColor = UIColor.blue {
        didSet {
            DoneButton.setTitleColor(textColor, for: .normal)
            DismissButton.setTitleColor(textColor, for: .normal)

        }
    }
    

    
    func initSubviews() {
        
        let bundle = Bundle(for: type(of: self))
        
        
        let nib = UINib(nibName: "DatePicker", bundle: bundle)
        
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        // to make view fit view in design you welcome.
       view.frame = self.bounds
        
        //   view.frame = CGRect.init(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 200)
        // Make the view stretch with containing view
        // to fit like you want in storyboard
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        // nib.contentView.frame = bounds
        
        addSubview(view)
        
        // custom initialization logic
        
    }
    
    
    
//    
    // add action of dropDown
    func initActionAndDelegete()  {
        
        
       
        DismissButton.addTarget(self, action: "dismissView:", for: .touchUpInside)
        //.addTarget(self, action:Selector("dismissView:") , for: .touchUpInside)
        
        
        DoneButton.addTarget(self, action: "selectItem:", for: .touchUpInside)
        
        
    }
    
    
    

    
    
    /// show view
    func show() {
       
        if showFlage == false {
        
//            var frameTemp = CGRect.init(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 200)
                UIView.animate(withDuration: 1.0, delay: 0.2, options: .curveEaseOut, animations: {
                    var basketTopFrame = self.frame
            
                    basketTopFrame.origin.y -= 200
            
            
                    self.frame = basketTopFrame
                }, completion: { finished in
                    print("Ragaie doors opened!")
                })
        
            showFlage = true
            }
        
    }
    
    
    func dismissView(_ sender: UIButton) -> Void {
    
        UIView.animate(withDuration: 1.0, delay: 0.2, options: .curveEaseOut, animations: {
            var basketTopFrame = self.frame
            
            basketTopFrame.origin.y += 200
            
            
            self.frame = basketTopFrame
        }, completion: { finished in
            print("Ragaie doors opened!")
        })
        showFlage = false
        
    }
    
    func selectItem(_ sender: UIButton) -> Void {
        
        
        if delegate != nil {
        
           // delegate.pickerList(self, didSelectRowAt: selectItem)
            
            delegate.DatePicker(self, didSelectDate: datePicker.date)
        }
       // print("\(dataSourceItem[selectItem]))")
        UIView.animate(withDuration: 1.0, delay: 0.2, options: .curveEaseOut, animations: {
            var basketTopFrame = self.frame
            
            basketTopFrame.origin.y += 200
            
            
            self.frame = basketTopFrame
        }, completion: { finished in
            print("Ragaie doors opened!")
        })
       showFlage =  false
        
    }

    
    
 
}




