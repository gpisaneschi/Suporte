//
//  TransacoesViewController.m
//  Suporte
//
//  Created by Equipe Suporte Aplicacao on 30/03/17.
//  Copyright © 2017 Equipe Suporte Aplicacao. All rights reserved.
//

#import "TransacoesViewController.h"

@interface TransacoesViewController ()

@property (strong, nonatomic) NSArray *transacoes;
@property (strong, nonatomic) NSArray *searchResults;
@property (strong, nonatomic) UISearchController *searchController;
@property (strong, nonatomic) UILabel* label;
@property (strong, nonatomic) NSString *search;


@end

@implementation TransacoesViewController

#pragma mark - Metodos Iniciais -

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    
    //Chama o metodo para carregar o Json
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomCell"
                                               bundle:[NSBundle mainBundle]]
         forCellReuseIdentifier:@"CustomCell"];
    
    [self carregaJson];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        return self.transacoes.count;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier;
    UITableViewCell *cell;
    Transacao *transacao;
    
    cellIdentifier = @"CustomCell";
    cell = [_tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (self.searchController.isActive) {
        transacao = [self.searchResults objectAtIndex:indexPath.row];
    }
    else{
        transacao = self.transacoes[indexPath.row];
    }

    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellIdentifier];
    }
    ((UITableViewCell *)cell).textLabel.text = transacao.codigo;
    
    return cell;

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

#pragma mark - SearchResults -

-(NSArray *)searchResults{
    self.search = self.searchController.searchBar.text;
    [self carregaJson];
    
    if (self.search.length > 0) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"codigo CONTAINS[c] %@", self.search];
        self.transacoes = [self.transacoes filteredArrayUsingPredicate:predicate];
        return self.transacoes;
    }
    else{
        return self.transacoes;
    }
    return @[];
}

#pragma mark - UISearchControllerDelegate -

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    [self.tableView reloadData];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self carregaJson];
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.searchController.searchBar.text = self.search;
}


#pragma mark - Carrega Json -

-(void)carregaJson{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Transacao" ofType:@"json"];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        NSError *error = nil;
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if (error) {
            return;
        }
        
        Transacoes *transacoes = [[Transacoes alloc] initWithDictionary:json error:&error];
        
        if (error) {
            return;
        }
        self.transacoes = transacoes.transacoes;
    }
    
}

#pragma mark - SelectRow -

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Transacao *transacao = self.transacoes[indexPath.row];
    
    [self performSegueWithIdentifier:@"detalheTransacao" sender:transacao];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"detalheTransacao"]) {
        Transacao *transacao = (Transacao *)sender;
        DetalheTransacaoTableViewController *detalheTransacao =
                    (DetalheTransacaoTableViewController *)segue.destinationViewController;
        
        detalheTransacao.detalheTransacao = transacao;
    }
    
}



@end
