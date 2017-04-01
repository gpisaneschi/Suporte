//
//  Contato.h
//  Suporte
//
//  Created by Equipe Suporte Aplicacao on 01/04/17.
//  Copyright © 2017 Equipe Suporte Aplicacao. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol Contato;

@interface Contato : JSONModel

@property (nonatomic) NSString <Optional> *equipe;
@property (nonatomic) NSString <Optional> *colaborador;
@property (nonatomic) NSString <Optional> *prioridAcionamento;
@property (nonatomic) NSString <Optional> *ramal;
@property (nonatomic) NSString <Optional> *telResidencial;
@property (nonatomic) NSString <Optional> *celular;


@end

@interface Contatos : JSONModel

@property (nonatomic) NSArray <Contato> *contatos;

@end

