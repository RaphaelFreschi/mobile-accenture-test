//
//  DecodableComic.swift
//  Marvel APP
//
//  Created by Raphael Freschi on 22/03/21.
//

import Foundation

struct comicsData: Decodable {
    var data: comicsResults
}

struct comicsResults: Decodable {
    var results: [comicsInfos]
    
}

struct comicsInfos: Decodable{
    var thumbnail: imageComic
    var prices: [price]
    var id: Int
    var pagesCount: Int
    var title: String
    var desc: String
    var creators: [creatorsList]
}

struct price: Decodable {
    var price: String
}

struct creatorsList: Decodable {
    var items: [nameCreator]
}

struct nameCreator: Decodable {
    var name: String
}

struct imageComic:Decodable {
    var path: String
}

