//
//  TransacoesViewController.h
//  Suporte
//
//  Created by Equipe Suporte Aplicacao on 30/03/17.
//  Copyright © 2017 Equipe Suporte Aplicacao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"
#import "Transacao.h"
#import "DetalheTransacaoTableViewController.h"

@interface TransacoesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
