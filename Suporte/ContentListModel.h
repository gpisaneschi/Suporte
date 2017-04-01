//
//  ContentListModel.h
//  Suporte
//
//  Created by Equipe Suporte Aplicacao on 26/03/17.
//  Copyright © 2017 Equipe Suporte Aplicacao. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol ContentListModel

@end

@interface ContentListModel : JSONModel



@property (nonatomic,strong)NSString* codigo;
@property (nonatomic,strong)NSString* descricao;
@property (nonatomic,strong)NSString <Optional> *tipo;
@property (nonatomic,strong)NSString <Optional> *bancoDeDados;
@property (nonatomic,strong)NSString <Optional> *servidorSql;
@property (nonatomic,strong)NSString <Optional> *equipeResponsavel;



@end
