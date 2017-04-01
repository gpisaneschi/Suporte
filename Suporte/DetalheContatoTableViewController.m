//
//  DetalheContatoTableViewController.m
//  Suporte
//
//  Created by Equipe Suporte Aplicacao on 01/04/17.
//  Copyright © 2017 Equipe Suporte Aplicacao. All rights reserved.
//

#import "DetalheContatoTableViewController.h"

@interface DetalheContatoTableViewController ()

@end

@implementation DetalheContatoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.nomeLabel.text = self.detalheContato.colaborador;
    self.equipeLabel.text = self.detalheContato.equipe;
    self.prioridadeLabel.text = self.detalheContato.prioridAcionamento;
    self.ramalLabel.text = self.detalheContato.ramal;
    self.telefoneLabel.text = self.detalheContato.telResidencial;
    self.celularLabel.text = self.detalheContato.celular;
    
    if (self.telefoneLabel.text.length == 0) {
        //self.telefoneCell.;
    }
    

}



#pragma mark - Table view data source


@end
