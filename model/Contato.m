//
//  Contato.m
//  ContatosApp
//
//  Created by Fernando on 06/06/16.
//  Copyright © 2016 Fernando. All rights reserved.
//

#import "Contato.h"

@implementation Contato

-(instancetype)initWithNome:(NSString *)nome telefone:(NSString *)telefone endereco:(NSString *)endereco site:(NSString *)site{
    
    
    Contato *contato = [Contato new];
    
    contato.nome = nome;
    contato.telefone = telefone;
    contato.endereco = endereco;
    contato.site = site;
    
    return contato;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"[%@, %@, %@, %@]",  self.nome,
                                                            self.telefone,
                                                            self.endereco,
                                                            self.site];
}

@end
