
extension FileManager {
	public var getDocumentDirectoryPath: String {
	    let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
	    return documentDirectory
	}

	public func getDocumentPath(forItemName name: String)-> String {
	    return getDocumentDirectoryPath.stringByAppendingPathComponent(name)
	}

	public func directoryExists(atPath filePath: String)-> Bool {
	    var isDir = ObjCBool(true)
	    return FileManager.default.fileExists(atPath: filePath, isDirectory: &isDir )
	}

	public func createDirectory(withFolderName name: String)-> Bool {
	    let finalPath = getDocumentDirectoryPath.stringByAppendingPathComponent(name)
	    return createDirectory(atPath: finalPath)
	}


}

extension String {
	public func stringByAppendingPathComponent(_ path: String) -> String {
	    let fileUrl = URL.init(fileURLWithPath: self)
	    let filePath = fileUrl.appendingPathComponent(path).path
	    return filePath
	}

}
