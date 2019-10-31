## Display class name, function name and line number

A helpful way when we trackback the logging or debug message in the code is if we would know which class, function and line number are triggered in the called.

Here in Swift, we can use #file #function #line #column to get the info we want.

    func logInfo(_ message: String,
                    fileName: String = #file,
                    funcName: String = #function,
                    lineNumber: Int = #line,
                    colNumber: Int = #column) {

        print("logged>> File: \(fileName) - \(funcName) at line \(lineNumber)[\(colNumber)]")
    }
