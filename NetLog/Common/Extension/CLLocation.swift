//
//  CLLocation.swift
//  NetLog
//
//  Created by ENES AKSOY on 21.02.2021.
//  Copyright © 2021 Enes Aksoy. All rights reserved.
//

import CoreLocation


extension CLLocation {
    func fetchCityAndCountry(completion: @escaping (_ city: String?, _ country: String?, _ subAdministrativeArea: String?, _ streetName: String?,  _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(self) {
            completion($0?.first?.administrativeArea,
                       $0?.first?.country,
                       $0?.first?.subAdministrativeArea,
                       $0?.first?.name,
                       $1)
        }
    }
}
