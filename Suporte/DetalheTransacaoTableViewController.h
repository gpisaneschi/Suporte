//
//  DetalheTransacaoTableViewController.h
//  Suporte
//
//  Created by Equipe Suporte Aplicacao on 31/03/17.
//  Copyright © 2017 Equipe Suporte Aplicacao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Transacao.h"
#import "TransacoesViewController.h"

@interface DetalheTransacaoTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>


@property (strong, nonatomic) Transacao *detalheTransacao;
@property (weak, nonatomic) IBOutlet UITableViewCell *codigoCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *descricaoCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *equipeResponsavelCell;
@property (weak, nonatomic) IBOutlet UILabel *codigoLabel;
@property (weak, nonatomic) IBOutlet UILabel *descricaoLabel;
@property (weak, nonatomic) IBOutlet UILabel *equipeResponsavelLabel;

@end
