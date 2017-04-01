//
//  DetalheViewController.m
//  Suporte
//
//  Created by Equipe Suporte Aplicacao on 27/03/17.
//  Copyright © 2017 Equipe Suporte Aplicacao. All rights reserved.
//

#import "DetalheViewController.h"

@implementation DetalheViewController

-(void)viewDidLoad{
    [super viewDidLoad];
  //[self preencheComRotina:self.detalheRotina];
    self.codigoLabel.text = self.detalheRotina.codigo;
    self.descricaoLabel.text = self.detalheRotina.descricao;
    self.tipoLabel.text = self.detalheRotina.tipo;
    self.bancoDeDadosLabel.text = self.detalheRotina.bancoDeDados;
    self.servidorSqlLabel.text = self.detalheRotina.servidorSql;
    self.solucaoLabel.text = self.detalheRotina.solucao;
    self.equipeLabel.text = self.detalheRotina.equipeResponsavel;
    
    if(self.descricaoLabel.text.length == 0){
        self.constraintTipoParaDescricao.priority = 1000;
    }
    if(self.tipoLabel.text.length == 0){
        self.constraintBancoParaTipo.priority = 1000;
    }
    if (self.bancoDeDadosLabel.text.length == 0) {
        self.constraintServidorParaBanco.priority = 1000;
    }
    if(self.servidorSqlLabel.text.length == 0){
        self.constraintSolucaoParaServidor.priority = 1000;
    }
    if (self.solucaoLabel.text.length == 0) {
        self.constraintEquipeParaSolucao.priority = 1000;
    }
}




#pragma mark - PreencherComRotina -

//- (void)preencheComRotina:(Rotina *)rotina {
//    self.codigoLabel.text = rotina.codigo;
//    
//    NSMutableString *resultado = [@"" mutableCopy];
//    
//    if (rotina.descricao.length > 0) {
//        [resultado appendFormat:@"DESCRIÇÃO: %@\r\r", rotina.descricao];
//    }
//    
//    if (rotina.solucao.length > 0) {
//        [resultado appendFormat:@"SOLUÇÃO: %@\r\r", rotina.solucao];
//    }
//    
//    if (rotina.tipo.length > 0) {
//        [resultado appendFormat:@"TIPO: %@\r\r", rotina.tipo];
//    }
//    
//    if (rotina.servidorSql.length > 0) {
//        [resultado appendFormat:@"SERVIDOR SQL: %@\r\r", rotina.servidorSql];
//    }
//    
//    if (rotina.bancoDeDados.length > 0) {
//        [resultado appendFormat:@"BANCO DE DADOS: %@\r\r", rotina.bancoDeDados];
//    }
//    
//    if (rotina.equipeResponsavel.length > 0) {
//        [resultado appendFormat:@"EQUIPE RESPONSAVEL: %@\r\r", rotina.equipeResponsavel];
//    }
//    
//    self.descricaoLabel.text = resultado;
//}

@end
