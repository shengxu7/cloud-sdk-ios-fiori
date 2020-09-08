//
//  Person.swift
//  Examples
//
//  Created by Stan Stadelman on 9/4/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import Foundation
import Contacts
import FioriSwiftUICore
import Floorplan
import Combine
import SwiftUI

extension TripPin {
    
    final class PeopleModel: ObservableObject {
        @Published var listResults: [Person] = []
        
        init() {
            Just(peopleData)
                .subscribe(on: DispatchQueue(label: "background"))
                .decode(type: [Person].self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { completion in
                    switch completion {
                        case .failure(let error):
                            print(error)
                        case .finished:
                            break
                    }
                }, receiveValue: { [self] people in
                    self.listResults = people
                })
                .store(in: &subscriptions)
        }
        
        private var subscriptions = Set<AnyCancellable>()
    }
    
    final class IPeopleLoader: ObservableObject {

        typealias Entity = Person
        
        @Published var listResults: [TripPin.Person] = []
        @Published var searchResults: [TripPin.Person] = []
        @Published var error: Error?

        
        var listResultsDelta: CurrentValueSubject<[TripPin.Person], Never> = CurrentValueSubject([])
        var searchResultsDelta: CurrentValueSubject<[TripPin.Person], Never> = CurrentValueSubject([])
        
        func reload(in range: Range<Int>?) {
            print("SHOULD RELOAD: \(range)")
        }
        
        func append(in range: Range<Int>) {
            print("SHOULD APPEND: \(range)")
        }
        
        func search(for keyword: String, in range: Range<Int>) {
            searchResults = listResults[range].filter {
                $0.UserName.contains(keyword)
                    || $0.FirstName.contains(keyword)
                    || $0.LastName.contains(keyword)
            }
        }
        
        

        
        init() {
            Just(peopleData)
                .subscribe(on: DispatchQueue(label: "background"))
                .decode(type: [Person].self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { completion in
                    switch completion {
                        case .failure(let error):
                            print(error)
                        case .finished:
                            break
                    }
                }, receiveValue: { [self] people in
                    self.listResults = people
                })
                .store(in: &subscriptions)
        }
        
        private var subscriptions = Set<AnyCancellable>()
    }

    
    final class PeopleLoader: DataLoader<Person> {
        override init() {
            super.init()
            Just(peopleData)
                .subscribe(on: DispatchQueue(label: "background"))
                .decode(type: [TripPin.Person].self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { completion in
                    switch completion {
                        case .failure(let error):
                            print(error)
                        case .finished:
                            break
                    }
                }, receiveValue: { [self] entities in
                    self.listResults = listResults
                })
                .store(in: &subscriptions)
        }
        
        override public func search(for keyword: String, in range: Range<Int>) {
            self.searchResults = listResults[range].filter {
                $0.UserName.contains(keyword)
                    || $0.FirstName.contains(keyword)
                    || $0.LastName.contains(keyword)
            }
        }
        
        private var subscriptions = Set<AnyCancellable>()
    }
    
}

extension TripPin {
    struct Person: Decodable, Hashable, Equatable {
        let UserName: String
        let FirstName: String
        let LastName: String
        let MiddleName: String?
        let Gender: String
        let age: Int?
        let Emails: [String]
        let FavoriteFeature: String
        let Features: [String]
        let AddressInfo: [Address]
        let ProfilePic: String?
        
        var nameComponents: PersonNameComponents {
            var c = PersonNameComponents()
            c.givenName = FirstName
            c.familyName = LastName
            return c
        }
        
        var cnContact: CNContact {
            let mu = CNMutableContact()
            mu.givenName = FirstName
            mu.familyName = LastName
            
            mu.emailAddresses = Emails.map {
                return CNLabeledValue(label: CNLabelWork, value: $0 as NSString)
            }
            
            mu.postalAddresses = AddressInfo.map {
                let pa = CNMutablePostalAddress()
                pa.street =  $0.Address
                pa.city = $0.City.Name
                pa.country = $0.City.CountryRegion
                return CNLabeledValue(label: CNLabelWork, value: pa)
            }
            
            return mu as CNContact
        }
    }
}
extension TripPin.Person: Identifiable {
    var id: String {
        return UserName
    }
}

extension TripPin.Person {
    struct Address: Decodable, Hashable, Equatable {
        let Address: String
        let City: City
    }
}

extension TripPin.Person.Address {
    struct City: Decodable, Hashable, Equatable {
        let Name: String
        let CountryRegion: String
        let Region: String
    }
}

extension TripPin.Person: ContactItemModel {
    var footnote: String? {
        Features.joined(separator: ", ")
    }
}

extension TripPin.Person: ProfileHeaderModel {}

extension TripPin.Person: TitleComponent {
    var title: String {
        return PersonNameComponentsFormatter().string(from: nameComponents)
    }
}

extension TripPin.Person: SubtitleComponent {
    var subtitle: String? {
        return Emails.joined(separator: ", ")
    }
}

extension TripPin.Person: DetailImageComponent {
    var detailImage: Image? {
        guard let name = ProfilePic else { return nil }
        return Image(name)
    }
}

extension TripPin.Person: DescriptionTextComponent {
    var descriptionText: String? {
        return cnContact.postalAddresses.map({
            CNPostalAddressFormatter().string(from: $0.value)
        }).joined(separator: "\r")
    }
}

extension TripPin.Person {
    var actionItems: some View {
        return Group {
            Button {
                print("Calling person: \(UserName)")
            } label: {
                Image(systemName: "phone")
            }
            ForEach(Emails, id: \.self) { email in
                Button {
                    print("Mailing person: \(UserName) at email address: \(email)")
                } label: {
                    Image(systemName: "mail")
                }
            }
        }
    }
}

extension TripPin.Person {
    enum Section: Int, CaseIterable {
        case `default`
    }
}

fileprivate let peopleData = """
[{"UserName":"russellwhyte","FirstName":"Russell","LastName":"Whyte","MiddleName":null,"Gender":"Male","Age":null,"Emails":["Russell@example.com","Russell@contoso.com"],"FavoriteFeature":"Feature1","Features":["Feature1","Feature2"],"AddressInfo":[{"Address":"187 Suffolk Ln.","City":{"Name":"Boise","CountryRegion":"United States","Region":"ID"}}],"HomeAddress":null, "ProfilePic":"ProfilePic3"},{"UserName":"scottketchum","FirstName":"Scott","LastName":"Ketchum","MiddleName":null,"Gender":"Male","Age":null,"Emails":["Scott@example.com"],"FavoriteFeature":"Feature1","Features":[],"AddressInfo":[{"Address":"2817 Milton Dr.","City":{"Name":"Albuquerque","CountryRegion":"United States","Region":"NM"}}],"HomeAddress":null, "ProfilePic":"ProfilePic7"},{"UserName":"ronaldmundy","FirstName":"Ronald","LastName":"Mundy","MiddleName":null,"Gender":"Male","Age":null,"Emails":["Ronald@example.com","Ronald@contoso.com"],"FavoriteFeature":"Feature1","Features":[],"AddressInfo":[{"Address":"187 Suffolk Ln.","City":{"Name":"Boise","CountryRegion":"United States","Region":"ID"}}],"HomeAddress":null, "ProfilePic":"ProfilePic8"},{"UserName":"javieralfred","FirstName":"Javier","LastName":"Alfred","MiddleName":null,"Gender":"Male","Age":null,"Emails":["Javier@example.com","Javier@contoso.com"],"FavoriteFeature":"Feature1","Features":[],"AddressInfo":[{"Address":"89 Jefferson Way Suite 2","City":{"Name":"Portland","CountryRegion":"United States","Region":"WA"}}],"HomeAddress":null, "ProfilePic":"ProfilePic9"},{"UserName":"willieashmore","FirstName":"Willie","LastName":"Ashmore","MiddleName":null,"Gender":"Male","Age":null,"Emails":[],"FavoriteFeature":"Feature1","Features":[],"AddressInfo":[],"HomeAddress":null, "ProfilePic":"ProfilePic10"},{"UserName":"vincentcalabrese","FirstName":"Vincent","LastName":"Calabrese","MiddleName":null,"Gender":"Male","Age":null,"Emails":["Vincent@example.com","Vincent@contoso.com", "vinny@me.com"],"FavoriteFeature":"Feature1","Features":[],"AddressInfo":[{"Address":"55 Grizzly Peak Rd.","City":{"Name":"Butte","CountryRegion":"United States","Region":"MT"}}],"HomeAddress":null, "ProfilePic":"ProfilePic6"},{"UserName":"clydeguess","FirstName":"Clyde","LastName":"Guess","MiddleName":null,"Gender":"Male","Age":null,"Emails":[],"FavoriteFeature":"Feature1","Features":[],"AddressInfo":[],"HomeAddress":{"Address":null,"City":null}},{"UserName":"keithpinckney","FirstName":"Keith","LastName":"Pinckney","MiddleName":null,"Gender":"Male","Age":null,"Emails":["Keith@example.com","Keith@contoso.com"],"FavoriteFeature":"Feature1","Features":[],"AddressInfo":[{"Address":"55 Grizzly Peak Rd.","City":{"Name":"Butte","CountryRegion":"United States","Region":"MT"}}],"HomeAddress":null, "ProfilePic":"ProfilePic16"},{"UserName":"marshallgaray","FirstName":"Marshall","LastName":"Garay","MiddleName":null,"Gender":"Male","Age":null,"Emails":["Marshall@example.com","Marshall@contoso.com"],"FavoriteFeature":"Feature1","Features":[],"AddressInfo":[{"Address":"55 Grizzly Peak Rd.","City":{"Name":"Butte","CountryRegion":"United States","Region":"MT"}}],"HomeAddress":null, "ProfilePic":"ProfilePic17"},{"UserName":"ryantheriault","FirstName":"Ryan","LastName":"Theriault","MiddleName":null,"Gender":"Male","Age":null,"Emails":["Ryan@example.com","Ryan@contoso.com"],"FavoriteFeature":"Feature1","Features":[],"AddressInfo":[{"Address":"55 Grizzly Peak Rd.","City":{"Name":"Butte","CountryRegion":"United States","Region":"MT"}}],"HomeAddress":null, "ProfilePic":"ProfilePic18"},{"UserName":"elainestewart","FirstName":"Elaine","LastName":"Stewart","MiddleName":null,"Gender":"Female","Age":null,"Emails":["Elaine@example.com","Elaine@contoso.com"],"FavoriteFeature":"Feature1","Features":[],"AddressInfo":[{"Address":"55 Grizzly Peak Rd.","City":{"Name":"Butte","CountryRegion":"United States","Region":"MT"}}],"HomeAddress":null, "ProfilePic":"ProfilePic1"},{"UserName":"salliesampson","FirstName":"Sallie","LastName":"Sampson","MiddleName":null,"Gender":"Female","Age":null,"Emails":["Sallie@example.com","Sallie@contoso.com"],"FavoriteFeature":"Feature1","Features":[],"AddressInfo":[{"Address":"87 Polk St. Suite 5","City":{"Name":"San Francisco","CountryRegion":"United States","Region":"CA"}},{"Address":"89 Chiaroscuro Rd.","City":{"Name":"Portland","CountryRegion":"United States","Region":"OR"}}],"HomeAddress":null, "ProfilePic":"ProfilePic2"},{"UserName":"jonirosales","FirstName":"Joni","LastName":"Rosales","MiddleName":null,"Gender":"Female","Age":null,"Emails":["Joni@example.com","Joni@contoso.com"],"FavoriteFeature":"Feature1","Features":[],"AddressInfo":[{"Address":"55 Grizzly Peak Rd.","City":{"Name":"Butte","CountryRegion":"United States","Region":"MT"}}],"HomeAddress":null, "ProfilePic":"ProfilePic4"},{"UserName":"georginabarlow","FirstName":"Georgina","LastName":"Barlow","MiddleName":null,"Gender":"Female","Age":null,"Emails":["Georgina@example.com","Georgina@contoso.com"],"FavoriteFeature":"Feature1","Features":[],"AddressInfo":[{"Address":"55 Grizzly Peak Rd.","City":{"Name":"Butte","CountryRegion":"United States","Region":"MT"}}],"HomeAddress":null, "ProfilePic":"ProfilePic5"},{"UserName":"angelhuffman","FirstName":"Angel","LastName":"Huffman","MiddleName":null,"Gender":"Female","Age":null,"Emails":["Angel@example.com"],"FavoriteFeature":"Feature1","Features":[],"AddressInfo":[{"Address":"55 Grizzly Peak Rd.","City":{"Name":"Butte","CountryRegion":"United States","Region":"MT"}}],"HomeAddress":null, "ProfilePic":"ProfilePic6"},{"UserName":"laurelosborn","FirstName":"Laurel","LastName":"Osborn","MiddleName":null,"Gender":"Female","Age":null,"Emails":["Laurel@example.com","Laurel@contoso.com"],"FavoriteFeature":"Feature1","Features":[],"AddressInfo":[{"Address":"87 Polk St. Suite 5","City":{"Name":"San Francisco","CountryRegion":"United States","Region":"CA"}}],"HomeAddress":null, "ProfilePic":"ProfilePic11"},{"UserName":"sandyosborn","FirstName":"Sandy","LastName":"Osborn","MiddleName":null,"Gender":"Female","Age":null,"Emails":["Sandy@example.com","Sandy@contoso.com"],"FavoriteFeature":"Feature1","Features":[],"AddressInfo":[{"Address":"87 Polk St. Suite 5","City":{"Name":"San Francisco","CountryRegion":"United States","Region":"CA"}}],"HomeAddress":null, "ProfilePic":"ProfilePic12"},{"UserName":"ursulabright","FirstName":"Ursula","LastName":"Bright","MiddleName":null,"Gender":"Female","Age":null,"Emails":["Ursula@example.com","Ursula@contoso.com"],"FavoriteFeature":"Feature1","Features":[],"AddressInfo":[{"Address":"87 Polk St. Suite 5","City":{"Name":"San Francisco","CountryRegion":"United States","Region":"CA"}}],"HomeAddress":null, "ProfilePic":"ProfilePic19"},{"@odata.type":"#Microsoft.OData.Service.Sample.TrippinInMemory.Models.Manager","UserName":"genevievereeves","FirstName":"Genevieve","LastName":"Reeves","MiddleName":null,"Gender":"Female","Age":null,"Emails":["Genevieve@example.com","Genevieve@contoso.com"],"FavoriteFeature":"Feature1","Features":[],"Budget":0,"AddressInfo":[{"Address":"87 Polk St. Suite 5","City":{"Name":"San Francisco","CountryRegion":"United States","Region":"CA"}}],"HomeAddress":null, "ProfilePic":"ProfilePic24","BossOffice":null},{"@odata.type":"#Microsoft.OData.Service.Sample.TrippinInMemory.Models.Employee","UserName":"kristakemp","FirstName":"Krista","LastName":"Kemp","MiddleName":null,"Gender":"Female","Age":null,"Emails":["Krista@example.com"],"FavoriteFeature":"Feature1","Features":[],"Cost":0,"AddressInfo":[{"Address":"87 Polk St. Suite 5","City":{"Name":"San Francisco","CountryRegion":"United States","Region":"CA"}}],"HomeAddress":null, "ProfilePic":"ProfilePic13"}]
""".data(using: .utf8)!

