//
//  Transacao.h
//  Suporte
//
//  Created by Equipe Suporte Aplicacao on 30/03/17.
//  Copyright © 2017 Equipe Suporte Aplicacao. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol Transacao;

@interface Transacao : JSONModel

@property (nonatomic) NSString <Optional> *codigo;
@property (nonatomic) NSString <Optional> *descricao;
@property (nonatomic) NSString <Optional> *equipeResponsavel;

@end

@interface Transacoes : JSONModel

@property (nonatomic) NSArray <Transacao> *transacoes;

@end
