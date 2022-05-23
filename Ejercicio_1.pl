/*BASE DE CONOCIMIENTOS*/
/*RAMA IZQUIERDA*/
verificar(espesor_menor_lim_umbral):-
    estado(espesor_menor_lim_umbral,ok),writeln('Estado del equipo sin efectos de oxidacion. \n
                                                 Espesor menor que limite del umbral. \n
                                                 Reportar equipo a la Unidad de Inspeccion Tecnica.');
    estado(espesor_menor_lim_umbral,no),writeln('Estado del equipo sin efectos de oxidacion. \n
                                                 Espesor mayor que limite del umbral. \n
                                                 Estado del equipo adecuado.');
    (estado(espesor_menor_lim_umbral,desconocido),writeln('No se conoce el espesor, se debe verificar')),
    (estado(estado_equipo_sin_efectos_oxidacion,no); verificar(estado_equipo_sin_efectos_oxidacion))

verificar(estado_equipo_sin_efectos_oxidacion):-
    estado(estado_equipo_sin_efectos_oxidacion,ok),writeln('Estado del equipo con efectos de oxidacion. \n
                                                            Se debe pintar el equipo.')
    estado(estado_equipo_sin_efectos_oxidacion,desconocido),writeln('No se conoce el estado del equipo, verificarlo')

/*RAMA CENTRAL IZQUIERDA*/
verificar(funcionamiento_correcto_piloto):-
    estado(funcionamiento_correcto_piloto,ok),writeln('El piloto funciona correctamente. \n
                                                       Ajustar la valvula de seguridad de acuerdo con las instrucciones');
    estado(funcionamiento_correcto_piloto,no),writeln('El piloto no funciona correctamente. \n
                                                       Hacer servicio completo y reinstalar piloto');
    estado(funcionamiento_correcto_piloto,desconocido),writeln('No se conoce el estado del piloto,verificar'),
    (estado(existe_fuga_prevencion_adecuada_entre_asiento_orificio,ok),writeln('Existe una fuga de prevencion entre asiento y orificio');
    verificar(existe_fuga_prevencion_adecuada_entre_asiento_orificio)).

verificar(existe_fuga_prevencion_adecuada_entre_asiento_orificio):-
    estado(existe_fuga_prevencion_adecuada_entre_asiento_orificio,no),writeln('Existe una fuga de prevencion entre asiento y orificio. \n
                                                                               Reemplazar asciento y orificio. Colocar valvula de seguridad en circuito')
    estado(existe_fuga_prevencion_adecuada_entre_asiento_orificio,desconocido),writeln('No se conoce prevencion de fuga entre asciento y orificio'),
    (estado(desempeno_eficiencia_resorte_valvula_seguridad,ok),writeln('Es bueno el desempeno y eficiencia del resorte de la valvula de seguridad'); verificar(desempeno_eficiencia_resorte_valvula_seguridad))

verificar(desempeno_eficiencia_resorte_valvula_seguridad):-
    estado(desempeno_eficiencia_resorte_valvula_seguridad,no),writeln('No es bueno el desempeno y eficiencia del resorte de la valvula de seguridad. \n
                                                                       Dar mantenimiento al resorte de seguridad y a la valvula de seguridad');
    estado(desempeno_eficiencia_resorte_valvula_seguridad,desconocido),writeln('No se conoce el estado del resorte de la valvula de seguridad, verifificar'),
    (estado(sensores_valvula_control_blokeados,no),writeln('Los sensores de la valvula de control no están bloqueados');verificar(sensores_valvula_control_blokeados)).                                                                  

verificar(sensores_valvula_control_blokeados):-
    estado(sensores_valvula_control_blokeados,ok),writeln('Los sensores de la valvula de control están bloqueados. \n
                                                           Limpiar y solucionar problemas de tuberias de detección.');
    estado(sensores_valvula_control_blokeados,desconocido),writeln('No se conoce el estado de los sensores de la valvula de control, verificar'),
    (estado(valvula_posicion_cerrar,no),write('La valvula no esta en la posicion "CERRAR"');verificar(valvula_posicion_cerrar)).                                                       

verificar(valvula_posicion_cerrar):-
    estado(valvula_posicion_cerrar,ok),writeln('La valvula esta en la posicion "CERRAR".\n
                                                Colocar la valvula de seguridad en posicion "ABRIR".');
    estado(valvula_posicion_cerrar,desconocido),write('No se conoce la posicion de la valvula'),
    (estado(valvula_alivio_aumento_presion_10_superior_presion_regulacion,no),writeln('No funciona correctamente la válvula de alivio con un aumento de presión del 10% superior a la presión de regulación');
    verificar(valvula_alivio_aumento_presion_10_superior_presion_regulacion))

verificar(valvula_alivio_aumento_presion_10_superior_presion_regulacion):-
    estado(valvula_alivio_aumento_presion_10_superior_presion_regulacion,ok),writeln('Funciona correctamente la válvula de alivio con un aumento de presión del 10% superior a la presión de regulación.\n
                                                                                      La función de seguridad es adecuada');
    estado(valvula_alivio_aumento_presion_10_superior_presion_regulacion,desconocido),writeln('No se conoce el comportamiento de la valvula de alivio ante incremento del 10% de presion,verificar'),
    (estado(valvula_seguridad_evacuacion_gas_continua,no),writeln('La valvula de setidad no tiene una evacuacion de gas continua');verificar(valvula_seguridad_evacuacion_gas_continua)).

verificar(valvula_seguridad_evacuacion_gas_continua):-
    estado(valvula_seguridad_evacuacion_gas_continua,desconocido),writeln('Verificar la evacuacion de la valvula de escape.').
    
/*RAMA CENTRAL DERECHA*/
verificar(fuga_prevenible_entre_asciento_orificio):-
    estado(fuga_prevenible_entre_asciento_orificio,ok),writeln('Existe una fuga prevenible entre asciento y orificio.\n
                                                                Ajustar la valvula de seguridad de acuerdo con las instrucciones.');
    estado(fuga_prevenible_entre_asciento_orificio,no),writeln('No existe una fuga prevenible entre asciento y orificio.\n
                                                                Reeplazar asciento y orificio. Colocar valvula de seguridad en el circuito');
    estado(fuga_prevenible_entre_asciento_orificio,desconocido),writeln('No se conoce fuga prevenible entre asciento y orificio, verificar'),
    (estado(efectividad_resorte_seguridad,ok),writeln('El resorte de seguridad es efectivo');verificar(efectividad_resorte_seguridad)).

verificar(efectividad_resorte_seguridad):-
    estado(efectividad_resorte_seguridad,no),writeln('El resorte de seguridad es efectivo.\n
                                                      Reemplazar el resorte de seguridad.');
    estado(efectividad_resorte_seguridad,desconocido),writeln('No se conoce la efectividad del resorte de seguridad, verificar'),
    (estado(obstruccion_tubos_sensor_presion_y_control,no),writeln('Los tubos del sensor de presión y control no están obstruidos');verificar(obstruccion_tubos_sensor_presion_y_control)).

verificar(obstruccion_tubos_sensor_presion_y_control):-
    estado(obstruccion_tubos_sensor_presion_y_control,ok),writeln('Los tubos del sensor de presión y control no están obstruidos.\n
                                                                   Limpiar y reparar las fallas de las tuberias de deteccion.');
    estado(obstruccion_tubos_sensor_presion_y_control,desconocido),writeln('No se conoce el estado de las tuberías de deteccion,verificar'),
    (estado(adecuada_presion_gas_en_linea,ok),writeln('Es adecuada la presion de gas en la linea');verificar(adecuada_presion_gas_en_linea)).

verificar(adecuada_presion_gas_en_linea):-
    estado(adecuada_presion_gas_en_linea,no),writeln('No es adecuada la presion de gas en la linea.\n
                                                      Ajustar el regulador de acuerdo a las instrucciones.');
    estado(adecuada_presion_gas_en_linea,desconocido),writeln('No se conoce la presion del gas en la linea, verificar'),
    (estado(valvula_seguridad_evacuacion_gas_continua,ok),writeln('La valvula de setidad tiene una evacuacion de gas continua');verificar(valvula_seguridad_evacuacion_gas_continua)).

/*RAMA DERECHA*/
verificar(fugas_arregladas_con_llaves_en_juntas):-
    estado(fugas_arregladas_con_llave_en_juntas,ok),writeln('Hay fugas arregladas con la llave en las juntas.\n
                                                             Informar a la Unidad de Inspeccion Tecnica');
    estado(fugas_arregladas_con_llave_en_juntas,no),writeln('No hay fugas arregladas con la llave en las juntas.\n
                                                             Enviar informe al departamento de reparacion.');
    estado(fugas_arregladas_con_llave_en_juntas,desconocido),writeln('No se conocen fugas arregladas con la llave en las juntas'),
    (estado(fuga_gas_en_junta,ok),writeln('Hay una fuga de gas en la junta');verificar(fuga_gas_en_junta)).

verificar(fuga_gas_en_junta):-
    estado(fuga_gas_en_junta,no),writeln('No hay una fuga de gas en la junta.\n
                                          La junta de la valvula de seguridad no tiene fugas de gas.');
    estador(fuga_gas_en_junta,desconocido),writeln('No se conoce fuga de gas en la junta, verificar').

/*GROUND FACTS*/
/*RAMA IZQUIERDA*/
estado(espesor_menor_lim_umbral,desconocido).
stado(estado_equipo_sin_efectos_oxidacion,desconocido).

/*RAMA CENTRAL IZQUIERDA*/
estado(funcionamiento_correcto_piloto,desconocido).
estado(existe_fuga_prevencion_adecuada_entre_asiento_orificio,desconocido).
estado(desempeno_eficiencia_resorte_valvula_seguridad,desconocido).
estado(sensores_valvula_control_blokeados,desconocido).
estado(valvula_posicion_cerrar,desconocido).
estado(valvula_alivio_aumento_presion_10_superior_presion_regulacion,desconocido).
estado(valvula_seguridad_evacuacion_gas_continua,desconocido).

/*RAMA CENTRAL DERECHA*/
estado(fuga_prevenible_entre_asciento_orificio,desconocido).
estado(efectividad_resorte_seguridad,desconocido).
estado(obstruccion_tubos_sensor_presion_y_control,desconocido).
estado(adecuada_presion_gas_en_linea,desconocido).

/*RAMA DERECHA*/
estado(fugas_arregladas_con_llave_en_juntas,desconocido).
estado(fuga_gas_en_junta,desconocido).