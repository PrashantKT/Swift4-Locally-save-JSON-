# Swift4-Local-saving-
Classes Helpful to save JSON in document directory with generic swift 4 solution with very easy steps 


**How to use it**
-----------------------------

Drag and drop **OfflineManager.swift** and **Helper.swift** and you DONE !!



And create your own cases  `WSCacheKeys` as per your response 

To Save

       OfflineManager.sharedManager.cacheDataToLocal(with: object as! [String:Any], to: .CampignList)

To Fetch data 

       DispatchQueue.global().async {
            // GET OFFLINE DATA
            if let object:[String:Any] = OfflineManager.sharedManager.loadCachedDataFromLocal(with: .CampignList) {
                do {
                    let data = try  JSONSerialization.data(withJSONObject: object, options: [])
                    let object = try CampaignListResponse.init(data: data)
                    DispatchQueue.main.async {
                        self.tableVIew.reloadData()
                    }
                } catch {
                }
            }
        }


