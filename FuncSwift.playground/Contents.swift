import UIKit

func TRUE(x: Any, y: Any) -> Any {
    return x
}

func FALSE(x: Any, y: Any) -> Any {
    return y
}

func NOT(x: Any) -> Any {
    guard let x = x as? (Any, Any) -> Any else { fatalError() }
    return x(FALSE, TRUE)
}

(NOT(x: TRUE) as! (Any, Any) -> Any)(1,0)

func AND(x: Any, y: Any) -> Any {
    guard let x = x as? (Any, Any) -> Any else { fatalError() }
    return x(y, FALSE)
}

(AND(x: FALSE, y: TRUE) as! (Any, Any) -> Any)(1,0)


func OR(x: Any, y: Any) -> Any {
    guard let x = x as? (Any, Any) -> Any else { fatalError() }
    return x(TRUE, y)
}

(OR(x: FALSE, y: TRUE) as! (Any, Any) -> Any)(1,0)

func XOR(x: Any, y: Any) -> Any {
    guard let x = x as? (Any, Any) -> Any else { fatalError() }
    return x(NOT(x: y), y)
}

(XOR(x: TRUE, y: TRUE) as! (Any, Any) -> Any)(1,0)

(AND(x: OR(x: TRUE, y: FALSE), y: XOR(x: FALSE, y: TRUE)) as! (Any, Any) -> Any)(1,0)
