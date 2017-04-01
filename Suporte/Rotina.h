//
//  Rotina.h
//  Suporte
//
//  Created by Equipe Suporte Aplicacao on 26/03/17.
//  Copyright © 2017 Equipe Suporte Aplicacao. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol Rotina;

@interface Rotina : JSONModel

@property (nonatomic) NSString <Optional> *codigo;
@property (nonatomic) NSString <Optional> *descricao;
@property (nonatomic) NSString <Optional> *solucao;
@property (nonatomic) NSString <Optional> *tipo;
@property (nonatomic) NSString <Optional> *bancoDeDados;
@property (nonatomic) NSString <Optional> *servidorSql;
@property (nonatomic) NSString <Optional> *equipeResponsavel;

@end


@interface Rotinas : JSONModel

@property (nonatomic) NSArray <Rotina> *rotinas;

@end
