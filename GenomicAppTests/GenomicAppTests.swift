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
        let compareText = "atgcatgcatgcatgcatgcatgcatgcatgcatgcatgcatgcatgcatgcatgcatgaactgctattgcctggaactgctattgcctggaactgctattgcctggaactgctattgcctggaactgctattgcctggaactgctattgcctggaactgctattgcctggatgcatgcatgcatgcatgcatgcatgcatgcatgcatgcat".uppercased()
        XCTAssertEqual(sequenceText, compareText)
    }
    
    func testQualityColor100() {
        let r = FastaProcessor.getRed(percentage: 1)
        let g = FastaProcessor.getGreen(percentage: 1)
        XCTAssertEqual(r, 0)
        XCTAssertEqual(g, 1)
    }
    
    func testQualityColor0() {
        let r = FastaProcessor.getRed(percentage: 0)
        let g = FastaProcessor.getGreen(percentage: 0)
        XCTAssertEqual(r, 1)
        XCTAssertEqual(g, 0)
    }
    
    func testQualityColor50() {
        let r = FastaProcessor.getRed(percentage: 0.5)
        let g = FastaProcessor.getGreen(percentage: 0.5)
        XCTAssertEqual(r, 1)
        XCTAssertEqual(g, 1)
    }
    
    
    func testQuality1() {
        let caracter = "+"
        let number = FastaProcessor.getQuality(character: caracter)
        XCTAssertEqual(10, number)
    }
    
    func testQuality2() {
        let caracter = "#"
        let number = FastaProcessor.getQuality(character: caracter)
        XCTAssertEqual(2, number)
    }
    
    func testQuality3() {
        let caracter = "3"
        let number = FastaProcessor.getQuality(character: caracter)
        XCTAssertEqual(18, number)
    }
    
    func testValidateSequence() throws{
        
        let sequenceNucleotide = Sequence.sample1.text
        var isValid = FastaProcessor.validateNucleotideSequence(sequence: sequenceNucleotide)
        XCTAssertTrue(isValid, "This was a valid sequence \(sequenceNucleotide) but was rejected")
        
    }
    
    func testInvalidSequence() throws{
        
        let sequenceNucleotide = "LUCAS¿56456"
        var isValid = FastaProcessor.validateNucleotideSequence(sequence: sequenceNucleotide)
        XCTAssertFalse(isValid, "This was an invalid sequence \(sequenceNucleotide) but was accepted")
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
