//
//  GenomicAppTests.swift
//  GenomicAppTests
//
//  Created by Lucas on 11/07/2022.
//

import XCTest
@testable import GenomicApp

class GenomicAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSequence1() throws {
        let sequenceText = Sequence.sample1.text
        let compareText = "atgcatgcatgcatgcatgcatgcatgcatgcatgcatgcatgcatgcatgcatgcatgaactgctattgcctggaactgctattgcctggaactgctattgcctggaactgctattgcctggaactgctattgcctggaactgctattgcctggaactgctattgcctggatgcatgcatgcatgcatgcatgcatgcatgcatgcatgcat"
        XCTAssertEqual(sequenceText, compareText)
    }
    
    func testSequence2() throws {
        let sequenceText = Sequence.sample2.text
        let compareText = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaagggggggggggggggggggggggtttttttttttttttttttttttttccccccccccccccccccc"
        XCTAssertEqual(sequenceText, compareText)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
