//
//  ContatosViewController.m
//  Suporte
//
//  Created by Equipe Suporte Aplicacao on 01/04/17.
//  Copyright © 2017 Equipe Suporte Aplicacao. All rights reserved.
//

#import "ContatosViewController.h"

@interface ContatosViewController ()

@property (strong, nonatomic) NSArray *contatos;
@property (strong, nonatomic) NSArray *searchResults;
@property (strong, nonatomic) UISearchController *searchController;
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) NSString *search;

@end

@implementation ContatosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ContatoTableViewCell"
                                               bundle:[NSBundle mainBundle]]
                               forCellReuseIdentifier:@"ContatoTableViewCell"];
    
    [self carregaJson];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.searchController.searchBar.text = self.search;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (!self.searchController.searchBar.superview) {
        self.tableView.tableHeaderView = self.searchController.searchBar;
    }
    if (!self.searchController.active && self.searchController.searchBar.text.length == 0) {
        self.tableView.contentOffset = CGPointMake(0, CGRectGetHeight(self.searchController.searchBar.frame));
    }
    
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (self.searchController.isActive) {
        self.searchController.active = NO;
    }
}


#pragma mark - Table View -
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.searchController.isActive && self.searchController.searchBar.text.length > 0) {
        return self.searchResults.count;
    }
    else{
        return self.contatos.count;
    }
    return 0;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier;
    cellIdentifier = @"ContatoTableViewCell";
    ContatoTableViewCell *cell;
    Contato *contato;
    
    
    //cell = [self.tableView dequeueReusableCellWithIdentifier:@"ContatoCell" forIndexPath:indexPath];
    cell = (ContatoTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    if (self.searchController.isActive) {
        contato = [self.searchResults objectAtIndex:indexPath.row];
    }
    else{
        contato = self.contatos[indexPath.row];
    }
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ContatoTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    cell.nomeLabel.text = contato.colaborador;
    cell.telefoneLabel.text = contato.celular;

    
    
    return cell;
    
}

#pragma mark - SearchResults -

-(NSArray *)searchResults{
    self.search = self.searchController.searchBar.text;
    [self carregaJson];
    
    if (self.search.length > 0) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"colaborador CONTAINS[c] %@", self.search];
        self.contatos = [self.contatos filteredArrayUsingPredicate:predicate];
        return self.contatos;
    }
    else{
        return self.contatos;
    }
    return @[];
}

#pragma mark - UISearchControllerDelegate -

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    [self.tableView reloadData];
}
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self carregaJson];
}



#pragma mark - Getters / Setters -

-(UISearchController *)searchController{
    if (!_searchController) {
        _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
        _searchController.searchResultsUpdater = self;
        _searchController.dimsBackgroundDuringPresentation = NO;
        _searchController.searchBar.delegate = self;
        [_searchController.searchBar sizeToFit];
    }
    return _searchController;
}



#pragma mark - Carrega Json -

-(void)carregaJson{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Contato" ofType:@"json"];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        NSError *error = nil;
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if (error) {
            return;
        }
        
        Contatos *contatos = [[Contatos alloc] initWithDictionary:json error:&error];
        
        if (error) {
            return;
        }
        self.contatos = contatos.contatos;
    }
    
}


#pragma mark - SelectRow -

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Contato *contato = self.contatos[indexPath.row];
    
    [self performSegueWithIdentifier:@"detalheContato" sender:contato];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"detalheContato"]) {
        Contato *contato = (Contato *)sender;
        DetalheContatoTableViewController *detalheContato =
        (DetalheContatoTableViewController *)segue.destinationViewController;
        
        detalheContato.detalheContato = contato;
    }
    
}


@end
