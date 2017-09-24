//
//  DetalheContatoTableViewController.h
//  Suporte
//
//  Created by Equipe Suporte Aplicacao on 01/04/17.
//  Copyright © 2017 Equipe Suporte Aplicacao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contato.h"
#import "ContatosViewController.h"

@interface DetalheContatoTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) Contato *detalheContato;
@property (weak, nonatomic) IBOutlet UITableViewCell *nomeCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *equipeCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *prioridadeCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *ramalCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *telefoneCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *celularCell;
@property (weak, nonatomic) IBOutlet UILabel *nomeLabel;
@property (weak, nonatomic) IBOutlet UILabel *equipeLabel;
@property (weak, nonatomic) IBOutlet UILabel *prioridadeLabel;
@property (weak, nonatomic) IBOutlet UILabel *ramalLabel;
@property (weak, nonatomic) IBOutlet UILabel *telefoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *celularLabel;
-(IBAction)callPhone:(id)sender;

@end
