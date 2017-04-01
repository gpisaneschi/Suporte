//
//  Transacao.m
//  Suporte
//
//  Created by Equipe Suporte Aplicacao on 30/03/17.
//  Copyright © 2017 Equipe Suporte Aplicacao. All rights reserved.
//

#import "Transacao.h"

@interface Transacao ()

@end

@implementation Transacao

+(JSONKeyMapper *)keyMapper {
    
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"codigo": @"Codigo",
                                                                  @"descricao": @"Descricao",
                                                                  @"equipeResponsavel": @"Equipe Responsável"
                                                                  }];
    
}
@end


@implementation Transacoes

+ (JSONKeyMapper *)keyMapper
{
    
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"transacoes": @"Transacao"
                                                                  }];
}

@end
