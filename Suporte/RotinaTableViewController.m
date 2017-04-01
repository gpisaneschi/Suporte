//
//  RotinaTableViewController.m
//  Suporte
//
//  Created by Equipe Suporte Aplicacao on 25/03/17.
//  Copyright © 2017 Equipe Suporte Aplicacao. All rights reserved.
//

#import "RotinaTableViewController.h"
#import "Rotina.h"
#import "DetalheViewController.h"

@interface RotinaTableViewController ()

@property (strong, nonatomic) NSArray *rotinas;
@property (strong, nonatomic) NSArray *searchResults;
@property (strong, nonatomic) UISearchController *searchController;
@property (strong, nonatomic) UILabel* label;
@property (strong, nonatomic) NSString *search;


@end

@implementation RotinaTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"Rotina" ofType:@"json"];
//    
//    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
//        
//        NSData *data = [NSData dataWithContentsOfFile:path];
//        
//        NSError *error = nil;
//        
//        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
//        
//        if (error) {
//            return;
//        }
//        
//        Rotinas *rotinas = [[Rotinas alloc] initWithDictionary:json error:&error];
//        
//        if (error) {
//            return;
//        }
//        
//      self.rotinas = rotinas.rotinas;
//    }
    //Chama o metodo para carregar o Json
    [self carregaJson];


    [self.tableView registerNib:[UINib nibWithNibName:@"CustomCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"CustomCell"];
}



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (!self.searchController.searchBar.superview) {
        self.tableView.tableHeaderView = self.searchController.searchBar;
    }
    if (!self.searchController.active && self.searchController.searchBar.text.length == 0) {
        self.tableView.contentOffset = CGPointMake(0, CGRectGetHeight(self.searchController.searchBar.frame));
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (self.searchController.isActive) {
        self.searchController.active = NO;
    }
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

-(NSArray *)searchResults{
    self.search= self.searchController.searchBar.text;
    [self carregaJson];
    //NSArray *filtroRotina;
    if (self.search.length > 0) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"codigo CONTAINS[c] %@", self.search];
        self.rotinas = [self.rotinas filteredArrayUsingPredicate:predicate];
        return self.rotinas;
    }
    else{
        return self.rotinas;
    }
    return @[];
}

#pragma mark - Table view data source -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.searchController.isActive && self.searchController.searchBar.text.length > 0) {
        return self.searchResults.count;
    }
    else{
        return self.rotinas.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier;
    UITableViewCell *cell;
    Rotina *rotina;
    
    cellIdentifier = @"CustomCell";
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (self.searchController.isActive) {
        rotina = [self.searchResults objectAtIndex:indexPath.row];
    }
    else{
        rotina = self.rotinas[indexPath.row];
        //codigo = [self.rotinas objectAtIndex:indexPath.row];
    }
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellIdentifier];
    }
    
    ((UITableViewCell *)cell).textLabel.text = rotina.codigo;
    
//
//    Rotina *rotina = self.rotinas[indexPath.row];
//    
//    cell.textLabel.text = rotina.codigo;
//    
    return cell;
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
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Rotina" ofType:@"json"];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        NSError *error = nil;
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if (error) {
            return;
        }
        
        Rotinas *rotinas = [[Rotinas alloc] initWithDictionary:json error:&error];
        
        if (error) {
            return;
        }
        self.rotinas = rotinas.rotinas;
    }

}

#pragma mark - SelectRow -

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Rotina *rotina = self.rotinas[indexPath.row];
    
    [self performSegueWithIdentifier:@"detalheRotina" sender:rotina];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"detalheRotina"]){
        Rotina *rotina = (Rotina *)sender;
        DetalheViewController *detalhe = (DetalheViewController *)segue.destinationViewController;
        detalhe.detalheRotina = rotina;
    }
}


@end
