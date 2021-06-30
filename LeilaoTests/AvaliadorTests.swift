//
//  AvaliadorTests.swift
//  LeilaoTests
//
//  Created by user on 30/06/21.
//

import XCTest
@testable import Leilao

class AvaliadorTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {
        
    }

    func testPerformanceExample() throws {
        self.measure {
        }
    }
    
    func testDeveEntenderLancesEmOrdemCrescente() {
        
        // Cenario
        
        let joao = Usuario(nome: "Joao")
        let jose = Usuario(nome: "Jose")
        let maria = Usuario(nome: "Maria")
        
        let leilao = Leilao(descricao: "Playstation 5")
        leilao.propoe(lance: Lance(maria, 250.0))
        leilao.propoe(lance: Lance(joao, 300.0))
        leilao.propoe(lance: Lance(jose, 400.0))
        
        // Acao
        
        let leiloeiro = Avaliador()
        leiloeiro.avalia(leilao: leilao)
        
        // Validacao
    
        XCTAssertEqual(250, leiloeiro.menorLance())
        XCTAssertEqual(400, leiloeiro.maiorLance())
    }
    
    func testDeveEntenderLeilaoComApenasUmLance() {
            let joao = Usuario(nome: "Joao")
            let leilao = Leilao(descricao: "Playstation 5")
            leilao.propoe(lance: Lance(joao, 1000.0))

            let leiloeiro = Avaliador()
            leiloeiro.avalia(leilao: leilao)

            XCTAssertEqual(1000.0, leiloeiro.menorLance())
            XCTAssertEqual(1000.0, leiloeiro.maiorLance())
    }
}
