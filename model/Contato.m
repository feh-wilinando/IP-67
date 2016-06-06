//
//  Contato.m
//  ContatosApp
//
//  Created by Fernando on 06/06/16.
//  Copyright © 2016 Fernando. All rights reserved.
//

#import "Contato.h"

@implementation Contato

+(instancetype)novoContatoComNome:(NSString *)nome Telefone:(NSString *)telefone Endereco:(NSString *)endereco eSite:(NSString *)site{
    
    
    Contato *contato = [Contato new];
    
    contato.nome = nome;
    contato.telefone = telefone;
    contato.endereco = endereco;
    contato.site = site;
    
    return contato;
}

@end
