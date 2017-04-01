//
//  DetalheTransacaoTableViewController.m
//  Suporte
//
//  Created by Equipe Suporte Aplicacao on 31/03/17.
//  Copyright © 2017 Equipe Suporte Aplicacao. All rights reserved.
//

#import "DetalheTransacaoTableViewController.h"

@interface DetalheTransacaoTableViewController ()

@end

@implementation DetalheTransacaoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.codigoLabel.text = self.detalheTransacao.codigo;
    self.descricaoLabel.text = self.detalheTransacao.descricao;
    self.equipeResponsavelLabel.text = self.detalheTransacao.equipeResponsavel;
    
}


@end
