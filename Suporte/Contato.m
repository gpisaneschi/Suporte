//
//  Contato.m
//  Suporte
//
//  Created by Equipe Suporte Aplicacao on 01/04/17.
//  Copyright © 2017 Equipe Suporte Aplicacao. All rights reserved.
//

#import "Contato.h"


@interface Contato ()

@end

@implementation Contato

+(JSONKeyMapper *)keyMapper {
    
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"equipe": @"Equipe",
                                                                  @"colaborador": @"Colaborador",
                                                                  @"prioridAcionamento": @"Priorid. Acionam.",
                                                                  @"ramal": @"Ramal",
                                                                  @"telResidencial": @"Tel.Resid.",
                                                                  @"celular": @"Celular"
                                                                  }];
    
}
@end


@implementation Contatos

+ (JSONKeyMapper *)keyMapper
{
    
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"contatos": @"Contatos"
                                                                  }];
}

@end



