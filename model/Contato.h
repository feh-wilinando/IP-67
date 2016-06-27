//
//  Contato.h
//  ContatosApp
//
//  Created by Fernando on 06/06/16.
//  Copyright © 2016 Fernando. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
@import MapKit;


@interface Contato : NSObject<MKAnnotation>

@property (nonatomic, strong) NSString *nome;
@property (nonatomic, strong) NSString *telefone;
@property (nonatomic, strong) NSString *endereco;
@property (nonatomic, strong) NSString *site;
@property (nonatomic, strong) UIImage *foto;
@property (nonatomic, strong) NSNumber *latitude;
@property (nonatomic, strong) NSNumber *longitude;

-(instancetype)initWithNome: (NSString*) nome
                         telefone:(NSString*)  telefone
                         endereco:(NSString*)  endereco
                            site:(NSString*)  site;


@end
