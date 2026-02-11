//
//
// MovieEndpointTests.swift
// MovieNetworkProviderTests
//
// Created by Tomasz Ogrodowski on 11/02/2026
// Copyright © 2026 Tomasz Ogrodowski. All rights reserved.
//
        

import Testing
@testable import MovieNetworkProvider
internal import Foundation

struct MovieEndpointTests {

    @Test func endpoint_topRated_test() async throws {
        let randomPage: Int = Int.random(in: 1...100)
        let language: String = "pl-PL"
        let endpoint = MovieEndpoint.topRated(language: language, page: randomPage)
        #expect(endpoint.path == "/3/movie/top_rated")
        #expect(endpoint.queryItems != nil)
        #expect(endpoint.queryItems?.count == 2)
        #expect(endpoint.queryItems?[0].name == "language" && endpoint.queryItems?[0].value == language)
        #expect(endpoint.queryItems?[1].name == "page" && endpoint.queryItems?[1].value == "\(randomPage)")
    }

    @Test func endpoint_popular_test() async throws {
        let randomPage: Int = Int.random(in: 1...100)
        let language: String = "pl-PL"
        let endpoint = MovieEndpoint.popular(language: language, page: randomPage)
        #expect(endpoint.path == "/3/movie/popular")
        #expect(endpoint.queryItems != nil)
        #expect(endpoint.queryItems?.count == 2)
        #expect(endpoint.queryItems?[0].name == "language" && endpoint.queryItems?[0].value == language)
        #expect(endpoint.queryItems?[1].name == "page" && endpoint.queryItems?[1].value == "\(randomPage)")
    }

}
