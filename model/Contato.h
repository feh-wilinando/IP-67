//
//  Contato.h
//  ContatosApp
//
//  Created by Fernando on 06/06/16.
//  Copyright © 2016 Fernando. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contato : NSObject

@property (nonatomic, strong) NSString *nome;
@property (nonatomic, strong) NSString *telefone;
@property (nonatomic, strong) NSString *endereco;
@property (nonatomic, strong) NSString *site;

+(instancetype)novoContatoComNome: (NSString*) nome
                         Telefone:(NSString*)  telefone
                         Endereco:(NSString*)  endereco
                            eSite:(NSString*)  site;

@end
