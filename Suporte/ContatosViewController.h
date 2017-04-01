//
//  ContatosViewController.h
//  Suporte
//
//  Created by Equipe Suporte Aplicacao on 01/04/17.
//  Copyright © 2017 Equipe Suporte Aplicacao. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "Contato.h"
#import "CustomCell.h"
#import "ContatoTableViewCell.h"
#import "DetalheContatoTableViewController.h"

@interface ContatosViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
