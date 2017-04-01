//
//  DetalheViewController.h
//  Suporte
//
//  Created by Equipe Suporte Aplicacao on 27/03/17.
//  Copyright © 2017 Equipe Suporte Aplicacao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Rotina.h"
#import "RotinaTableViewController.h"

@interface DetalheViewController : UIViewController

@property (nonatomic,strong) Rotina *detalheRotina;
@property (weak, nonatomic) IBOutlet UILabel *codigoLabel;
@property (weak, nonatomic) IBOutlet UILabel *descricaoLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipoLabel;
@property (weak, nonatomic) IBOutlet UILabel *bancoDeDadosLabel;
@property (weak, nonatomic) IBOutlet UILabel *servidorSqlLabel;
@property (weak, nonatomic) IBOutlet UILabel *solucaoLabel;
@property (weak, nonatomic) IBOutlet UILabel *equipeLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTipoParaDescricao;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintBancoParaTipo;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintServidorParaBanco;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintSolucaoParaServidor;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintEquipeParaSolucao;




@end
