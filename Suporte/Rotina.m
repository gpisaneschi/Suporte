//
//  Rotina.m
//  Suporte
//
//  Created by Equipe Suporte Aplicacao on 26/03/17.
//  Copyright © 2017 Equipe Suporte Aplicacao. All rights reserved.
//

#import "Rotina.h"

@implementation Rotina


+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"codigo": @"Codigo",
                                                                  @"descricao": @"Descricao",
                                                                  @"solucao": @"O_que_fazer_no_caso_de_problemas",
                                                                  @"tipo": @"Tipo",
                                                                  @"bancoDeDados": @"Banco_de_Dados",
                                                                  @"servidorSql": @"Servidor_SQL",
                                                                  @"equipeResponsavel": @"Equipe_Responsavel"
                                                                  }];
}

//+(JSONKeyMapper*)keyMapper
//{
//    return [JSONKeyMapper mapperForSnakeCase];
//}

@end


@implementation Rotinas

+ (JSONKeyMapper *)keyMapper
{
    
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                @"rotinas": @"Rotina"
                                                                }];
}

@end